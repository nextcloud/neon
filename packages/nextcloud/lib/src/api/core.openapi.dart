// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers
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
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'core.openapi.g.dart';

class $Client extends DynamiteClient {
  $Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  $Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  $AppPasswordClient get appPassword => $AppPasswordClient(this);

  $AutoCompleteClient get autoComplete => $AutoCompleteClient(this);

  $AvatarClient get avatar => $AvatarClient(this);

  $ClientFlowLoginV2Client get clientFlowLoginV2 => $ClientFlowLoginV2Client(this);

  $CollaborationResourcesClient get collaborationResources => $CollaborationResourcesClient(this);

  $GuestAvatarClient get guestAvatar => $GuestAvatarClient(this);

  $HoverCardClient get hoverCard => $HoverCardClient(this);

  $NavigationClient get navigation => $NavigationClient(this);

  $OcmClient get ocm => $OcmClient(this);

  $OcsClient get ocs => $OcsClient(this);

  $PreviewClient get preview => $PreviewClient(this);

  $ProfileApiClient get profileApi => $ProfileApiClient(this);

  $ReferenceClient get reference => $ReferenceClient(this);

  $ReferenceApiClient get referenceApi => $ReferenceApiClient(this);

  $TextProcessingApiClient get textProcessingApi => $TextProcessingApiClient(this);

  $TextToImageApiClient get textToImageApi => $TextToImageApiClient(this);

  $TranslationApiClient get translationApi => $TranslationApiClient(this);

  $UnifiedSearchClient get unifiedSearch => $UnifiedSearchClient(this);

  $WhatsNewClient get whatsNew => $WhatsNewClient(this);

  $WipeClient get wipe => $WipeClient(this);

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
    const _headers = <String, String>{
      'Accept': 'application/json',
    };

