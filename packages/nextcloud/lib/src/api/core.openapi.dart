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
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'core.openapi.g.dart';

class CoreClient extends DynamiteClient {
  CoreClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  CoreClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  CoreAppPasswordClient get appPassword => CoreAppPasswordClient(this);

  CoreAutoCompleteClient get autoComplete => CoreAutoCompleteClient(this);

  CoreAvatarClient get avatar => CoreAvatarClient(this);

  CoreClientFlowLoginV2Client get clientFlowLoginV2 => CoreClientFlowLoginV2Client(this);

  CoreCollaborationResourcesClient get collaborationResources => CoreCollaborationResourcesClient(this);

  CoreGuestAvatarClient get guestAvatar => CoreGuestAvatarClient(this);

  CoreHoverCardClient get hoverCard => CoreHoverCardClient(this);

  CoreNavigationClient get navigation => CoreNavigationClient(this);

  CoreOcmClient get ocm => CoreOcmClient(this);

  CoreOcsClient get ocs => CoreOcsClient(this);

  CorePreviewClient get preview => CorePreviewClient(this);

  CoreProfileApiClient get profileApi => CoreProfileApiClient(this);

  CoreReferenceClient get reference => CoreReferenceClient(this);

  CoreReferenceApiClient get referenceApi => CoreReferenceApiClient(this);

  CoreTextProcessingApiClient get textProcessingApi => CoreTextProcessingApiClient(this);

  CoreTranslationApiClient get translationApi => CoreTranslationApiClient(this);

  CoreUnifiedSearchClient get unifiedSearch => CoreUnifiedSearchClient(this);

  CoreWhatsNewClient get whatsNew => CoreWhatsNewClient(this);

  CoreWipeClient get wipe => CoreWipeClient(this);

  Future<DynamiteResponse<CoreStatus, void>> getStatus() async {
    final rawResponse = getStatusRaw();

    return rawResponse.future;
  }