    const _path = '/status.php';
    return DynamiteRawResponse<Status, void>(
      response: executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Status),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $AppPasswordClient {
  $AppPasswordClient(this._rootClient);

  final $Client _rootClient;

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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<AppPasswordGetAppPasswordResponseApplicationJson, void> getAppPasswordRaw({bool? oCSAPIRequest}) {
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/core/getapppassword';
    return DynamiteRawResponse<AppPasswordGetAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AppPasswordGetAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    bool? oCSAPIRequest,
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
    bool? oCSAPIRequest,
  }) {
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/core/apppassword/rotate';
    return DynamiteRawResponse<AppPasswordRotateAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AppPasswordRotateAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    bool? oCSAPIRequest,
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
    bool? oCSAPIRequest,
  }) {
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/core/apppassword';
    return DynamiteRawResponse<AppPasswordDeleteAppPasswordResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $AutoCompleteClient {
  $AutoCompleteClient(this._rootClient);

  final $Client _rootClient;

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
    required String search,
    String? itemType,
    String? itemId,
    String? sorter,
    BuiltList<int>? shareTypes,
    int? limit,
    bool? oCSAPIRequest,
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
    required String search,
    String? itemType,
    String? itemId,
    String? sorter,
    BuiltList<int>? shareTypes,
    int? limit,
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
    final $search = jsonSerializers.serialize(search, specifiedType: const FullType(String));
    _parameters['search'] = $search;

    final $itemType = jsonSerializers.serialize(itemType, specifiedType: const FullType(String));
    _parameters['itemType'] = $itemType;

    final $itemId = jsonSerializers.serialize(itemId, specifiedType: const FullType(String));
    _parameters['itemId'] = $itemId;

    final $sorter = jsonSerializers.serialize(sorter, specifiedType: const FullType(String));
    _parameters['sorter'] = $sorter;

    final $shareTypes =
        jsonSerializers.serialize(shareTypes, specifiedType: const FullType(BuiltList, [FullType(int)]));
    _parameters['shareTypes%5B%5D'] = $shareTypes;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 10;
    _parameters['limit'] = $limit;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/core/autocomplete/get{?search*,itemType*,itemId*,sorter*,shareTypes%5B%5D*,limit*}')
            .expand(_parameters);
    return DynamiteRawResponse<AutoCompleteGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(AutoCompleteGetResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

/// Class AvatarController.
class $AvatarClient {
  $AvatarClient(this._rootClient);

  final $Client _rootClient;

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
    required String userId,
    required int size,
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
    required String userId,
    required int size,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    _parameters['userId'] = $userId;

    final $size = jsonSerializers.serialize(size, specifiedType: const FullType(int));
    _parameters['size'] = $size;

    final _path = UriTemplate('/index.php/avatar/{userId}/{size}/dark').expand(_parameters);
    return DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarDarkHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(AvatarAvatarGetAvatarDarkHeaders),
      serializers: jsonSerializers,
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
    required String userId,
    required int size,
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
    required String userId,
    required int size,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $userId = jsonSerializers.serialize(userId, specifiedType: const FullType(String));
    _parameters['userId'] = $userId;

    final $size = jsonSerializers.serialize(size, specifiedType: const FullType(int));
    _parameters['size'] = $size;

    final _path = UriTemplate('/index.php/avatar/{userId}/{size}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, AvatarAvatarGetAvatarHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(AvatarAvatarGetAvatarHeaders),
      serializers: jsonSerializers,
    );
  }
}

class $ClientFlowLoginV2Client {
  $ClientFlowLoginV2Client(this._rootClient);

  final $Client _rootClient;

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
  Future<DynamiteResponse<LoginFlowV2Credentials, void>> poll({required String token}) async {
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
  DynamiteRawResponse<LoginFlowV2Credentials, void> pollRaw({required String token}) {
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
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/login/v2/poll{?token*}').expand(_parameters);
    return DynamiteRawResponse<LoginFlowV2Credentials, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(LoginFlowV2Credentials),
      headersType: null,
      serializers: jsonSerializers,
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
    }

// coverage:ignore-end
    const _path = '/index.php/login/v2';
    return DynamiteRawResponse<LoginFlowV2, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(LoginFlowV2),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $CollaborationResourcesClient {
  $CollaborationResourcesClient(this._rootClient);

  final $Client _rootClient;

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
    required String filter,
    bool? oCSAPIRequest,
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
    required String filter,
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
    final $filter = jsonSerializers.serialize(filter, specifiedType: const FullType(String));
    _parameters['filter'] = $filter;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/collaboration/resources/collections/search/{filter}').expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesSearchCollectionsResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int collectionId,
    bool? oCSAPIRequest,
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
    required int collectionId,
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
    final $collectionId = jsonSerializers.serialize(collectionId, specifiedType: const FullType(int));
    _parameters['collectionId'] = $collectionId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}').expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesListCollectionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesListCollectionResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String collectionName,
    required int collectionId,
    bool? oCSAPIRequest,
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
    required String collectionName,
    required int collectionId,
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
    final $collectionName = jsonSerializers.serialize(collectionName, specifiedType: const FullType(String));
    _parameters['collectionName'] = $collectionName;

    final $collectionId = jsonSerializers.serialize(collectionId, specifiedType: const FullType(int));
    _parameters['collectionId'] = $collectionId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}{?collectionName*}')
        .expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesRenameCollectionResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String resourceType,
    required String resourceId,
    required int collectionId,
    bool? oCSAPIRequest,
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
    required String resourceType,
    required String resourceId,
    required int collectionId,
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
    final $resourceType = jsonSerializers.serialize(resourceType, specifiedType: const FullType(String));
    _parameters['resourceType'] = $resourceType;

    final $resourceId = jsonSerializers.serialize(resourceId, specifiedType: const FullType(String));
    _parameters['resourceId'] = $resourceId;

    final $collectionId = jsonSerializers.serialize(collectionId, specifiedType: const FullType(int));
    _parameters['collectionId'] = $collectionId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}{?resourceType*,resourceId*}')
            .expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesAddResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesAddResourceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String resourceType,
    required String resourceId,
    required int collectionId,
    bool? oCSAPIRequest,
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
    required String resourceType,
    required String resourceId,
    required int collectionId,
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
    final $resourceType = jsonSerializers.serialize(resourceType, specifiedType: const FullType(String));
    _parameters['resourceType'] = $resourceType;

    final $resourceId = jsonSerializers.serialize(resourceId, specifiedType: const FullType(String));
    _parameters['resourceId'] = $resourceId;

    final $collectionId = jsonSerializers.serialize(collectionId, specifiedType: const FullType(int));
    _parameters['collectionId'] = $collectionId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/collaboration/resources/collections/{collectionId}{?resourceType*,resourceId*}')
            .expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesRemoveResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String resourceType,
    required String resourceId,
    bool? oCSAPIRequest,
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
    required String resourceType,
    required String resourceId,
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
    final $resourceType = jsonSerializers.serialize(resourceType, specifiedType: const FullType(String));
    _parameters['resourceType'] = $resourceType;

    final $resourceId = jsonSerializers.serialize(resourceId, specifiedType: const FullType(String));
    _parameters['resourceId'] = $resourceId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/collaboration/resources/{resourceType}/{resourceId}').expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String name,
    required String baseResourceType,
    required String baseResourceId,
    bool? oCSAPIRequest,
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
    required String name,
    required String baseResourceType,
    required String baseResourceId,
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
    final $name = jsonSerializers.serialize(name, specifiedType: const FullType(String));
    _parameters['name'] = $name;

    final $baseResourceType = jsonSerializers.serialize(baseResourceType, specifiedType: const FullType(String));
    _parameters['baseResourceType'] = $baseResourceType;

    final $baseResourceId = jsonSerializers.serialize(baseResourceId, specifiedType: const FullType(String));
    _parameters['baseResourceId'] = $baseResourceId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/collaboration/resources/{baseResourceType}/{baseResourceId}{?name*}')
        .expand(_parameters);
    return DynamiteRawResponse<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

/// This controller handles guest avatar requests.
class $GuestAvatarClient {
  $GuestAvatarClient(this._rootClient);

  final $Client _rootClient;

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
    required String guestName,
    required String size,
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
    required String guestName,
    required String size,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $guestName = jsonSerializers.serialize(guestName, specifiedType: const FullType(String));
    _parameters['guestName'] = $guestName;

    final $size = jsonSerializers.serialize(size, specifiedType: const FullType(String));
    _parameters['size'] = $size;

    final _path = UriTemplate('/index.php/avatar/guest/{guestName}/{size}/dark').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
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
    required String guestName,
    required String size,
    int? darkTheme,
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
    required String guestName,
    required String size,
    int? darkTheme,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $guestName = jsonSerializers.serialize(guestName, specifiedType: const FullType(String));
    _parameters['guestName'] = $guestName;

    final $size = jsonSerializers.serialize(size, specifiedType: const FullType(String));
    _parameters['size'] = $size;

    var $darkTheme = jsonSerializers.serialize(darkTheme, specifiedType: const FullType(int));
    $darkTheme ??= 0;
    _parameters['darkTheme'] = $darkTheme;

    final _path = UriTemplate('/index.php/avatar/guest/{guestName}/{size}{?darkTheme*}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200, 201},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $HoverCardClient {
  $HoverCardClient(this._rootClient);

  final $Client _rootClient;

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
    required String userId,
    bool? oCSAPIRequest,
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/hovercard/v1/{userId}').expand(_parameters);
    return DynamiteRawResponse<HoverCardGetUserResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(HoverCardGetUserResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $NavigationClient {
  $NavigationClient(this._rootClient);

  final $Client _rootClient;

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
    int? absolute,
    bool? oCSAPIRequest,
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
    int? absolute,
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
    var $absolute = jsonSerializers.serialize(absolute, specifiedType: const FullType(int));
    $absolute ??= 0;
    _parameters['absolute'] = $absolute;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/core/navigation/apps{?absolute*}').expand(_parameters);
    return DynamiteRawResponse<NavigationGetAppsNavigationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(NavigationGetAppsNavigationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    int? absolute,
    bool? oCSAPIRequest,
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
    int? absolute,
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
    var $absolute = jsonSerializers.serialize(absolute, specifiedType: const FullType(int));
    $absolute ??= 0;
    _parameters['absolute'] = $absolute;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/core/navigation/settings{?absolute*}').expand(_parameters);
    return DynamiteRawResponse<NavigationGetSettingsNavigationResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(NavigationGetSettingsNavigationResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

/// Controller about the endpoint /ocm-provider/.
class $OcmClient {
  $OcmClient(this._rootClient);

  final $Client _rootClient;

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
    }

// coverage:ignore-end
    const _path = '/index.php/ocm-provider';
    return DynamiteRawResponse<OcmDiscoveryResponseApplicationJson, OcmOcmDiscoveryHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(OcmDiscoveryResponseApplicationJson),
      headersType: const FullType(OcmOcmDiscoveryHeaders),
      serializers: jsonSerializers,
    );
  }
}

class $OcsClient {
  $OcsClient(this._rootClient);

  final $Client _rootClient;

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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<OcsGetCapabilitiesResponseApplicationJson, void> getCapabilitiesRaw({bool? oCSAPIRequest}) {
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
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/cloud/capabilities';
    return DynamiteRawResponse<OcsGetCapabilitiesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(OcsGetCapabilitiesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $PreviewClient {
  $PreviewClient(this._rootClient);

  final $Client _rootClient;

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
    int? fileId,
    int? x,
    int? y,
    int? a,
    int? forceIcon,
    String? mode,
    int? mimeFallback,
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
    int? fileId,
    int? x,
    int? y,
    int? a,
    int? forceIcon,
    String? mode,
    int? mimeFallback,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    var $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    $fileId ??= -1;
    _parameters['fileId'] = $fileId;

    var $x = jsonSerializers.serialize(x, specifiedType: const FullType(int));
    $x ??= 32;
    _parameters['x'] = $x;

    var $y = jsonSerializers.serialize(y, specifiedType: const FullType(int));
    $y ??= 32;
    _parameters['y'] = $y;

    var $a = jsonSerializers.serialize(a, specifiedType: const FullType(int));
    $a ??= 0;
    _parameters['a'] = $a;

    var $forceIcon = jsonSerializers.serialize(forceIcon, specifiedType: const FullType(int));
    $forceIcon ??= 1;
    _parameters['forceIcon'] = $forceIcon;

    var $mode = jsonSerializers.serialize(mode, specifiedType: const FullType(String));
    $mode ??= 'fill';
    _parameters['mode'] = $mode;

    var $mimeFallback = jsonSerializers.serialize(mimeFallback, specifiedType: const FullType(int));
    $mimeFallback ??= 0;
    _parameters['mimeFallback'] = $mimeFallback;

    final _path =
        UriTemplate('/index.php/core/preview{?fileId*,x*,y*,a*,forceIcon*,mode*,mimeFallback*}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
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
    String? file,
    int? x,
    int? y,
    int? a,
    int? forceIcon,
    String? mode,
    int? mimeFallback,
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
    String? file,
    int? x,
    int? y,
    int? a,
    int? forceIcon,
    String? mode,
    int? mimeFallback,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    var $file = jsonSerializers.serialize(file, specifiedType: const FullType(String));
    $file ??= '';
    _parameters['file'] = $file;

    var $x = jsonSerializers.serialize(x, specifiedType: const FullType(int));
    $x ??= 32;
    _parameters['x'] = $x;

    var $y = jsonSerializers.serialize(y, specifiedType: const FullType(int));
    $y ??= 32;
    _parameters['y'] = $y;

    var $a = jsonSerializers.serialize(a, specifiedType: const FullType(int));
    $a ??= 0;
    _parameters['a'] = $a;

    var $forceIcon = jsonSerializers.serialize(forceIcon, specifiedType: const FullType(int));
    $forceIcon ??= 1;
    _parameters['forceIcon'] = $forceIcon;

    var $mode = jsonSerializers.serialize(mode, specifiedType: const FullType(String));
    $mode ??= 'fill';
    _parameters['mode'] = $mode;

    var $mimeFallback = jsonSerializers.serialize(mimeFallback, specifiedType: const FullType(int));
    $mimeFallback ??= 0;
    _parameters['mimeFallback'] = $mimeFallback;

    final _path =
        UriTemplate('/index.php/core/preview.png{?file*,x*,y*,a*,forceIcon*,mode*,mimeFallback*}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $ProfileApiClient {
  $ProfileApiClient(this._rootClient);

  final $Client _rootClient;

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
    required String paramId,
    required String visibility,
    required String targetUserId,
    bool? oCSAPIRequest,
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
    required String paramId,
    required String visibility,
    required String targetUserId,
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
    final $paramId = jsonSerializers.serialize(paramId, specifiedType: const FullType(String));
    _parameters['paramId'] = $paramId;

    final $visibility = jsonSerializers.serialize(visibility, specifiedType: const FullType(String));
    _parameters['visibility'] = $visibility;

    final $targetUserId = jsonSerializers.serialize(targetUserId, specifiedType: const FullType(String));
    _parameters['targetUserId'] = $targetUserId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/profile/{targetUserId}{?paramId*,visibility*}').expand(_parameters);
    return DynamiteRawResponse<ProfileApiSetVisibilityResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ProfileApiSetVisibilityResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $ReferenceClient {
  $ReferenceClient(this._rootClient);

  final $Client _rootClient;

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
  Future<DynamiteResponse<Uint8List, void>> preview({required String referenceId}) async {
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
  DynamiteRawResponse<Uint8List, void> previewRaw({required String referenceId}) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $referenceId = jsonSerializers.serialize(referenceId, specifiedType: const FullType(String));
    _parameters['referenceId'] = $referenceId;

    final _path = UriTemplate('/index.php/core/references/preview/{referenceId}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $ReferenceApiClient {
  $ReferenceApiClient(this._rootClient);

  final $Client _rootClient;

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
    required String reference,
    bool? oCSAPIRequest,
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
    required String reference,
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
    final $reference = jsonSerializers.serialize(reference, specifiedType: const FullType(String));
    _parameters['reference'] = $reference;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/references/resolve{?reference*}').expand(_parameters);
    return DynamiteRawResponse<ReferenceApiResolveOneResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiResolveOneResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required BuiltList<String> references,
    int? limit,
    bool? oCSAPIRequest,
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
    required BuiltList<String> references,
    int? limit,
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
    final $references =
        jsonSerializers.serialize(references, specifiedType: const FullType(BuiltList, [FullType(String)]));
    _parameters['references%5B%5D'] = $references;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 1;
    _parameters['limit'] = $limit;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/references/resolve{?references%5B%5D*,limit*}').expand(_parameters);
    return DynamiteRawResponse<ReferenceApiResolveResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiResolveResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String text,
    int? resolve,
    int? limit,
    bool? oCSAPIRequest,
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
    required String text,
    int? resolve,
    int? limit,
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
    final $text = jsonSerializers.serialize(text, specifiedType: const FullType(String));
    _parameters['text'] = $text;

    var $resolve = jsonSerializers.serialize(resolve, specifiedType: const FullType(int));
    $resolve ??= 0;
    _parameters['resolve'] = $resolve;

    var $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    $limit ??= 1;
    _parameters['limit'] = $limit;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/references/extract{?text*,resolve*,limit*}').expand(_parameters);
    return DynamiteRawResponse<ReferenceApiExtractResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiExtractResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    bool? oCSAPIRequest,
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
    bool? oCSAPIRequest,
  }) {
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/references/providers';
    return DynamiteRawResponse<ReferenceApiGetProvidersInfoResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String providerId,
    int? timestamp,
    bool? oCSAPIRequest,
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
    required String providerId,
    int? timestamp,
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
    final $providerId = jsonSerializers.serialize(providerId, specifiedType: const FullType(String));
    _parameters['providerId'] = $providerId;

    final $timestamp = jsonSerializers.serialize(timestamp, specifiedType: const FullType(int));
    _parameters['timestamp'] = $timestamp;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/references/provider/{providerId}{?timestamp*}').expand(_parameters);
    return DynamiteRawResponse<ReferenceApiTouchProviderResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(ReferenceApiTouchProviderResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $TextProcessingApiClient {
  $TextProcessingApiClient(this._rootClient);

  final $Client _rootClient;

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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<TextProcessingApiTaskTypesResponseApplicationJson, void> taskTypesRaw({bool? oCSAPIRequest}) {
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
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/textprocessing/tasktypes';
    return DynamiteRawResponse<TextProcessingApiTaskTypesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiTaskTypesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  ///   * 500
  ///   * 400: Scheduling task is not possible
  ///   * 412: Scheduling task is not possible
  ///
  /// See:
  ///  * [scheduleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TextProcessingApiScheduleResponseApplicationJson, void>> schedule({
    required String input,
    required String type,
    required String appId,
    String? identifier,
    bool? oCSAPIRequest,
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
  ///   * 500
  ///   * 400: Scheduling task is not possible
  ///   * 412: Scheduling task is not possible
  ///
  /// See:
  ///  * [schedule] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TextProcessingApiScheduleResponseApplicationJson, void> scheduleRaw({
    required String input,
    required String type,
    required String appId,
    String? identifier,
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
    }

// coverage:ignore-end
    final $input = jsonSerializers.serialize(input, specifiedType: const FullType(String));
    _parameters['input'] = $input;

    final $type = jsonSerializers.serialize(type, specifiedType: const FullType(String));
    _parameters['type'] = $type;

    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    _parameters['appId'] = $appId;

    var $identifier = jsonSerializers.serialize(identifier, specifiedType: const FullType(String));
    $identifier ??= '';
    _parameters['identifier'] = $identifier;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/textprocessing/schedule{?input*,type*,appId*,identifier*}').expand(_parameters);
    return DynamiteRawResponse<TextProcessingApiScheduleResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiScheduleResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    bool? oCSAPIRequest,
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
    required int id,
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
    }

// coverage:ignore-end
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/textprocessing/task/{id}').expand(_parameters);
    return DynamiteRawResponse<TextProcessingApiGetTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiGetTaskResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    bool? oCSAPIRequest,
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
    required int id,
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

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/textprocessing/task/{id}').expand(_parameters);
    return DynamiteRawResponse<TextProcessingApiDeleteTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiDeleteTaskResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String appId,
    String? identifier,
    bool? oCSAPIRequest,
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
    required String appId,
    String? identifier,
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
    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    _parameters['appId'] = $appId;

    final $identifier = jsonSerializers.serialize(identifier, specifiedType: const FullType(String));
    _parameters['identifier'] = $identifier;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/textprocessing/tasks/app/{appId}{?identifier*}').expand(_parameters);
    return DynamiteRawResponse<TextProcessingApiListTasksByAppResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextProcessingApiListTasksByAppResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $TextToImageApiClient {
  $TextToImageApiClient(this._rootClient);

  final $Client _rootClient;

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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<TextToImageApiIsAvailableResponseApplicationJson, void> isAvailableRaw({bool? oCSAPIRequest}) {
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
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/text2image/is_available';
    return DynamiteRawResponse<TextToImageApiIsAvailableResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiIsAvailableResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String input,
    required String appId,
    String? identifier,
    int? numberOfImages,
    bool? oCSAPIRequest,
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
    required String input,
    required String appId,
    String? identifier,
    int? numberOfImages,
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
    }

// coverage:ignore-end
    final $input = jsonSerializers.serialize(input, specifiedType: const FullType(String));
    _parameters['input'] = $input;

    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    _parameters['appId'] = $appId;

    var $identifier = jsonSerializers.serialize(identifier, specifiedType: const FullType(String));
    $identifier ??= '';
    _parameters['identifier'] = $identifier;

    var $numberOfImages = jsonSerializers.serialize(numberOfImages, specifiedType: const FullType(int));
    $numberOfImages ??= 8;
    _parameters['numberOfImages'] = $numberOfImages;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/text2image/schedule{?input*,appId*,identifier*,numberOfImages*}').expand(_parameters);
    return DynamiteRawResponse<TextToImageApiScheduleResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiScheduleResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    bool? oCSAPIRequest,
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
    required int id,
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
    }

// coverage:ignore-end
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/text2image/task/{id}').expand(_parameters);
    return DynamiteRawResponse<TextToImageApiGetTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiGetTaskResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    bool? oCSAPIRequest,
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
    required int id,
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

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/text2image/task/{id}').expand(_parameters);
    return DynamiteRawResponse<TextToImageApiDeleteTaskResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiDeleteTaskResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    required int index,
    bool? oCSAPIRequest,
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
    required int id,
    required int index,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, dynamic>{};
    final _headers = <String, String>{
      'Accept': '*/*',
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
    }

// coverage:ignore-end
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    _parameters['id'] = $id;

    final $index = jsonSerializers.serialize(index, specifiedType: const FullType(int));
    _parameters['index'] = $index;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/text2image/task/{id}/image/{index}').expand(_parameters);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: jsonSerializers,
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
    required String appId,
    String? identifier,
    bool? oCSAPIRequest,
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
    required String appId,
    String? identifier,
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
    final $appId = jsonSerializers.serialize(appId, specifiedType: const FullType(String));
    _parameters['appId'] = $appId;

    final $identifier = jsonSerializers.serialize(identifier, specifiedType: const FullType(String));
    _parameters['identifier'] = $identifier;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/text2image/tasks/app/{appId}{?identifier*}').expand(_parameters);
    return DynamiteRawResponse<TextToImageApiListTasksByAppResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TextToImageApiListTasksByAppResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $TranslationApiClient {
  $TranslationApiClient(this._rootClient);

  final $Client _rootClient;

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
    bool? oCSAPIRequest,
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
  DynamiteRawResponse<TranslationApiLanguagesResponseApplicationJson, void> languagesRaw({bool? oCSAPIRequest}) {
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
    }

// coverage:ignore-end
    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/translation/languages';
    return DynamiteRawResponse<TranslationApiLanguagesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TranslationApiLanguagesResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String text,
    required String toLanguage,
    String? fromLanguage,
    bool? oCSAPIRequest,
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
    required String text,
    required String toLanguage,
    String? fromLanguage,
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
    }

// coverage:ignore-end
    final $text = jsonSerializers.serialize(text, specifiedType: const FullType(String));
    _parameters['text'] = $text;

    final $toLanguage = jsonSerializers.serialize(toLanguage, specifiedType: const FullType(String));
    _parameters['toLanguage'] = $toLanguage;

    final $fromLanguage = jsonSerializers.serialize(fromLanguage, specifiedType: const FullType(String));
    _parameters['fromLanguage'] = $fromLanguage;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/translation/translate{?text*,toLanguage*,fromLanguage*}').expand(_parameters);
    return DynamiteRawResponse<TranslationApiTranslateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(TranslationApiTranslateResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $UnifiedSearchClient {
  $UnifiedSearchClient(this._rootClient);

  final $Client _rootClient;

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
    String? from,
    bool? oCSAPIRequest,
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
    String? from,
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
    var $from = jsonSerializers.serialize(from, specifiedType: const FullType(String));
    $from ??= '';
    _parameters['from'] = $from;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/search/providers{?from*}').expand(_parameters);
    return DynamiteRawResponse<UnifiedSearchGetProvidersResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UnifiedSearchGetProvidersResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Launch a search for a specific search provider.
  ///
  /// Additional filters are available for each provider. Send a request to /providers endpoint to list providers with their available filters.
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
    required String providerId,
    String? term,
    int? sortOrder,
    int? limit,
    UnifiedSearchSearchCursor? cursor,
    String? from,
    bool? oCSAPIRequest,
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

  /// Launch a search for a specific search provider.
  ///
  /// Additional filters are available for each provider. Send a request to /providers endpoint to list providers with their available filters.
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
    required String providerId,
    String? term,
    int? sortOrder,
    int? limit,
    UnifiedSearchSearchCursor? cursor,
    String? from,
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
    final $providerId = jsonSerializers.serialize(providerId, specifiedType: const FullType(String));
    _parameters['providerId'] = $providerId;

    var $term = jsonSerializers.serialize(term, specifiedType: const FullType(String));
    $term ??= '';
    _parameters['term'] = $term;

    final $sortOrder = jsonSerializers.serialize(sortOrder, specifiedType: const FullType(int));
    _parameters['sortOrder'] = $sortOrder;

    final $limit = jsonSerializers.serialize(limit, specifiedType: const FullType(int));
    _parameters['limit'] = $limit;

    final $cursor = jsonSerializers.serialize(cursor, specifiedType: const FullType(UnifiedSearchSearchCursor));
    _parameters['cursor'] = $cursor;

    var $from = jsonSerializers.serialize(from, specifiedType: const FullType(String));
    $from ??= '';
    _parameters['from'] = $from;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path =
        UriTemplate('/ocs/v2.php/search/providers/{providerId}/search{?term*,sortOrder*,limit*,cursor*,from*}')
            .expand(_parameters);
    return DynamiteRawResponse<UnifiedSearchSearchResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(UnifiedSearchSearchResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $WhatsNewClient {
  $WhatsNewClient(this._rootClient);

  final $Client _rootClient;

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
  Future<DynamiteResponse<WhatsNewGetResponseApplicationJson, void>> $get({bool? oCSAPIRequest}) async {
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
  DynamiteRawResponse<WhatsNewGetResponseApplicationJson, void> $getRaw({bool? oCSAPIRequest}) {
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
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    const _path = '/ocs/v2.php/core/whatsnew';
    return DynamiteRawResponse<WhatsNewGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(WhatsNewGetResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
    required String version,
    bool? oCSAPIRequest,
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
    required String version,
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
    final $version = jsonSerializers.serialize(version, specifiedType: const FullType(String));
    _parameters['version'] = $version;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _headers['OCS-APIRequest'] = const dynamite_utils.HeaderEncoder().convert($oCSAPIRequest);

    final _path = UriTemplate('/ocs/v2.php/core/whatsnew{?version*}').expand(_parameters);
    return DynamiteRawResponse<WhatsNewDismissResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(WhatsNewDismissResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

class $WipeClient {
  $WipeClient(this._rootClient);

  final $Client _rootClient;

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
  Future<DynamiteResponse<WipeCheckWipeResponseApplicationJson, void>> checkWipe({required String token}) async {
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
  DynamiteRawResponse<WipeCheckWipeResponseApplicationJson, void> checkWipeRaw({required String token}) {
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
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/core/wipe/check{?token*}').expand(_parameters);
    return DynamiteRawResponse<WipeCheckWipeResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(WipeCheckWipeResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<JsonObject, void>> wipeDone({required String token}) async {
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
  DynamiteRawResponse<JsonObject, void> wipeDoneRaw({required String token}) {
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
    }

// coverage:ignore-end
    final $token = jsonSerializers.serialize(token, specifiedType: const FullType(String));
    _parameters['token'] = $token;

    final _path = UriTemplate('/index.php/core/wipe/success{?token*}').expand(_parameters);
    return DynamiteRawResponse<JsonObject, void>(
      response: _rootClient.executeRequest(
        'post',
        _path,
        _headers,
        null,
        const {200, 404},
      ),
      bodyType: const FullType(JsonObject),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $StatusInterface {
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
}

abstract class Status implements $StatusInterface, Built<Status, StatusBuilder> {
  factory Status([void Function(StatusBuilder)? b]) = _$Status;

  // coverage:ignore-start
  const Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Status.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Status> get serializer => _$statusSerializer;
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
abstract interface class $AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data
    implements
        $AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data([
    void Function(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordGetAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data get data;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson_Ocs
    implements
        $AppPasswordGetAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson_Ocs,
            AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs([
    void Function(AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordGetAppPasswordResponseApplicationJsonInterface {
  AppPasswordGetAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordGetAppPasswordResponseApplicationJson
    implements
        $AppPasswordGetAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordGetAppPasswordResponseApplicationJson,
            AppPasswordGetAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordGetAppPasswordResponseApplicationJson([
    void Function(AppPasswordGetAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordGetAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordGetAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordGetAppPasswordResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordGetAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordGetAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data
    implements
        $AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
            AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data([
    void Function(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data get data;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson_Ocs
    implements
        $AppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
            AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs([
    void Function(AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordRotateAppPasswordResponseApplicationJsonInterface {
  AppPasswordRotateAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordRotateAppPasswordResponseApplicationJson
    implements
        $AppPasswordRotateAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordRotateAppPasswordResponseApplicationJson,
            AppPasswordRotateAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordRotateAppPasswordResponseApplicationJson([
    void Function(AppPasswordRotateAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordRotateAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordRotateAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordRotateAppPasswordResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordRotateAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordRotateAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs
    implements
        $AppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface,
        Built<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
            AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder> {
  factory AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs([
    void Function(AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$appPasswordDeleteAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AppPasswordDeleteAppPasswordResponseApplicationJsonInterface {
  AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs get ocs;
}

abstract class AppPasswordDeleteAppPasswordResponseApplicationJson
    implements
        $AppPasswordDeleteAppPasswordResponseApplicationJsonInterface,
        Built<AppPasswordDeleteAppPasswordResponseApplicationJson,
            AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder> {
  factory AppPasswordDeleteAppPasswordResponseApplicationJson([
    void Function(AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$AppPasswordDeleteAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const AppPasswordDeleteAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AppPasswordDeleteAppPasswordResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AppPasswordDeleteAppPasswordResponseApplicationJson> get serializer =>
      _$appPasswordDeleteAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AutocompleteResult_Status0Interface {
  String get status;
  String? get message;
  String? get icon;
  int? get clearAt;
}

abstract class AutocompleteResult_Status0
    implements
        $AutocompleteResult_Status0Interface,
        Built<AutocompleteResult_Status0, AutocompleteResult_Status0Builder> {
  factory AutocompleteResult_Status0([void Function(AutocompleteResult_Status0Builder)? b]) =
      _$AutocompleteResult_Status0;

  // coverage:ignore-start
  const AutocompleteResult_Status0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutocompleteResult_Status0.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutocompleteResult_Status0> get serializer => _$autocompleteResultStatus0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AutocompleteResultInterface {
  String get id;
  String get label;
  String get icon;
  String get source;
  AutocompleteResult_Status get status;
  String get subline;
  String get shareWithDisplayNameUnique;
}

abstract class AutocompleteResult
    implements $AutocompleteResultInterface, Built<AutocompleteResult, AutocompleteResultBuilder> {
  factory AutocompleteResult([void Function(AutocompleteResultBuilder)? b]) = _$AutocompleteResult;

  // coverage:ignore-start
  const AutocompleteResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutocompleteResult.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutocompleteResult> get serializer => _$autocompleteResultSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(AutocompleteResultBuilder b) {
    b.status?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $AutoCompleteGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<AutocompleteResult> get data;
}

abstract class AutoCompleteGetResponseApplicationJson_Ocs
    implements
        $AutoCompleteGetResponseApplicationJson_OcsInterface,
        Built<AutoCompleteGetResponseApplicationJson_Ocs, AutoCompleteGetResponseApplicationJson_OcsBuilder> {
  factory AutoCompleteGetResponseApplicationJson_Ocs([
    void Function(AutoCompleteGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$AutoCompleteGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const AutoCompleteGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutoCompleteGetResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutoCompleteGetResponseApplicationJson_Ocs> get serializer =>
      _$autoCompleteGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AutoCompleteGetResponseApplicationJsonInterface {
  AutoCompleteGetResponseApplicationJson_Ocs get ocs;
}

abstract class AutoCompleteGetResponseApplicationJson
    implements
        $AutoCompleteGetResponseApplicationJsonInterface,
        Built<AutoCompleteGetResponseApplicationJson, AutoCompleteGetResponseApplicationJsonBuilder> {
  factory AutoCompleteGetResponseApplicationJson([void Function(AutoCompleteGetResponseApplicationJsonBuilder)? b]) =
      _$AutoCompleteGetResponseApplicationJson;

  // coverage:ignore-start
  const AutoCompleteGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AutoCompleteGetResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AutoCompleteGetResponseApplicationJson> get serializer =>
      _$autoCompleteGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarAvatarGetAvatarDarkHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  Header<int>? get xNcIscustomavatar;
}

abstract class AvatarAvatarGetAvatarDarkHeaders
    implements
        $AvatarAvatarGetAvatarDarkHeadersInterface,
        Built<AvatarAvatarGetAvatarDarkHeaders, AvatarAvatarGetAvatarDarkHeadersBuilder> {
  factory AvatarAvatarGetAvatarDarkHeaders([void Function(AvatarAvatarGetAvatarDarkHeadersBuilder)? b]) =
      _$AvatarAvatarGetAvatarDarkHeaders;

  // coverage:ignore-start
  const AvatarAvatarGetAvatarDarkHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarAvatarGetAvatarDarkHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarAvatarGetAvatarDarkHeaders> get serializer => _$avatarAvatarGetAvatarDarkHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $AvatarAvatarGetAvatarHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  Header<int>? get xNcIscustomavatar;
}

abstract class AvatarAvatarGetAvatarHeaders
    implements
        $AvatarAvatarGetAvatarHeadersInterface,
        Built<AvatarAvatarGetAvatarHeaders, AvatarAvatarGetAvatarHeadersBuilder> {
  factory AvatarAvatarGetAvatarHeaders([void Function(AvatarAvatarGetAvatarHeadersBuilder)? b]) =
      _$AvatarAvatarGetAvatarHeaders;

  // coverage:ignore-start
  const AvatarAvatarGetAvatarHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory AvatarAvatarGetAvatarHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<AvatarAvatarGetAvatarHeaders> get serializer => _$avatarAvatarGetAvatarHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $LoginFlowV2CredentialsInterface {
  String get server;
  String get loginName;
  String get appPassword;
}

abstract class LoginFlowV2Credentials
    implements $LoginFlowV2CredentialsInterface, Built<LoginFlowV2Credentials, LoginFlowV2CredentialsBuilder> {
  factory LoginFlowV2Credentials([void Function(LoginFlowV2CredentialsBuilder)? b]) = _$LoginFlowV2Credentials;

  // coverage:ignore-start
  const LoginFlowV2Credentials._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2Credentials.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2Credentials> get serializer => _$loginFlowV2CredentialsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $LoginFlowV2_PollInterface {
  String get token;
  String get endpoint;
}

abstract class LoginFlowV2_Poll
    implements $LoginFlowV2_PollInterface, Built<LoginFlowV2_Poll, LoginFlowV2_PollBuilder> {
  factory LoginFlowV2_Poll([void Function(LoginFlowV2_PollBuilder)? b]) = _$LoginFlowV2_Poll;

  // coverage:ignore-start
  const LoginFlowV2_Poll._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2_Poll.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2_Poll> get serializer => _$loginFlowV2PollSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $LoginFlowV2Interface {
  LoginFlowV2_Poll get poll;
  String get login;
}

abstract class LoginFlowV2 implements $LoginFlowV2Interface, Built<LoginFlowV2, LoginFlowV2Builder> {
  factory LoginFlowV2([void Function(LoginFlowV2Builder)? b]) = _$LoginFlowV2;

  // coverage:ignore-start
  const LoginFlowV2._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LoginFlowV2.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LoginFlowV2> get serializer => _$loginFlowV2Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenGraphObjectInterface {
  String get id;
  String get name;
  String? get description;
  String? get thumb;
  String get link;
}

abstract class OpenGraphObject implements $OpenGraphObjectInterface, Built<OpenGraphObject, OpenGraphObjectBuilder> {
  factory OpenGraphObject([void Function(OpenGraphObjectBuilder)? b]) = _$OpenGraphObject;

  // coverage:ignore-start
  const OpenGraphObject._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenGraphObject.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenGraphObject> get serializer => _$openGraphObjectSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ResourceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  OpenGraphObject get openGraphObject;
  bool get accessible;
}

abstract class Resource implements $ResourceInterface, Built<Resource, ResourceBuilder> {
  factory Resource([void Function(ResourceBuilder)? b]) = _$Resource;

  // coverage:ignore-start
  const Resource._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Resource.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Resource> get serializer => _$resourceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollectionInterface {
  int get id;
  String get name;
  BuiltList<Resource> get resources;
}

abstract class Collection implements $CollectionInterface, Built<Collection, CollectionBuilder> {
  factory Collection([void Function(CollectionBuilder)? b]) = _$Collection;

  // coverage:ignore-start
  const Collection._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Collection.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Collection> get serializer => _$collectionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Collection> get data;
}

abstract class CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
            CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesSearchCollectionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesSearchCollectionsResponseApplicationJsonInterface {
  CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesSearchCollectionsResponseApplicationJson
    implements
        $CollaborationResourcesSearchCollectionsResponseApplicationJsonInterface,
        Built<CollaborationResourcesSearchCollectionsResponseApplicationJson,
            CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder> {
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson([
    void Function(CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesSearchCollectionsResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesSearchCollectionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesSearchCollectionsResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesSearchCollectionsResponseApplicationJson> get serializer =>
      _$collaborationResourcesSearchCollectionsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesListCollectionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesListCollectionResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesListCollectionResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesListCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesListCollectionResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesListCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesListCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesListCollectionResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesListCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesListCollectionResponseApplicationJsonInterface {
  CollaborationResourcesListCollectionResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesListCollectionResponseApplicationJson
    implements
        $CollaborationResourcesListCollectionResponseApplicationJsonInterface,
        Built<CollaborationResourcesListCollectionResponseApplicationJson,
            CollaborationResourcesListCollectionResponseApplicationJsonBuilder> {
  factory CollaborationResourcesListCollectionResponseApplicationJson([
    void Function(CollaborationResourcesListCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesListCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesListCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesListCollectionResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesListCollectionResponseApplicationJson> get serializer =>
      _$collaborationResourcesListCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
            CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesRenameCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesRenameCollectionResponseApplicationJsonInterface {
  CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesRenameCollectionResponseApplicationJson
    implements
        $CollaborationResourcesRenameCollectionResponseApplicationJsonInterface,
        Built<CollaborationResourcesRenameCollectionResponseApplicationJson,
            CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder> {
  factory CollaborationResourcesRenameCollectionResponseApplicationJson([
    void Function(CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesRenameCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesRenameCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRenameCollectionResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRenameCollectionResponseApplicationJson> get serializer =>
      _$collaborationResourcesRenameCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesAddResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesAddResourceResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesAddResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesAddResourceResponseApplicationJson_Ocs,
            CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesAddResourceResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesAddResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesAddResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesAddResourceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesAddResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesAddResourceResponseApplicationJsonInterface {
  CollaborationResourcesAddResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesAddResourceResponseApplicationJson
    implements
        $CollaborationResourcesAddResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesAddResourceResponseApplicationJson,
            CollaborationResourcesAddResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesAddResourceResponseApplicationJson([
    void Function(CollaborationResourcesAddResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesAddResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesAddResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesAddResourceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesAddResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesAddResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
            CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesRemoveResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesRemoveResourceResponseApplicationJsonInterface {
  CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesRemoveResourceResponseApplicationJson
    implements
        $CollaborationResourcesRemoveResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesRemoveResourceResponseApplicationJson,
            CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesRemoveResourceResponseApplicationJson([
    void Function(CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesRemoveResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesRemoveResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesRemoveResourceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesRemoveResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesRemoveResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Collection> get data;
}

abstract class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.fromJson(
    Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesGetCollectionsByResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface {
  CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesGetCollectionsByResourceResponseApplicationJson
    implements
        $CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
            CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson([
    void Function(CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesGetCollectionsByResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesGetCollectionsByResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesGetCollectionsByResourceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesGetCollectionsByResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Collection get data;
}

abstract class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs
    implements
        $CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface,
        Built<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder> {
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs([
    void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.fromJson(
    Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs> get serializer =>
      _$collaborationResourcesCreateCollectionOnResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface {
  CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs get ocs;
}

abstract class CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson
    implements
        $CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface,
        Built<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
            CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder> {
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson([
    void Function(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson;

  // coverage:ignore-start
  const CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson> get serializer =>
      _$collaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ContactsActionInterface {
  String get title;
  String get icon;
  String get hyperlink;
  String get appId;
}

abstract class ContactsAction implements $ContactsActionInterface, Built<ContactsAction, ContactsActionBuilder> {
  factory ContactsAction([void Function(ContactsActionBuilder)? b]) = _$ContactsAction;

  // coverage:ignore-start
  const ContactsAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ContactsAction.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ContactsAction> get serializer => _$contactsActionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HoverCardGetUserResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get displayName;
  BuiltList<ContactsAction> get actions;
}

abstract class HoverCardGetUserResponseApplicationJson_Ocs_Data
    implements
        $HoverCardGetUserResponseApplicationJson_Ocs_DataInterface,
        Built<HoverCardGetUserResponseApplicationJson_Ocs_Data,
            HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder> {
  factory HoverCardGetUserResponseApplicationJson_Ocs_Data([
    void Function(HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$HoverCardGetUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs_Data> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HoverCardGetUserResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  HoverCardGetUserResponseApplicationJson_Ocs_Data get data;
}

abstract class HoverCardGetUserResponseApplicationJson_Ocs
    implements
        $HoverCardGetUserResponseApplicationJson_OcsInterface,
        Built<HoverCardGetUserResponseApplicationJson_Ocs, HoverCardGetUserResponseApplicationJson_OcsBuilder> {
  factory HoverCardGetUserResponseApplicationJson_Ocs([
    void Function(HoverCardGetUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$HoverCardGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson_Ocs> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $HoverCardGetUserResponseApplicationJsonInterface {
  HoverCardGetUserResponseApplicationJson_Ocs get ocs;
}

abstract class HoverCardGetUserResponseApplicationJson
    implements
        $HoverCardGetUserResponseApplicationJsonInterface,
        Built<HoverCardGetUserResponseApplicationJson, HoverCardGetUserResponseApplicationJsonBuilder> {
  factory HoverCardGetUserResponseApplicationJson([void Function(HoverCardGetUserResponseApplicationJsonBuilder)? b]) =
      _$HoverCardGetUserResponseApplicationJson;

  // coverage:ignore-start
  const HoverCardGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory HoverCardGetUserResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<HoverCardGetUserResponseApplicationJson> get serializer =>
      _$hoverCardGetUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NavigationEntryInterface {
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

abstract class NavigationEntry implements $NavigationEntryInterface, Built<NavigationEntry, NavigationEntryBuilder> {
  factory NavigationEntry([void Function(NavigationEntryBuilder)? b]) = _$NavigationEntry;

  // coverage:ignore-start
  const NavigationEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationEntry.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationEntry> get serializer => _$navigationEntrySerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(NavigationEntryBuilder b) {
    b.order?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $NavigationGetAppsNavigationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<NavigationEntry> get data;
}

abstract class NavigationGetAppsNavigationResponseApplicationJson_Ocs
    implements
        $NavigationGetAppsNavigationResponseApplicationJson_OcsInterface,
        Built<NavigationGetAppsNavigationResponseApplicationJson_Ocs,
            NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder> {
  factory NavigationGetAppsNavigationResponseApplicationJson_Ocs([
    void Function(NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NavigationGetAppsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NavigationGetAppsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetAppsNavigationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetAppsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$navigationGetAppsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NavigationGetAppsNavigationResponseApplicationJsonInterface {
  NavigationGetAppsNavigationResponseApplicationJson_Ocs get ocs;
}

abstract class NavigationGetAppsNavigationResponseApplicationJson
    implements
        $NavigationGetAppsNavigationResponseApplicationJsonInterface,
        Built<NavigationGetAppsNavigationResponseApplicationJson,
            NavigationGetAppsNavigationResponseApplicationJsonBuilder> {
  factory NavigationGetAppsNavigationResponseApplicationJson([
    void Function(NavigationGetAppsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$NavigationGetAppsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const NavigationGetAppsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetAppsNavigationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetAppsNavigationResponseApplicationJson> get serializer =>
      _$navigationGetAppsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NavigationGetSettingsNavigationResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<NavigationEntry> get data;
}

abstract class NavigationGetSettingsNavigationResponseApplicationJson_Ocs
    implements
        $NavigationGetSettingsNavigationResponseApplicationJson_OcsInterface,
        Built<NavigationGetSettingsNavigationResponseApplicationJson_Ocs,
            NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder> {
  factory NavigationGetSettingsNavigationResponseApplicationJson_Ocs([
    void Function(NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NavigationGetSettingsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NavigationGetSettingsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetSettingsNavigationResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$navigationGetSettingsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NavigationGetSettingsNavigationResponseApplicationJsonInterface {
  NavigationGetSettingsNavigationResponseApplicationJson_Ocs get ocs;
}

abstract class NavigationGetSettingsNavigationResponseApplicationJson
    implements
        $NavigationGetSettingsNavigationResponseApplicationJsonInterface,
        Built<NavigationGetSettingsNavigationResponseApplicationJson,
            NavigationGetSettingsNavigationResponseApplicationJsonBuilder> {
  factory NavigationGetSettingsNavigationResponseApplicationJson([
    void Function(NavigationGetSettingsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$NavigationGetSettingsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const NavigationGetSettingsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NavigationGetSettingsNavigationResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NavigationGetSettingsNavigationResponseApplicationJson> get serializer =>
      _$navigationGetSettingsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcmOcmDiscoveryHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-ocm-providers')
  Header<bool>? get xNextcloudOcmProviders;
}

abstract class OcmOcmDiscoveryHeaders
    implements $OcmOcmDiscoveryHeadersInterface, Built<OcmOcmDiscoveryHeaders, OcmOcmDiscoveryHeadersBuilder> {
  factory OcmOcmDiscoveryHeaders([void Function(OcmOcmDiscoveryHeadersBuilder)? b]) = _$OcmOcmDiscoveryHeaders;

  // coverage:ignore-start
  const OcmOcmDiscoveryHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmOcmDiscoveryHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmOcmDiscoveryHeaders> get serializer => _$ocmOcmDiscoveryHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface {
  String get webdav;
}

abstract class OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols
    implements
        $OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface,
        Built<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
            OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder> {
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols([
    void Function(OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder)? b,
  ]) = _$OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonResourceTypesProtocolsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcmDiscoveryResponseApplicationJson_ResourceTypesInterface {
  String get name;
  BuiltList<String> get shareTypes;
  OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols get protocols;
}

abstract class OcmDiscoveryResponseApplicationJson_ResourceTypes
    implements
        $OcmDiscoveryResponseApplicationJson_ResourceTypesInterface,
        Built<OcmDiscoveryResponseApplicationJson_ResourceTypes,
            OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder> {
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes([
    void Function(OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder)? b,
  ]) = _$OcmDiscoveryResponseApplicationJson_ResourceTypes;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson_ResourceTypes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson_ResourceTypes.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson_ResourceTypes> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonResourceTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcmDiscoveryResponseApplicationJsonInterface {
  bool get enabled;
  String get apiVersion;
  String get endPoint;
  BuiltList<OcmDiscoveryResponseApplicationJson_ResourceTypes> get resourceTypes;
}

abstract class OcmDiscoveryResponseApplicationJson
    implements
        $OcmDiscoveryResponseApplicationJsonInterface,
        Built<OcmDiscoveryResponseApplicationJson, OcmDiscoveryResponseApplicationJsonBuilder> {
  factory OcmDiscoveryResponseApplicationJson([void Function(OcmDiscoveryResponseApplicationJsonBuilder)? b]) =
      _$OcmDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const OcmDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcmDiscoveryResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcmDiscoveryResponseApplicationJson> get serializer =>
      _$ocmDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface {
  int get major;
  int get minor;
  int get micro;
  String get string;
  String get edition;
  bool get extendedSupport;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version
    implements
        $OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version([
    void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsDataVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CommentsCapabilities_FilesInterface {
  bool get comments;
}

abstract class CommentsCapabilities_Files
    implements
        $CommentsCapabilities_FilesInterface,
        Built<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder> {
  factory CommentsCapabilities_Files([void Function(CommentsCapabilities_FilesBuilder)? b]) =
      _$CommentsCapabilities_Files;

  // coverage:ignore-start
  const CommentsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities_Files.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities_Files> get serializer => _$commentsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CommentsCapabilitiesInterface {
  CommentsCapabilities_Files get files;
}

abstract class CommentsCapabilities
    implements $CommentsCapabilitiesInterface, Built<CommentsCapabilities, CommentsCapabilitiesBuilder> {
  factory CommentsCapabilities([void Function(CommentsCapabilitiesBuilder)? b]) = _$CommentsCapabilities;

  // coverage:ignore-start
  const CommentsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CommentsCapabilities> get serializer => _$commentsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DavCapabilities_DavInterface {
  String get chunking;
  String? get bulkupload;
}

abstract class DavCapabilities_Dav
    implements $DavCapabilities_DavInterface, Built<DavCapabilities_Dav, DavCapabilities_DavBuilder> {
  factory DavCapabilities_Dav([void Function(DavCapabilities_DavBuilder)? b]) = _$DavCapabilities_Dav;

  // coverage:ignore-start
  const DavCapabilities_Dav._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities_Dav.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities_Dav> get serializer => _$davCapabilitiesDavSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DavCapabilitiesInterface {
  DavCapabilities_Dav get dav;
}

abstract class DavCapabilities implements $DavCapabilitiesInterface, Built<DavCapabilities, DavCapabilitiesBuilder> {
  factory DavCapabilities([void Function(DavCapabilitiesBuilder)? b]) = _$DavCapabilities;

  // coverage:ignore-start
  const DavCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DavCapabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DavCapabilities> get serializer => _$davCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesCapabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
}

abstract class FilesCapabilities_Files_DirectEditing
    implements
        $FilesCapabilities_Files_DirectEditingInterface,
        Built<FilesCapabilities_Files_DirectEditing, FilesCapabilities_Files_DirectEditingBuilder> {
  factory FilesCapabilities_Files_DirectEditing([void Function(FilesCapabilities_Files_DirectEditingBuilder)? b]) =
      _$FilesCapabilities_Files_DirectEditing;

  // coverage:ignore-start
  const FilesCapabilities_Files_DirectEditing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities_Files_DirectEditing.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities_Files_DirectEditing> get serializer =>
      _$filesCapabilitiesFilesDirectEditingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesCapabilities_FilesInterface {
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  FilesCapabilities_Files_DirectEditing get directEditing;
}

abstract class FilesCapabilities_Files
    implements $FilesCapabilities_FilesInterface, Built<FilesCapabilities_Files, FilesCapabilities_FilesBuilder> {
  factory FilesCapabilities_Files([void Function(FilesCapabilities_FilesBuilder)? b]) = _$FilesCapabilities_Files;

  // coverage:ignore-start
  const FilesCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities_Files.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities_Files> get serializer => _$filesCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesCapabilitiesInterface {
  FilesCapabilities_Files get files;
}

abstract class FilesCapabilities
    implements $FilesCapabilitiesInterface, Built<FilesCapabilities, FilesCapabilitiesBuilder> {
  factory FilesCapabilities([void Function(FilesCapabilitiesBuilder)? b]) = _$FilesCapabilities;

  // coverage:ignore-start
  const FilesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesCapabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesCapabilities> get serializer => _$filesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_Password
    implements
        $FilesSharingCapabilities_FilesSharing_Public_PasswordInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_Password,
            FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_Password([
    void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_Password;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_Password.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDate
    implements
        $FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDate([
    void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    implements
        $FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal([
    void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    implements
        $FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
            FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote([
    void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_PublicInterface {
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
        $FilesSharingCapabilities_FilesSharing_PublicInterface,
        Built<FilesSharingCapabilities_FilesSharing_Public, FilesSharingCapabilities_FilesSharing_PublicBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Public([
    void Function(FilesSharingCapabilities_FilesSharing_PublicBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Public;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Public.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Public> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_User_ExpireDate
    implements
        $FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_User_ExpireDate,
            FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_User_ExpireDate([
    void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_User_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_User_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_User_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_UserInterface {
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_User_ExpireDate? get expireDate;
}

abstract class FilesSharingCapabilities_FilesSharing_User
    implements
        $FilesSharingCapabilities_FilesSharing_UserInterface,
        Built<FilesSharingCapabilities_FilesSharing_User, FilesSharingCapabilities_FilesSharing_UserBuilder> {
  factory FilesSharingCapabilities_FilesSharing_User([
    void Function(FilesSharingCapabilities_FilesSharing_UserBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_User;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_User._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_User.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_User> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Group_ExpireDate
    implements
        $FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Group_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Group_ExpireDate([
    void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Group_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Group_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Group_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_GroupInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate? get expireDate;
}

abstract class FilesSharingCapabilities_FilesSharing_Group
    implements
        $FilesSharingCapabilities_FilesSharing_GroupInterface,
        Built<FilesSharingCapabilities_FilesSharing_Group, FilesSharingCapabilities_FilesSharing_GroupBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Group([
    void Function(FilesSharingCapabilities_FilesSharing_GroupBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Group;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Group._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Group.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Group> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    implements
        $FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDate([
    void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDate;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface {
  bool get enabled;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        $FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
            FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported([
    void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_FederationInterface {
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation
    implements
        $FilesSharingCapabilities_FilesSharing_FederationInterface,
        Built<FilesSharingCapabilities_FilesSharing_Federation,
            FilesSharingCapabilities_FilesSharing_FederationBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Federation([
    void Function(FilesSharingCapabilities_FilesSharing_FederationBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Federation;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Federation._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Federation.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharing_ShareeInterface {
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
}

abstract class FilesSharingCapabilities_FilesSharing_Sharee
    implements
        $FilesSharingCapabilities_FilesSharing_ShareeInterface,
        Built<FilesSharingCapabilities_FilesSharing_Sharee, FilesSharingCapabilities_FilesSharing_ShareeBuilder> {
  factory FilesSharingCapabilities_FilesSharing_Sharee([
    void Function(FilesSharingCapabilities_FilesSharing_ShareeBuilder)? b,
  ]) = _$FilesSharingCapabilities_FilesSharing_Sharee;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing_Sharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing_Sharee.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      _$filesSharingCapabilitiesFilesSharingShareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilities_FilesSharingInterface {
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
        $FilesSharingCapabilities_FilesSharingInterface,
        Built<FilesSharingCapabilities_FilesSharing, FilesSharingCapabilities_FilesSharingBuilder> {
  factory FilesSharingCapabilities_FilesSharing([void Function(FilesSharingCapabilities_FilesSharingBuilder)? b]) =
      _$FilesSharingCapabilities_FilesSharing;

  // coverage:ignore-start
  const FilesSharingCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities_FilesSharing.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities_FilesSharing> get serializer =>
      _$filesSharingCapabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesSharingCapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  FilesSharingCapabilities_FilesSharing get filesSharing;
}

abstract class FilesSharingCapabilities
    implements $FilesSharingCapabilitiesInterface, Built<FilesSharingCapabilities, FilesSharingCapabilitiesBuilder> {
  factory FilesSharingCapabilities([void Function(FilesSharingCapabilitiesBuilder)? b]) = _$FilesSharingCapabilities;

  // coverage:ignore-start
  const FilesSharingCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingCapabilities> get serializer => _$filesSharingCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesTrashbinCapabilities_FilesInterface {
  bool get undelete;
}

abstract class FilesTrashbinCapabilities_Files
    implements
        $FilesTrashbinCapabilities_FilesInterface,
        Built<FilesTrashbinCapabilities_Files, FilesTrashbinCapabilities_FilesBuilder> {
  factory FilesTrashbinCapabilities_Files([void Function(FilesTrashbinCapabilities_FilesBuilder)? b]) =
      _$FilesTrashbinCapabilities_Files;

  // coverage:ignore-start
  const FilesTrashbinCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities_Files.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities_Files> get serializer => _$filesTrashbinCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesTrashbinCapabilitiesInterface {
  FilesTrashbinCapabilities_Files get files;
}

abstract class FilesTrashbinCapabilities
    implements $FilesTrashbinCapabilitiesInterface, Built<FilesTrashbinCapabilities, FilesTrashbinCapabilitiesBuilder> {
  factory FilesTrashbinCapabilities([void Function(FilesTrashbinCapabilitiesBuilder)? b]) = _$FilesTrashbinCapabilities;

  // coverage:ignore-start
  const FilesTrashbinCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities> get serializer => _$filesTrashbinCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesVersionsCapabilities_FilesInterface {
  bool get versioning;
  @BuiltValueField(wireName: 'version_labeling')
  bool get versionLabeling;
  @BuiltValueField(wireName: 'version_deletion')
  bool get versionDeletion;
}

abstract class FilesVersionsCapabilities_Files
    implements
        $FilesVersionsCapabilities_FilesInterface,
        Built<FilesVersionsCapabilities_Files, FilesVersionsCapabilities_FilesBuilder> {
  factory FilesVersionsCapabilities_Files([void Function(FilesVersionsCapabilities_FilesBuilder)? b]) =
      _$FilesVersionsCapabilities_Files;

  // coverage:ignore-start
  const FilesVersionsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities_Files.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities_Files> get serializer => _$filesVersionsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $FilesVersionsCapabilitiesInterface {
  FilesVersionsCapabilities_Files get files;
}

abstract class FilesVersionsCapabilities
    implements $FilesVersionsCapabilitiesInterface, Built<FilesVersionsCapabilities, FilesVersionsCapabilitiesBuilder> {
  factory FilesVersionsCapabilities([void Function(FilesVersionsCapabilitiesBuilder)? b]) = _$FilesVersionsCapabilities;

  // coverage:ignore-start
  const FilesVersionsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities> get serializer => _$filesVersionsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotesCapabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
}

abstract class NotesCapabilities_Notes
    implements $NotesCapabilities_NotesInterface, Built<NotesCapabilities_Notes, NotesCapabilities_NotesBuilder> {
  factory NotesCapabilities_Notes([void Function(NotesCapabilities_NotesBuilder)? b]) = _$NotesCapabilities_Notes;

  // coverage:ignore-start
  const NotesCapabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities_Notes.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotesCapabilities_Notes> get serializer => _$notesCapabilitiesNotesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotesCapabilitiesInterface {
  NotesCapabilities_Notes get notes;
}

abstract class NotesCapabilities
    implements $NotesCapabilitiesInterface, Built<NotesCapabilities, NotesCapabilitiesBuilder> {
  factory NotesCapabilities([void Function(NotesCapabilitiesBuilder)? b]) = _$NotesCapabilities;

  // coverage:ignore-start
  const NotesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotesCapabilities> get serializer => _$notesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotificationsCapabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
}

abstract class NotificationsCapabilities_Notifications
    implements
        $NotificationsCapabilities_NotificationsInterface,
        Built<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder> {
  factory NotificationsCapabilities_Notifications([void Function(NotificationsCapabilities_NotificationsBuilder)? b]) =
      _$NotificationsCapabilities_Notifications;

  // coverage:ignore-start
  const NotificationsCapabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities_Notifications.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotificationsCapabilities_Notifications> get serializer =>
      _$notificationsCapabilitiesNotificationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $NotificationsCapabilitiesInterface {
  NotificationsCapabilities_Notifications get notifications;
}

abstract class NotificationsCapabilities
    implements $NotificationsCapabilitiesInterface, Built<NotificationsCapabilities, NotificationsCapabilitiesBuilder> {
  factory NotificationsCapabilities([void Function(NotificationsCapabilitiesBuilder)? b]) = _$NotificationsCapabilities;

  // coverage:ignore-start
  const NotificationsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NotificationsCapabilities> get serializer => _$notificationsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ProvisioningApiCapabilities_ProvisioningApiInterface {
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
        $ProvisioningApiCapabilities_ProvisioningApiInterface,
        Built<ProvisioningApiCapabilities_ProvisioningApi, ProvisioningApiCapabilities_ProvisioningApiBuilder> {
  factory ProvisioningApiCapabilities_ProvisioningApi([
    void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder)? b,
  ]) = _$ProvisioningApiCapabilities_ProvisioningApi;

  // coverage:ignore-start
  const ProvisioningApiCapabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities_ProvisioningApi.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      _$provisioningApiCapabilitiesProvisioningApiSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ProvisioningApiCapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  ProvisioningApiCapabilities_ProvisioningApi get provisioningApi;
}

abstract class ProvisioningApiCapabilities
    implements
        $ProvisioningApiCapabilitiesInterface,
        Built<ProvisioningApiCapabilities, ProvisioningApiCapabilitiesBuilder> {
  factory ProvisioningApiCapabilities([void Function(ProvisioningApiCapabilitiesBuilder)? b]) =
      _$ProvisioningApiCapabilities;

  // coverage:ignore-start
  const ProvisioningApiCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProvisioningApiCapabilities> get serializer => _$provisioningApiCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        $SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop,
            SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop([
    void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$sharebymailCapabilities0FilesSharingSharebymailUploadFilesDropSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_Password
    implements
        $SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_Password,
            SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_Password([
    void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_Password.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_Password> get serializer =>
      _$sharebymailCapabilities0FilesSharingSharebymailPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
}

abstract class SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate
    implements
        $SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate,
            SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate([
    void Function(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$sharebymailCapabilities0FilesSharingSharebymailExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0_FilesSharing_SharebymailInterface {
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
        $SharebymailCapabilities0_FilesSharing_SharebymailInterface,
        Built<SharebymailCapabilities0_FilesSharing_Sharebymail,
            SharebymailCapabilities0_FilesSharing_SharebymailBuilder> {
  factory SharebymailCapabilities0_FilesSharing_Sharebymail([
    void Function(SharebymailCapabilities0_FilesSharing_SharebymailBuilder)? b,
  ]) = _$SharebymailCapabilities0_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing_Sharebymail.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0_FilesSharing_Sharebymail> get serializer =>
      _$sharebymailCapabilities0FilesSharingSharebymailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0_FilesSharingInterface {
  SharebymailCapabilities0_FilesSharing_Sharebymail get sharebymail;
}

abstract class SharebymailCapabilities0_FilesSharing
    implements
        $SharebymailCapabilities0_FilesSharingInterface,
        Built<SharebymailCapabilities0_FilesSharing, SharebymailCapabilities0_FilesSharingBuilder> {
  factory SharebymailCapabilities0_FilesSharing([void Function(SharebymailCapabilities0_FilesSharingBuilder)? b]) =
      _$SharebymailCapabilities0_FilesSharing;

  // coverage:ignore-start
  const SharebymailCapabilities0_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0_FilesSharing.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0_FilesSharing> get serializer =>
      _$sharebymailCapabilities0FilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SharebymailCapabilities0Interface {
  @BuiltValueField(wireName: 'files_sharing')
  SharebymailCapabilities0_FilesSharing get filesSharing;
}

abstract class SharebymailCapabilities0
    implements $SharebymailCapabilities0Interface, Built<SharebymailCapabilities0, SharebymailCapabilities0Builder> {
  factory SharebymailCapabilities0([void Function(SharebymailCapabilities0Builder)? b]) = _$SharebymailCapabilities0;

  // coverage:ignore-start
  const SharebymailCapabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SharebymailCapabilities0.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SharebymailCapabilities0> get serializer => _$sharebymailCapabilities0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterface {
  bool get allowed;
  String? get folder;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Attachments
    implements
        $SpreedPublicCapabilities0_Spreed_Config_AttachmentsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Attachments,
            SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Attachments([
    void Function(SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Attachments;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Attachments._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Attachments.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Attachments> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigAttachmentsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_CallInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'breakout-rooms')
  bool get breakoutRooms;
  bool get recording;
  @BuiltValueField(wireName: 'recording-consent')
  int? get recordingConsent;
  @BuiltValueField(wireName: 'supported-reactions')
  BuiltList<String>? get supportedReactions;
  @BuiltValueField(wireName: 'predefined-backgrounds')
  BuiltList<String>? get predefinedBackgrounds;
  @BuiltValueField(wireName: 'can-upload-background')
  bool? get canUploadBackground;
  @BuiltValueField(wireName: 'sip-enabled')
  bool? get sipEnabled;
  @BuiltValueField(wireName: 'sip-dialout-enabled')
  bool? get sipDialoutEnabled;
  @BuiltValueField(wireName: 'can-enable-sip')
  bool? get canEnableSip;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Call
    implements
        $SpreedPublicCapabilities0_Spreed_Config_CallInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Call, SpreedPublicCapabilities0_Spreed_Config_CallBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Call([
    void Function(SpreedPublicCapabilities0_Spreed_Config_CallBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Call;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Call._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Call.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Call> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigCallSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_ChatInterface {
  @BuiltValueField(wireName: 'max-length')
  int get maxLength;
  @BuiltValueField(wireName: 'read-privacy')
  int get readPrivacy;
  @BuiltValueField(wireName: 'has-translation-providers')
  bool? get hasTranslationProviders;
  @BuiltValueField(wireName: 'typing-privacy')
  int? get typingPrivacy;
  BuiltList<String>? get translations;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Chat
    implements
        $SpreedPublicCapabilities0_Spreed_Config_ChatInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Chat, SpreedPublicCapabilities0_Spreed_Config_ChatBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Chat([
    void Function(SpreedPublicCapabilities0_Spreed_Config_ChatBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Chat;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Chat._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Chat.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Chat> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigChatSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_ConversationsInterface {
  @BuiltValueField(wireName: 'can-create')
  bool get canCreate;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Conversations
    implements
        $SpreedPublicCapabilities0_Spreed_Config_ConversationsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Conversations,
            SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Conversations([
    void Function(SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Conversations;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Conversations._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Conversations.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Conversations> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigConversationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_PreviewsInterface {
  @BuiltValueField(wireName: 'max-gif-size')
  int get maxGifSize;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Previews
    implements
        $SpreedPublicCapabilities0_Spreed_Config_PreviewsInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Previews,
            SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Previews([
    void Function(SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Previews;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Previews._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Previews.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Previews> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigPreviewsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_Config_SignalingInterface {
  @BuiltValueField(wireName: 'session-ping-limit')
  int get sessionPingLimit;
  @BuiltValueField(wireName: 'hello-v2-token-key')
  String? get helloV2TokenKey;
}

abstract class SpreedPublicCapabilities0_Spreed_Config_Signaling
    implements
        $SpreedPublicCapabilities0_Spreed_Config_SignalingInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config_Signaling,
            SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config_Signaling([
    void Function(SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder)? b,
  ]) = _$SpreedPublicCapabilities0_Spreed_Config_Signaling;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config_Signaling._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config_Signaling.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config_Signaling> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigSignalingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_Spreed_ConfigInterface {
  SpreedPublicCapabilities0_Spreed_Config_Attachments get attachments;
  SpreedPublicCapabilities0_Spreed_Config_Call get call;
  SpreedPublicCapabilities0_Spreed_Config_Chat get chat;
  SpreedPublicCapabilities0_Spreed_Config_Conversations get conversations;
  SpreedPublicCapabilities0_Spreed_Config_Previews get previews;
  SpreedPublicCapabilities0_Spreed_Config_Signaling get signaling;
}

abstract class SpreedPublicCapabilities0_Spreed_Config
    implements
        $SpreedPublicCapabilities0_Spreed_ConfigInterface,
        Built<SpreedPublicCapabilities0_Spreed_Config, SpreedPublicCapabilities0_Spreed_ConfigBuilder> {
  factory SpreedPublicCapabilities0_Spreed_Config([void Function(SpreedPublicCapabilities0_Spreed_ConfigBuilder)? b]) =
      _$SpreedPublicCapabilities0_Spreed_Config;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed_Config._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed_Config.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed_Config> get serializer =>
      _$spreedPublicCapabilities0SpreedConfigSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0_SpreedInterface {
  BuiltList<String> get features;
  SpreedPublicCapabilities0_Spreed_Config get config;
  String get version;
}

abstract class SpreedPublicCapabilities0_Spreed
    implements
        $SpreedPublicCapabilities0_SpreedInterface,
        Built<SpreedPublicCapabilities0_Spreed, SpreedPublicCapabilities0_SpreedBuilder> {
  factory SpreedPublicCapabilities0_Spreed([void Function(SpreedPublicCapabilities0_SpreedBuilder)? b]) =
      _$SpreedPublicCapabilities0_Spreed;

  // coverage:ignore-start
  const SpreedPublicCapabilities0_Spreed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0_Spreed.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0_Spreed> get serializer => _$spreedPublicCapabilities0SpreedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SpreedPublicCapabilities0Interface {
  SpreedPublicCapabilities0_Spreed get spreed;
}

abstract class SpreedPublicCapabilities0
    implements $SpreedPublicCapabilities0Interface, Built<SpreedPublicCapabilities0, SpreedPublicCapabilities0Builder> {
  factory SpreedPublicCapabilities0([void Function(SpreedPublicCapabilities0Builder)? b]) = _$SpreedPublicCapabilities0;

  // coverage:ignore-start
  const SpreedPublicCapabilities0._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SpreedPublicCapabilities0.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SpreedPublicCapabilities0> get serializer => _$spreedPublicCapabilities0Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ThemingPublicCapabilities_ThemingInterface {
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
        $ThemingPublicCapabilities_ThemingInterface,
        Built<ThemingPublicCapabilities_Theming, ThemingPublicCapabilities_ThemingBuilder> {
  factory ThemingPublicCapabilities_Theming([void Function(ThemingPublicCapabilities_ThemingBuilder)? b]) =
      _$ThemingPublicCapabilities_Theming;

  // coverage:ignore-start
  const ThemingPublicCapabilities_Theming._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingPublicCapabilities_Theming.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingPublicCapabilities_Theming> get serializer => _$themingPublicCapabilitiesThemingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ThemingPublicCapabilitiesInterface {
  ThemingPublicCapabilities_Theming get theming;
}

abstract class ThemingPublicCapabilities
    implements $ThemingPublicCapabilitiesInterface, Built<ThemingPublicCapabilities, ThemingPublicCapabilitiesBuilder> {
  factory ThemingPublicCapabilities([void Function(ThemingPublicCapabilitiesBuilder)? b]) = _$ThemingPublicCapabilities;

  // coverage:ignore-start
  const ThemingPublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ThemingPublicCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ThemingPublicCapabilities> get serializer => _$themingPublicCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusCapabilities_UserStatusInterface {
  bool get enabled;
  bool? get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
}

abstract class UserStatusCapabilities_UserStatus
    implements
        $UserStatusCapabilities_UserStatusInterface,
        Built<UserStatusCapabilities_UserStatus, UserStatusCapabilities_UserStatusBuilder> {
  factory UserStatusCapabilities_UserStatus([void Function(UserStatusCapabilities_UserStatusBuilder)? b]) =
      _$UserStatusCapabilities_UserStatus;

  // coverage:ignore-start
  const UserStatusCapabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities_UserStatus.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusCapabilities_UserStatus> get serializer => _$userStatusCapabilitiesUserStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UserStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  UserStatusCapabilities_UserStatus get userStatus;
}

abstract class UserStatusCapabilities
    implements $UserStatusCapabilitiesInterface, Built<UserStatusCapabilities, UserStatusCapabilitiesBuilder> {
  factory UserStatusCapabilities([void Function(UserStatusCapabilitiesBuilder)? b]) = _$UserStatusCapabilities;

  // coverage:ignore-start
  const UserStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UserStatusCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UserStatusCapabilities> get serializer => _$userStatusCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusCapabilities_WeatherStatusInterface {
  bool get enabled;
}

abstract class WeatherStatusCapabilities_WeatherStatus
    implements
        $WeatherStatusCapabilities_WeatherStatusInterface,
        Built<WeatherStatusCapabilities_WeatherStatus, WeatherStatusCapabilities_WeatherStatusBuilder> {
  factory WeatherStatusCapabilities_WeatherStatus([void Function(WeatherStatusCapabilities_WeatherStatusBuilder)? b]) =
      _$WeatherStatusCapabilities_WeatherStatus;

  // coverage:ignore-start
  const WeatherStatusCapabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities_WeatherStatus.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$weatherStatusCapabilitiesWeatherStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WeatherStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  WeatherStatusCapabilities_WeatherStatus get weatherStatus;
}

abstract class WeatherStatusCapabilities
    implements $WeatherStatusCapabilitiesInterface, Built<WeatherStatusCapabilities, WeatherStatusCapabilitiesBuilder> {
  factory WeatherStatusCapabilities([void Function(WeatherStatusCapabilitiesBuilder)? b]) = _$WeatherStatusCapabilities;

  // coverage:ignore-start
  const WeatherStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WeatherStatusCapabilities.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WeatherStatusCapabilities> get serializer => _$weatherStatusCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface {
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version get version;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities get capabilities;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs_Data
    implements
        $OcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
            OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data([
    void Function(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs_Data> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsDataSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder b) {
    b.capabilities?.validateAnyOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OcsGetCapabilitiesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OcsGetCapabilitiesResponseApplicationJson_Ocs_Data get data;
}

abstract class OcsGetCapabilitiesResponseApplicationJson_Ocs
    implements
        $OcsGetCapabilitiesResponseApplicationJson_OcsInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson_Ocs, OcsGetCapabilitiesResponseApplicationJson_OcsBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs([
    void Function(OcsGetCapabilitiesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson_Ocs> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OcsGetCapabilitiesResponseApplicationJsonInterface {
  OcsGetCapabilitiesResponseApplicationJson_Ocs get ocs;
}

abstract class OcsGetCapabilitiesResponseApplicationJson
    implements
        $OcsGetCapabilitiesResponseApplicationJsonInterface,
        Built<OcsGetCapabilitiesResponseApplicationJson, OcsGetCapabilitiesResponseApplicationJsonBuilder> {
  factory OcsGetCapabilitiesResponseApplicationJson([
    void Function(OcsGetCapabilitiesResponseApplicationJsonBuilder)? b,
  ]) = _$OcsGetCapabilitiesResponseApplicationJson;

  // coverage:ignore-start
  const OcsGetCapabilitiesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OcsGetCapabilitiesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OcsGetCapabilitiesResponseApplicationJson> get serializer =>
      _$ocsGetCapabilitiesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ProfileApiSetVisibilityResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ProfileApiSetVisibilityResponseApplicationJson_Ocs
    implements
        $ProfileApiSetVisibilityResponseApplicationJson_OcsInterface,
        Built<ProfileApiSetVisibilityResponseApplicationJson_Ocs,
            ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder> {
  factory ProfileApiSetVisibilityResponseApplicationJson_Ocs([
    void Function(ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProfileApiSetVisibilityResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProfileApiSetVisibilityResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProfileApiSetVisibilityResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProfileApiSetVisibilityResponseApplicationJson_Ocs> get serializer =>
      _$profileApiSetVisibilityResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ProfileApiSetVisibilityResponseApplicationJsonInterface {
  ProfileApiSetVisibilityResponseApplicationJson_Ocs get ocs;
}

abstract class ProfileApiSetVisibilityResponseApplicationJson
    implements
        $ProfileApiSetVisibilityResponseApplicationJsonInterface,
        Built<ProfileApiSetVisibilityResponseApplicationJson, ProfileApiSetVisibilityResponseApplicationJsonBuilder> {
  factory ProfileApiSetVisibilityResponseApplicationJson([
    void Function(ProfileApiSetVisibilityResponseApplicationJsonBuilder)? b,
  ]) = _$ProfileApiSetVisibilityResponseApplicationJson;

  // coverage:ignore-start
  const ProfileApiSetVisibilityResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProfileApiSetVisibilityResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ProfileApiSetVisibilityResponseApplicationJson> get serializer =>
      _$profileApiSetVisibilityResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  OpenGraphObject get openGraphObject;
  bool get accessible;
}

abstract class Reference implements $ReferenceInterface, Built<Reference, ReferenceBuilder> {
  factory Reference([void Function(ReferenceBuilder)? b]) = _$Reference;

  // coverage:ignore-start
  const Reference._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Reference.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Reference> get serializer => _$referenceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiResolveOneResponseApplicationJson_Ocs_Data
    implements
        $ReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs_Data([
    void Function(ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveOneResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiResolveOneResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiResolveOneResponseApplicationJson_Ocs
    implements
        $ReferenceApiResolveOneResponseApplicationJson_OcsInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson_Ocs,
            ReferenceApiResolveOneResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs([
    void Function(ReferenceApiResolveOneResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveOneResponseApplicationJsonInterface {
  ReferenceApiResolveOneResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiResolveOneResponseApplicationJson
    implements
        $ReferenceApiResolveOneResponseApplicationJsonInterface,
        Built<ReferenceApiResolveOneResponseApplicationJson, ReferenceApiResolveOneResponseApplicationJsonBuilder> {
  factory ReferenceApiResolveOneResponseApplicationJson([
    void Function(ReferenceApiResolveOneResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiResolveOneResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiResolveOneResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveOneResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveOneResponseApplicationJson> get serializer =>
      _$referenceApiResolveOneResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiResolveResponseApplicationJson_Ocs_Data
    implements
        $ReferenceApiResolveResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiResolveResponseApplicationJson_Ocs_Data,
            ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiResolveResponseApplicationJson_Ocs_Data([
    void Function(ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiResolveResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiResolveResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiResolveResponseApplicationJson_Ocs
    implements
        $ReferenceApiResolveResponseApplicationJson_OcsInterface,
        Built<ReferenceApiResolveResponseApplicationJson_Ocs, ReferenceApiResolveResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiResolveResponseApplicationJson_Ocs([
    void Function(ReferenceApiResolveResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiResolveResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiResolveResponseApplicationJsonInterface {
  ReferenceApiResolveResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiResolveResponseApplicationJson
    implements
        $ReferenceApiResolveResponseApplicationJsonInterface,
        Built<ReferenceApiResolveResponseApplicationJson, ReferenceApiResolveResponseApplicationJsonBuilder> {
  factory ReferenceApiResolveResponseApplicationJson([
    void Function(ReferenceApiResolveResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiResolveResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiResolveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiResolveResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiResolveResponseApplicationJson> get serializer =>
      _$referenceApiResolveResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiExtractResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, Reference> get references;
}

abstract class ReferenceApiExtractResponseApplicationJson_Ocs_Data
    implements
        $ReferenceApiExtractResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiExtractResponseApplicationJson_Ocs_Data,
            ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiExtractResponseApplicationJson_Ocs_Data([
    void Function(ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiExtractResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiExtractResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiExtractResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiExtractResponseApplicationJson_Ocs
    implements
        $ReferenceApiExtractResponseApplicationJson_OcsInterface,
        Built<ReferenceApiExtractResponseApplicationJson_Ocs, ReferenceApiExtractResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiExtractResponseApplicationJson_Ocs([
    void Function(ReferenceApiExtractResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiExtractResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiExtractResponseApplicationJsonInterface {
  ReferenceApiExtractResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiExtractResponseApplicationJson
    implements
        $ReferenceApiExtractResponseApplicationJsonInterface,
        Built<ReferenceApiExtractResponseApplicationJson, ReferenceApiExtractResponseApplicationJsonBuilder> {
  factory ReferenceApiExtractResponseApplicationJson([
    void Function(ReferenceApiExtractResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiExtractResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiExtractResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiExtractResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiExtractResponseApplicationJson> get serializer =>
      _$referenceApiExtractResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceProviderInterface {
  String get id;
  String get title;
  @BuiltValueField(wireName: 'icon_url')
  String get iconUrl;
  int get order;
  @BuiltValueField(wireName: 'search_providers_ids')
  BuiltList<String>? get searchProvidersIds;
}

abstract class ReferenceProvider
    implements $ReferenceProviderInterface, Built<ReferenceProvider, ReferenceProviderBuilder> {
  factory ReferenceProvider([void Function(ReferenceProviderBuilder)? b]) = _$ReferenceProvider;

  // coverage:ignore-start
  const ReferenceProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceProvider.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceProvider> get serializer => _$referenceProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<ReferenceProvider> get data;
}

abstract class ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs
    implements
        $ReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface,
        Built<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
            ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs([
    void Function(ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiGetProvidersInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiGetProvidersInfoResponseApplicationJsonInterface {
  ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiGetProvidersInfoResponseApplicationJson
    implements
        $ReferenceApiGetProvidersInfoResponseApplicationJsonInterface,
        Built<ReferenceApiGetProvidersInfoResponseApplicationJson,
            ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder> {
  factory ReferenceApiGetProvidersInfoResponseApplicationJson([
    void Function(ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiGetProvidersInfoResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiGetProvidersInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiGetProvidersInfoResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiGetProvidersInfoResponseApplicationJson> get serializer =>
      _$referenceApiGetProvidersInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface {
  bool get success;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data
    implements
        $ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
            ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data([
    void Function(ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiTouchProviderResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data get data;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson_Ocs
    implements
        $ReferenceApiTouchProviderResponseApplicationJson_OcsInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson_Ocs,
            ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs([
    void Function(ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson_Ocs> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ReferenceApiTouchProviderResponseApplicationJsonInterface {
  ReferenceApiTouchProviderResponseApplicationJson_Ocs get ocs;
}

abstract class ReferenceApiTouchProviderResponseApplicationJson
    implements
        $ReferenceApiTouchProviderResponseApplicationJsonInterface,
        Built<ReferenceApiTouchProviderResponseApplicationJson,
            ReferenceApiTouchProviderResponseApplicationJsonBuilder> {
  factory ReferenceApiTouchProviderResponseApplicationJson([
    void Function(ReferenceApiTouchProviderResponseApplicationJsonBuilder)? b,
  ]) = _$ReferenceApiTouchProviderResponseApplicationJson;

  // coverage:ignore-start
  const ReferenceApiTouchProviderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ReferenceApiTouchProviderResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ReferenceApiTouchProviderResponseApplicationJson> get serializer =>
      _$referenceApiTouchProviderResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface {
  String get id;
  String get name;
  String get description;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types
    implements
        $TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types([
    void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsDataTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get types;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data
    implements
        $TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
            TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data([
    void Function(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiTaskTypesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson_Ocs
    implements
        $TextProcessingApiTaskTypesResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson_Ocs,
            TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs([
    void Function(TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiTaskTypesResponseApplicationJsonInterface {
  TextProcessingApiTaskTypesResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiTaskTypesResponseApplicationJson
    implements
        $TextProcessingApiTaskTypesResponseApplicationJsonInterface,
        Built<TextProcessingApiTaskTypesResponseApplicationJson,
            TextProcessingApiTaskTypesResponseApplicationJsonBuilder> {
  factory TextProcessingApiTaskTypesResponseApplicationJson([
    void Function(TextProcessingApiTaskTypesResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiTaskTypesResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiTaskTypesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiTaskTypesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiTaskTypesResponseApplicationJson> get serializer =>
      _$textProcessingApiTaskTypesResponseApplicationJsonSerializer;
}

class TextProcessingTask_Status extends EnumClass {
  const TextProcessingTask_Status._(super.name);

  @BuiltValueEnumConst(wireName: '0')
  static const TextProcessingTask_Status $0 = _$textProcessingTaskStatus$0;

  @BuiltValueEnumConst(wireName: '1')
  static const TextProcessingTask_Status $1 = _$textProcessingTaskStatus$1;

  @BuiltValueEnumConst(wireName: '2')
  static const TextProcessingTask_Status $2 = _$textProcessingTaskStatus$2;

  @BuiltValueEnumConst(wireName: '3')
  static const TextProcessingTask_Status $3 = _$textProcessingTaskStatus$3;

  @BuiltValueEnumConst(wireName: '4')
  static const TextProcessingTask_Status $4 = _$textProcessingTaskStatus$4;

  // coverage:ignore-start
  static BuiltSet<TextProcessingTask_Status> get values => _$textProcessingTaskStatusValues;
  // coverage:ignore-end

  static TextProcessingTask_Status valueOf(String name) => _$valueOfTextProcessingTask_Status(name);

  int get value => jsonSerializers.serializeWith(serializer, this)! as int;

  @BuiltValueSerializer(custom: true)
  static Serializer<TextProcessingTask_Status> get serializer => const _$TextProcessingTask_StatusSerializer();
}

class _$TextProcessingTask_StatusSerializer implements PrimitiveSerializer<TextProcessingTask_Status> {
  const _$TextProcessingTask_StatusSerializer();

  static const Map<TextProcessingTask_Status, Object> _toWire = <TextProcessingTask_Status, Object>{
    TextProcessingTask_Status.$0: 0,
    TextProcessingTask_Status.$1: 1,
    TextProcessingTask_Status.$2: 2,
    TextProcessingTask_Status.$3: 3,
    TextProcessingTask_Status.$4: 4,
  };

  static const Map<Object, TextProcessingTask_Status> _fromWire = <Object, TextProcessingTask_Status>{
    0: TextProcessingTask_Status.$0,
    1: TextProcessingTask_Status.$1,
    2: TextProcessingTask_Status.$2,
    3: TextProcessingTask_Status.$3,
    4: TextProcessingTask_Status.$4,
  };

  @override
  Iterable<Type> get types => const [TextProcessingTask_Status];

  @override
  String get wireName => 'TextProcessingTask_Status';

  @override
  Object serialize(
    Serializers serializers,
    TextProcessingTask_Status object, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      _toWire[object]!;

  @override
  TextProcessingTask_Status deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      _fromWire[serialized]!;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingTaskInterface {
  int? get id;
  String get type;
  TextProcessingTask_Status get status;
  String? get userId;
  String get appId;
  String get input;
  String? get output;
  String get identifier;
  int? get completionExpectedAt;
}

abstract class TextProcessingTask
    implements $TextProcessingTaskInterface, Built<TextProcessingTask, TextProcessingTaskBuilder> {
  factory TextProcessingTask([void Function(TextProcessingTaskBuilder)? b]) = _$TextProcessingTask;

  // coverage:ignore-start
  const TextProcessingTask._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingTask.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingTask> get serializer => _$textProcessingTaskSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiScheduleResponseApplicationJson_Ocs_Data
    implements
        $TextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
            TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs_Data([
    void Function(TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiScheduleResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiScheduleResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiScheduleResponseApplicationJson_Ocs
    implements
        $TextProcessingApiScheduleResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson_Ocs,
            TextProcessingApiScheduleResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs([
    void Function(TextProcessingApiScheduleResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiScheduleResponseApplicationJsonInterface {
  TextProcessingApiScheduleResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiScheduleResponseApplicationJson
    implements
        $TextProcessingApiScheduleResponseApplicationJsonInterface,
        Built<TextProcessingApiScheduleResponseApplicationJson,
            TextProcessingApiScheduleResponseApplicationJsonBuilder> {
  factory TextProcessingApiScheduleResponseApplicationJson([
    void Function(TextProcessingApiScheduleResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiScheduleResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiScheduleResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiScheduleResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiScheduleResponseApplicationJson> get serializer =>
      _$textProcessingApiScheduleResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data
    implements
        $TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data([
    void Function(TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiGetTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson_Ocs
    implements
        $TextProcessingApiGetTaskResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson_Ocs,
            TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs([
    void Function(TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiGetTaskResponseApplicationJsonInterface {
  TextProcessingApiGetTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiGetTaskResponseApplicationJson
    implements
        $TextProcessingApiGetTaskResponseApplicationJsonInterface,
        Built<TextProcessingApiGetTaskResponseApplicationJson, TextProcessingApiGetTaskResponseApplicationJsonBuilder> {
  factory TextProcessingApiGetTaskResponseApplicationJson([
    void Function(TextProcessingApiGetTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiGetTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiGetTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiGetTaskResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiGetTaskResponseApplicationJson> get serializer =>
      _$textProcessingApiGetTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface {
  TextProcessingTask get task;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data
    implements
        $TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data([
    void Function(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson_Ocs
    implements
        $TextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
            TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs([
    void Function(TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiDeleteTaskResponseApplicationJsonInterface {
  TextProcessingApiDeleteTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiDeleteTaskResponseApplicationJson
    implements
        $TextProcessingApiDeleteTaskResponseApplicationJsonInterface,
        Built<TextProcessingApiDeleteTaskResponseApplicationJson,
            TextProcessingApiDeleteTaskResponseApplicationJsonBuilder> {
  factory TextProcessingApiDeleteTaskResponseApplicationJson([
    void Function(TextProcessingApiDeleteTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiDeleteTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiDeleteTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiDeleteTaskResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiDeleteTaskResponseApplicationJson> get serializer =>
      _$textProcessingApiDeleteTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextProcessingTask> get tasks;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data
    implements
        $TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data([
    void Function(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data get data;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson_Ocs
    implements
        $TextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
            TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs([
    void Function(TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextProcessingApiListTasksByAppResponseApplicationJsonInterface {
  TextProcessingApiListTasksByAppResponseApplicationJson_Ocs get ocs;
}

abstract class TextProcessingApiListTasksByAppResponseApplicationJson
    implements
        $TextProcessingApiListTasksByAppResponseApplicationJsonInterface,
        Built<TextProcessingApiListTasksByAppResponseApplicationJson,
            TextProcessingApiListTasksByAppResponseApplicationJsonBuilder> {
  factory TextProcessingApiListTasksByAppResponseApplicationJson([
    void Function(TextProcessingApiListTasksByAppResponseApplicationJsonBuilder)? b,
  ]) = _$TextProcessingApiListTasksByAppResponseApplicationJson;

  // coverage:ignore-start
  const TextProcessingApiListTasksByAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextProcessingApiListTasksByAppResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextProcessingApiListTasksByAppResponseApplicationJson> get serializer =>
      _$textProcessingApiListTasksByAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterface {
  bool get isAvailable;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data
    implements
        $TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data,
            TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data([
    void Function(TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data> get serializer =>
      _$textToImageApiIsAvailableResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiIsAvailableResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson_Ocs
    implements
        $TextToImageApiIsAvailableResponseApplicationJson_OcsInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson_Ocs,
            TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs([
    void Function(TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiIsAvailableResponseApplicationJson_Ocs> get serializer =>
      _$textToImageApiIsAvailableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiIsAvailableResponseApplicationJsonInterface {
  TextToImageApiIsAvailableResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiIsAvailableResponseApplicationJson
    implements
        $TextToImageApiIsAvailableResponseApplicationJsonInterface,
        Built<TextToImageApiIsAvailableResponseApplicationJson,
            TextToImageApiIsAvailableResponseApplicationJsonBuilder> {
  factory TextToImageApiIsAvailableResponseApplicationJson([
    void Function(TextToImageApiIsAvailableResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiIsAvailableResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiIsAvailableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiIsAvailableResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiIsAvailableResponseApplicationJson> get serializer =>
      _$textToImageApiIsAvailableResponseApplicationJsonSerializer;
}

class TextToImageTask_Status extends EnumClass {
  const TextToImageTask_Status._(super.name);

  @BuiltValueEnumConst(wireName: '0')
  static const TextToImageTask_Status $0 = _$textToImageTaskStatus$0;

  @BuiltValueEnumConst(wireName: '1')
  static const TextToImageTask_Status $1 = _$textToImageTaskStatus$1;

  @BuiltValueEnumConst(wireName: '2')
  static const TextToImageTask_Status $2 = _$textToImageTaskStatus$2;

  @BuiltValueEnumConst(wireName: '3')
  static const TextToImageTask_Status $3 = _$textToImageTaskStatus$3;

  @BuiltValueEnumConst(wireName: '4')
  static const TextToImageTask_Status $4 = _$textToImageTaskStatus$4;

  // coverage:ignore-start
  static BuiltSet<TextToImageTask_Status> get values => _$textToImageTaskStatusValues;
  // coverage:ignore-end

  static TextToImageTask_Status valueOf(String name) => _$valueOfTextToImageTask_Status(name);

  int get value => jsonSerializers.serializeWith(serializer, this)! as int;

  @BuiltValueSerializer(custom: true)
  static Serializer<TextToImageTask_Status> get serializer => const _$TextToImageTask_StatusSerializer();
}

class _$TextToImageTask_StatusSerializer implements PrimitiveSerializer<TextToImageTask_Status> {
  const _$TextToImageTask_StatusSerializer();

  static const Map<TextToImageTask_Status, Object> _toWire = <TextToImageTask_Status, Object>{
    TextToImageTask_Status.$0: 0,
    TextToImageTask_Status.$1: 1,
    TextToImageTask_Status.$2: 2,
    TextToImageTask_Status.$3: 3,
    TextToImageTask_Status.$4: 4,
  };

  static const Map<Object, TextToImageTask_Status> _fromWire = <Object, TextToImageTask_Status>{
    0: TextToImageTask_Status.$0,
    1: TextToImageTask_Status.$1,
    2: TextToImageTask_Status.$2,
    3: TextToImageTask_Status.$3,
    4: TextToImageTask_Status.$4,
  };

  @override
  Iterable<Type> get types => const [TextToImageTask_Status];

  @override
  String get wireName => 'TextToImageTask_Status';

  @override
  Object serialize(
    Serializers serializers,
    TextToImageTask_Status object, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      _toWire[object]!;

  @override
  TextToImageTask_Status deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      _fromWire[serialized]!;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageTaskInterface {
  int? get id;
  TextToImageTask_Status get status;
  String? get userId;
  String get appId;
  String get input;
  String? get identifier;
  int get numberOfImages;
  int? get completionExpectedAt;
}

abstract class TextToImageTask implements $TextToImageTaskInterface, Built<TextToImageTask, TextToImageTaskBuilder> {
  factory TextToImageTask([void Function(TextToImageTaskBuilder)? b]) = _$TextToImageTask;

  // coverage:ignore-start
  const TextToImageTask._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageTask.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageTask> get serializer => _$textToImageTaskSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiScheduleResponseApplicationJson_Ocs_Data
    implements
        $TextToImageApiScheduleResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiScheduleResponseApplicationJson_Ocs_Data,
            TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson_Ocs_Data([
    void Function(TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      _$textToImageApiScheduleResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiScheduleResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiScheduleResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiScheduleResponseApplicationJson_Ocs
    implements
        $TextToImageApiScheduleResponseApplicationJson_OcsInterface,
        Built<TextToImageApiScheduleResponseApplicationJson_Ocs,
            TextToImageApiScheduleResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson_Ocs([
    void Function(TextToImageApiScheduleResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiScheduleResponseApplicationJson_Ocs> get serializer =>
      _$textToImageApiScheduleResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiScheduleResponseApplicationJsonInterface {
  TextToImageApiScheduleResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiScheduleResponseApplicationJson
    implements
        $TextToImageApiScheduleResponseApplicationJsonInterface,
        Built<TextToImageApiScheduleResponseApplicationJson, TextToImageApiScheduleResponseApplicationJsonBuilder> {
  factory TextToImageApiScheduleResponseApplicationJson([
    void Function(TextToImageApiScheduleResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiScheduleResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiScheduleResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiScheduleResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiScheduleResponseApplicationJson> get serializer =>
      _$textToImageApiScheduleResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiGetTaskResponseApplicationJson_Ocs_Data
    implements
        $TextToImageApiGetTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs_Data([
    void Function(TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textToImageApiGetTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiGetTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiGetTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiGetTaskResponseApplicationJson_Ocs
    implements
        $TextToImageApiGetTaskResponseApplicationJson_OcsInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson_Ocs,
            TextToImageApiGetTaskResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs([
    void Function(TextToImageApiGetTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      _$textToImageApiGetTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiGetTaskResponseApplicationJsonInterface {
  TextToImageApiGetTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiGetTaskResponseApplicationJson
    implements
        $TextToImageApiGetTaskResponseApplicationJsonInterface,
        Built<TextToImageApiGetTaskResponseApplicationJson, TextToImageApiGetTaskResponseApplicationJsonBuilder> {
  factory TextToImageApiGetTaskResponseApplicationJson([
    void Function(TextToImageApiGetTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiGetTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiGetTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiGetTaskResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiGetTaskResponseApplicationJson> get serializer =>
      _$textToImageApiGetTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterface {
  TextToImageTask get task;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data
    implements
        $TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data,
            TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data([
    void Function(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$textToImageApiDeleteTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiDeleteTaskResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson_Ocs
    implements
        $TextToImageApiDeleteTaskResponseApplicationJson_OcsInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson_Ocs,
            TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs([
    void Function(TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      _$textToImageApiDeleteTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiDeleteTaskResponseApplicationJsonInterface {
  TextToImageApiDeleteTaskResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiDeleteTaskResponseApplicationJson
    implements
        $TextToImageApiDeleteTaskResponseApplicationJsonInterface,
        Built<TextToImageApiDeleteTaskResponseApplicationJson, TextToImageApiDeleteTaskResponseApplicationJsonBuilder> {
  factory TextToImageApiDeleteTaskResponseApplicationJson([
    void Function(TextToImageApiDeleteTaskResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiDeleteTaskResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiDeleteTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiDeleteTaskResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiDeleteTaskResponseApplicationJson> get serializer =>
      _$textToImageApiDeleteTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TextToImageTask> get tasks;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data
    implements
        $TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data,
            TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data([
    void Function(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      _$textToImageApiListTasksByAppResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiListTasksByAppResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data get data;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson_Ocs
    implements
        $TextToImageApiListTasksByAppResponseApplicationJson_OcsInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson_Ocs,
            TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs([
    void Function(TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      _$textToImageApiListTasksByAppResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TextToImageApiListTasksByAppResponseApplicationJsonInterface {
  TextToImageApiListTasksByAppResponseApplicationJson_Ocs get ocs;
}

abstract class TextToImageApiListTasksByAppResponseApplicationJson
    implements
        $TextToImageApiListTasksByAppResponseApplicationJsonInterface,
        Built<TextToImageApiListTasksByAppResponseApplicationJson,
            TextToImageApiListTasksByAppResponseApplicationJsonBuilder> {
  factory TextToImageApiListTasksByAppResponseApplicationJson([
    void Function(TextToImageApiListTasksByAppResponseApplicationJsonBuilder)? b,
  ]) = _$TextToImageApiListTasksByAppResponseApplicationJson;

  // coverage:ignore-start
  const TextToImageApiListTasksByAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TextToImageApiListTasksByAppResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TextToImageApiListTasksByAppResponseApplicationJson> get serializer =>
      _$textToImageApiListTasksByAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface {
  String get from;
  String get fromLabel;
  String get to;
  String get toLabel;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages
    implements
        $TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
            TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages([
    void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsDataLanguagesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get languages;
  bool get languageDetection;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs_Data
    implements
        $TranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs_Data,
            TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data([
    void Function(TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs_Data> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiLanguagesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TranslationApiLanguagesResponseApplicationJson_Ocs_Data get data;
}

abstract class TranslationApiLanguagesResponseApplicationJson_Ocs
    implements
        $TranslationApiLanguagesResponseApplicationJson_OcsInterface,
        Built<TranslationApiLanguagesResponseApplicationJson_Ocs,
            TranslationApiLanguagesResponseApplicationJson_OcsBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson_Ocs([
    void Function(TranslationApiLanguagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson_Ocs> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiLanguagesResponseApplicationJsonInterface {
  TranslationApiLanguagesResponseApplicationJson_Ocs get ocs;
}

abstract class TranslationApiLanguagesResponseApplicationJson
    implements
        $TranslationApiLanguagesResponseApplicationJsonInterface,
        Built<TranslationApiLanguagesResponseApplicationJson, TranslationApiLanguagesResponseApplicationJsonBuilder> {
  factory TranslationApiLanguagesResponseApplicationJson([
    void Function(TranslationApiLanguagesResponseApplicationJsonBuilder)? b,
  ]) = _$TranslationApiLanguagesResponseApplicationJson;

  // coverage:ignore-start
  const TranslationApiLanguagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiLanguagesResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiLanguagesResponseApplicationJson> get serializer =>
      _$translationApiLanguagesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiTranslateResponseApplicationJson_Ocs_DataInterface {
  String get text;
  String? get from;
}

abstract class TranslationApiTranslateResponseApplicationJson_Ocs_Data
    implements
        $TranslationApiTranslateResponseApplicationJson_Ocs_DataInterface,
        Built<TranslationApiTranslateResponseApplicationJson_Ocs_Data,
            TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder> {
  factory TranslationApiTranslateResponseApplicationJson_Ocs_Data([
    void Function(TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs_Data> get serializer =>
      _$translationApiTranslateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiTranslateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TranslationApiTranslateResponseApplicationJson_Ocs_Data get data;
}

abstract class TranslationApiTranslateResponseApplicationJson_Ocs
    implements
        $TranslationApiTranslateResponseApplicationJson_OcsInterface,
        Built<TranslationApiTranslateResponseApplicationJson_Ocs,
            TranslationApiTranslateResponseApplicationJson_OcsBuilder> {
  factory TranslationApiTranslateResponseApplicationJson_Ocs([
    void Function(TranslationApiTranslateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson_Ocs> get serializer =>
      _$translationApiTranslateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TranslationApiTranslateResponseApplicationJsonInterface {
  TranslationApiTranslateResponseApplicationJson_Ocs get ocs;
}

abstract class TranslationApiTranslateResponseApplicationJson
    implements
        $TranslationApiTranslateResponseApplicationJsonInterface,
        Built<TranslationApiTranslateResponseApplicationJson, TranslationApiTranslateResponseApplicationJsonBuilder> {
  factory TranslationApiTranslateResponseApplicationJson([
    void Function(TranslationApiTranslateResponseApplicationJsonBuilder)? b,
  ]) = _$TranslationApiTranslateResponseApplicationJson;

  // coverage:ignore-start
  const TranslationApiTranslateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TranslationApiTranslateResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TranslationApiTranslateResponseApplicationJson> get serializer =>
      _$translationApiTranslateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchProviderInterface {
  String get id;
  String? get appId;
  String get name;
  String? get icon;
  int get order;
  BuiltList<String>? get triggers;
  BuiltMap<String, String>? get filters;
  bool? get inAppSearch;
}

abstract class UnifiedSearchProvider
    implements $UnifiedSearchProviderInterface, Built<UnifiedSearchProvider, UnifiedSearchProviderBuilder> {
  factory UnifiedSearchProvider([void Function(UnifiedSearchProviderBuilder)? b]) = _$UnifiedSearchProvider;

  // coverage:ignore-start
  const UnifiedSearchProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchProvider.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchProvider> get serializer => _$unifiedSearchProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchGetProvidersResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<UnifiedSearchProvider> get data;
}

abstract class UnifiedSearchGetProvidersResponseApplicationJson_Ocs
    implements
        $UnifiedSearchGetProvidersResponseApplicationJson_OcsInterface,
        Built<UnifiedSearchGetProvidersResponseApplicationJson_Ocs,
            UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder> {
  factory UnifiedSearchGetProvidersResponseApplicationJson_Ocs([
    void Function(UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UnifiedSearchGetProvidersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UnifiedSearchGetProvidersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchGetProvidersResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson_Ocs> get serializer =>
      _$unifiedSearchGetProvidersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchGetProvidersResponseApplicationJsonInterface {
  UnifiedSearchGetProvidersResponseApplicationJson_Ocs get ocs;
}

abstract class UnifiedSearchGetProvidersResponseApplicationJson
    implements
        $UnifiedSearchGetProvidersResponseApplicationJsonInterface,
        Built<UnifiedSearchGetProvidersResponseApplicationJson,
            UnifiedSearchGetProvidersResponseApplicationJsonBuilder> {
  factory UnifiedSearchGetProvidersResponseApplicationJson([
    void Function(UnifiedSearchGetProvidersResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedSearchGetProvidersResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedSearchGetProvidersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchGetProvidersResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchGetProvidersResponseApplicationJson> get serializer =>
      _$unifiedSearchGetProvidersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchResultEntryInterface {
  String get thumbnailUrl;
  String get title;
  String get subline;
  String get resourceUrl;
  String get icon;
  bool get rounded;
  BuiltList<String> get attributes;
}

abstract class UnifiedSearchResultEntry
    implements $UnifiedSearchResultEntryInterface, Built<UnifiedSearchResultEntry, UnifiedSearchResultEntryBuilder> {
  factory UnifiedSearchResultEntry([void Function(UnifiedSearchResultEntryBuilder)? b]) = _$UnifiedSearchResultEntry;

  // coverage:ignore-start
  const UnifiedSearchResultEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchResultEntry.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchResultEntry> get serializer => _$unifiedSearchResultEntrySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchResultInterface {
  String get name;
  bool get isPaginated;
  BuiltList<UnifiedSearchResultEntry> get entries;
  UnifiedSearchResult_Cursor? get cursor;
}

abstract class UnifiedSearchResult
    implements $UnifiedSearchResultInterface, Built<UnifiedSearchResult, UnifiedSearchResultBuilder> {
  factory UnifiedSearchResult([void Function(UnifiedSearchResultBuilder)? b]) = _$UnifiedSearchResult;

  // coverage:ignore-start
  const UnifiedSearchResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchResult.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchResult> get serializer => _$unifiedSearchResultSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(UnifiedSearchResultBuilder b) {
    b.cursor?.validateOneOf();
  }
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchSearchResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  UnifiedSearchResult get data;
}

abstract class UnifiedSearchSearchResponseApplicationJson_Ocs
    implements
        $UnifiedSearchSearchResponseApplicationJson_OcsInterface,
        Built<UnifiedSearchSearchResponseApplicationJson_Ocs, UnifiedSearchSearchResponseApplicationJson_OcsBuilder> {
  factory UnifiedSearchSearchResponseApplicationJson_Ocs([
    void Function(UnifiedSearchSearchResponseApplicationJson_OcsBuilder)? b,
  ]) = _$UnifiedSearchSearchResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const UnifiedSearchSearchResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchSearchResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchSearchResponseApplicationJson_Ocs> get serializer =>
      _$unifiedSearchSearchResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $UnifiedSearchSearchResponseApplicationJsonInterface {
  UnifiedSearchSearchResponseApplicationJson_Ocs get ocs;
}

abstract class UnifiedSearchSearchResponseApplicationJson
    implements
        $UnifiedSearchSearchResponseApplicationJsonInterface,
        Built<UnifiedSearchSearchResponseApplicationJson, UnifiedSearchSearchResponseApplicationJsonBuilder> {
  factory UnifiedSearchSearchResponseApplicationJson([
    void Function(UnifiedSearchSearchResponseApplicationJsonBuilder)? b,
  ]) = _$UnifiedSearchSearchResponseApplicationJson;

  // coverage:ignore-start
  const UnifiedSearchSearchResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory UnifiedSearchSearchResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<UnifiedSearchSearchResponseApplicationJson> get serializer =>
      _$unifiedSearchSearchResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface {
  BuiltList<String> get regular;
  BuiltList<String> get admin;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew
    implements
        $WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
            WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew([
    void Function(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder)? b,
  ]) = _$WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsDataWhatsNewSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewGetResponseApplicationJson_Ocs_DataInterface {
  String get changelogURL;
  String get product;
  String get version;
  WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew? get whatsNew;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs_Data
    implements
        $WhatsNewGetResponseApplicationJson_Ocs_DataInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs_Data, WhatsNewGetResponseApplicationJson_Ocs_DataBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs_Data([
    void Function(WhatsNewGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$WhatsNewGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  WhatsNewGetResponseApplicationJson_Ocs_Data get data;
}

abstract class WhatsNewGetResponseApplicationJson_Ocs
    implements
        $WhatsNewGetResponseApplicationJson_OcsInterface,
        Built<WhatsNewGetResponseApplicationJson_Ocs, WhatsNewGetResponseApplicationJson_OcsBuilder> {
  factory WhatsNewGetResponseApplicationJson_Ocs([void Function(WhatsNewGetResponseApplicationJson_OcsBuilder)? b]) =
      _$WhatsNewGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson_Ocs> get serializer =>
      _$whatsNewGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewGetResponseApplicationJsonInterface {
  WhatsNewGetResponseApplicationJson_Ocs get ocs;
}

abstract class WhatsNewGetResponseApplicationJson
    implements
        $WhatsNewGetResponseApplicationJsonInterface,
        Built<WhatsNewGetResponseApplicationJson, WhatsNewGetResponseApplicationJsonBuilder> {
  factory WhatsNewGetResponseApplicationJson([void Function(WhatsNewGetResponseApplicationJsonBuilder)? b]) =
      _$WhatsNewGetResponseApplicationJson;

  // coverage:ignore-start
  const WhatsNewGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewGetResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewGetResponseApplicationJson> get serializer =>
      _$whatsNewGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewDismissResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class WhatsNewDismissResponseApplicationJson_Ocs
    implements
        $WhatsNewDismissResponseApplicationJson_OcsInterface,
        Built<WhatsNewDismissResponseApplicationJson_Ocs, WhatsNewDismissResponseApplicationJson_OcsBuilder> {
  factory WhatsNewDismissResponseApplicationJson_Ocs([
    void Function(WhatsNewDismissResponseApplicationJson_OcsBuilder)? b,
  ]) = _$WhatsNewDismissResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const WhatsNewDismissResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewDismissResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewDismissResponseApplicationJson_Ocs> get serializer =>
      _$whatsNewDismissResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WhatsNewDismissResponseApplicationJsonInterface {
  WhatsNewDismissResponseApplicationJson_Ocs get ocs;
}

abstract class WhatsNewDismissResponseApplicationJson
    implements
        $WhatsNewDismissResponseApplicationJsonInterface,
        Built<WhatsNewDismissResponseApplicationJson, WhatsNewDismissResponseApplicationJsonBuilder> {
  factory WhatsNewDismissResponseApplicationJson([void Function(WhatsNewDismissResponseApplicationJsonBuilder)? b]) =
      _$WhatsNewDismissResponseApplicationJson;

  // coverage:ignore-start
  const WhatsNewDismissResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WhatsNewDismissResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WhatsNewDismissResponseApplicationJson> get serializer =>
      _$whatsNewDismissResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $WipeCheckWipeResponseApplicationJsonInterface {
  bool get wipe;
}

abstract class WipeCheckWipeResponseApplicationJson
    implements
        $WipeCheckWipeResponseApplicationJsonInterface,
        Built<WipeCheckWipeResponseApplicationJson, WipeCheckWipeResponseApplicationJsonBuilder> {
  factory WipeCheckWipeResponseApplicationJson([void Function(WipeCheckWipeResponseApplicationJsonBuilder)? b]) =
      _$WipeCheckWipeResponseApplicationJson;

  // coverage:ignore-start
  const WipeCheckWipeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory WipeCheckWipeResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<WipeCheckWipeResponseApplicationJson> get serializer =>
      _$wipeCheckWipeResponseApplicationJsonSerializer;
}

typedef AutocompleteResult_Status = ({AutocompleteResult_Status0? autocompleteResultStatus0, String? string});

typedef NavigationEntry_Order = ({int? $int, String? string});

typedef SharebymailCapabilities = ({
  BuiltList<Never>? builtListNever,
  SharebymailCapabilities0? sharebymailCapabilities0
});

typedef SpreedPublicCapabilities = ({
  BuiltList<Never>? builtListNever,
  SpreedPublicCapabilities0? spreedPublicCapabilities0
});

typedef OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities = ({
  CommentsCapabilities? commentsCapabilities,
  DavCapabilities? davCapabilities,
  FilesCapabilities? filesCapabilities,
  FilesSharingCapabilities? filesSharingCapabilities,
  FilesTrashbinCapabilities? filesTrashbinCapabilities,
  FilesVersionsCapabilities? filesVersionsCapabilities,
  NotesCapabilities? notesCapabilities,
  NotificationsCapabilities? notificationsCapabilities,
  ProvisioningApiCapabilities? provisioningApiCapabilities,
  SharebymailCapabilities? sharebymailCapabilities,
  SpreedPublicCapabilities? spreedPublicCapabilities,
  ThemingPublicCapabilities? themingPublicCapabilities,
  UserStatusCapabilities? userStatusCapabilities,
  WeatherStatusCapabilities? weatherStatusCapabilities
});

typedef UnifiedSearchSearchCursor = ({int? $int, String? string});

typedef UnifiedSearchResult_Cursor = ({int? $int, String? string});

typedef $AutocompleteResultStatus0String = ({AutocompleteResult_Status0? autocompleteResultStatus0, String? string});

extension $AutocompleteResultStatus0StringExtension on $AutocompleteResultStatus0String {
  List<dynamic> get _values => [autocompleteResultStatus0, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$AutocompleteResultStatus0String> get serializer =>
      const _$AutocompleteResultStatus0StringSerializer();
  static $AutocompleteResultStatus0String fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$AutocompleteResultStatus0StringSerializer implements PrimitiveSerializer<$AutocompleteResultStatus0String> {
  const _$AutocompleteResultStatus0StringSerializer();

  @override
  Iterable<Type> get types => const [$AutocompleteResultStatus0String];

  @override
  String get wireName => r'$AutocompleteResultStatus0String';

  @override
  Object serialize(
    Serializers serializers,
    $AutocompleteResultStatus0String object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.autocompleteResultStatus0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(AutocompleteResult_Status0))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $AutocompleteResultStatus0String deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    AutocompleteResult_Status0? autocompleteResultStatus0;
    try {
      autocompleteResultStatus0 = serializers.deserialize(
        data,
        specifiedType: const FullType(AutocompleteResult_Status0),
      )! as AutocompleteResult_Status0;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return (autocompleteResultStatus0: autocompleteResultStatus0, string: string);
  }
}

typedef $IntString = ({int? $int, String? string});

extension $IntStringExtension on $IntString {
  List<dynamic> get _values => [$int, string];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$IntString> get serializer => const _$IntStringSerializer();
  static $IntString fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$IntStringSerializer implements PrimitiveSerializer<$IntString> {
  const _$IntStringSerializer();

  @override
  Iterable<Type> get types => const [$IntString];

  @override
  String get wireName => r'$IntString';

  @override
  Object serialize(
    Serializers serializers,
    $IntString object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.$int;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(int))!;
    }
    value = object.string;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(String))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $IntString deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    int? $int;
    try {
      $int = serializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    String? string;
    try {
      string = serializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    return ($int: $int, string: string);
  }
}

typedef $BuiltListSharebymailCapabilities0 = ({
  BuiltList<Never>? builtListNever,
  SharebymailCapabilities0? sharebymailCapabilities0
});

extension $BuiltListSharebymailCapabilities0Extension on $BuiltListSharebymailCapabilities0 {
  List<dynamic> get _values => [builtListNever, sharebymailCapabilities0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListSharebymailCapabilities0> get serializer =>
      const _$BuiltListSharebymailCapabilities0Serializer();
  static $BuiltListSharebymailCapabilities0 fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListSharebymailCapabilities0Serializer implements PrimitiveSerializer<$BuiltListSharebymailCapabilities0> {
  const _$BuiltListSharebymailCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListSharebymailCapabilities0];

  @override
  String get wireName => r'$BuiltListSharebymailCapabilities0';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListSharebymailCapabilities0 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.sharebymailCapabilities0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(SharebymailCapabilities0))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListSharebymailCapabilities0 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    SharebymailCapabilities0? sharebymailCapabilities0;
    try {
      sharebymailCapabilities0 = serializers.deserialize(data, specifiedType: const FullType(SharebymailCapabilities0))!
          as SharebymailCapabilities0;
    } catch (_) {}
    return (builtListNever: builtListNever, sharebymailCapabilities0: sharebymailCapabilities0);
  }
}

typedef $BuiltListSpreedPublicCapabilities0 = ({
  BuiltList<Never>? builtListNever,
  SpreedPublicCapabilities0? spreedPublicCapabilities0
});

extension $BuiltListSpreedPublicCapabilities0Extension on $BuiltListSpreedPublicCapabilities0 {
  List<dynamic> get _values => [builtListNever, spreedPublicCapabilities0];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListSpreedPublicCapabilities0> get serializer =>
      const _$BuiltListSpreedPublicCapabilities0Serializer();
  static $BuiltListSpreedPublicCapabilities0 fromJson(Object? json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListSpreedPublicCapabilities0Serializer
    implements PrimitiveSerializer<$BuiltListSpreedPublicCapabilities0> {
  const _$BuiltListSpreedPublicCapabilities0Serializer();

  @override
  Iterable<Type> get types => const [$BuiltListSpreedPublicCapabilities0];

  @override
  String get wireName => r'$BuiltListSpreedPublicCapabilities0';

  @override
  Object serialize(
    Serializers serializers,
    $BuiltListSpreedPublicCapabilities0 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListNever;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(Never)]))!;
    }
    value = object.spreedPublicCapabilities0;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(SpreedPublicCapabilities0))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListSpreedPublicCapabilities0 deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<Never>? builtListNever;
    try {
      builtListNever = serializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(Never)]))!
          as BuiltList<Never>;
    } catch (_) {}
    SpreedPublicCapabilities0? spreedPublicCapabilities0;
    try {
      spreedPublicCapabilities0 = serializers.deserialize(
        data,
        specifiedType: const FullType(SpreedPublicCapabilities0),
      )! as SpreedPublicCapabilities0;
    } catch (_) {}
    return (builtListNever: builtListNever, spreedPublicCapabilities0: spreedPublicCapabilities0);
  }
}

typedef $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities
    = ({
  CommentsCapabilities? commentsCapabilities,
  DavCapabilities? davCapabilities,
  FilesCapabilities? filesCapabilities,
  FilesSharingCapabilities? filesSharingCapabilities,
  FilesTrashbinCapabilities? filesTrashbinCapabilities,
  FilesVersionsCapabilities? filesVersionsCapabilities,
  NotesCapabilities? notesCapabilities,
  NotificationsCapabilities? notificationsCapabilities,
  ProvisioningApiCapabilities? provisioningApiCapabilities,
  SharebymailCapabilities? sharebymailCapabilities,
  SpreedPublicCapabilities? spreedPublicCapabilities,
  ThemingPublicCapabilities? themingPublicCapabilities,
  UserStatusCapabilities? userStatusCapabilities,
  WeatherStatusCapabilities? weatherStatusCapabilities
});

extension $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilitiesExtension
    on $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities {
  List<dynamic> get _values => [
        commentsCapabilities,
        davCapabilities,
        filesCapabilities,
        filesSharingCapabilities,
        filesTrashbinCapabilities,
        filesVersionsCapabilities,
        notesCapabilities,
        notificationsCapabilities,
        provisioningApiCapabilities,
        sharebymailCapabilities,
        spreedPublicCapabilities,
        themingPublicCapabilities,
        userStatusCapabilities,
        weatherStatusCapabilities,
      ];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<
          $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities>
      get serializer =>
          const _$CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilitiesSerializer();
  static $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities
      fromJson(Object? json) => jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => jsonSerializers.serializeWith(serializer, this);
}

class _$CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilitiesSerializer
    implements
        PrimitiveSerializer<
            $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities> {
  const _$CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [
        $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities,
      ];

  @override
  String get wireName =>
      r'$CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities';

  @override
  Object serialize(
    Serializers serializers,
    $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities
        object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.commentsCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(CommentsCapabilities))!;
    }
    value = object.davCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(DavCapabilities))!;
    }
    value = object.filesCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(FilesCapabilities))!;
    }
    value = object.filesSharingCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(FilesSharingCapabilities))!;
    }
    value = object.filesTrashbinCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(FilesTrashbinCapabilities))!;
    }
    value = object.filesVersionsCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(FilesVersionsCapabilities))!;
    }
    value = object.notesCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(NotesCapabilities))!;
    }
    value = object.notificationsCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(NotificationsCapabilities))!;
    }
    value = object.provisioningApiCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ProvisioningApiCapabilities))!;
    }
    value = object.sharebymailCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(SharebymailCapabilities))!;
    }
    value = object.spreedPublicCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(SpreedPublicCapabilities))!;
    }
    value = object.themingPublicCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(ThemingPublicCapabilities))!;
    }
    value = object.userStatusCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(UserStatusCapabilities))!;
    }
    value = object.weatherStatusCapabilities;
    if (value != null) {
      return serializers.serialize(value, specifiedType: const FullType(WeatherStatusCapabilities))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilities
      deserialize(
    Serializers serializers,
    Object data, {
    FullType specifiedType = FullType.unspecified,
  }) {
    CommentsCapabilities? commentsCapabilities;
    try {
      commentsCapabilities =
          serializers.deserialize(data, specifiedType: const FullType(CommentsCapabilities))! as CommentsCapabilities;
    } catch (_) {}
    DavCapabilities? davCapabilities;
    try {
      davCapabilities =
          serializers.deserialize(data, specifiedType: const FullType(DavCapabilities))! as DavCapabilities;
    } catch (_) {}
    FilesCapabilities? filesCapabilities;
    try {
      filesCapabilities =
          serializers.deserialize(data, specifiedType: const FullType(FilesCapabilities))! as FilesCapabilities;
    } catch (_) {}
    FilesSharingCapabilities? filesSharingCapabilities;
    try {
      filesSharingCapabilities = serializers.deserialize(data, specifiedType: const FullType(FilesSharingCapabilities))!
          as FilesSharingCapabilities;
    } catch (_) {}
    FilesTrashbinCapabilities? filesTrashbinCapabilities;
    try {
      filesTrashbinCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(FilesTrashbinCapabilities),
      )! as FilesTrashbinCapabilities;
    } catch (_) {}
    FilesVersionsCapabilities? filesVersionsCapabilities;
    try {
      filesVersionsCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(FilesVersionsCapabilities),
      )! as FilesVersionsCapabilities;
    } catch (_) {}
    NotesCapabilities? notesCapabilities;
    try {
      notesCapabilities =
          serializers.deserialize(data, specifiedType: const FullType(NotesCapabilities))! as NotesCapabilities;
    } catch (_) {}
    NotificationsCapabilities? notificationsCapabilities;
    try {
      notificationsCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(NotificationsCapabilities),
      )! as NotificationsCapabilities;
    } catch (_) {}
    ProvisioningApiCapabilities? provisioningApiCapabilities;
    try {
      provisioningApiCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiCapabilities),
      )! as ProvisioningApiCapabilities;
    } catch (_) {}
    SharebymailCapabilities? sharebymailCapabilities;
    try {
      sharebymailCapabilities = ((serializers.deserialize(data, specifiedType: const FullType(SharebymailCapabilities))!
          as SharebymailCapabilities)
        ..validateOneOf());
    } catch (_) {}
    SpreedPublicCapabilities? spreedPublicCapabilities;
    try {
      spreedPublicCapabilities = ((serializers.deserialize(
        data,
        specifiedType: const FullType(SpreedPublicCapabilities),
      )! as SpreedPublicCapabilities)
        ..validateOneOf());
    } catch (_) {}
    ThemingPublicCapabilities? themingPublicCapabilities;
    try {
      themingPublicCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(ThemingPublicCapabilities),
      )! as ThemingPublicCapabilities;
    } catch (_) {}
    UserStatusCapabilities? userStatusCapabilities;
    try {
      userStatusCapabilities = serializers.deserialize(data, specifiedType: const FullType(UserStatusCapabilities))!
          as UserStatusCapabilities;
    } catch (_) {}
    WeatherStatusCapabilities? weatherStatusCapabilities;
    try {
      weatherStatusCapabilities = serializers.deserialize(
        data,
        specifiedType: const FullType(WeatherStatusCapabilities),
      )! as WeatherStatusCapabilities;
    } catch (_) {}
    return (
      commentsCapabilities: commentsCapabilities,
      davCapabilities: davCapabilities,
      filesCapabilities: filesCapabilities,
      filesSharingCapabilities: filesSharingCapabilities,
      filesTrashbinCapabilities: filesTrashbinCapabilities,
      filesVersionsCapabilities: filesVersionsCapabilities,
      notesCapabilities: notesCapabilities,
      notificationsCapabilities: notificationsCapabilities,
      provisioningApiCapabilities: provisioningApiCapabilities,
      sharebymailCapabilities: sharebymailCapabilities,
      spreedPublicCapabilities: spreedPublicCapabilities,
      themingPublicCapabilities: themingPublicCapabilities,
      userStatusCapabilities: userStatusCapabilities,
      weatherStatusCapabilities: weatherStatusCapabilities
    );
  }
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Status), StatusBuilder.new)
      ..add(Status.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson),
        AppPasswordGetAppPasswordResponseApplicationJsonBuilder.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs),
        AppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data),
        AppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson),
        AppPasswordRotateAppPasswordResponseApplicationJsonBuilder.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs),
        AppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data),
        AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(AppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson),
        AppPasswordDeleteAppPasswordResponseApplicationJsonBuilder.new,
      )
      ..add(AppPasswordDeleteAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs),
        AppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(AutoCompleteGetResponseApplicationJson),
        AutoCompleteGetResponseApplicationJsonBuilder.new,
      )
      ..add(AutoCompleteGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(AutoCompleteGetResponseApplicationJson_Ocs),
        AutoCompleteGetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(AutoCompleteGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(AutocompleteResult), AutocompleteResultBuilder.new)
      ..add(AutocompleteResult.serializer)
      ..addBuilderFactory(const FullType(AutocompleteResult_Status0), AutocompleteResult_Status0Builder.new)
      ..add(AutocompleteResult_Status0.serializer)
      ..add($AutocompleteResultStatus0StringExtension.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AutocompleteResult)]),
        ListBuilder<AutocompleteResult>.new,
      )
      ..addBuilderFactory(const FullType(AvatarAvatarGetAvatarDarkHeaders), AvatarAvatarGetAvatarDarkHeadersBuilder.new)
      ..add(AvatarAvatarGetAvatarDarkHeaders.serializer)
      ..addBuilderFactory(const FullType(Header, [FullType(int)]), HeaderBuilder<int>.new)
      ..add(Header.serializer)
      ..addBuilderFactory(const FullType(AvatarAvatarGetAvatarHeaders), AvatarAvatarGetAvatarHeadersBuilder.new)
      ..add(AvatarAvatarGetAvatarHeaders.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2Credentials), LoginFlowV2CredentialsBuilder.new)
      ..add(LoginFlowV2Credentials.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2), LoginFlowV2Builder.new)
      ..add(LoginFlowV2.serializer)
      ..addBuilderFactory(const FullType(LoginFlowV2_Poll), LoginFlowV2_PollBuilder.new)
      ..add(LoginFlowV2_Poll.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson),
        CollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesSearchCollectionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs),
        CollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Collection), CollectionBuilder.new)
      ..add(Collection.serializer)
      ..addBuilderFactory(const FullType(Resource), ResourceBuilder.new)
      ..add(Resource.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(const FullType(OpenGraphObject), OpenGraphObjectBuilder.new)
      ..add(OpenGraphObject.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Resource)]), ListBuilder<Resource>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Collection)]), ListBuilder<Collection>.new)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesListCollectionResponseApplicationJson),
        CollaborationResourcesListCollectionResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesListCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesListCollectionResponseApplicationJson_Ocs),
        CollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesListCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson),
        CollaborationResourcesRenameCollectionResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesRenameCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs),
        CollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesAddResourceResponseApplicationJson),
        CollaborationResourcesAddResourceResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesAddResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesAddResourceResponseApplicationJson_Ocs),
        CollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesAddResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson),
        CollaborationResourcesRemoveResourceResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesRemoveResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs),
        CollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs),
        CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder.new,
      )
      ..add(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs),
        CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder.new,
      )
      ..add(CollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson),
        HoverCardGetUserResponseApplicationJsonBuilder.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson_Ocs),
        HoverCardGetUserResponseApplicationJson_OcsBuilder.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(HoverCardGetUserResponseApplicationJson_Ocs_Data),
        HoverCardGetUserResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(HoverCardGetUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ContactsAction), ContactsActionBuilder.new)
      ..add(ContactsAction.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ContactsAction)]), ListBuilder<ContactsAction>.new)
      ..addBuilderFactory(
        const FullType(NavigationGetAppsNavigationResponseApplicationJson),
        NavigationGetAppsNavigationResponseApplicationJsonBuilder.new,
      )
      ..add(NavigationGetAppsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NavigationGetAppsNavigationResponseApplicationJson_Ocs),
        NavigationGetAppsNavigationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(NavigationGetAppsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NavigationEntry), NavigationEntryBuilder.new)
      ..add(NavigationEntry.serializer)
      ..add($IntStringExtension.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NavigationEntry)]), ListBuilder<NavigationEntry>.new)
      ..addBuilderFactory(
        const FullType(NavigationGetSettingsNavigationResponseApplicationJson),
        NavigationGetSettingsNavigationResponseApplicationJsonBuilder.new,
      )
      ..add(NavigationGetSettingsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NavigationGetSettingsNavigationResponseApplicationJson_Ocs),
        NavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder.new,
      )
      ..add(NavigationGetSettingsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OcmOcmDiscoveryHeaders), OcmOcmDiscoveryHeadersBuilder.new)
      ..add(OcmOcmDiscoveryHeaders.serializer)
      ..addBuilderFactory(const FullType(Header, [FullType(bool)]), HeaderBuilder<bool>.new)
      ..addBuilderFactory(
        const FullType(OcmDiscoveryResponseApplicationJson),
        OcmDiscoveryResponseApplicationJsonBuilder.new,
      )
      ..add(OcmDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes),
        OcmDiscoveryResponseApplicationJson_ResourceTypesBuilder.new,
      )
      ..add(OcmDiscoveryResponseApplicationJson_ResourceTypes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols),
        OcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder.new,
      )
      ..add(OcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(OcmDiscoveryResponseApplicationJson_ResourceTypes)]),
        ListBuilder<OcmDiscoveryResponseApplicationJson_ResourceTypes>.new,
      )
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson),
        OcsGetCapabilitiesResponseApplicationJsonBuilder.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs),
        OcsGetCapabilitiesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data),
        OcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version),
        OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder.new,
      )
      ..add(OcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities), CommentsCapabilitiesBuilder.new)
      ..add(CommentsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities_Files), CommentsCapabilities_FilesBuilder.new)
      ..add(CommentsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities), DavCapabilitiesBuilder.new)
      ..add(DavCapabilities.serializer)
      ..addBuilderFactory(const FullType(DavCapabilities_Dav), DavCapabilities_DavBuilder.new)
      ..add(DavCapabilities_Dav.serializer)
      ..addBuilderFactory(const FullType(FilesCapabilities), FilesCapabilitiesBuilder.new)
      ..add(FilesCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesCapabilities_Files), FilesCapabilities_FilesBuilder.new)
      ..add(FilesCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(
        const FullType(FilesCapabilities_Files_DirectEditing),
        FilesCapabilities_Files_DirectEditingBuilder.new,
      )
      ..add(FilesCapabilities_Files_DirectEditing.serializer)
      ..addBuilderFactory(const FullType(FilesSharingCapabilities), FilesSharingCapabilitiesBuilder.new)
      ..add(FilesSharingCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing),
        FilesSharingCapabilities_FilesSharingBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public),
        FilesSharingCapabilities_FilesSharing_PublicBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_Password),
        FilesSharingCapabilities_FilesSharing_Public_PasswordBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_Password.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote),
        FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_User),
        FilesSharingCapabilities_FilesSharing_UserBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_User.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_User_ExpireDate),
        FilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_User_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Group),
        FilesSharingCapabilities_FilesSharing_GroupBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Group.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Group_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Group_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation),
        FilesSharingCapabilities_FilesSharing_FederationBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate),
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported),
        FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingCapabilities_FilesSharing_Sharee),
        FilesSharingCapabilities_FilesSharing_ShareeBuilder.new,
      )
      ..add(FilesSharingCapabilities_FilesSharing_Sharee.serializer)
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities), FilesTrashbinCapabilitiesBuilder.new)
      ..add(FilesTrashbinCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities_Files), FilesTrashbinCapabilities_FilesBuilder.new)
      ..add(FilesTrashbinCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities), FilesVersionsCapabilitiesBuilder.new)
      ..add(FilesVersionsCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities_Files), FilesVersionsCapabilities_FilesBuilder.new)
      ..add(FilesVersionsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities), NotesCapabilitiesBuilder.new)
      ..add(NotesCapabilities.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities_Notes), NotesCapabilities_NotesBuilder.new)
      ..add(NotesCapabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(NotificationsCapabilities), NotificationsCapabilitiesBuilder.new)
      ..add(NotificationsCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsCapabilities_Notifications),
        NotificationsCapabilities_NotificationsBuilder.new,
      )
      ..add(NotificationsCapabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiCapabilities), ProvisioningApiCapabilitiesBuilder.new)
      ..add(ProvisioningApiCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiCapabilities_ProvisioningApi),
        ProvisioningApiCapabilities_ProvisioningApiBuilder.new,
      )
      ..add(ProvisioningApiCapabilities_ProvisioningApi.serializer)
      ..addBuilderFactory(const FullType(SharebymailCapabilities0), SharebymailCapabilities0Builder.new)
      ..add(SharebymailCapabilities0.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing),
        SharebymailCapabilities0_FilesSharingBuilder.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail),
        SharebymailCapabilities0_FilesSharing_SharebymailBuilder.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop),
        SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDropBuilder.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_Password),
        SharebymailCapabilities0_FilesSharing_Sharebymail_PasswordBuilder.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate),
        SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDateBuilder.new,
      )
      ..add(SharebymailCapabilities0_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Never)]), ListBuilder<Never>.new)
      ..add($BuiltListSharebymailCapabilities0Extension.serializer)
      ..addBuilderFactory(const FullType(SpreedPublicCapabilities0), SpreedPublicCapabilities0Builder.new)
      ..add(SpreedPublicCapabilities0.serializer)
      ..addBuilderFactory(const FullType(SpreedPublicCapabilities0_Spreed), SpreedPublicCapabilities0_SpreedBuilder.new)
      ..add(SpreedPublicCapabilities0_Spreed.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config),
        SpreedPublicCapabilities0_Spreed_ConfigBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Attachments),
        SpreedPublicCapabilities0_Spreed_Config_AttachmentsBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Attachments.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Call),
        SpreedPublicCapabilities0_Spreed_Config_CallBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Call.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Chat),
        SpreedPublicCapabilities0_Spreed_Config_ChatBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Chat.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Conversations),
        SpreedPublicCapabilities0_Spreed_Config_ConversationsBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Conversations.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Previews),
        SpreedPublicCapabilities0_Spreed_Config_PreviewsBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Previews.serializer)
      ..addBuilderFactory(
        const FullType(SpreedPublicCapabilities0_Spreed_Config_Signaling),
        SpreedPublicCapabilities0_Spreed_Config_SignalingBuilder.new,
      )
      ..add(SpreedPublicCapabilities0_Spreed_Config_Signaling.serializer)
      ..add($BuiltListSpreedPublicCapabilities0Extension.serializer)
      ..addBuilderFactory(const FullType(ThemingPublicCapabilities), ThemingPublicCapabilitiesBuilder.new)
      ..add(ThemingPublicCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(ThemingPublicCapabilities_Theming),
        ThemingPublicCapabilities_ThemingBuilder.new,
      )
      ..add(ThemingPublicCapabilities_Theming.serializer)
      ..addBuilderFactory(const FullType(UserStatusCapabilities), UserStatusCapabilitiesBuilder.new)
      ..add(UserStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(UserStatusCapabilities_UserStatus),
        UserStatusCapabilities_UserStatusBuilder.new,
      )
      ..add(UserStatusCapabilities_UserStatus.serializer)
      ..addBuilderFactory(const FullType(WeatherStatusCapabilities), WeatherStatusCapabilitiesBuilder.new)
      ..add(WeatherStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(WeatherStatusCapabilities_WeatherStatus),
        WeatherStatusCapabilities_WeatherStatusBuilder.new,
      )
      ..add(WeatherStatusCapabilities_WeatherStatus.serializer)
      ..add(
        $CommentsCapabilitiesDavCapabilitiesFilesCapabilitiesFilesSharingCapabilitiesFilesTrashbinCapabilitiesFilesVersionsCapabilitiesNotesCapabilitiesNotificationsCapabilitiesProvisioningApiCapabilitiesSharebymailCapabilitiesSpreedPublicCapabilitiesThemingPublicCapabilitiesUserStatusCapabilitiesWeatherStatusCapabilitiesExtension
            .serializer,
      )
      ..addBuilderFactory(
        const FullType(ProfileApiSetVisibilityResponseApplicationJson),
        ProfileApiSetVisibilityResponseApplicationJsonBuilder.new,
      )
      ..add(ProfileApiSetVisibilityResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProfileApiSetVisibilityResponseApplicationJson_Ocs),
        ProfileApiSetVisibilityResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ProfileApiSetVisibilityResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson),
        ReferenceApiResolveOneResponseApplicationJsonBuilder.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs),
        ReferenceApiResolveOneResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data),
        ReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ReferenceApiResolveOneResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(Reference), ReferenceBuilder.new)
      ..add(Reference.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(Reference)]),
        MapBuilder<String, Reference>.new,
      )
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson),
        ReferenceApiResolveResponseApplicationJsonBuilder.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson_Ocs),
        ReferenceApiResolveResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiResolveResponseApplicationJson_Ocs_Data),
        ReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ReferenceApiResolveResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson),
        ReferenceApiExtractResponseApplicationJsonBuilder.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson_Ocs),
        ReferenceApiExtractResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiExtractResponseApplicationJson_Ocs_Data),
        ReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ReferenceApiExtractResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson),
        ReferenceApiGetProvidersInfoResponseApplicationJsonBuilder.new,
      )
      ..add(ReferenceApiGetProvidersInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs),
        ReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ReferenceProvider), ReferenceProviderBuilder.new)
      ..add(ReferenceProvider.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ReferenceProvider)]), ListBuilder<ReferenceProvider>.new)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson),
        ReferenceApiTouchProviderResponseApplicationJsonBuilder.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs),
        ReferenceApiTouchProviderResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data),
        ReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson),
        TextProcessingApiTaskTypesResponseApplicationJsonBuilder.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs),
        TextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data),
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types),
        TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder.new,
      )
      ..add(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types)]),
        ListBuilder<TextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>.new,
      )
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson),
        TextProcessingApiScheduleResponseApplicationJsonBuilder.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs),
        TextProcessingApiScheduleResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data),
        TextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextProcessingApiScheduleResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(TextProcessingTask), TextProcessingTaskBuilder.new)
      ..add(TextProcessingTask.serializer)
      ..add(TextProcessingTask_Status.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson),
        TextProcessingApiGetTaskResponseApplicationJsonBuilder.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs),
        TextProcessingApiGetTaskResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data),
        TextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson),
        TextProcessingApiDeleteTaskResponseApplicationJsonBuilder.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs),
        TextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data),
        TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson),
        TextProcessingApiListTasksByAppResponseApplicationJsonBuilder.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs),
        TextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data),
        TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TextProcessingTask)]),
        ListBuilder<TextProcessingTask>.new,
      )
      ..addBuilderFactory(
        const FullType(TextToImageApiIsAvailableResponseApplicationJson),
        TextToImageApiIsAvailableResponseApplicationJsonBuilder.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs),
        TextToImageApiIsAvailableResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data),
        TextToImageApiIsAvailableResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextToImageApiIsAvailableResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson),
        TextToImageApiScheduleResponseApplicationJsonBuilder.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs),
        TextToImageApiScheduleResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiScheduleResponseApplicationJson_Ocs_Data),
        TextToImageApiScheduleResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextToImageApiScheduleResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(TextToImageTask), TextToImageTaskBuilder.new)
      ..add(TextToImageTask.serializer)
      ..add(TextToImageTask_Status.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson),
        TextToImageApiGetTaskResponseApplicationJsonBuilder.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs),
        TextToImageApiGetTaskResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data),
        TextToImageApiGetTaskResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextToImageApiGetTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson),
        TextToImageApiDeleteTaskResponseApplicationJsonBuilder.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs),
        TextToImageApiDeleteTaskResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data),
        TextToImageApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextToImageApiDeleteTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson),
        TextToImageApiListTasksByAppResponseApplicationJsonBuilder.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs),
        TextToImageApiListTasksByAppResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data),
        TextToImageApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TextToImageApiListTasksByAppResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(TextToImageTask)]), ListBuilder<TextToImageTask>.new)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson),
        TranslationApiLanguagesResponseApplicationJsonBuilder.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs),
        TranslationApiLanguagesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data),
        TranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages),
        TranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder.new,
      )
      ..add(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages)]),
        ListBuilder<TranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>.new,
      )
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson),
        TranslationApiTranslateResponseApplicationJsonBuilder.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson_Ocs),
        TranslationApiTranslateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TranslationApiTranslateResponseApplicationJson_Ocs_Data),
        TranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TranslationApiTranslateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchGetProvidersResponseApplicationJson),
        UnifiedSearchGetProvidersResponseApplicationJsonBuilder.new,
      )
      ..add(UnifiedSearchGetProvidersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchGetProvidersResponseApplicationJson_Ocs),
        UnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UnifiedSearchGetProvidersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchProvider), UnifiedSearchProviderBuilder.new)
      ..add(UnifiedSearchProvider.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(String)]),
        MapBuilder<String, String>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UnifiedSearchProvider)]),
        ListBuilder<UnifiedSearchProvider>.new,
      )
      ..addBuilderFactory(
        const FullType(UnifiedSearchSearchResponseApplicationJson),
        UnifiedSearchSearchResponseApplicationJsonBuilder.new,
      )
      ..add(UnifiedSearchSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(UnifiedSearchSearchResponseApplicationJson_Ocs),
        UnifiedSearchSearchResponseApplicationJson_OcsBuilder.new,
      )
      ..add(UnifiedSearchSearchResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchResult), UnifiedSearchResultBuilder.new)
      ..add(UnifiedSearchResult.serializer)
      ..addBuilderFactory(const FullType(UnifiedSearchResultEntry), UnifiedSearchResultEntryBuilder.new)
      ..add(UnifiedSearchResultEntry.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UnifiedSearchResultEntry)]),
        ListBuilder<UnifiedSearchResultEntry>.new,
      )
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson),
        WhatsNewGetResponseApplicationJsonBuilder.new,
      )
      ..add(WhatsNewGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs),
        WhatsNewGetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data),
        WhatsNewGetResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew),
        WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder.new,
      )
      ..add(WhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewDismissResponseApplicationJson),
        WhatsNewDismissResponseApplicationJsonBuilder.new,
      )
      ..add(WhatsNewDismissResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(WhatsNewDismissResponseApplicationJson_Ocs),
        WhatsNewDismissResponseApplicationJson_OcsBuilder.new,
      )
      ..add(WhatsNewDismissResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(WipeCheckWipeResponseApplicationJson),
        WipeCheckWipeResponseApplicationJsonBuilder.new,
      )
      ..add(WipeCheckWipeResponseApplicationJson.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const HeaderPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