  DynamiteRawResponse<CoreStatus, void> getStatusRaw() {
    const path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreStatus, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreStatus),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreAppPasswordClient {
  CoreAppPasswordClient(this._rootClient);

  final CoreClient _rootClient;

  /// Create app password
  Future<DynamiteResponse<CoreAppPasswordGetAppPasswordResponseApplicationJson, void>> getAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create app password
  DynamiteRawResponse<CoreAppPasswordGetAppPasswordResponseApplicationJson, void> getAppPasswordRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/getapppassword';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreAppPasswordGetAppPasswordResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreAppPasswordGetAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Rotate app password
  Future<DynamiteResponse<CoreAppPasswordRotateAppPasswordResponseApplicationJson, void>> rotateAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = rotateAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Rotate app password
  DynamiteRawResponse<CoreAppPasswordRotateAppPasswordResponseApplicationJson, void> rotateAppPasswordRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/apppassword/rotate';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreAppPasswordRotateAppPasswordResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreAppPasswordRotateAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete app password
  Future<DynamiteResponse<CoreAppPasswordDeleteAppPasswordResponseApplicationJson, void>> deleteAppPassword({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteAppPasswordRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete app password
  DynamiteRawResponse<CoreAppPasswordDeleteAppPasswordResponseApplicationJson, void> deleteAppPasswordRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/apppassword';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreAppPasswordDeleteAppPasswordResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreAppPasswordDeleteAppPasswordResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreAutoCompleteClient {
  CoreAutoCompleteClient(this._rootClient);

  final CoreClient _rootClient;

  /// Autocomplete a query
  Future<DynamiteResponse<CoreAutoCompleteGetResponseApplicationJson, void>> $get({
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

  /// Autocomplete a query
  DynamiteRawResponse<CoreAutoCompleteGetResponseApplicationJson, void> $getRaw({
    required final String search,
    final String? itemType,
    final String? itemId,
    final String? sorter,
    final List<int>? shareTypes,
    final int limit = 10,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/autocomplete/get';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreAutoCompleteGetResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreAutoCompleteGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// Class AvatarController
class CoreAvatarClient {
  CoreAvatarClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the dark avatar
  Future<DynamiteResponse<Uint8List, CoreAvatarAvatarGetAvatarDarkHeaders>> getAvatarDark({
    required final String userId,
    required final int size,
  }) async {
    final rawResponse = getAvatarDarkRaw(
      userId: userId,
      size: size,
    );

    return rawResponse.future;
  }

  /// Get the dark avatar
  DynamiteRawResponse<Uint8List, CoreAvatarAvatarGetAvatarDarkHeaders> getAvatarDarkRaw({
    required final String userId,
    required final int size,
  }) {
    var path = '/index.php/avatar/{userId}/{size}/dark';
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
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, CoreAvatarAvatarGetAvatarDarkHeaders>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(CoreAvatarAvatarGetAvatarDarkHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Get the avatar
  Future<DynamiteResponse<Uint8List, CoreAvatarAvatarGetAvatarHeaders>> getAvatar({
    required final String userId,
    required final int size,
  }) async {
    final rawResponse = getAvatarRaw(
      userId: userId,
      size: size,
    );

    return rawResponse.future;
  }

  /// Get the avatar
  DynamiteRawResponse<Uint8List, CoreAvatarAvatarGetAvatarHeaders> getAvatarRaw({
    required final String userId,
    required final int size,
  }) {
    var path = '/index.php/avatar/{userId}/{size}';
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
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, CoreAvatarAvatarGetAvatarHeaders>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(CoreAvatarAvatarGetAvatarHeaders),
      serializers: _jsonSerializers,
    );
  }
}

class CoreClientFlowLoginV2Client {
  CoreClientFlowLoginV2Client(this._rootClient);

  final CoreClient _rootClient;

  /// Poll the login flow credentials
  Future<DynamiteResponse<CoreLoginFlowV2Credentials, void>> poll({required final String token}) async {
    final rawResponse = pollRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Poll the login flow credentials
  DynamiteRawResponse<CoreLoginFlowV2Credentials, void> pollRaw({required final String token}) {
    const path = '/index.php/login/v2/poll';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreLoginFlowV2Credentials, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreLoginFlowV2Credentials),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Init a login flow
  Future<DynamiteResponse<CoreLoginFlowV2, void>> init() async {
    final rawResponse = initRaw();

    return rawResponse.future;
  }

  /// Init a login flow
  DynamiteRawResponse<CoreLoginFlowV2, void> initRaw() {
    const path = '/index.php/login/v2';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreLoginFlowV2, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreLoginFlowV2),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreCollaborationResourcesClient {
  CoreCollaborationResourcesClient(this._rootClient);

  final CoreClient _rootClient;

  /// Search for collections
  Future<DynamiteResponse<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson, void>> searchCollections({
    required final String filter,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = searchCollectionsRaw(
      filter: filter,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search for collections
  DynamiteRawResponse<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson, void> searchCollectionsRaw({
    required final String filter,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/collections/search/{filter}';
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
    path = path.replaceAll('{filter}', Uri.encodeQueryComponent(filter));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a collection
  Future<DynamiteResponse<CoreCollaborationResourcesListCollectionResponseApplicationJson, void>> listCollection({
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listCollectionRaw(
      collectionId: collectionId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a collection
  DynamiteRawResponse<CoreCollaborationResourcesListCollectionResponseApplicationJson, void> listCollectionRaw({
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
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
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesListCollectionResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesListCollectionResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Rename a collection
  Future<DynamiteResponse<CoreCollaborationResourcesRenameCollectionResponseApplicationJson, void>> renameCollection({
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

  /// Rename a collection
  DynamiteRawResponse<CoreCollaborationResourcesRenameCollectionResponseApplicationJson, void> renameCollectionRaw({
    required final String collectionName,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
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
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesRenameCollectionResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesRenameCollectionResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Add a resource to a collection
  Future<DynamiteResponse<CoreCollaborationResourcesAddResourceResponseApplicationJson, void>> addResource({
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

  /// Add a resource to a collection
  DynamiteRawResponse<CoreCollaborationResourcesAddResourceResponseApplicationJson, void> addResourceRaw({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
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
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesAddResourceResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesAddResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a resource from a collection
  Future<DynamiteResponse<CoreCollaborationResourcesRemoveResourceResponseApplicationJson, void>> removeResource({
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

  /// Remove a resource from a collection
  DynamiteRawResponse<CoreCollaborationResourcesRemoveResourceResponseApplicationJson, void> removeResourceRaw({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
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
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesRemoveResourceResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesRemoveResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get collections by resource
  Future<DynamiteResponse<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>>
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

  /// Get collections by resource
  DynamiteRawResponse<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>
      getCollectionsByResourceRaw({
    required final String resourceType,
    required final String resourceId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/{resourceType}/{resourceId}';
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
    path = path.replaceAll('{resourceType}', Uri.encodeQueryComponent(resourceType));
    path = path.replaceAll('{resourceId}', Uri.encodeQueryComponent(resourceId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a collection for a resource
  Future<DynamiteResponse<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>>
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

  /// Create a collection for a resource
  DynamiteRawResponse<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>
      createCollectionOnResourceRaw({
    required final String name,
    required final String baseResourceType,
    required final String baseResourceId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/collaboration/resources/{baseResourceType}/{baseResourceId}';
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
    path = path.replaceAll('{baseResourceType}', Uri.encodeQueryComponent(baseResourceType));
    path = path.replaceAll('{baseResourceId}', Uri.encodeQueryComponent(baseResourceId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// This controller handles guest avatar requests.
class CoreGuestAvatarClient {
  CoreGuestAvatarClient(this._rootClient);

  final CoreClient _rootClient;

  /// Returns a dark guest avatar image response
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

  /// Returns a dark guest avatar image response
  DynamiteRawResponse<Uint8List, void> getAvatarDarkRaw({
    required final String guestName,
    required final String size,
  }) {
    var path = '/index.php/avatar/guest/{guestName}/{size}/dark';
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
    path = path.replaceAll('{guestName}', Uri.encodeQueryComponent(guestName));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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

  /// Returns a guest avatar image response
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

  /// Returns a guest avatar image response
  DynamiteRawResponse<Uint8List, void> getAvatarRaw({
    required final String guestName,
    required final String size,
    final int? darkTheme = 0,
  }) {
    var path = '/index.php/avatar/guest/{guestName}/{size}';
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
    path = path.replaceAll('{guestName}', Uri.encodeQueryComponent(guestName));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size));
    if (darkTheme != null) {
      if (darkTheme != 0) {
        queryParameters['darkTheme'] = darkTheme.toString();
      }
    }
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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

class CoreHoverCardClient {
  CoreHoverCardClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the user details for a hovercard
  Future<DynamiteResponse<CoreHoverCardGetUserResponseApplicationJson, void>> getUser({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getUserRaw(
      userId: userId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the user details for a hovercard
  DynamiteRawResponse<CoreHoverCardGetUserResponseApplicationJson, void> getUserRaw({
    required final String userId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/hovercard/v1/{userId}';
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
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreHoverCardGetUserResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreHoverCardGetUserResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreNavigationClient {
  CoreNavigationClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the apps navigation
  Future<DynamiteResponse<CoreNavigationGetAppsNavigationResponseApplicationJson, void>> getAppsNavigation({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getAppsNavigationRaw(
      absolute: absolute,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the apps navigation
  DynamiteRawResponse<CoreNavigationGetAppsNavigationResponseApplicationJson, void> getAppsNavigationRaw({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/navigation/apps';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreNavigationGetAppsNavigationResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreNavigationGetAppsNavigationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the settings navigation
  Future<DynamiteResponse<CoreNavigationGetSettingsNavigationResponseApplicationJson, void>> getSettingsNavigation({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getSettingsNavigationRaw(
      absolute: absolute,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the settings navigation
  DynamiteRawResponse<CoreNavigationGetSettingsNavigationResponseApplicationJson, void> getSettingsNavigationRaw({
    final int absolute = 0,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/navigation/settings';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreNavigationGetSettingsNavigationResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreNavigationGetSettingsNavigationResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

/// Controller about the endpoint /ocm-provider/
class CoreOcmClient {
  CoreOcmClient(this._rootClient);

  final CoreClient _rootClient;

  /// generate a OCMProvider with local data and send it as DataResponse. This replaces the old PHP file ocm-provider/index.php
  Future<DynamiteResponse<CoreOcmDiscoveryResponseApplicationJson, CoreOcmOcmDiscoveryHeaders>> discovery() async {
    final rawResponse = discoveryRaw();

    return rawResponse.future;
  }

  /// generate a OCMProvider with local data and send it as DataResponse. This replaces the old PHP file ocm-provider/index.php
  DynamiteRawResponse<CoreOcmDiscoveryResponseApplicationJson, CoreOcmOcmDiscoveryHeaders> discoveryRaw() {
    const path = '/index.php/ocm-provider';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreOcmDiscoveryResponseApplicationJson, CoreOcmOcmDiscoveryHeaders>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreOcmDiscoveryResponseApplicationJson),
      headersType: const FullType(CoreOcmOcmDiscoveryHeaders),
      serializers: _jsonSerializers,
    );
  }
}

class CoreOcsClient {
  CoreOcsClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the capabilities
  Future<DynamiteResponse<CoreOcsGetCapabilitiesResponseApplicationJson, void>> getCapabilities({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getCapabilitiesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the capabilities
  DynamiteRawResponse<CoreOcsGetCapabilitiesResponseApplicationJson, void> getCapabilitiesRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/cloud/capabilities';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreOcsGetCapabilitiesResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreOcsGetCapabilitiesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CorePreviewClient {
  CorePreviewClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get a preview by file ID
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

  /// Get a preview by file ID
  DynamiteRawResponse<Uint8List, void> getPreviewByFileIdRaw({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) {
    const path = '/index.php/core/preview';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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

  /// Get a preview by file path
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

  /// Get a preview by file path
  DynamiteRawResponse<Uint8List, void> getPreviewRaw({
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) {
    const path = '/index.php/core/preview.png';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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

class CoreProfileApiClient {
  CoreProfileApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Update the visibility of a parameter
  Future<DynamiteResponse<CoreProfileApiSetVisibilityResponseApplicationJson, void>> setVisibility({
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

  /// Update the visibility of a parameter
  DynamiteRawResponse<CoreProfileApiSetVisibilityResponseApplicationJson, void> setVisibilityRaw({
    required final String paramId,
    required final String visibility,
    required final String targetUserId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/profile/{targetUserId}';
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
    path = path.replaceAll('{targetUserId}', Uri.encodeQueryComponent(targetUserId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreProfileApiSetVisibilityResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreProfileApiSetVisibilityResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreReferenceClient {
  CoreReferenceClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get a preview for a reference
  Future<DynamiteResponse<Uint8List, void>> preview({required final String referenceId}) async {
    final rawResponse = previewRaw(
      referenceId: referenceId,
    );

    return rawResponse.future;
  }

  /// Get a preview for a reference
  DynamiteRawResponse<Uint8List, void> previewRaw({required final String referenceId}) {
    var path = '/index.php/core/references/preview/{referenceId}';
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
    path = path.replaceAll('{referenceId}', Uri.encodeQueryComponent(referenceId));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
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

class CoreReferenceApiClient {
  CoreReferenceApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Resolve a reference
  Future<DynamiteResponse<CoreReferenceApiResolveOneResponseApplicationJson, void>> resolveOne({
    required final String reference,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = resolveOneRaw(
      reference: reference,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Resolve a reference
  DynamiteRawResponse<CoreReferenceApiResolveOneResponseApplicationJson, void> resolveOneRaw({
    required final String reference,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/references/resolve';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreReferenceApiResolveOneResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreReferenceApiResolveOneResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Resolve multiple references
  Future<DynamiteResponse<CoreReferenceApiResolveResponseApplicationJson, void>> resolve({
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

  /// Resolve multiple references
  DynamiteRawResponse<CoreReferenceApiResolveResponseApplicationJson, void> resolveRaw({
    required final List<String> references,
    final int limit = 1,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/references/resolve';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreReferenceApiResolveResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreReferenceApiResolveResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Extract references from a text
  Future<DynamiteResponse<CoreReferenceApiExtractResponseApplicationJson, void>> extract({
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

  /// Extract references from a text
  DynamiteRawResponse<CoreReferenceApiExtractResponseApplicationJson, void> extractRaw({
    required final String text,
    final int resolve = 0,
    final int limit = 1,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/references/extract';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreReferenceApiExtractResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreReferenceApiExtractResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the providers
  Future<DynamiteResponse<CoreReferenceApiGetProvidersInfoResponseApplicationJson, void>> getProvidersInfo({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getProvidersInfoRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the providers
  DynamiteRawResponse<CoreReferenceApiGetProvidersInfoResponseApplicationJson, void> getProvidersInfoRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/references/providers';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreReferenceApiGetProvidersInfoResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreReferenceApiGetProvidersInfoResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Touch a provider
  Future<DynamiteResponse<CoreReferenceApiTouchProviderResponseApplicationJson, void>> touchProvider({
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

  /// Touch a provider
  DynamiteRawResponse<CoreReferenceApiTouchProviderResponseApplicationJson, void> touchProviderRaw({
    required final String providerId,
    final int? timestamp,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/references/provider/{providerId}';
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
    path = path.replaceAll('{providerId}', Uri.encodeQueryComponent(providerId));
    if (timestamp != null) {
      queryParameters['timestamp'] = timestamp.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreReferenceApiTouchProviderResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreReferenceApiTouchProviderResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreTextProcessingApiClient {
  CoreTextProcessingApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// This endpoint returns all available LanguageModel task types
  Future<DynamiteResponse<CoreTextProcessingApiTaskTypesResponseApplicationJson, void>> taskTypes({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = taskTypesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint returns all available LanguageModel task types
  DynamiteRawResponse<CoreTextProcessingApiTaskTypesResponseApplicationJson, void> taskTypesRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/textprocessing/tasktypes';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTextProcessingApiTaskTypesResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows scheduling a language model task
  Future<DynamiteResponse<CoreTextProcessingApiScheduleResponseApplicationJson, void>> schedule({
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

  /// This endpoint allows scheduling a language model task
  DynamiteRawResponse<CoreTextProcessingApiScheduleResponseApplicationJson, void> scheduleRaw({
    required final String input,
    required final String type,
    required final String appId,
    final String identifier = '',
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/textprocessing/schedule';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTextProcessingApiScheduleResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTextProcessingApiScheduleResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows checking the status and results of a task. Tasks are removed 1 week after receiving their last update.
  Future<DynamiteResponse<CoreTextProcessingApiGetTaskResponseApplicationJson, void>> getTask({
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
  DynamiteRawResponse<CoreTextProcessingApiGetTaskResponseApplicationJson, void> getTaskRaw({
    required final int id,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/textprocessing/task/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTextProcessingApiGetTaskResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTextProcessingApiGetTaskResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint allows to delete a scheduled task for a user
  Future<DynamiteResponse<CoreTextProcessingApiDeleteTaskResponseApplicationJson, void>> deleteTask({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteTaskRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// This endpoint allows to delete a scheduled task for a user
  DynamiteRawResponse<CoreTextProcessingApiDeleteTaskResponseApplicationJson, void> deleteTaskRaw({
    required final int id,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/textprocessing/task/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTextProcessingApiDeleteTaskResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTextProcessingApiDeleteTaskResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// This endpoint returns a list of tasks of a user that are related with a specific appId and optionally with an identifier
  Future<DynamiteResponse<CoreTextProcessingApiListTasksByAppResponseApplicationJson, void>> listTasksByApp({
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

  /// This endpoint returns a list of tasks of a user that are related with a specific appId and optionally with an identifier
  DynamiteRawResponse<CoreTextProcessingApiListTasksByAppResponseApplicationJson, void> listTasksByAppRaw({
    required final String appId,
    final String? identifier,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/textprocessing/tasks/app/{appId}';
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
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    if (identifier != null) {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTextProcessingApiListTasksByAppResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTextProcessingApiListTasksByAppResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreTranslationApiClient {
  CoreTranslationApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the list of supported languages
  Future<DynamiteResponse<CoreTranslationApiLanguagesResponseApplicationJson, void>> languages({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = languagesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the list of supported languages
  DynamiteRawResponse<CoreTranslationApiLanguagesResponseApplicationJson, void> languagesRaw({
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/translation/languages';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTranslationApiLanguagesResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTranslationApiLanguagesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Translate a text
  Future<DynamiteResponse<CoreTranslationApiTranslateResponseApplicationJson, void>> translate({
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

  /// Translate a text
  DynamiteRawResponse<CoreTranslationApiTranslateResponseApplicationJson, void> translateRaw({
    required final String text,
    required final String toLanguage,
    final String? fromLanguage,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/translation/translate';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreTranslationApiTranslateResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreTranslationApiTranslateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreUnifiedSearchClient {
  CoreUnifiedSearchClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the providers for unified search
  Future<DynamiteResponse<CoreUnifiedSearchGetProvidersResponseApplicationJson, void>> getProviders({
    final String from = '',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getProvidersRaw(
      from: from,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the providers for unified search
  DynamiteRawResponse<CoreUnifiedSearchGetProvidersResponseApplicationJson, void> getProvidersRaw({
    final String from = '',
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/search/providers';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreUnifiedSearchGetProvidersResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreUnifiedSearchGetProvidersResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Search
  Future<DynamiteResponse<CoreUnifiedSearchSearchResponseApplicationJson, void>> search({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<CoreUnifiedSearchSearchCursor>? cursor,
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

  /// Search
  DynamiteRawResponse<CoreUnifiedSearchSearchResponseApplicationJson, void> searchRaw({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<CoreUnifiedSearchSearchCursor>? cursor,
    final String from = '',
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/search/providers/{providerId}/search';
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
    path = path.replaceAll('{providerId}', Uri.encodeQueryComponent(providerId));
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
        specifiedType: const FullType(ContentString, [FullType(CoreUnifiedSearchSearchCursor)]),
      );
    }
    if (from != '') {
      queryParameters['from'] = from;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreUnifiedSearchSearchResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreUnifiedSearchSearchResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreWhatsNewClient {
  CoreWhatsNewClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the changes
  Future<DynamiteResponse<CoreWhatsNewGetResponseApplicationJson, void>> $get({final bool oCSAPIRequest = true}) async {
    final rawResponse = $getRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the changes
  DynamiteRawResponse<CoreWhatsNewGetResponseApplicationJson, void> $getRaw({final bool oCSAPIRequest = true}) {
    const path = '/ocs/v2.php/core/whatsnew';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreWhatsNewGetResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreWhatsNewGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Dismiss the changes
  Future<DynamiteResponse<CoreWhatsNewDismissResponseApplicationJson, void>> dismiss({
    required final String version,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = dismissRaw(
      version: version,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Dismiss the changes
  DynamiteRawResponse<CoreWhatsNewDismissResponseApplicationJson, void> dismissRaw({
    required final String version,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/core/whatsnew';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreWhatsNewDismissResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreWhatsNewDismissResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class CoreWipeClient {
  CoreWipeClient(this._rootClient);

  final CoreClient _rootClient;

  /// Check if the device should be wiped
  Future<DynamiteResponse<CoreWipeCheckWipeResponseApplicationJson, void>> checkWipe({
    required final String token,
  }) async {
    final rawResponse = checkWipeRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Check if the device should be wiped
  DynamiteRawResponse<CoreWipeCheckWipeResponseApplicationJson, void> checkWipeRaw({required final String token}) {
    const path = '/index.php/core/wipe/check';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<CoreWipeCheckWipeResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(CoreWipeCheckWipeResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Finish the wipe
  Future<DynamiteResponse<JsonObject, void>> wipeDone({required final String token}) async {
    final rawResponse = wipeDoneRaw(
      token: token,
    );

    return rawResponse.future;
  }

  /// Finish the wipe
  DynamiteRawResponse<JsonObject, void> wipeDoneRaw({required final String token}) {
    const path = '/index.php/core/wipe/success';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<JsonObject, void>(
      response: _rootClient.doRequest(
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
abstract interface class CoreStatusInterface {
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
  CoreStatusInterface rebuild(final void Function(CoreStatusInterfaceBuilder) updates);
  CoreStatusInterfaceBuilder toBuilder();
}

abstract class CoreStatus implements CoreStatusInterface, Built<CoreStatus, CoreStatusBuilder> {
  factory CoreStatus([final void Function(CoreStatusBuilder)? b]) = _$CoreStatus;

  // coverage:ignore-start
  const CoreStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreStatus.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreStatus> get serializer => _$coreStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  CoreOCSMetaInterface rebuild(final void Function(CoreOCSMetaInterfaceBuilder) updates);
  CoreOCSMetaInterfaceBuilder toBuilder();
}

abstract class CoreOCSMeta implements CoreOCSMetaInterface, Built<CoreOCSMeta, CoreOCSMetaBuilder> {
  factory CoreOCSMeta([final void Function(CoreOCSMetaBuilder)? b]) = _$CoreOCSMeta;

  // coverage:ignore-start
  const CoreOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOCSMeta> get serializer => _$coreOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
  CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data
    implements
        CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data,
            CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data([
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreAppPasswordGetAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data get data;
  CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs
    implements
        CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsInterface,
        Built<CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs,
            CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder> {
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs([
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordGetAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordGetAppPasswordResponseApplicationJsonInterface {
  CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs get ocs;
  CoreAppPasswordGetAppPasswordResponseApplicationJsonInterface rebuild(
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreAppPasswordGetAppPasswordResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordGetAppPasswordResponseApplicationJson
    implements
        CoreAppPasswordGetAppPasswordResponseApplicationJsonInterface,
        Built<CoreAppPasswordGetAppPasswordResponseApplicationJson,
            CoreAppPasswordGetAppPasswordResponseApplicationJsonBuilder> {
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson([
    final void Function(CoreAppPasswordGetAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordGetAppPasswordResponseApplicationJson> get serializer =>
      _$coreAppPasswordGetAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface {
  String get apppassword;
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data
    implements
        CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataInterface,
        Built<CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data,
            CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data([
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data get data;
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs
    implements
        CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsInterface,
        Built<CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs,
            CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs([
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordRotateAppPasswordResponseApplicationJsonInterface {
  CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs get ocs;
  CoreAppPasswordRotateAppPasswordResponseApplicationJsonInterface rebuild(
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreAppPasswordRotateAppPasswordResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordRotateAppPasswordResponseApplicationJson
    implements
        CoreAppPasswordRotateAppPasswordResponseApplicationJsonInterface,
        Built<CoreAppPasswordRotateAppPasswordResponseApplicationJson,
            CoreAppPasswordRotateAppPasswordResponseApplicationJsonBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson([
    final void Function(CoreAppPasswordRotateAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordRotateAppPasswordResponseApplicationJson> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  JsonObject get data;
  CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs
    implements
        CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsInterface,
        Built<CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs,
            CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder> {
  factory CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs([
    final void Function(CoreAppPasswordDeleteAppPasswordResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordDeleteAppPasswordResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAppPasswordDeleteAppPasswordResponseApplicationJsonInterface {
  CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs get ocs;
  CoreAppPasswordDeleteAppPasswordResponseApplicationJsonInterface rebuild(
    final void Function(CoreAppPasswordDeleteAppPasswordResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreAppPasswordDeleteAppPasswordResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreAppPasswordDeleteAppPasswordResponseApplicationJson
    implements
        CoreAppPasswordDeleteAppPasswordResponseApplicationJsonInterface,
        Built<CoreAppPasswordDeleteAppPasswordResponseApplicationJson,
            CoreAppPasswordDeleteAppPasswordResponseApplicationJsonBuilder> {
  factory CoreAppPasswordDeleteAppPasswordResponseApplicationJson([
    final void Function(CoreAppPasswordDeleteAppPasswordResponseApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordDeleteAppPasswordResponseApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordDeleteAppPasswordResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordDeleteAppPasswordResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAppPasswordDeleteAppPasswordResponseApplicationJson> get serializer =>
      _$coreAppPasswordDeleteAppPasswordResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAutocompleteResultInterface {
  String get id;
  String get label;
  String get icon;
  String get source;
  String get status;
  String get subline;
  String get shareWithDisplayNameUnique;
  CoreAutocompleteResultInterface rebuild(final void Function(CoreAutocompleteResultInterfaceBuilder) updates);
  CoreAutocompleteResultInterfaceBuilder toBuilder();
}

abstract class CoreAutocompleteResult
    implements CoreAutocompleteResultInterface, Built<CoreAutocompleteResult, CoreAutocompleteResultBuilder> {
  factory CoreAutocompleteResult([final void Function(CoreAutocompleteResultBuilder)? b]) = _$CoreAutocompleteResult;

  // coverage:ignore-start
  const CoreAutocompleteResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAutocompleteResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAutocompleteResult> get serializer => _$coreAutocompleteResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAutoCompleteGetResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreAutocompleteResult> get data;
  CoreAutoCompleteGetResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreAutoCompleteGetResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreAutoCompleteGetResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreAutoCompleteGetResponseApplicationJson_Ocs
    implements
        CoreAutoCompleteGetResponseApplicationJson_OcsInterface,
        Built<CoreAutoCompleteGetResponseApplicationJson_Ocs, CoreAutoCompleteGetResponseApplicationJson_OcsBuilder> {
  factory CoreAutoCompleteGetResponseApplicationJson_Ocs([
    final void Function(CoreAutoCompleteGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAutoCompleteGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAutoCompleteGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAutoCompleteGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAutoCompleteGetResponseApplicationJson_Ocs> get serializer =>
      _$coreAutoCompleteGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAutoCompleteGetResponseApplicationJsonInterface {
  CoreAutoCompleteGetResponseApplicationJson_Ocs get ocs;
  CoreAutoCompleteGetResponseApplicationJsonInterface rebuild(
    final void Function(CoreAutoCompleteGetResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreAutoCompleteGetResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreAutoCompleteGetResponseApplicationJson
    implements
        CoreAutoCompleteGetResponseApplicationJsonInterface,
        Built<CoreAutoCompleteGetResponseApplicationJson, CoreAutoCompleteGetResponseApplicationJsonBuilder> {
  factory CoreAutoCompleteGetResponseApplicationJson([
    final void Function(CoreAutoCompleteGetResponseApplicationJsonBuilder)? b,
  ]) = _$CoreAutoCompleteGetResponseApplicationJson;

  // coverage:ignore-start
  const CoreAutoCompleteGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAutoCompleteGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreAutoCompleteGetResponseApplicationJson> get serializer =>
      _$coreAutoCompleteGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreAvatarAvatarGetAvatarDarkHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
  CoreAvatarAvatarGetAvatarDarkHeadersInterface rebuild(
    final void Function(CoreAvatarAvatarGetAvatarDarkHeadersInterfaceBuilder) updates,
  );
  CoreAvatarAvatarGetAvatarDarkHeadersInterfaceBuilder toBuilder();
}

abstract class CoreAvatarAvatarGetAvatarDarkHeaders
    implements
        CoreAvatarAvatarGetAvatarDarkHeadersInterface,
        Built<CoreAvatarAvatarGetAvatarDarkHeaders, CoreAvatarAvatarGetAvatarDarkHeadersBuilder> {
  factory CoreAvatarAvatarGetAvatarDarkHeaders([final void Function(CoreAvatarAvatarGetAvatarDarkHeadersBuilder)? b]) =
      _$CoreAvatarAvatarGetAvatarDarkHeaders;

  // coverage:ignore-start
  const CoreAvatarAvatarGetAvatarDarkHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAvatarAvatarGetAvatarDarkHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CoreAvatarAvatarGetAvatarDarkHeaders> get serializer =>
      _$CoreAvatarAvatarGetAvatarDarkHeadersSerializer();
}

class _$CoreAvatarAvatarGetAvatarDarkHeadersSerializer
    implements StructuredSerializer<CoreAvatarAvatarGetAvatarDarkHeaders> {
  @override
  final Iterable<Type> types = const [CoreAvatarAvatarGetAvatarDarkHeaders, _$CoreAvatarAvatarGetAvatarDarkHeaders];

  @override
  final String wireName = 'CoreAvatarAvatarGetAvatarDarkHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CoreAvatarAvatarGetAvatarDarkHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  CoreAvatarAvatarGetAvatarDarkHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreAvatarAvatarGetAvatarDarkHeadersBuilder();

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
abstract interface class CoreAvatarAvatarGetAvatarHeadersInterface {
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
  CoreAvatarAvatarGetAvatarHeadersInterface rebuild(
    final void Function(CoreAvatarAvatarGetAvatarHeadersInterfaceBuilder) updates,
  );
  CoreAvatarAvatarGetAvatarHeadersInterfaceBuilder toBuilder();
}

abstract class CoreAvatarAvatarGetAvatarHeaders
    implements
        CoreAvatarAvatarGetAvatarHeadersInterface,
        Built<CoreAvatarAvatarGetAvatarHeaders, CoreAvatarAvatarGetAvatarHeadersBuilder> {
  factory CoreAvatarAvatarGetAvatarHeaders([final void Function(CoreAvatarAvatarGetAvatarHeadersBuilder)? b]) =
      _$CoreAvatarAvatarGetAvatarHeaders;

  // coverage:ignore-start
  const CoreAvatarAvatarGetAvatarHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAvatarAvatarGetAvatarHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CoreAvatarAvatarGetAvatarHeaders> get serializer => _$CoreAvatarAvatarGetAvatarHeadersSerializer();
}

class _$CoreAvatarAvatarGetAvatarHeadersSerializer implements StructuredSerializer<CoreAvatarAvatarGetAvatarHeaders> {
  @override
  final Iterable<Type> types = const [CoreAvatarAvatarGetAvatarHeaders, _$CoreAvatarAvatarGetAvatarHeaders];

  @override
  final String wireName = 'CoreAvatarAvatarGetAvatarHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CoreAvatarAvatarGetAvatarHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  CoreAvatarAvatarGetAvatarHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreAvatarAvatarGetAvatarHeadersBuilder();

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
abstract interface class CoreLoginFlowV2CredentialsInterface {
  String get server;
  String get loginName;
  String get appPassword;
  CoreLoginFlowV2CredentialsInterface rebuild(final void Function(CoreLoginFlowV2CredentialsInterfaceBuilder) updates);
  CoreLoginFlowV2CredentialsInterfaceBuilder toBuilder();
}

abstract class CoreLoginFlowV2Credentials
    implements
        CoreLoginFlowV2CredentialsInterface,
        Built<CoreLoginFlowV2Credentials, CoreLoginFlowV2CredentialsBuilder> {
  factory CoreLoginFlowV2Credentials([final void Function(CoreLoginFlowV2CredentialsBuilder)? b]) =
      _$CoreLoginFlowV2Credentials;

  // coverage:ignore-start
  const CoreLoginFlowV2Credentials._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreLoginFlowV2Credentials.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreLoginFlowV2Credentials> get serializer => _$coreLoginFlowV2CredentialsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreLoginFlowV2_PollInterface {
  String get token;
  String get endpoint;
  CoreLoginFlowV2_PollInterface rebuild(final void Function(CoreLoginFlowV2_PollInterfaceBuilder) updates);
  CoreLoginFlowV2_PollInterfaceBuilder toBuilder();
}

abstract class CoreLoginFlowV2_Poll
    implements CoreLoginFlowV2_PollInterface, Built<CoreLoginFlowV2_Poll, CoreLoginFlowV2_PollBuilder> {
  factory CoreLoginFlowV2_Poll([final void Function(CoreLoginFlowV2_PollBuilder)? b]) = _$CoreLoginFlowV2_Poll;

  // coverage:ignore-start
  const CoreLoginFlowV2_Poll._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreLoginFlowV2_Poll.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreLoginFlowV2_Poll> get serializer => _$coreLoginFlowV2PollSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreLoginFlowV2Interface {
  CoreLoginFlowV2_Poll get poll;
  String get login;
  CoreLoginFlowV2Interface rebuild(final void Function(CoreLoginFlowV2InterfaceBuilder) updates);
  CoreLoginFlowV2InterfaceBuilder toBuilder();
}

abstract class CoreLoginFlowV2 implements CoreLoginFlowV2Interface, Built<CoreLoginFlowV2, CoreLoginFlowV2Builder> {
  factory CoreLoginFlowV2([final void Function(CoreLoginFlowV2Builder)? b]) = _$CoreLoginFlowV2;

  // coverage:ignore-start
  const CoreLoginFlowV2._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreLoginFlowV2.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreLoginFlowV2> get serializer => _$coreLoginFlowV2Serializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOpenGraphObjectInterface {
  String get id;
  String get name;
  String? get description;
  String? get thumb;
  String get link;
  CoreOpenGraphObjectInterface rebuild(final void Function(CoreOpenGraphObjectInterfaceBuilder) updates);
  CoreOpenGraphObjectInterfaceBuilder toBuilder();
}

abstract class CoreOpenGraphObject
    implements CoreOpenGraphObjectInterface, Built<CoreOpenGraphObject, CoreOpenGraphObjectBuilder> {
  factory CoreOpenGraphObject([final void Function(CoreOpenGraphObjectBuilder)? b]) = _$CoreOpenGraphObject;

  // coverage:ignore-start
  const CoreOpenGraphObject._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOpenGraphObject.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOpenGraphObject> get serializer => _$coreOpenGraphObjectSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreResourceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  CoreOpenGraphObject get openGraphObject;
  bool get accessible;
  CoreResourceInterface rebuild(final void Function(CoreResourceInterfaceBuilder) updates);
  CoreResourceInterfaceBuilder toBuilder();
}

abstract class CoreResource implements CoreResourceInterface, Built<CoreResource, CoreResourceBuilder> {
  factory CoreResource([final void Function(CoreResourceBuilder)? b]) = _$CoreResource;

  // coverage:ignore-start
  const CoreResource._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreResource.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreResource> get serializer => _$coreResourceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollectionInterface {
  int get id;
  String get name;
  BuiltList<CoreResource> get resources;
  CoreCollectionInterface rebuild(final void Function(CoreCollectionInterfaceBuilder) updates);
  CoreCollectionInterfaceBuilder toBuilder();
}

abstract class CoreCollection implements CoreCollectionInterface, Built<CoreCollection, CoreCollectionBuilder> {
  factory CoreCollection([final void Function(CoreCollectionBuilder)? b]) = _$CoreCollection;

  // coverage:ignore-start
  const CoreCollection._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollection.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollection> get serializer => _$coreCollectionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreCollection> get data;
  CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs,
            CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesSearchCollectionsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonInterface {
  CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesSearchCollectionsResponseApplicationJson
    implements
        CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson,
            CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesSearchCollectionsResponseApplicationJson([
    final void Function(CoreCollaborationResourcesSearchCollectionsResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesSearchCollectionsResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesSearchCollectionsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesSearchCollectionsResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesSearchCollectionsResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesSearchCollectionsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreCollection get data;
  CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs,
            CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesListCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesListCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesListCollectionResponseApplicationJsonInterface {
  CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesListCollectionResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesListCollectionResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesListCollectionResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesListCollectionResponseApplicationJson
    implements
        CoreCollaborationResourcesListCollectionResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesListCollectionResponseApplicationJson,
            CoreCollaborationResourcesListCollectionResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesListCollectionResponseApplicationJson([
    final void Function(CoreCollaborationResourcesListCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesListCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesListCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesListCollectionResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesListCollectionResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesListCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreCollection get data;
  CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs,
            CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesRenameCollectionResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesRenameCollectionResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesRenameCollectionResponseApplicationJsonInterface {
  CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesRenameCollectionResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesRenameCollectionResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesRenameCollectionResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesRenameCollectionResponseApplicationJson
    implements
        CoreCollaborationResourcesRenameCollectionResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesRenameCollectionResponseApplicationJson,
            CoreCollaborationResourcesRenameCollectionResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesRenameCollectionResponseApplicationJson([
    final void Function(CoreCollaborationResourcesRenameCollectionResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesRenameCollectionResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesRenameCollectionResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRenameCollectionResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesRenameCollectionResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesRenameCollectionResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreCollection get data;
  CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs,
            CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesAddResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesAddResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesAddResourceResponseApplicationJsonInterface {
  CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesAddResourceResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesAddResourceResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesAddResourceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesAddResourceResponseApplicationJson
    implements
        CoreCollaborationResourcesAddResourceResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesAddResourceResponseApplicationJson,
            CoreCollaborationResourcesAddResourceResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesAddResourceResponseApplicationJson([
    final void Function(CoreCollaborationResourcesAddResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesAddResourceResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesAddResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesAddResourceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesAddResourceResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesAddResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreCollection get data;
  CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs,
            CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesRemoveResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesRemoveResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesRemoveResourceResponseApplicationJsonInterface {
  CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesRemoveResourceResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesRemoveResourceResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreCollaborationResourcesRemoveResourceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesRemoveResourceResponseApplicationJson
    implements
        CoreCollaborationResourcesRemoveResourceResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesRemoveResourceResponseApplicationJson,
            CoreCollaborationResourcesRemoveResourceResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesRemoveResourceResponseApplicationJson([
    final void Function(CoreCollaborationResourcesRemoveResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesRemoveResourceResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesRemoveResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRemoveResourceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesRemoveResourceResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesRemoveResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreCollection> get data;
  CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs,
            CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface {
  CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterfaceBuilder)
        updates,
  );
  CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson
    implements
        CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson,
            CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson([
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesGetCollectionsByResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreCollection get data;
  CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs
    implements
        CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsInterface,
        Built<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs,
            CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface {
  CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs get ocs;
  CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface rebuild(
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterfaceBuilder)
        updates,
  );
  CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson
    implements
        CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonInterface,
        Built<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson,
            CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder> {
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson([
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson> get serializer =>
      _$coreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreContactsActionInterface {
  String get title;
  String get icon;
  String get hyperlink;
  String get appId;
  CoreContactsActionInterface rebuild(final void Function(CoreContactsActionInterfaceBuilder) updates);
  CoreContactsActionInterfaceBuilder toBuilder();
}

abstract class CoreContactsAction
    implements CoreContactsActionInterface, Built<CoreContactsAction, CoreContactsActionBuilder> {
  factory CoreContactsAction([final void Function(CoreContactsActionBuilder)? b]) = _$CoreContactsAction;

  // coverage:ignore-start
  const CoreContactsAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreContactsAction.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreContactsAction> get serializer => _$coreContactsActionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreHoverCardGetUserResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get displayName;
  BuiltList<CoreContactsAction> get actions;
  CoreHoverCardGetUserResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreHoverCardGetUserResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreHoverCardGetUserResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreHoverCardGetUserResponseApplicationJson_Ocs_Data
    implements
        CoreHoverCardGetUserResponseApplicationJson_Ocs_DataInterface,
        Built<CoreHoverCardGetUserResponseApplicationJson_Ocs_Data,
            CoreHoverCardGetUserResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreHoverCardGetUserResponseApplicationJson_Ocs_Data([
    final void Function(CoreHoverCardGetUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreHoverCardGetUserResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreHoverCardGetUserResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreHoverCardGetUserResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreHoverCardGetUserResponseApplicationJson_Ocs_Data get data;
  CoreHoverCardGetUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreHoverCardGetUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreHoverCardGetUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreHoverCardGetUserResponseApplicationJson_Ocs
    implements
        CoreHoverCardGetUserResponseApplicationJson_OcsInterface,
        Built<CoreHoverCardGetUserResponseApplicationJson_Ocs, CoreHoverCardGetUserResponseApplicationJson_OcsBuilder> {
  factory CoreHoverCardGetUserResponseApplicationJson_Ocs([
    final void Function(CoreHoverCardGetUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreHoverCardGetUserResponseApplicationJson_Ocs> get serializer =>
      _$coreHoverCardGetUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreHoverCardGetUserResponseApplicationJsonInterface {
  CoreHoverCardGetUserResponseApplicationJson_Ocs get ocs;
  CoreHoverCardGetUserResponseApplicationJsonInterface rebuild(
    final void Function(CoreHoverCardGetUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreHoverCardGetUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreHoverCardGetUserResponseApplicationJson
    implements
        CoreHoverCardGetUserResponseApplicationJsonInterface,
        Built<CoreHoverCardGetUserResponseApplicationJson, CoreHoverCardGetUserResponseApplicationJsonBuilder> {
  factory CoreHoverCardGetUserResponseApplicationJson([
    final void Function(CoreHoverCardGetUserResponseApplicationJsonBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponseApplicationJson;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreHoverCardGetUserResponseApplicationJson> get serializer =>
      _$coreHoverCardGetUserResponseApplicationJsonSerializer;
}

abstract class CoreNavigationEntry_Order implements Built<CoreNavigationEntry_Order, CoreNavigationEntry_OrderBuilder> {
  factory CoreNavigationEntry_Order([final void Function(CoreNavigationEntry_OrderBuilder)? b]) =
      _$CoreNavigationEntry_Order;

  // coverage:ignore-start
  const CoreNavigationEntry_Order._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationEntry_Order.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  String? get string;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreNavigationEntry_Order> get serializer => _$CoreNavigationEntry_OrderSerializer();
}

class _$CoreNavigationEntry_OrderSerializer implements PrimitiveSerializer<CoreNavigationEntry_Order> {
  @override
  final Iterable<Type> types = const [CoreNavigationEntry_Order, _$CoreNavigationEntry_Order];

  @override
  final String wireName = 'CoreNavigationEntry_Order';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreNavigationEntry_Order object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreNavigationEntry_Order deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreNavigationEntry_OrderBuilder()..data = JsonObject(data);
    try {
      result._$int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    try {
      result._string = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CoreNavigationEntryInterface {
  String get id;
  CoreNavigationEntry_Order get order;
  String get href;
  String get icon;
  String get type;
  String get name;
  bool get active;
  String get classes;
  int get unread;
  CoreNavigationEntryInterface rebuild(final void Function(CoreNavigationEntryInterfaceBuilder) updates);
  CoreNavigationEntryInterfaceBuilder toBuilder();
}

abstract class CoreNavigationEntry
    implements CoreNavigationEntryInterface, Built<CoreNavigationEntry, CoreNavigationEntryBuilder> {
  factory CoreNavigationEntry([final void Function(CoreNavigationEntryBuilder)? b]) = _$CoreNavigationEntry;

  // coverage:ignore-start
  const CoreNavigationEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationEntry.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNavigationEntry> get serializer => _$coreNavigationEntrySerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNavigationGetAppsNavigationResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreNavigationEntry> get data;
  CoreNavigationGetAppsNavigationResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreNavigationGetAppsNavigationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreNavigationGetAppsNavigationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs
    implements
        CoreNavigationGetAppsNavigationResponseApplicationJson_OcsInterface,
        Built<CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs,
            CoreNavigationGetAppsNavigationResponseApplicationJson_OcsBuilder> {
  factory CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs([
    final void Function(CoreNavigationGetAppsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$coreNavigationGetAppsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNavigationGetAppsNavigationResponseApplicationJsonInterface {
  CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs get ocs;
  CoreNavigationGetAppsNavigationResponseApplicationJsonInterface rebuild(
    final void Function(CoreNavigationGetAppsNavigationResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreNavigationGetAppsNavigationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreNavigationGetAppsNavigationResponseApplicationJson
    implements
        CoreNavigationGetAppsNavigationResponseApplicationJsonInterface,
        Built<CoreNavigationGetAppsNavigationResponseApplicationJson,
            CoreNavigationGetAppsNavigationResponseApplicationJsonBuilder> {
  factory CoreNavigationGetAppsNavigationResponseApplicationJson([
    final void Function(CoreNavigationGetAppsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$CoreNavigationGetAppsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const CoreNavigationGetAppsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetAppsNavigationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNavigationGetAppsNavigationResponseApplicationJson> get serializer =>
      _$coreNavigationGetAppsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreNavigationEntry> get data;
  CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs
    implements
        CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsInterface,
        Built<CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs,
            CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder> {
  factory CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs([
    final void Function(CoreNavigationGetSettingsNavigationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs> get serializer =>
      _$coreNavigationGetSettingsNavigationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNavigationGetSettingsNavigationResponseApplicationJsonInterface {
  CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs get ocs;
  CoreNavigationGetSettingsNavigationResponseApplicationJsonInterface rebuild(
    final void Function(CoreNavigationGetSettingsNavigationResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreNavigationGetSettingsNavigationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreNavigationGetSettingsNavigationResponseApplicationJson
    implements
        CoreNavigationGetSettingsNavigationResponseApplicationJsonInterface,
        Built<CoreNavigationGetSettingsNavigationResponseApplicationJson,
            CoreNavigationGetSettingsNavigationResponseApplicationJsonBuilder> {
  factory CoreNavigationGetSettingsNavigationResponseApplicationJson([
    final void Function(CoreNavigationGetSettingsNavigationResponseApplicationJsonBuilder)? b,
  ]) = _$CoreNavigationGetSettingsNavigationResponseApplicationJson;

  // coverage:ignore-start
  const CoreNavigationGetSettingsNavigationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetSettingsNavigationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNavigationGetSettingsNavigationResponseApplicationJson> get serializer =>
      _$coreNavigationGetSettingsNavigationResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcmOcmDiscoveryHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-ocm-providers')
  bool? get xNextcloudOcmProviders;
  CoreOcmOcmDiscoveryHeadersInterface rebuild(final void Function(CoreOcmOcmDiscoveryHeadersInterfaceBuilder) updates);
  CoreOcmOcmDiscoveryHeadersInterfaceBuilder toBuilder();
}

abstract class CoreOcmOcmDiscoveryHeaders
    implements
        CoreOcmOcmDiscoveryHeadersInterface,
        Built<CoreOcmOcmDiscoveryHeaders, CoreOcmOcmDiscoveryHeadersBuilder> {
  factory CoreOcmOcmDiscoveryHeaders([final void Function(CoreOcmOcmDiscoveryHeadersBuilder)? b]) =
      _$CoreOcmOcmDiscoveryHeaders;

  // coverage:ignore-start
  const CoreOcmOcmDiscoveryHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcmOcmDiscoveryHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<CoreOcmOcmDiscoveryHeaders> get serializer => _$CoreOcmOcmDiscoveryHeadersSerializer();
}

class _$CoreOcmOcmDiscoveryHeadersSerializer implements StructuredSerializer<CoreOcmOcmDiscoveryHeaders> {
  @override
  final Iterable<Type> types = const [CoreOcmOcmDiscoveryHeaders, _$CoreOcmOcmDiscoveryHeaders];

  @override
  final String wireName = 'CoreOcmOcmDiscoveryHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CoreOcmOcmDiscoveryHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  CoreOcmOcmDiscoveryHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreOcmOcmDiscoveryHeadersBuilder();

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
abstract interface class CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface {
  String get webdav;
  CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface rebuild(
    final void Function(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterfaceBuilder) updates,
  );
  CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterfaceBuilder toBuilder();
}

abstract class CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols
    implements
        CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsInterface,
        Built<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols,
            CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder> {
  factory CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols([
    final void Function(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_ProtocolsBuilder)? b,
  ]) = _$CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols;

  // coverage:ignore-start
  const CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols> get serializer =>
      _$coreOcmDiscoveryResponseApplicationJsonResourceTypesProtocolsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcmDiscoveryResponseApplicationJson_ResourceTypesInterface {
  String get name;
  BuiltList<String> get shareTypes;
  CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols get protocols;
  CoreOcmDiscoveryResponseApplicationJson_ResourceTypesInterface rebuild(
    final void Function(CoreOcmDiscoveryResponseApplicationJson_ResourceTypesInterfaceBuilder) updates,
  );
  CoreOcmDiscoveryResponseApplicationJson_ResourceTypesInterfaceBuilder toBuilder();
}

abstract class CoreOcmDiscoveryResponseApplicationJson_ResourceTypes
    implements
        CoreOcmDiscoveryResponseApplicationJson_ResourceTypesInterface,
        Built<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes,
            CoreOcmDiscoveryResponseApplicationJson_ResourceTypesBuilder> {
  factory CoreOcmDiscoveryResponseApplicationJson_ResourceTypes([
    final void Function(CoreOcmDiscoveryResponseApplicationJson_ResourceTypesBuilder)? b,
  ]) = _$CoreOcmDiscoveryResponseApplicationJson_ResourceTypes;

  // coverage:ignore-start
  const CoreOcmDiscoveryResponseApplicationJson_ResourceTypes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcmDiscoveryResponseApplicationJson_ResourceTypes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes> get serializer =>
      _$coreOcmDiscoveryResponseApplicationJsonResourceTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcmDiscoveryResponseApplicationJsonInterface {
  bool get enabled;
  String get apiVersion;
  String get endPoint;
  BuiltList<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes> get resourceTypes;
  CoreOcmDiscoveryResponseApplicationJsonInterface rebuild(
    final void Function(CoreOcmDiscoveryResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreOcmDiscoveryResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreOcmDiscoveryResponseApplicationJson
    implements
        CoreOcmDiscoveryResponseApplicationJsonInterface,
        Built<CoreOcmDiscoveryResponseApplicationJson, CoreOcmDiscoveryResponseApplicationJsonBuilder> {
  factory CoreOcmDiscoveryResponseApplicationJson([
    final void Function(CoreOcmDiscoveryResponseApplicationJsonBuilder)? b,
  ]) = _$CoreOcmDiscoveryResponseApplicationJson;

  // coverage:ignore-start
  const CoreOcmDiscoveryResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcmDiscoveryResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcmDiscoveryResponseApplicationJson> get serializer =>
      _$coreOcmDiscoveryResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface {
  int get major;
  int get minor;
  int get micro;
  String get string;
  String get edition;
  bool get extendedSupport;
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface rebuild(
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterfaceBuilder) updates,
  );
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterfaceBuilder toBuilder();
}

abstract class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version
    implements
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionInterface,
        Built<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version,
            CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder> {
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version([
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_VersionBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version> get serializer =>
      _$coreOcsGetCapabilitiesResponseApplicationJsonOcsDataVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCommentsCapabilities_FilesInterface {
  bool get comments;
  CoreCommentsCapabilities_FilesInterface rebuild(
    final void Function(CoreCommentsCapabilities_FilesInterfaceBuilder) updates,
  );
  CoreCommentsCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class CoreCommentsCapabilities_Files
    implements
        CoreCommentsCapabilities_FilesInterface,
        Built<CoreCommentsCapabilities_Files, CoreCommentsCapabilities_FilesBuilder> {
  factory CoreCommentsCapabilities_Files([final void Function(CoreCommentsCapabilities_FilesBuilder)? b]) =
      _$CoreCommentsCapabilities_Files;

  // coverage:ignore-start
  const CoreCommentsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCommentsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCommentsCapabilities_Files> get serializer => _$coreCommentsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreCommentsCapabilitiesInterface {
  CoreCommentsCapabilities_Files get files;
  CoreCommentsCapabilitiesInterface rebuild(final void Function(CoreCommentsCapabilitiesInterfaceBuilder) updates);
  CoreCommentsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreCommentsCapabilities
    implements CoreCommentsCapabilitiesInterface, Built<CoreCommentsCapabilities, CoreCommentsCapabilitiesBuilder> {
  factory CoreCommentsCapabilities([final void Function(CoreCommentsCapabilitiesBuilder)? b]) =
      _$CoreCommentsCapabilities;

  // coverage:ignore-start
  const CoreCommentsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCommentsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreCommentsCapabilities> get serializer => _$coreCommentsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreDavCapabilities_DavInterface {
  String get chunking;
  String? get bulkupload;
  CoreDavCapabilities_DavInterface rebuild(final void Function(CoreDavCapabilities_DavInterfaceBuilder) updates);
  CoreDavCapabilities_DavInterfaceBuilder toBuilder();
}

abstract class CoreDavCapabilities_Dav
    implements CoreDavCapabilities_DavInterface, Built<CoreDavCapabilities_Dav, CoreDavCapabilities_DavBuilder> {
  factory CoreDavCapabilities_Dav([final void Function(CoreDavCapabilities_DavBuilder)? b]) = _$CoreDavCapabilities_Dav;

  // coverage:ignore-start
  const CoreDavCapabilities_Dav._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreDavCapabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreDavCapabilities_Dav> get serializer => _$coreDavCapabilitiesDavSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreDavCapabilitiesInterface {
  CoreDavCapabilities_Dav get dav;
  CoreDavCapabilitiesInterface rebuild(final void Function(CoreDavCapabilitiesInterfaceBuilder) updates);
  CoreDavCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreDavCapabilities
    implements CoreDavCapabilitiesInterface, Built<CoreDavCapabilities, CoreDavCapabilitiesBuilder> {
  factory CoreDavCapabilities([final void Function(CoreDavCapabilitiesBuilder)? b]) = _$CoreDavCapabilities;

  // coverage:ignore-start
  const CoreDavCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreDavCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreDavCapabilities> get serializer => _$coreDavCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesCapabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
  CoreFilesCapabilities_Files_DirectEditingInterface rebuild(
    final void Function(CoreFilesCapabilities_Files_DirectEditingInterfaceBuilder) updates,
  );
  CoreFilesCapabilities_Files_DirectEditingInterfaceBuilder toBuilder();
}

abstract class CoreFilesCapabilities_Files_DirectEditing
    implements
        CoreFilesCapabilities_Files_DirectEditingInterface,
        Built<CoreFilesCapabilities_Files_DirectEditing, CoreFilesCapabilities_Files_DirectEditingBuilder> {
  factory CoreFilesCapabilities_Files_DirectEditing([
    final void Function(CoreFilesCapabilities_Files_DirectEditingBuilder)? b,
  ]) = _$CoreFilesCapabilities_Files_DirectEditing;

  // coverage:ignore-start
  const CoreFilesCapabilities_Files_DirectEditing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesCapabilities_Files_DirectEditing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesCapabilities_Files_DirectEditing> get serializer =>
      _$coreFilesCapabilitiesFilesDirectEditingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesCapabilities_FilesInterface {
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  CoreFilesCapabilities_Files_DirectEditing get directEditing;
  CoreFilesCapabilities_FilesInterface rebuild(
    final void Function(CoreFilesCapabilities_FilesInterfaceBuilder) updates,
  );
  CoreFilesCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class CoreFilesCapabilities_Files
    implements
        CoreFilesCapabilities_FilesInterface,
        Built<CoreFilesCapabilities_Files, CoreFilesCapabilities_FilesBuilder> {
  factory CoreFilesCapabilities_Files([final void Function(CoreFilesCapabilities_FilesBuilder)? b]) =
      _$CoreFilesCapabilities_Files;

  // coverage:ignore-start
  const CoreFilesCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesCapabilities_Files> get serializer => _$coreFilesCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesCapabilitiesInterface {
  CoreFilesCapabilities_Files get files;
  CoreFilesCapabilitiesInterface rebuild(final void Function(CoreFilesCapabilitiesInterfaceBuilder) updates);
  CoreFilesCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreFilesCapabilities
    implements CoreFilesCapabilitiesInterface, Built<CoreFilesCapabilities, CoreFilesCapabilitiesBuilder> {
  factory CoreFilesCapabilities([final void Function(CoreFilesCapabilitiesBuilder)? b]) = _$CoreFilesCapabilities;

  // coverage:ignore-start
  const CoreFilesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesCapabilities> get serializer => _$coreFilesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
  CoreFilesSharingCapabilities_FilesSharing_Public_PasswordInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_Password
    implements
        CoreFilesSharingCapabilities_FilesSharing_Public_PasswordInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Public_Password,
            CoreFilesSharingCapabilities_FilesSharing_Public_PasswordBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Public_Password([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Public_Password;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Public_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Public_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate
    implements
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate,
            CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    implements
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal,
            CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    implements
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote,
            CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_PublicInterface {
  bool get enabled;
  CoreFilesSharingCapabilities_FilesSharing_Public_Password? get password;
  @BuiltValueField(wireName: 'multiple_links')
  bool? get multipleLinks;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'expire_date_internal')
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal? get expireDateInternal;
  @BuiltValueField(wireName: 'expire_date_remote')
  CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote? get expireDateRemote;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  bool? get upload;
  @BuiltValueField(wireName: 'upload_files_drop')
  bool? get uploadFilesDrop;
  CoreFilesSharingCapabilities_FilesSharing_PublicInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public
    implements
        CoreFilesSharingCapabilities_FilesSharing_PublicInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Public,
            CoreFilesSharingCapabilities_FilesSharing_PublicBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Public([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_PublicBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Public;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Public.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateInterface {
  bool get enabled;
  CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate
    implements
        CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate,
            CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingUserExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_UserInterface {
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate? get expireDate;
  CoreFilesSharingCapabilities_FilesSharing_UserInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_UserInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_UserInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_User
    implements
        CoreFilesSharingCapabilities_FilesSharing_UserInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_User, CoreFilesSharingCapabilities_FilesSharing_UserBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_User([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_UserBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_User;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_User._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_User.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_User> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface {
  bool get enabled;
  CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate
    implements
        CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate,
            CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingGroupExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_GroupInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate? get expireDate;
  CoreFilesSharingCapabilities_FilesSharing_GroupInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Group
    implements
        CoreFilesSharingCapabilities_FilesSharing_GroupInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Group, CoreFilesSharingCapabilities_FilesSharing_GroupBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Group([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_GroupBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Group;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Group._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Group.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Group> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface {
  bool get enabled;
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    implements
        CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate,
            CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface {
  bool get enabled;
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder)
        updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported,
            CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_FederationInterface {
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
  CoreFilesSharingCapabilities_FilesSharing_FederationInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation
    implements
        CoreFilesSharingCapabilities_FilesSharing_FederationInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Federation,
            CoreFilesSharingCapabilities_FilesSharing_FederationBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Federation([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_FederationBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Federation;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Federation._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Federation.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharing_ShareeInterface {
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
  CoreFilesSharingCapabilities_FilesSharing_ShareeInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Sharee
    implements
        CoreFilesSharingCapabilities_FilesSharing_ShareeInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing_Sharee,
            CoreFilesSharingCapabilities_FilesSharing_ShareeBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing_Sharee([
    final void Function(CoreFilesSharingCapabilities_FilesSharing_ShareeBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing_Sharee;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing_Sharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing_Sharee.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingShareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilities_FilesSharingInterface {
  @BuiltValueField(wireName: 'api_enabled')
  bool get apiEnabled;
  CoreFilesSharingCapabilities_FilesSharing_Public get public;
  CoreFilesSharingCapabilities_FilesSharing_User get user;
  bool get resharing;
  @BuiltValueField(wireName: 'group_sharing')
  bool? get groupSharing;
  CoreFilesSharingCapabilities_FilesSharing_Group? get group;
  @BuiltValueField(wireName: 'default_permissions')
  int? get defaultPermissions;
  CoreFilesSharingCapabilities_FilesSharing_Federation get federation;
  CoreFilesSharingCapabilities_FilesSharing_Sharee get sharee;
  CoreFilesSharingCapabilities_FilesSharingInterface rebuild(
    final void Function(CoreFilesSharingCapabilities_FilesSharingInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilities_FilesSharingInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities_FilesSharing
    implements
        CoreFilesSharingCapabilities_FilesSharingInterface,
        Built<CoreFilesSharingCapabilities_FilesSharing, CoreFilesSharingCapabilities_FilesSharingBuilder> {
  factory CoreFilesSharingCapabilities_FilesSharing([
    final void Function(CoreFilesSharingCapabilities_FilesSharingBuilder)? b,
  ]) = _$CoreFilesSharingCapabilities_FilesSharing;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities_FilesSharing> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesSharingCapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  CoreFilesSharingCapabilities_FilesSharing get filesSharing;
  CoreFilesSharingCapabilitiesInterface rebuild(
    final void Function(CoreFilesSharingCapabilitiesInterfaceBuilder) updates,
  );
  CoreFilesSharingCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreFilesSharingCapabilities
    implements
        CoreFilesSharingCapabilitiesInterface,
        Built<CoreFilesSharingCapabilities, CoreFilesSharingCapabilitiesBuilder> {
  factory CoreFilesSharingCapabilities([final void Function(CoreFilesSharingCapabilitiesBuilder)? b]) =
      _$CoreFilesSharingCapabilities;

  // coverage:ignore-start
  const CoreFilesSharingCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesSharingCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesSharingCapabilities> get serializer => _$coreFilesSharingCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesTrashbinCapabilities_FilesInterface {
  bool get undelete;
  CoreFilesTrashbinCapabilities_FilesInterface rebuild(
    final void Function(CoreFilesTrashbinCapabilities_FilesInterfaceBuilder) updates,
  );
  CoreFilesTrashbinCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class CoreFilesTrashbinCapabilities_Files
    implements
        CoreFilesTrashbinCapabilities_FilesInterface,
        Built<CoreFilesTrashbinCapabilities_Files, CoreFilesTrashbinCapabilities_FilesBuilder> {
  factory CoreFilesTrashbinCapabilities_Files([final void Function(CoreFilesTrashbinCapabilities_FilesBuilder)? b]) =
      _$CoreFilesTrashbinCapabilities_Files;

  // coverage:ignore-start
  const CoreFilesTrashbinCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesTrashbinCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesTrashbinCapabilities_Files> get serializer =>
      _$coreFilesTrashbinCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesTrashbinCapabilitiesInterface {
  CoreFilesTrashbinCapabilities_Files get files;
  CoreFilesTrashbinCapabilitiesInterface rebuild(
    final void Function(CoreFilesTrashbinCapabilitiesInterfaceBuilder) updates,
  );
  CoreFilesTrashbinCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreFilesTrashbinCapabilities
    implements
        CoreFilesTrashbinCapabilitiesInterface,
        Built<CoreFilesTrashbinCapabilities, CoreFilesTrashbinCapabilitiesBuilder> {
  factory CoreFilesTrashbinCapabilities([final void Function(CoreFilesTrashbinCapabilitiesBuilder)? b]) =
      _$CoreFilesTrashbinCapabilities;

  // coverage:ignore-start
  const CoreFilesTrashbinCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesTrashbinCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesTrashbinCapabilities> get serializer => _$coreFilesTrashbinCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesVersionsCapabilities_FilesInterface {
  bool get versioning;
  @BuiltValueField(wireName: 'version_labeling')
  bool get versionLabeling;
  @BuiltValueField(wireName: 'version_deletion')
  bool get versionDeletion;
  CoreFilesVersionsCapabilities_FilesInterface rebuild(
    final void Function(CoreFilesVersionsCapabilities_FilesInterfaceBuilder) updates,
  );
  CoreFilesVersionsCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class CoreFilesVersionsCapabilities_Files
    implements
        CoreFilesVersionsCapabilities_FilesInterface,
        Built<CoreFilesVersionsCapabilities_Files, CoreFilesVersionsCapabilities_FilesBuilder> {
  factory CoreFilesVersionsCapabilities_Files([final void Function(CoreFilesVersionsCapabilities_FilesBuilder)? b]) =
      _$CoreFilesVersionsCapabilities_Files;

  // coverage:ignore-start
  const CoreFilesVersionsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesVersionsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesVersionsCapabilities_Files> get serializer =>
      _$coreFilesVersionsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreFilesVersionsCapabilitiesInterface {
  CoreFilesVersionsCapabilities_Files get files;
  CoreFilesVersionsCapabilitiesInterface rebuild(
    final void Function(CoreFilesVersionsCapabilitiesInterfaceBuilder) updates,
  );
  CoreFilesVersionsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreFilesVersionsCapabilities
    implements
        CoreFilesVersionsCapabilitiesInterface,
        Built<CoreFilesVersionsCapabilities, CoreFilesVersionsCapabilitiesBuilder> {
  factory CoreFilesVersionsCapabilities([final void Function(CoreFilesVersionsCapabilitiesBuilder)? b]) =
      _$CoreFilesVersionsCapabilities;

  // coverage:ignore-start
  const CoreFilesVersionsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreFilesVersionsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreFilesVersionsCapabilities> get serializer => _$coreFilesVersionsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNotesCapabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  CoreNotesCapabilities_NotesInterface rebuild(
    final void Function(CoreNotesCapabilities_NotesInterfaceBuilder) updates,
  );
  CoreNotesCapabilities_NotesInterfaceBuilder toBuilder();
}

abstract class CoreNotesCapabilities_Notes
    implements
        CoreNotesCapabilities_NotesInterface,
        Built<CoreNotesCapabilities_Notes, CoreNotesCapabilities_NotesBuilder> {
  factory CoreNotesCapabilities_Notes([final void Function(CoreNotesCapabilities_NotesBuilder)? b]) =
      _$CoreNotesCapabilities_Notes;

  // coverage:ignore-start
  const CoreNotesCapabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNotesCapabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNotesCapabilities_Notes> get serializer => _$coreNotesCapabilitiesNotesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNotesCapabilitiesInterface {
  CoreNotesCapabilities_Notes get notes;
  CoreNotesCapabilitiesInterface rebuild(final void Function(CoreNotesCapabilitiesInterfaceBuilder) updates);
  CoreNotesCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreNotesCapabilities
    implements CoreNotesCapabilitiesInterface, Built<CoreNotesCapabilities, CoreNotesCapabilitiesBuilder> {
  factory CoreNotesCapabilities([final void Function(CoreNotesCapabilitiesBuilder)? b]) = _$CoreNotesCapabilities;

  // coverage:ignore-start
  const CoreNotesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNotesCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNotesCapabilities> get serializer => _$coreNotesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNotificationsCapabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
  CoreNotificationsCapabilities_NotificationsInterface rebuild(
    final void Function(CoreNotificationsCapabilities_NotificationsInterfaceBuilder) updates,
  );
  CoreNotificationsCapabilities_NotificationsInterfaceBuilder toBuilder();
}

abstract class CoreNotificationsCapabilities_Notifications
    implements
        CoreNotificationsCapabilities_NotificationsInterface,
        Built<CoreNotificationsCapabilities_Notifications, CoreNotificationsCapabilities_NotificationsBuilder> {
  factory CoreNotificationsCapabilities_Notifications([
    final void Function(CoreNotificationsCapabilities_NotificationsBuilder)? b,
  ]) = _$CoreNotificationsCapabilities_Notifications;

  // coverage:ignore-start
  const CoreNotificationsCapabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNotificationsCapabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNotificationsCapabilities_Notifications> get serializer =>
      _$coreNotificationsCapabilitiesNotificationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreNotificationsCapabilitiesInterface {
  CoreNotificationsCapabilities_Notifications get notifications;
  CoreNotificationsCapabilitiesInterface rebuild(
    final void Function(CoreNotificationsCapabilitiesInterfaceBuilder) updates,
  );
  CoreNotificationsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreNotificationsCapabilities
    implements
        CoreNotificationsCapabilitiesInterface,
        Built<CoreNotificationsCapabilities, CoreNotificationsCapabilitiesBuilder> {
  factory CoreNotificationsCapabilities([final void Function(CoreNotificationsCapabilitiesBuilder)? b]) =
      _$CoreNotificationsCapabilities;

  // coverage:ignore-start
  const CoreNotificationsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNotificationsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreNotificationsCapabilities> get serializer => _$coreNotificationsCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreProvisioningApiCapabilities_ProvisioningApiInterface {
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
  CoreProvisioningApiCapabilities_ProvisioningApiInterface rebuild(
    final void Function(CoreProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder) updates,
  );
  CoreProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder toBuilder();
}

abstract class CoreProvisioningApiCapabilities_ProvisioningApi
    implements
        CoreProvisioningApiCapabilities_ProvisioningApiInterface,
        Built<CoreProvisioningApiCapabilities_ProvisioningApi, CoreProvisioningApiCapabilities_ProvisioningApiBuilder> {
  factory CoreProvisioningApiCapabilities_ProvisioningApi([
    final void Function(CoreProvisioningApiCapabilities_ProvisioningApiBuilder)? b,
  ]) = _$CoreProvisioningApiCapabilities_ProvisioningApi;

  // coverage:ignore-start
  const CoreProvisioningApiCapabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProvisioningApiCapabilities_ProvisioningApi.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      _$coreProvisioningApiCapabilitiesProvisioningApiSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreProvisioningApiCapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  CoreProvisioningApiCapabilities_ProvisioningApi get provisioningApi;
  CoreProvisioningApiCapabilitiesInterface rebuild(
    final void Function(CoreProvisioningApiCapabilitiesInterfaceBuilder) updates,
  );
  CoreProvisioningApiCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreProvisioningApiCapabilities
    implements
        CoreProvisioningApiCapabilitiesInterface,
        Built<CoreProvisioningApiCapabilities, CoreProvisioningApiCapabilitiesBuilder> {
  factory CoreProvisioningApiCapabilities([final void Function(CoreProvisioningApiCapabilitiesBuilder)? b]) =
      _$CoreProvisioningApiCapabilities;

  // coverage:ignore-start
  const CoreProvisioningApiCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProvisioningApiCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreProvisioningApiCapabilities> get serializer => _$coreProvisioningApiCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface {
  bool get enabled;
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface rebuild(
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropInterface,
        Built<CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)? b,
  ]) = _$CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop;

  // coverage:ignore-start
  const CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface {
  bool get enabled;
  bool get enforced;
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface rebuild(
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password
    implements
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordInterface,
        Built<CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password,
            CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password([
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password;

  // coverage:ignore-start
  const CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface {
  bool get enabled;
  bool get enforced;
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface rebuild(
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateInterface,
        Built<CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate,
            CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate;

  // coverage:ignore-start
  const CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilities_FilesSharing_SharebymailInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate get expireDate;
  CoreSharebymailCapabilities_FilesSharing_SharebymailInterface rebuild(
    final void Function(CoreSharebymailCapabilities_FilesSharing_SharebymailInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilities_FilesSharing_SharebymailInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail
    implements
        CoreSharebymailCapabilities_FilesSharing_SharebymailInterface,
        Built<CoreSharebymailCapabilities_FilesSharing_Sharebymail,
            CoreSharebymailCapabilities_FilesSharing_SharebymailBuilder> {
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail([
    final void Function(CoreSharebymailCapabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$CoreSharebymailCapabilities_FilesSharing_Sharebymail;

  // coverage:ignore-start
  const CoreSharebymailCapabilities_FilesSharing_Sharebymail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities_FilesSharing_Sharebymail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilities_FilesSharingInterface {
  CoreSharebymailCapabilities_FilesSharing_Sharebymail get sharebymail;
  CoreSharebymailCapabilities_FilesSharingInterface rebuild(
    final void Function(CoreSharebymailCapabilities_FilesSharingInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilities_FilesSharingInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities_FilesSharing
    implements
        CoreSharebymailCapabilities_FilesSharingInterface,
        Built<CoreSharebymailCapabilities_FilesSharing, CoreSharebymailCapabilities_FilesSharingBuilder> {
  factory CoreSharebymailCapabilities_FilesSharing([
    final void Function(CoreSharebymailCapabilities_FilesSharingBuilder)? b,
  ]) = _$CoreSharebymailCapabilities_FilesSharing;

  // coverage:ignore-start
  const CoreSharebymailCapabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities_FilesSharing> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreSharebymailCapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  CoreSharebymailCapabilities_FilesSharing get filesSharing;
  CoreSharebymailCapabilitiesInterface rebuild(
    final void Function(CoreSharebymailCapabilitiesInterfaceBuilder) updates,
  );
  CoreSharebymailCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreSharebymailCapabilities
    implements
        CoreSharebymailCapabilitiesInterface,
        Built<CoreSharebymailCapabilities, CoreSharebymailCapabilitiesBuilder> {
  factory CoreSharebymailCapabilities([final void Function(CoreSharebymailCapabilitiesBuilder)? b]) =
      _$CoreSharebymailCapabilities;

  // coverage:ignore-start
  const CoreSharebymailCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreSharebymailCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreSharebymailCapabilities> get serializer => _$coreSharebymailCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreThemingPublicCapabilities_ThemingInterface {
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
  CoreThemingPublicCapabilities_ThemingInterface rebuild(
    final void Function(CoreThemingPublicCapabilities_ThemingInterfaceBuilder) updates,
  );
  CoreThemingPublicCapabilities_ThemingInterfaceBuilder toBuilder();
}

abstract class CoreThemingPublicCapabilities_Theming
    implements
        CoreThemingPublicCapabilities_ThemingInterface,
        Built<CoreThemingPublicCapabilities_Theming, CoreThemingPublicCapabilities_ThemingBuilder> {
  factory CoreThemingPublicCapabilities_Theming([
    final void Function(CoreThemingPublicCapabilities_ThemingBuilder)? b,
  ]) = _$CoreThemingPublicCapabilities_Theming;

  // coverage:ignore-start
  const CoreThemingPublicCapabilities_Theming._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreThemingPublicCapabilities_Theming.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreThemingPublicCapabilities_Theming> get serializer =>
      _$coreThemingPublicCapabilitiesThemingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreThemingPublicCapabilitiesInterface {
  CoreThemingPublicCapabilities_Theming get theming;
  CoreThemingPublicCapabilitiesInterface rebuild(
    final void Function(CoreThemingPublicCapabilitiesInterfaceBuilder) updates,
  );
  CoreThemingPublicCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreThemingPublicCapabilities
    implements
        CoreThemingPublicCapabilitiesInterface,
        Built<CoreThemingPublicCapabilities, CoreThemingPublicCapabilitiesBuilder> {
  factory CoreThemingPublicCapabilities([final void Function(CoreThemingPublicCapabilitiesBuilder)? b]) =
      _$CoreThemingPublicCapabilities;

  // coverage:ignore-start
  const CoreThemingPublicCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreThemingPublicCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreThemingPublicCapabilities> get serializer => _$coreThemingPublicCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUserStatusCapabilities_UserStatusInterface {
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
  CoreUserStatusCapabilities_UserStatusInterface rebuild(
    final void Function(CoreUserStatusCapabilities_UserStatusInterfaceBuilder) updates,
  );
  CoreUserStatusCapabilities_UserStatusInterfaceBuilder toBuilder();
}

abstract class CoreUserStatusCapabilities_UserStatus
    implements
        CoreUserStatusCapabilities_UserStatusInterface,
        Built<CoreUserStatusCapabilities_UserStatus, CoreUserStatusCapabilities_UserStatusBuilder> {
  factory CoreUserStatusCapabilities_UserStatus([
    final void Function(CoreUserStatusCapabilities_UserStatusBuilder)? b,
  ]) = _$CoreUserStatusCapabilities_UserStatus;

  // coverage:ignore-start
  const CoreUserStatusCapabilities_UserStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUserStatusCapabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUserStatusCapabilities_UserStatus> get serializer =>
      _$coreUserStatusCapabilitiesUserStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUserStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'user_status')
  CoreUserStatusCapabilities_UserStatus get userStatus;
  CoreUserStatusCapabilitiesInterface rebuild(final void Function(CoreUserStatusCapabilitiesInterfaceBuilder) updates);
  CoreUserStatusCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreUserStatusCapabilities
    implements
        CoreUserStatusCapabilitiesInterface,
        Built<CoreUserStatusCapabilities, CoreUserStatusCapabilitiesBuilder> {
  factory CoreUserStatusCapabilities([final void Function(CoreUserStatusCapabilitiesBuilder)? b]) =
      _$CoreUserStatusCapabilities;

  // coverage:ignore-start
  const CoreUserStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUserStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUserStatusCapabilities> get serializer => _$coreUserStatusCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWeatherStatusCapabilities_WeatherStatusInterface {
  bool get enabled;
  CoreWeatherStatusCapabilities_WeatherStatusInterface rebuild(
    final void Function(CoreWeatherStatusCapabilities_WeatherStatusInterfaceBuilder) updates,
  );
  CoreWeatherStatusCapabilities_WeatherStatusInterfaceBuilder toBuilder();
}

abstract class CoreWeatherStatusCapabilities_WeatherStatus
    implements
        CoreWeatherStatusCapabilities_WeatherStatusInterface,
        Built<CoreWeatherStatusCapabilities_WeatherStatus, CoreWeatherStatusCapabilities_WeatherStatusBuilder> {
  factory CoreWeatherStatusCapabilities_WeatherStatus([
    final void Function(CoreWeatherStatusCapabilities_WeatherStatusBuilder)? b,
  ]) = _$CoreWeatherStatusCapabilities_WeatherStatus;

  // coverage:ignore-start
  const CoreWeatherStatusCapabilities_WeatherStatus._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWeatherStatusCapabilities_WeatherStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$coreWeatherStatusCapabilitiesWeatherStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWeatherStatusCapabilitiesInterface {
  @BuiltValueField(wireName: 'weather_status')
  CoreWeatherStatusCapabilities_WeatherStatus get weatherStatus;
  CoreWeatherStatusCapabilitiesInterface rebuild(
    final void Function(CoreWeatherStatusCapabilitiesInterfaceBuilder) updates,
  );
  CoreWeatherStatusCapabilitiesInterfaceBuilder toBuilder();
}

abstract class CoreWeatherStatusCapabilities
    implements
        CoreWeatherStatusCapabilitiesInterface,
        Built<CoreWeatherStatusCapabilities, CoreWeatherStatusCapabilitiesBuilder> {
  factory CoreWeatherStatusCapabilities([final void Function(CoreWeatherStatusCapabilitiesBuilder)? b]) =
      _$CoreWeatherStatusCapabilities;

  // coverage:ignore-start
  const CoreWeatherStatusCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWeatherStatusCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWeatherStatusCapabilities> get serializer => _$coreWeatherStatusCapabilitiesSerializer;
}

abstract class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities
    implements
        Built<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
            CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder> {
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities([
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  CoreCommentsCapabilities? get commentsCapabilities;
  CoreDavCapabilities? get davCapabilities;
  CoreFilesCapabilities? get filesCapabilities;
  CoreFilesSharingCapabilities? get filesSharingCapabilities;
  CoreFilesTrashbinCapabilities? get filesTrashbinCapabilities;
  CoreFilesVersionsCapabilities? get filesVersionsCapabilities;
  CoreNotesCapabilities? get notesCapabilities;
  CoreNotificationsCapabilities? get notificationsCapabilities;
  CoreProvisioningApiCapabilities? get provisioningApiCapabilities;
  CoreSharebymailCapabilities? get sharebymailCapabilities;
  CoreThemingPublicCapabilities? get themingPublicCapabilities;
  CoreUserStatusCapabilities? get userStatusCapabilities;
  CoreWeatherStatusCapabilities? get weatherStatusCapabilities;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities> get serializer =>
      _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesSerializer();
}

class _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesSerializer
    implements PrimitiveSerializer<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities> {
  @override
  final Iterable<Type> types = const [
    CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
    _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities,
  ];

  @override
  final String wireName = 'CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_CapabilitiesBuilder()
      ..data = JsonObject(data);
    try {
      result._commentsCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreCommentsCapabilities),
      )! as CoreCommentsCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._davCapabilities = (_jsonSerializers.deserialize(data, specifiedType: const FullType(CoreDavCapabilities))!
              as CoreDavCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._filesCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreFilesCapabilities),
      )! as CoreFilesCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._filesSharingCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreFilesSharingCapabilities),
      )! as CoreFilesSharingCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._filesTrashbinCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreFilesTrashbinCapabilities),
      )! as CoreFilesTrashbinCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._filesVersionsCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreFilesVersionsCapabilities),
      )! as CoreFilesVersionsCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._notesCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreNotesCapabilities),
      )! as CoreNotesCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._notificationsCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreNotificationsCapabilities),
      )! as CoreNotificationsCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._provisioningApiCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreProvisioningApiCapabilities),
      )! as CoreProvisioningApiCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._sharebymailCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreSharebymailCapabilities),
      )! as CoreSharebymailCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._themingPublicCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreThemingPublicCapabilities),
      )! as CoreThemingPublicCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._userStatusCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreUserStatusCapabilities),
      )! as CoreUserStatusCapabilities)
          .toBuilder();
    } catch (_) {}
    try {
      result._weatherStatusCapabilities = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(CoreWeatherStatusCapabilities),
      )! as CoreWeatherStatusCapabilities)
          .toBuilder();
    } catch (_) {}
    assert(
      [
        result._commentsCapabilities,
        result._davCapabilities,
        result._filesCapabilities,
        result._filesSharingCapabilities,
        result._filesTrashbinCapabilities,
        result._filesVersionsCapabilities,
        result._notesCapabilities,
        result._notificationsCapabilities,
        result._provisioningApiCapabilities,
        result._sharebymailCapabilities,
        result._themingPublicCapabilities,
        result._userStatusCapabilities,
        result._weatherStatusCapabilities,
      ].where((final x) => x != null).isNotEmpty,
      'Need anyOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface {
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version get version;
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities get capabilities;
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data
    implements
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataInterface,
        Built<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data,
            CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data([
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreOcsGetCapabilitiesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcsGetCapabilitiesResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data get data;
  CoreOcsGetCapabilitiesResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreOcsGetCapabilitiesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreOcsGetCapabilitiesResponseApplicationJson_Ocs
    implements
        CoreOcsGetCapabilitiesResponseApplicationJson_OcsInterface,
        Built<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs,
            CoreOcsGetCapabilitiesResponseApplicationJson_OcsBuilder> {
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs([
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcsGetCapabilitiesResponseApplicationJson_Ocs> get serializer =>
      _$coreOcsGetCapabilitiesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreOcsGetCapabilitiesResponseApplicationJsonInterface {
  CoreOcsGetCapabilitiesResponseApplicationJson_Ocs get ocs;
  CoreOcsGetCapabilitiesResponseApplicationJsonInterface rebuild(
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreOcsGetCapabilitiesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreOcsGetCapabilitiesResponseApplicationJson
    implements
        CoreOcsGetCapabilitiesResponseApplicationJsonInterface,
        Built<CoreOcsGetCapabilitiesResponseApplicationJson, CoreOcsGetCapabilitiesResponseApplicationJsonBuilder> {
  factory CoreOcsGetCapabilitiesResponseApplicationJson([
    final void Function(CoreOcsGetCapabilitiesResponseApplicationJsonBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponseApplicationJson;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreOcsGetCapabilitiesResponseApplicationJson> get serializer =>
      _$coreOcsGetCapabilitiesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreProfileApiSetVisibilityResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  JsonObject get data;
  CoreProfileApiSetVisibilityResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreProfileApiSetVisibilityResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreProfileApiSetVisibilityResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreProfileApiSetVisibilityResponseApplicationJson_Ocs
    implements
        CoreProfileApiSetVisibilityResponseApplicationJson_OcsInterface,
        Built<CoreProfileApiSetVisibilityResponseApplicationJson_Ocs,
            CoreProfileApiSetVisibilityResponseApplicationJson_OcsBuilder> {
  factory CoreProfileApiSetVisibilityResponseApplicationJson_Ocs([
    final void Function(CoreProfileApiSetVisibilityResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreProfileApiSetVisibilityResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreProfileApiSetVisibilityResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProfileApiSetVisibilityResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreProfileApiSetVisibilityResponseApplicationJson_Ocs> get serializer =>
      _$coreProfileApiSetVisibilityResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreProfileApiSetVisibilityResponseApplicationJsonInterface {
  CoreProfileApiSetVisibilityResponseApplicationJson_Ocs get ocs;
  CoreProfileApiSetVisibilityResponseApplicationJsonInterface rebuild(
    final void Function(CoreProfileApiSetVisibilityResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreProfileApiSetVisibilityResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreProfileApiSetVisibilityResponseApplicationJson
    implements
        CoreProfileApiSetVisibilityResponseApplicationJsonInterface,
        Built<CoreProfileApiSetVisibilityResponseApplicationJson,
            CoreProfileApiSetVisibilityResponseApplicationJsonBuilder> {
  factory CoreProfileApiSetVisibilityResponseApplicationJson([
    final void Function(CoreProfileApiSetVisibilityResponseApplicationJsonBuilder)? b,
  ]) = _$CoreProfileApiSetVisibilityResponseApplicationJson;

  // coverage:ignore-start
  const CoreProfileApiSetVisibilityResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProfileApiSetVisibilityResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreProfileApiSetVisibilityResponseApplicationJson> get serializer =>
      _$coreProfileApiSetVisibilityResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceInterface {
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  CoreOpenGraphObject get openGraphObject;
  bool get accessible;
  CoreReferenceInterface rebuild(final void Function(CoreReferenceInterfaceBuilder) updates);
  CoreReferenceInterfaceBuilder toBuilder();
}

abstract class CoreReference implements CoreReferenceInterface, Built<CoreReference, CoreReferenceBuilder> {
  factory CoreReference([final void Function(CoreReferenceBuilder)? b]) = _$CoreReference;

  // coverage:ignore-start
  const CoreReference._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReference.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReference> get serializer => _$coreReferenceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, CoreReference> get references;
  CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data
    implements
        CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataInterface,
        Built<CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data,
            CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiResolveOneResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiResolveOneResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveOneResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data get data;
  CoreReferenceApiResolveOneResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreReferenceApiResolveOneResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveOneResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveOneResponseApplicationJson_Ocs
    implements
        CoreReferenceApiResolveOneResponseApplicationJson_OcsInterface,
        Built<CoreReferenceApiResolveOneResponseApplicationJson_Ocs,
            CoreReferenceApiResolveOneResponseApplicationJson_OcsBuilder> {
  factory CoreReferenceApiResolveOneResponseApplicationJson_Ocs([
    final void Function(CoreReferenceApiResolveOneResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveOneResponseApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiResolveOneResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveOneResponseApplicationJsonInterface {
  CoreReferenceApiResolveOneResponseApplicationJson_Ocs get ocs;
  CoreReferenceApiResolveOneResponseApplicationJsonInterface rebuild(
    final void Function(CoreReferenceApiResolveOneResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveOneResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveOneResponseApplicationJson
    implements
        CoreReferenceApiResolveOneResponseApplicationJsonInterface,
        Built<CoreReferenceApiResolveOneResponseApplicationJson,
            CoreReferenceApiResolveOneResponseApplicationJsonBuilder> {
  factory CoreReferenceApiResolveOneResponseApplicationJson([
    final void Function(CoreReferenceApiResolveOneResponseApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponseApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveOneResponseApplicationJson> get serializer =>
      _$coreReferenceApiResolveOneResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, CoreReference> get references;
  CoreReferenceApiResolveResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreReferenceApiResolveResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveResponseApplicationJson_Ocs_Data
    implements
        CoreReferenceApiResolveResponseApplicationJson_Ocs_DataInterface,
        Built<CoreReferenceApiResolveResponseApplicationJson_Ocs_Data,
            CoreReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiResolveResponseApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiResolveResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiResolveResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreReferenceApiResolveResponseApplicationJson_Ocs_Data get data;
  CoreReferenceApiResolveResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreReferenceApiResolveResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveResponseApplicationJson_Ocs
    implements
        CoreReferenceApiResolveResponseApplicationJson_OcsInterface,
        Built<CoreReferenceApiResolveResponseApplicationJson_Ocs,
            CoreReferenceApiResolveResponseApplicationJson_OcsBuilder> {
  factory CoreReferenceApiResolveResponseApplicationJson_Ocs([
    final void Function(CoreReferenceApiResolveResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveResponseApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiResolveResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiResolveResponseApplicationJsonInterface {
  CoreReferenceApiResolveResponseApplicationJson_Ocs get ocs;
  CoreReferenceApiResolveResponseApplicationJsonInterface rebuild(
    final void Function(CoreReferenceApiResolveResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreReferenceApiResolveResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiResolveResponseApplicationJson
    implements
        CoreReferenceApiResolveResponseApplicationJsonInterface,
        Built<CoreReferenceApiResolveResponseApplicationJson, CoreReferenceApiResolveResponseApplicationJsonBuilder> {
  factory CoreReferenceApiResolveResponseApplicationJson([
    final void Function(CoreReferenceApiResolveResponseApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponseApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiResolveResponseApplicationJson> get serializer =>
      _$coreReferenceApiResolveResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiExtractResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, CoreReference> get references;
  CoreReferenceApiExtractResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreReferenceApiExtractResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreReferenceApiExtractResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiExtractResponseApplicationJson_Ocs_Data
    implements
        CoreReferenceApiExtractResponseApplicationJson_Ocs_DataInterface,
        Built<CoreReferenceApiExtractResponseApplicationJson_Ocs_Data,
            CoreReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiExtractResponseApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiExtractResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiExtractResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiExtractResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiExtractResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreReferenceApiExtractResponseApplicationJson_Ocs_Data get data;
  CoreReferenceApiExtractResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreReferenceApiExtractResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreReferenceApiExtractResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiExtractResponseApplicationJson_Ocs
    implements
        CoreReferenceApiExtractResponseApplicationJson_OcsInterface,
        Built<CoreReferenceApiExtractResponseApplicationJson_Ocs,
            CoreReferenceApiExtractResponseApplicationJson_OcsBuilder> {
  factory CoreReferenceApiExtractResponseApplicationJson_Ocs([
    final void Function(CoreReferenceApiExtractResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiExtractResponseApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiExtractResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiExtractResponseApplicationJsonInterface {
  CoreReferenceApiExtractResponseApplicationJson_Ocs get ocs;
  CoreReferenceApiExtractResponseApplicationJsonInterface rebuild(
    final void Function(CoreReferenceApiExtractResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreReferenceApiExtractResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiExtractResponseApplicationJson
    implements
        CoreReferenceApiExtractResponseApplicationJsonInterface,
        Built<CoreReferenceApiExtractResponseApplicationJson, CoreReferenceApiExtractResponseApplicationJsonBuilder> {
  factory CoreReferenceApiExtractResponseApplicationJson([
    final void Function(CoreReferenceApiExtractResponseApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponseApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiExtractResponseApplicationJson> get serializer =>
      _$coreReferenceApiExtractResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceProviderInterface {
  String get id;
  String get title;
  @BuiltValueField(wireName: 'icon_url')
  String get iconUrl;
  int get order;
  @BuiltValueField(wireName: 'search_providers_ids')
  BuiltList<String>? get searchProvidersIds;
  CoreReferenceProviderInterface rebuild(final void Function(CoreReferenceProviderInterfaceBuilder) updates);
  CoreReferenceProviderInterfaceBuilder toBuilder();
}

abstract class CoreReferenceProvider
    implements CoreReferenceProviderInterface, Built<CoreReferenceProvider, CoreReferenceProviderBuilder> {
  factory CoreReferenceProvider([final void Function(CoreReferenceProviderBuilder)? b]) = _$CoreReferenceProvider;

  // coverage:ignore-start
  const CoreReferenceProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceProvider.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceProvider> get serializer => _$coreReferenceProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreReferenceProvider> get data;
  CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs
    implements
        CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsInterface,
        Built<CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs,
            CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder> {
  factory CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs([
    final void Function(CoreReferenceApiGetProvidersInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiGetProvidersInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiGetProvidersInfoResponseApplicationJsonInterface {
  CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs get ocs;
  CoreReferenceApiGetProvidersInfoResponseApplicationJsonInterface rebuild(
    final void Function(CoreReferenceApiGetProvidersInfoResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreReferenceApiGetProvidersInfoResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiGetProvidersInfoResponseApplicationJson
    implements
        CoreReferenceApiGetProvidersInfoResponseApplicationJsonInterface,
        Built<CoreReferenceApiGetProvidersInfoResponseApplicationJson,
            CoreReferenceApiGetProvidersInfoResponseApplicationJsonBuilder> {
  factory CoreReferenceApiGetProvidersInfoResponseApplicationJson([
    final void Function(CoreReferenceApiGetProvidersInfoResponseApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiGetProvidersInfoResponseApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiGetProvidersInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiGetProvidersInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiGetProvidersInfoResponseApplicationJson> get serializer =>
      _$coreReferenceApiGetProvidersInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface {
  bool get success;
  CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data
    implements
        CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataInterface,
        Built<CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data,
            CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiTouchProviderResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiTouchProviderResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data get data;
  CoreReferenceApiTouchProviderResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreReferenceApiTouchProviderResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiTouchProviderResponseApplicationJson_Ocs
    implements
        CoreReferenceApiTouchProviderResponseApplicationJson_OcsInterface,
        Built<CoreReferenceApiTouchProviderResponseApplicationJson_Ocs,
            CoreReferenceApiTouchProviderResponseApplicationJson_OcsBuilder> {
  factory CoreReferenceApiTouchProviderResponseApplicationJson_Ocs([
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiTouchProviderResponseApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiTouchProviderResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreReferenceApiTouchProviderResponseApplicationJsonInterface {
  CoreReferenceApiTouchProviderResponseApplicationJson_Ocs get ocs;
  CoreReferenceApiTouchProviderResponseApplicationJsonInterface rebuild(
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreReferenceApiTouchProviderResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreReferenceApiTouchProviderResponseApplicationJson
    implements
        CoreReferenceApiTouchProviderResponseApplicationJsonInterface,
        Built<CoreReferenceApiTouchProviderResponseApplicationJson,
            CoreReferenceApiTouchProviderResponseApplicationJsonBuilder> {
  factory CoreReferenceApiTouchProviderResponseApplicationJson([
    final void Function(CoreReferenceApiTouchProviderResponseApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponseApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreReferenceApiTouchProviderResponseApplicationJson> get serializer =>
      _$coreReferenceApiTouchProviderResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface {
  String get id;
  String get name;
  String get description;
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface rebuild(
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterfaceBuilder) updates,
  );
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types
    implements
        CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesInterface,
        Built<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types,
            CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder> {
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types([
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_TypesBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get serializer =>
      _$coreTextProcessingApiTaskTypesResponseApplicationJsonOcsDataTypesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types> get types;
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data
    implements
        CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data,
            CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiTaskTypesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data get data;
  CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs
    implements
        CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsInterface,
        Built<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs,
            CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiTaskTypesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiTaskTypesResponseApplicationJsonInterface {
  CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs get ocs;
  CoreTextProcessingApiTaskTypesResponseApplicationJsonInterface rebuild(
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTextProcessingApiTaskTypesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiTaskTypesResponseApplicationJson
    implements
        CoreTextProcessingApiTaskTypesResponseApplicationJsonInterface,
        Built<CoreTextProcessingApiTaskTypesResponseApplicationJson,
            CoreTextProcessingApiTaskTypesResponseApplicationJsonBuilder> {
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson([
    final void Function(CoreTextProcessingApiTaskTypesResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponseApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiTaskTypesResponseApplicationJson> get serializer =>
      _$coreTextProcessingApiTaskTypesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingTaskInterface {
  int? get id;
  String get type;
  int get status;
  String? get userId;
  String get appId;
  String get input;
  String? get output;
  String get identifier;
  CoreTextProcessingTaskInterface rebuild(final void Function(CoreTextProcessingTaskInterfaceBuilder) updates);
  CoreTextProcessingTaskInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingTask
    implements CoreTextProcessingTaskInterface, Built<CoreTextProcessingTask, CoreTextProcessingTaskBuilder> {
  factory CoreTextProcessingTask([final void Function(CoreTextProcessingTaskBuilder)? b]) = _$CoreTextProcessingTask;

  // coverage:ignore-start
  const CoreTextProcessingTask._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingTask.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingTask> get serializer => _$coreTextProcessingTaskSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface {
  CoreTextProcessingTask get task;
  CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data
    implements
        CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data,
            CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiScheduleResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiScheduleResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data get data;
  CoreTextProcessingApiScheduleResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTextProcessingApiScheduleResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiScheduleResponseApplicationJson_Ocs
    implements
        CoreTextProcessingApiScheduleResponseApplicationJson_OcsInterface,
        Built<CoreTextProcessingApiScheduleResponseApplicationJson_Ocs,
            CoreTextProcessingApiScheduleResponseApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiScheduleResponseApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiScheduleResponseApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiScheduleResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiScheduleResponseApplicationJsonInterface {
  CoreTextProcessingApiScheduleResponseApplicationJson_Ocs get ocs;
  CoreTextProcessingApiScheduleResponseApplicationJsonInterface rebuild(
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTextProcessingApiScheduleResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiScheduleResponseApplicationJson
    implements
        CoreTextProcessingApiScheduleResponseApplicationJsonInterface,
        Built<CoreTextProcessingApiScheduleResponseApplicationJson,
            CoreTextProcessingApiScheduleResponseApplicationJsonBuilder> {
  factory CoreTextProcessingApiScheduleResponseApplicationJson([
    final void Function(CoreTextProcessingApiScheduleResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponseApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiScheduleResponseApplicationJson> get serializer =>
      _$coreTextProcessingApiScheduleResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface {
  CoreTextProcessingTask get task;
  CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data
    implements
        CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data,
            CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiGetTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiGetTaskResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data get data;
  CoreTextProcessingApiGetTaskResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTextProcessingApiGetTaskResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs
    implements
        CoreTextProcessingApiGetTaskResponseApplicationJson_OcsInterface,
        Built<CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs,
            CoreTextProcessingApiGetTaskResponseApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiGetTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiGetTaskResponseApplicationJsonInterface {
  CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs get ocs;
  CoreTextProcessingApiGetTaskResponseApplicationJsonInterface rebuild(
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTextProcessingApiGetTaskResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiGetTaskResponseApplicationJson
    implements
        CoreTextProcessingApiGetTaskResponseApplicationJsonInterface,
        Built<CoreTextProcessingApiGetTaskResponseApplicationJson,
            CoreTextProcessingApiGetTaskResponseApplicationJsonBuilder> {
  factory CoreTextProcessingApiGetTaskResponseApplicationJson([
    final void Function(CoreTextProcessingApiGetTaskResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponseApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiGetTaskResponseApplicationJson> get serializer =>
      _$coreTextProcessingApiGetTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface {
  CoreTextProcessingTask get task;
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data
    implements
        CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data,
            CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data get data;
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs
    implements
        CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsInterface,
        Built<CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs,
            CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiDeleteTaskResponseApplicationJsonInterface {
  CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs get ocs;
  CoreTextProcessingApiDeleteTaskResponseApplicationJsonInterface rebuild(
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTextProcessingApiDeleteTaskResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiDeleteTaskResponseApplicationJson
    implements
        CoreTextProcessingApiDeleteTaskResponseApplicationJsonInterface,
        Built<CoreTextProcessingApiDeleteTaskResponseApplicationJson,
            CoreTextProcessingApiDeleteTaskResponseApplicationJsonBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson([
    final void Function(CoreTextProcessingApiDeleteTaskResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponseApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiDeleteTaskResponseApplicationJson> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface {
  BuiltList<CoreTextProcessingTask> get tasks;
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data
    implements
        CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data,
            CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data get data;
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs
    implements
        CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsInterface,
        Built<CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs,
            CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTextProcessingApiListTasksByAppResponseApplicationJsonInterface {
  CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs get ocs;
  CoreTextProcessingApiListTasksByAppResponseApplicationJsonInterface rebuild(
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTextProcessingApiListTasksByAppResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTextProcessingApiListTasksByAppResponseApplicationJson
    implements
        CoreTextProcessingApiListTasksByAppResponseApplicationJsonInterface,
        Built<CoreTextProcessingApiListTasksByAppResponseApplicationJson,
            CoreTextProcessingApiListTasksByAppResponseApplicationJsonBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson([
    final void Function(CoreTextProcessingApiListTasksByAppResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponseApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTextProcessingApiListTasksByAppResponseApplicationJson> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface {
  String get from;
  String get fromLabel;
  String get to;
  String get toLabel;
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface rebuild(
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterfaceBuilder) updates,
  );
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages
    implements
        CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesInterface,
        Built<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages,
            CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder> {
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages([
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_LanguagesBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get serializer =>
      _$coreTranslationApiLanguagesResponseApplicationJsonOcsDataLanguagesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface {
  BuiltList<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages> get languages;
  bool get languageDetection;
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data
    implements
        CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data,
            CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data([
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTranslationApiLanguagesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiLanguagesResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data get data;
  CoreTranslationApiLanguagesResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTranslationApiLanguagesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiLanguagesResponseApplicationJson_Ocs
    implements
        CoreTranslationApiLanguagesResponseApplicationJson_OcsInterface,
        Built<CoreTranslationApiLanguagesResponseApplicationJson_Ocs,
            CoreTranslationApiLanguagesResponseApplicationJson_OcsBuilder> {
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs([
    final void Function(CoreTranslationApiLanguagesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiLanguagesResponseApplicationJson_Ocs> get serializer =>
      _$coreTranslationApiLanguagesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiLanguagesResponseApplicationJsonInterface {
  CoreTranslationApiLanguagesResponseApplicationJson_Ocs get ocs;
  CoreTranslationApiLanguagesResponseApplicationJsonInterface rebuild(
    final void Function(CoreTranslationApiLanguagesResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTranslationApiLanguagesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiLanguagesResponseApplicationJson
    implements
        CoreTranslationApiLanguagesResponseApplicationJsonInterface,
        Built<CoreTranslationApiLanguagesResponseApplicationJson,
            CoreTranslationApiLanguagesResponseApplicationJsonBuilder> {
  factory CoreTranslationApiLanguagesResponseApplicationJson([
    final void Function(CoreTranslationApiLanguagesResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponseApplicationJson;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiLanguagesResponseApplicationJson> get serializer =>
      _$coreTranslationApiLanguagesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataInterface {
  String get text;
  String? get from;
  CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data
    implements
        CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataInterface,
        Built<CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data,
            CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data([
    final void Function(CoreTranslationApiTranslateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreTranslationApiTranslateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiTranslateResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data get data;
  CoreTranslationApiTranslateResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreTranslationApiTranslateResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreTranslationApiTranslateResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiTranslateResponseApplicationJson_Ocs
    implements
        CoreTranslationApiTranslateResponseApplicationJson_OcsInterface,
        Built<CoreTranslationApiTranslateResponseApplicationJson_Ocs,
            CoreTranslationApiTranslateResponseApplicationJson_OcsBuilder> {
  factory CoreTranslationApiTranslateResponseApplicationJson_Ocs([
    final void Function(CoreTranslationApiTranslateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiTranslateResponseApplicationJson_Ocs> get serializer =>
      _$coreTranslationApiTranslateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreTranslationApiTranslateResponseApplicationJsonInterface {
  CoreTranslationApiTranslateResponseApplicationJson_Ocs get ocs;
  CoreTranslationApiTranslateResponseApplicationJsonInterface rebuild(
    final void Function(CoreTranslationApiTranslateResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreTranslationApiTranslateResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreTranslationApiTranslateResponseApplicationJson
    implements
        CoreTranslationApiTranslateResponseApplicationJsonInterface,
        Built<CoreTranslationApiTranslateResponseApplicationJson,
            CoreTranslationApiTranslateResponseApplicationJsonBuilder> {
  factory CoreTranslationApiTranslateResponseApplicationJson([
    final void Function(CoreTranslationApiTranslateResponseApplicationJsonBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponseApplicationJson;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreTranslationApiTranslateResponseApplicationJson> get serializer =>
      _$coreTranslationApiTranslateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchProviderInterface {
  String get id;
  String get name;
  int get order;
  CoreUnifiedSearchProviderInterface rebuild(final void Function(CoreUnifiedSearchProviderInterfaceBuilder) updates);
  CoreUnifiedSearchProviderInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchProvider
    implements CoreUnifiedSearchProviderInterface, Built<CoreUnifiedSearchProvider, CoreUnifiedSearchProviderBuilder> {
  factory CoreUnifiedSearchProvider([final void Function(CoreUnifiedSearchProviderBuilder)? b]) =
      _$CoreUnifiedSearchProvider;

  // coverage:ignore-start
  const CoreUnifiedSearchProvider._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchProvider.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchProvider> get serializer => _$coreUnifiedSearchProviderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  BuiltList<CoreUnifiedSearchProvider> get data;
  CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs
    implements
        CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsInterface,
        Built<CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs,
            CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchGetProvidersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchGetProvidersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchGetProvidersResponseApplicationJsonInterface {
  CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs get ocs;
  CoreUnifiedSearchGetProvidersResponseApplicationJsonInterface rebuild(
    final void Function(CoreUnifiedSearchGetProvidersResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreUnifiedSearchGetProvidersResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchGetProvidersResponseApplicationJson
    implements
        CoreUnifiedSearchGetProvidersResponseApplicationJsonInterface,
        Built<CoreUnifiedSearchGetProvidersResponseApplicationJson,
            CoreUnifiedSearchGetProvidersResponseApplicationJsonBuilder> {
  factory CoreUnifiedSearchGetProvidersResponseApplicationJson([
    final void Function(CoreUnifiedSearchGetProvidersResponseApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchGetProvidersResponseApplicationJson;

  // coverage:ignore-start
  const CoreUnifiedSearchGetProvidersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchGetProvidersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchGetProvidersResponseApplicationJson> get serializer =>
      _$coreUnifiedSearchGetProvidersResponseApplicationJsonSerializer;
}

abstract class CoreUnifiedSearchSearchCursor
    implements Built<CoreUnifiedSearchSearchCursor, CoreUnifiedSearchSearchCursorBuilder> {
  factory CoreUnifiedSearchSearchCursor([final void Function(CoreUnifiedSearchSearchCursorBuilder)? b]) =
      _$CoreUnifiedSearchSearchCursor;

  // coverage:ignore-start
  const CoreUnifiedSearchSearchCursor._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchSearchCursor.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  String? get string;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreUnifiedSearchSearchCursor> get serializer => _$CoreUnifiedSearchSearchCursorSerializer();
}

class _$CoreUnifiedSearchSearchCursorSerializer implements PrimitiveSerializer<CoreUnifiedSearchSearchCursor> {
  @override
  final Iterable<Type> types = const [CoreUnifiedSearchSearchCursor, _$CoreUnifiedSearchSearchCursor];

  @override
  final String wireName = 'CoreUnifiedSearchSearchCursor';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreUnifiedSearchSearchCursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreUnifiedSearchSearchCursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreUnifiedSearchSearchCursorBuilder()..data = JsonObject(data);
    try {
      result._$int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    try {
      result._string = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchResultEntryInterface {
  String get thumbnailUrl;
  String get title;
  String get subline;
  String get resourceUrl;
  String get icon;
  bool get rounded;
  BuiltList<String> get attributes;
  CoreUnifiedSearchResultEntryInterface rebuild(
    final void Function(CoreUnifiedSearchResultEntryInterfaceBuilder) updates,
  );
  CoreUnifiedSearchResultEntryInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchResultEntry
    implements
        CoreUnifiedSearchResultEntryInterface,
        Built<CoreUnifiedSearchResultEntry, CoreUnifiedSearchResultEntryBuilder> {
  factory CoreUnifiedSearchResultEntry([final void Function(CoreUnifiedSearchResultEntryBuilder)? b]) =
      _$CoreUnifiedSearchResultEntry;

  // coverage:ignore-start
  const CoreUnifiedSearchResultEntry._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchResultEntry.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchResultEntry> get serializer => _$coreUnifiedSearchResultEntrySerializer;
}

abstract class CoreUnifiedSearchResult_Cursor
    implements Built<CoreUnifiedSearchResult_Cursor, CoreUnifiedSearchResult_CursorBuilder> {
  factory CoreUnifiedSearchResult_Cursor([final void Function(CoreUnifiedSearchResult_CursorBuilder)? b]) =
      _$CoreUnifiedSearchResult_Cursor;

  // coverage:ignore-start
  const CoreUnifiedSearchResult_Cursor._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchResult_Cursor.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  String? get string;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreUnifiedSearchResult_Cursor> get serializer => _$CoreUnifiedSearchResult_CursorSerializer();
}

class _$CoreUnifiedSearchResult_CursorSerializer implements PrimitiveSerializer<CoreUnifiedSearchResult_Cursor> {
  @override
  final Iterable<Type> types = const [CoreUnifiedSearchResult_Cursor, _$CoreUnifiedSearchResult_Cursor];

  @override
  final String wireName = 'CoreUnifiedSearchResult_Cursor';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreUnifiedSearchResult_Cursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreUnifiedSearchResult_Cursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreUnifiedSearchResult_CursorBuilder()..data = JsonObject(data);
    try {
      result._$int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    try {
      result._string = _jsonSerializers.deserialize(data, specifiedType: const FullType(String))! as String;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchResultInterface {
  String get name;
  bool get isPaginated;
  BuiltList<CoreUnifiedSearchResultEntry> get entries;
  CoreUnifiedSearchResult_Cursor? get cursor;
  CoreUnifiedSearchResultInterface rebuild(final void Function(CoreUnifiedSearchResultInterfaceBuilder) updates);
  CoreUnifiedSearchResultInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchResult
    implements CoreUnifiedSearchResultInterface, Built<CoreUnifiedSearchResult, CoreUnifiedSearchResultBuilder> {
  factory CoreUnifiedSearchResult([final void Function(CoreUnifiedSearchResultBuilder)? b]) = _$CoreUnifiedSearchResult;

  // coverage:ignore-start
  const CoreUnifiedSearchResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchResult> get serializer => _$coreUnifiedSearchResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchSearchResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreUnifiedSearchResult get data;
  CoreUnifiedSearchSearchResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreUnifiedSearchSearchResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreUnifiedSearchSearchResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchSearchResponseApplicationJson_Ocs
    implements
        CoreUnifiedSearchSearchResponseApplicationJson_OcsInterface,
        Built<CoreUnifiedSearchSearchResponseApplicationJson_Ocs,
            CoreUnifiedSearchSearchResponseApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchSearchResponseApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchSearchResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchSearchResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreUnifiedSearchSearchResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchSearchResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchSearchResponseApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchSearchResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreUnifiedSearchSearchResponseApplicationJsonInterface {
  CoreUnifiedSearchSearchResponseApplicationJson_Ocs get ocs;
  CoreUnifiedSearchSearchResponseApplicationJsonInterface rebuild(
    final void Function(CoreUnifiedSearchSearchResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreUnifiedSearchSearchResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreUnifiedSearchSearchResponseApplicationJson
    implements
        CoreUnifiedSearchSearchResponseApplicationJsonInterface,
        Built<CoreUnifiedSearchSearchResponseApplicationJson, CoreUnifiedSearchSearchResponseApplicationJsonBuilder> {
  factory CoreUnifiedSearchSearchResponseApplicationJson([
    final void Function(CoreUnifiedSearchSearchResponseApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchSearchResponseApplicationJson;

  // coverage:ignore-start
  const CoreUnifiedSearchSearchResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchSearchResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreUnifiedSearchSearchResponseApplicationJson> get serializer =>
      _$coreUnifiedSearchSearchResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface {
  BuiltList<String> get regular;
  BuiltList<String> get admin;
  CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface rebuild(
    final void Function(CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterfaceBuilder) updates,
  );
  CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew
    implements
        CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewInterface,
        Built<CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew,
            CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder> {
  factory CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew([
    final void Function(CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNewBuilder)? b,
  ]) = _$CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew;

  // coverage:ignore-start
  const CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew> get serializer =>
      _$coreWhatsNewGetResponseApplicationJsonOcsDataWhatsNewSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewGetResponseApplicationJson_Ocs_DataInterface {
  String get changelogURL;
  String get product;
  String get version;
  CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew? get whatsNew;
  CoreWhatsNewGetResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(CoreWhatsNewGetResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  CoreWhatsNewGetResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewGetResponseApplicationJson_Ocs_Data
    implements
        CoreWhatsNewGetResponseApplicationJson_Ocs_DataInterface,
        Built<CoreWhatsNewGetResponseApplicationJson_Ocs_Data, CoreWhatsNewGetResponseApplicationJson_Ocs_DataBuilder> {
  factory CoreWhatsNewGetResponseApplicationJson_Ocs_Data([
    final void Function(CoreWhatsNewGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreWhatsNewGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreWhatsNewGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$coreWhatsNewGetResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewGetResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  CoreWhatsNewGetResponseApplicationJson_Ocs_Data get data;
  CoreWhatsNewGetResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreWhatsNewGetResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreWhatsNewGetResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewGetResponseApplicationJson_Ocs
    implements
        CoreWhatsNewGetResponseApplicationJson_OcsInterface,
        Built<CoreWhatsNewGetResponseApplicationJson_Ocs, CoreWhatsNewGetResponseApplicationJson_OcsBuilder> {
  factory CoreWhatsNewGetResponseApplicationJson_Ocs([
    final void Function(CoreWhatsNewGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreWhatsNewGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreWhatsNewGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewGetResponseApplicationJson_Ocs> get serializer =>
      _$coreWhatsNewGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewGetResponseApplicationJsonInterface {
  CoreWhatsNewGetResponseApplicationJson_Ocs get ocs;
  CoreWhatsNewGetResponseApplicationJsonInterface rebuild(
    final void Function(CoreWhatsNewGetResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreWhatsNewGetResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewGetResponseApplicationJson
    implements
        CoreWhatsNewGetResponseApplicationJsonInterface,
        Built<CoreWhatsNewGetResponseApplicationJson, CoreWhatsNewGetResponseApplicationJsonBuilder> {
  factory CoreWhatsNewGetResponseApplicationJson([
    final void Function(CoreWhatsNewGetResponseApplicationJsonBuilder)? b,
  ]) = _$CoreWhatsNewGetResponseApplicationJson;

  // coverage:ignore-start
  const CoreWhatsNewGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewGetResponseApplicationJson> get serializer =>
      _$coreWhatsNewGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewDismissResponseApplicationJson_OcsInterface {
  CoreOCSMeta get meta;
  JsonObject get data;
  CoreWhatsNewDismissResponseApplicationJson_OcsInterface rebuild(
    final void Function(CoreWhatsNewDismissResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  CoreWhatsNewDismissResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewDismissResponseApplicationJson_Ocs
    implements
        CoreWhatsNewDismissResponseApplicationJson_OcsInterface,
        Built<CoreWhatsNewDismissResponseApplicationJson_Ocs, CoreWhatsNewDismissResponseApplicationJson_OcsBuilder> {
  factory CoreWhatsNewDismissResponseApplicationJson_Ocs([
    final void Function(CoreWhatsNewDismissResponseApplicationJson_OcsBuilder)? b,
  ]) = _$CoreWhatsNewDismissResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreWhatsNewDismissResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewDismissResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewDismissResponseApplicationJson_Ocs> get serializer =>
      _$coreWhatsNewDismissResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWhatsNewDismissResponseApplicationJsonInterface {
  CoreWhatsNewDismissResponseApplicationJson_Ocs get ocs;
  CoreWhatsNewDismissResponseApplicationJsonInterface rebuild(
    final void Function(CoreWhatsNewDismissResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreWhatsNewDismissResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreWhatsNewDismissResponseApplicationJson
    implements
        CoreWhatsNewDismissResponseApplicationJsonInterface,
        Built<CoreWhatsNewDismissResponseApplicationJson, CoreWhatsNewDismissResponseApplicationJsonBuilder> {
  factory CoreWhatsNewDismissResponseApplicationJson([
    final void Function(CoreWhatsNewDismissResponseApplicationJsonBuilder)? b,
  ]) = _$CoreWhatsNewDismissResponseApplicationJson;

  // coverage:ignore-start
  const CoreWhatsNewDismissResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewDismissResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWhatsNewDismissResponseApplicationJson> get serializer =>
      _$coreWhatsNewDismissResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class CoreWipeCheckWipeResponseApplicationJsonInterface {
  bool get wipe;
  CoreWipeCheckWipeResponseApplicationJsonInterface rebuild(
    final void Function(CoreWipeCheckWipeResponseApplicationJsonInterfaceBuilder) updates,
  );
  CoreWipeCheckWipeResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class CoreWipeCheckWipeResponseApplicationJson
    implements
        CoreWipeCheckWipeResponseApplicationJsonInterface,
        Built<CoreWipeCheckWipeResponseApplicationJson, CoreWipeCheckWipeResponseApplicationJsonBuilder> {
  factory CoreWipeCheckWipeResponseApplicationJson([
    final void Function(CoreWipeCheckWipeResponseApplicationJsonBuilder)? b,
  ]) = _$CoreWipeCheckWipeResponseApplicationJson;

  // coverage:ignore-start
  const CoreWipeCheckWipeResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWipeCheckWipeResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<CoreWipeCheckWipeResponseApplicationJson> get serializer =>
      _$coreWipeCheckWipeResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(CoreStatus), CoreStatus.new)
      ..add(CoreStatus.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponseApplicationJson),
        CoreAppPasswordGetAppPasswordResponseApplicationJson.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs),
        CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreOCSMeta), CoreOCSMeta.new)
      ..add(CoreOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data),
        CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponseApplicationJson),
        CoreAppPasswordRotateAppPasswordResponseApplicationJson.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs),
        CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data),
        CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordDeleteAppPasswordResponseApplicationJson),
        CoreAppPasswordDeleteAppPasswordResponseApplicationJson.new,
      )
      ..add(CoreAppPasswordDeleteAppPasswordResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs),
        CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordDeleteAppPasswordResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(CoreAutoCompleteGetResponseApplicationJson),
        CoreAutoCompleteGetResponseApplicationJson.new,
      )
      ..add(CoreAutoCompleteGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAutoCompleteGetResponseApplicationJson_Ocs),
        CoreAutoCompleteGetResponseApplicationJson_Ocs.new,
      )
      ..add(CoreAutoCompleteGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreAutocompleteResult), CoreAutocompleteResult.new)
      ..add(CoreAutocompleteResult.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreAutocompleteResult)]),
        ListBuilder<CoreAutocompleteResult>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreAvatarAvatarGetAvatarDarkHeaders),
        CoreAvatarAvatarGetAvatarDarkHeaders.new,
      )
      ..add(CoreAvatarAvatarGetAvatarDarkHeaders.serializer)
      ..addBuilderFactory(const FullType(CoreAvatarAvatarGetAvatarHeaders), CoreAvatarAvatarGetAvatarHeaders.new)
      ..add(CoreAvatarAvatarGetAvatarHeaders.serializer)
      ..addBuilderFactory(const FullType(CoreLoginFlowV2Credentials), CoreLoginFlowV2Credentials.new)
      ..add(CoreLoginFlowV2Credentials.serializer)
      ..addBuilderFactory(const FullType(CoreLoginFlowV2), CoreLoginFlowV2.new)
      ..add(CoreLoginFlowV2.serializer)
      ..addBuilderFactory(const FullType(CoreLoginFlowV2_Poll), CoreLoginFlowV2_Poll.new)
      ..add(CoreLoginFlowV2_Poll.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson),
        CoreCollaborationResourcesSearchCollectionsResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs),
        CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesSearchCollectionsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreCollection), CoreCollection.new)
      ..add(CoreCollection.serializer)
      ..addBuilderFactory(const FullType(CoreResource), CoreResource.new)
      ..add(CoreResource.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(const FullType(CoreOpenGraphObject), CoreOpenGraphObject.new)
      ..add(CoreOpenGraphObject.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(CoreResource)]), ListBuilder<CoreResource>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(CoreCollection)]), ListBuilder<CoreCollection>.new)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesListCollectionResponseApplicationJson),
        CoreCollaborationResourcesListCollectionResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesListCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs),
        CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesListCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRenameCollectionResponseApplicationJson),
        CoreCollaborationResourcesRenameCollectionResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesRenameCollectionResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs),
        CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesRenameCollectionResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesAddResourceResponseApplicationJson),
        CoreCollaborationResourcesAddResourceResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesAddResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs),
        CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesAddResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRemoveResourceResponseApplicationJson),
        CoreCollaborationResourcesRemoveResourceResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesRemoveResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs),
        CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesRemoveResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson),
        CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs),
        CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesGetCollectionsByResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson),
        CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs),
        CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesCreateCollectionOnResourceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponseApplicationJson),
        CoreHoverCardGetUserResponseApplicationJson.new,
      )
      ..add(CoreHoverCardGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponseApplicationJson_Ocs),
        CoreHoverCardGetUserResponseApplicationJson_Ocs.new,
      )
      ..add(CoreHoverCardGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponseApplicationJson_Ocs_Data),
        CoreHoverCardGetUserResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreHoverCardGetUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreContactsAction), CoreContactsAction.new)
      ..add(CoreContactsAction.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreContactsAction)]),
        ListBuilder<CoreContactsAction>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreNavigationGetAppsNavigationResponseApplicationJson),
        CoreNavigationGetAppsNavigationResponseApplicationJson.new,
      )
      ..add(CoreNavigationGetAppsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs),
        CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs.new,
      )
      ..add(CoreNavigationGetAppsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreNavigationEntry), CoreNavigationEntry.new)
      ..add(CoreNavigationEntry.serializer)
      ..addBuilderFactory(const FullType(CoreNavigationEntry_Order), CoreNavigationEntry_Order.new)
      ..add(CoreNavigationEntry_Order.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreNavigationEntry)]),
        ListBuilder<CoreNavigationEntry>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreNavigationGetSettingsNavigationResponseApplicationJson),
        CoreNavigationGetSettingsNavigationResponseApplicationJson.new,
      )
      ..add(CoreNavigationGetSettingsNavigationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs),
        CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs.new,
      )
      ..add(CoreNavigationGetSettingsNavigationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreOcmOcmDiscoveryHeaders), CoreOcmOcmDiscoveryHeaders.new)
      ..add(CoreOcmOcmDiscoveryHeaders.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcmDiscoveryResponseApplicationJson),
        CoreOcmDiscoveryResponseApplicationJson.new,
      )
      ..add(CoreOcmDiscoveryResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes),
        CoreOcmDiscoveryResponseApplicationJson_ResourceTypes.new,
      )
      ..add(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols),
        CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.new,
      )
      ..add(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes_Protocols.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreOcmDiscoveryResponseApplicationJson_ResourceTypes)]),
        ListBuilder<CoreOcmDiscoveryResponseApplicationJson_ResourceTypes>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponseApplicationJson),
        CoreOcsGetCapabilitiesResponseApplicationJson.new,
      )
      ..add(CoreOcsGetCapabilitiesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs),
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs.new,
      )
      ..add(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data),
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version),
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.new,
      )
      ..add(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Version.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities),
        CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.new,
      )
      ..add(CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data_Capabilities.serializer)
      ..addBuilderFactory(const FullType(CoreCommentsCapabilities), CoreCommentsCapabilities.new)
      ..add(CoreCommentsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreCommentsCapabilities_Files), CoreCommentsCapabilities_Files.new)
      ..add(CoreCommentsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(CoreDavCapabilities), CoreDavCapabilities.new)
      ..add(CoreDavCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreDavCapabilities_Dav), CoreDavCapabilities_Dav.new)
      ..add(CoreDavCapabilities_Dav.serializer)
      ..addBuilderFactory(const FullType(CoreFilesCapabilities), CoreFilesCapabilities.new)
      ..add(CoreFilesCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreFilesCapabilities_Files), CoreFilesCapabilities_Files.new)
      ..add(CoreFilesCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(
        const FullType(CoreFilesCapabilities_Files_DirectEditing),
        CoreFilesCapabilities_Files_DirectEditing.new,
      )
      ..add(CoreFilesCapabilities_Files_DirectEditing.serializer)
      ..addBuilderFactory(const FullType(CoreFilesSharingCapabilities), CoreFilesSharingCapabilities.new)
      ..add(CoreFilesSharingCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing),
        CoreFilesSharingCapabilities_FilesSharing.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Public),
        CoreFilesSharingCapabilities_FilesSharing_Public.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Public.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Public_Password),
        CoreFilesSharingCapabilities_FilesSharing_Public_Password.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Public_Password.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate),
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal),
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote),
        CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_User),
        CoreFilesSharingCapabilities_FilesSharing_User.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_User.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate),
        CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Group),
        CoreFilesSharingCapabilities_FilesSharing_Group.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Group.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate),
        CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Federation),
        CoreFilesSharingCapabilities_FilesSharing_Federation.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Federation.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate),
        CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported),
        CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..addBuilderFactory(
        const FullType(CoreFilesSharingCapabilities_FilesSharing_Sharee),
        CoreFilesSharingCapabilities_FilesSharing_Sharee.new,
      )
      ..add(CoreFilesSharingCapabilities_FilesSharing_Sharee.serializer)
      ..addBuilderFactory(const FullType(CoreFilesTrashbinCapabilities), CoreFilesTrashbinCapabilities.new)
      ..add(CoreFilesTrashbinCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreFilesTrashbinCapabilities_Files), CoreFilesTrashbinCapabilities_Files.new)
      ..add(CoreFilesTrashbinCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(CoreFilesVersionsCapabilities), CoreFilesVersionsCapabilities.new)
      ..add(CoreFilesVersionsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreFilesVersionsCapabilities_Files), CoreFilesVersionsCapabilities_Files.new)
      ..add(CoreFilesVersionsCapabilities_Files.serializer)
      ..addBuilderFactory(const FullType(CoreNotesCapabilities), CoreNotesCapabilities.new)
      ..add(CoreNotesCapabilities.serializer)
      ..addBuilderFactory(const FullType(CoreNotesCapabilities_Notes), CoreNotesCapabilities_Notes.new)
      ..add(CoreNotesCapabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(CoreNotificationsCapabilities), CoreNotificationsCapabilities.new)
      ..add(CoreNotificationsCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreNotificationsCapabilities_Notifications),
        CoreNotificationsCapabilities_Notifications.new,
      )
      ..add(CoreNotificationsCapabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(CoreProvisioningApiCapabilities), CoreProvisioningApiCapabilities.new)
      ..add(CoreProvisioningApiCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreProvisioningApiCapabilities_ProvisioningApi),
        CoreProvisioningApiCapabilities_ProvisioningApi.new,
      )
      ..add(CoreProvisioningApiCapabilities_ProvisioningApi.serializer)
      ..addBuilderFactory(const FullType(CoreSharebymailCapabilities), CoreSharebymailCapabilities.new)
      ..add(CoreSharebymailCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreSharebymailCapabilities_FilesSharing),
        CoreSharebymailCapabilities_FilesSharing.new,
      )
      ..add(CoreSharebymailCapabilities_FilesSharing.serializer)
      ..addBuilderFactory(
        const FullType(CoreSharebymailCapabilities_FilesSharing_Sharebymail),
        CoreSharebymailCapabilities_FilesSharing_Sharebymail.new,
      )
      ..add(CoreSharebymailCapabilities_FilesSharing_Sharebymail.serializer)
      ..addBuilderFactory(
        const FullType(CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop),
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.new,
      )
      ..add(CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..addBuilderFactory(
        const FullType(CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password),
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password.new,
      )
      ..add(CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password.serializer)
      ..addBuilderFactory(
        const FullType(CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate),
        CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.new,
      )
      ..add(CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(CoreThemingPublicCapabilities), CoreThemingPublicCapabilities.new)
      ..add(CoreThemingPublicCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreThemingPublicCapabilities_Theming),
        CoreThemingPublicCapabilities_Theming.new,
      )
      ..add(CoreThemingPublicCapabilities_Theming.serializer)
      ..addBuilderFactory(const FullType(CoreUserStatusCapabilities), CoreUserStatusCapabilities.new)
      ..add(CoreUserStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreUserStatusCapabilities_UserStatus),
        CoreUserStatusCapabilities_UserStatus.new,
      )
      ..add(CoreUserStatusCapabilities_UserStatus.serializer)
      ..addBuilderFactory(const FullType(CoreWeatherStatusCapabilities), CoreWeatherStatusCapabilities.new)
      ..add(CoreWeatherStatusCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(CoreWeatherStatusCapabilities_WeatherStatus),
        CoreWeatherStatusCapabilities_WeatherStatus.new,
      )
      ..add(CoreWeatherStatusCapabilities_WeatherStatus.serializer)
      ..addBuilderFactory(
        const FullType(CoreProfileApiSetVisibilityResponseApplicationJson),
        CoreProfileApiSetVisibilityResponseApplicationJson.new,
      )
      ..add(CoreProfileApiSetVisibilityResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreProfileApiSetVisibilityResponseApplicationJson_Ocs),
        CoreProfileApiSetVisibilityResponseApplicationJson_Ocs.new,
      )
      ..add(CoreProfileApiSetVisibilityResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponseApplicationJson),
        CoreReferenceApiResolveOneResponseApplicationJson.new,
      )
      ..add(CoreReferenceApiResolveOneResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponseApplicationJson_Ocs),
        CoreReferenceApiResolveOneResponseApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiResolveOneResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data),
        CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiResolveOneResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreReference), CoreReference.new)
      ..add(CoreReference.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(CoreReference)]),
        MapBuilder<String, CoreReference>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponseApplicationJson),
        CoreReferenceApiResolveResponseApplicationJson.new,
      )
      ..add(CoreReferenceApiResolveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponseApplicationJson_Ocs),
        CoreReferenceApiResolveResponseApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiResolveResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponseApplicationJson_Ocs_Data),
        CoreReferenceApiResolveResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiResolveResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponseApplicationJson),
        CoreReferenceApiExtractResponseApplicationJson.new,
      )
      ..add(CoreReferenceApiExtractResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponseApplicationJson_Ocs),
        CoreReferenceApiExtractResponseApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiExtractResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponseApplicationJson_Ocs_Data),
        CoreReferenceApiExtractResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiExtractResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiGetProvidersInfoResponseApplicationJson),
        CoreReferenceApiGetProvidersInfoResponseApplicationJson.new,
      )
      ..add(CoreReferenceApiGetProvidersInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs),
        CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiGetProvidersInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreReferenceProvider), CoreReferenceProvider.new)
      ..add(CoreReferenceProvider.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreReferenceProvider)]),
        ListBuilder<CoreReferenceProvider>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponseApplicationJson),
        CoreReferenceApiTouchProviderResponseApplicationJson.new,
      )
      ..add(CoreReferenceApiTouchProviderResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs),
        CoreReferenceApiTouchProviderResponseApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data),
        CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiTouchProviderResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson),
        CoreTextProcessingApiTaskTypesResponseApplicationJson.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs),
        CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data),
        CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types),
        CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types)]),
        ListBuilder<CoreTextProcessingApiTaskTypesResponseApplicationJson_Ocs_Data_Types>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponseApplicationJson),
        CoreTextProcessingApiScheduleResponseApplicationJson.new,
      )
      ..add(CoreTextProcessingApiScheduleResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs),
        CoreTextProcessingApiScheduleResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data),
        CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiScheduleResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreTextProcessingTask), CoreTextProcessingTask.new)
      ..add(CoreTextProcessingTask.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponseApplicationJson),
        CoreTextProcessingApiGetTaskResponseApplicationJson.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs),
        CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data),
        CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponseApplicationJson),
        CoreTextProcessingApiDeleteTaskResponseApplicationJson.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs),
        CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data),
        CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponseApplicationJson),
        CoreTextProcessingApiListTasksByAppResponseApplicationJson.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs),
        CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data),
        CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTextProcessingTask)]),
        ListBuilder<CoreTextProcessingTask>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponseApplicationJson),
        CoreTranslationApiLanguagesResponseApplicationJson.new,
      )
      ..add(CoreTranslationApiLanguagesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponseApplicationJson_Ocs),
        CoreTranslationApiLanguagesResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTranslationApiLanguagesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data),
        CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages),
        CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.new,
      )
      ..add(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages)]),
        ListBuilder<CoreTranslationApiLanguagesResponseApplicationJson_Ocs_Data_Languages>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponseApplicationJson),
        CoreTranslationApiTranslateResponseApplicationJson.new,
      )
      ..add(CoreTranslationApiTranslateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponseApplicationJson_Ocs),
        CoreTranslationApiTranslateResponseApplicationJson_Ocs.new,
      )
      ..add(CoreTranslationApiTranslateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data),
        CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTranslationApiTranslateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchGetProvidersResponseApplicationJson),
        CoreUnifiedSearchGetProvidersResponseApplicationJson.new,
      )
      ..add(CoreUnifiedSearchGetProvidersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs),
        CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs.new,
      )
      ..add(CoreUnifiedSearchGetProvidersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreUnifiedSearchProvider), CoreUnifiedSearchProvider.new)
      ..add(CoreUnifiedSearchProvider.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreUnifiedSearchProvider)]),
        ListBuilder<CoreUnifiedSearchProvider>.new,
      )
      ..addBuilderFactory(const FullType(CoreUnifiedSearchSearchCursor), CoreUnifiedSearchSearchCursor.new)
      ..add(CoreUnifiedSearchSearchCursor.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(CoreUnifiedSearchSearchCursor)]),
        ContentString<CoreUnifiedSearchSearchCursor>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchSearchResponseApplicationJson),
        CoreUnifiedSearchSearchResponseApplicationJson.new,
      )
      ..add(CoreUnifiedSearchSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchSearchResponseApplicationJson_Ocs),
        CoreUnifiedSearchSearchResponseApplicationJson_Ocs.new,
      )
      ..add(CoreUnifiedSearchSearchResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreUnifiedSearchResult), CoreUnifiedSearchResult.new)
      ..add(CoreUnifiedSearchResult.serializer)
      ..addBuilderFactory(const FullType(CoreUnifiedSearchResultEntry), CoreUnifiedSearchResultEntry.new)
      ..add(CoreUnifiedSearchResultEntry.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreUnifiedSearchResultEntry)]),
        ListBuilder<CoreUnifiedSearchResultEntry>.new,
      )
      ..addBuilderFactory(const FullType(CoreUnifiedSearchResult_Cursor), CoreUnifiedSearchResult_Cursor.new)
      ..add(CoreUnifiedSearchResult_Cursor.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponseApplicationJson),
        CoreWhatsNewGetResponseApplicationJson.new,
      )
      ..add(CoreWhatsNewGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponseApplicationJson_Ocs),
        CoreWhatsNewGetResponseApplicationJson_Ocs.new,
      )
      ..add(CoreWhatsNewGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponseApplicationJson_Ocs_Data),
        CoreWhatsNewGetResponseApplicationJson_Ocs_Data.new,
      )
      ..add(CoreWhatsNewGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew),
        CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.new,
      )
      ..add(CoreWhatsNewGetResponseApplicationJson_Ocs_Data_WhatsNew.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewDismissResponseApplicationJson),
        CoreWhatsNewDismissResponseApplicationJson.new,
      )
      ..add(CoreWhatsNewDismissResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewDismissResponseApplicationJson_Ocs),
        CoreWhatsNewDismissResponseApplicationJson_Ocs.new,
      )
      ..add(CoreWhatsNewDismissResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreWipeCheckWipeResponseApplicationJson),
        CoreWipeCheckWipeResponseApplicationJson.new,
      )
      ..add(CoreWipeCheckWipeResponseApplicationJson.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
