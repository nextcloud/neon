// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'core.openapi.g.dart';

class CoreResponse<T, U> extends DynamiteResponse<T, U> {
  CoreResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'CoreResponse(data: $data, headers: $headers)';
}

class CoreApiException extends DynamiteApiException {
  CoreApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<CoreApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return CoreApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'CoreApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

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
  Future<CoreStatus> getStatus() async {
    const path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreStatus))!
          as CoreStatus;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreAppPasswordClient {
  CoreAppPasswordClient(this._rootClient);

  final CoreClient _rootClient;

  /// Create app password
  Future<CoreAppPasswordGetAppPasswordResponse200ApplicationJson> getAppPassword({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/getapppassword';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreAppPasswordGetAppPasswordResponse200ApplicationJson),
      )! as CoreAppPasswordGetAppPasswordResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Rotate app password
  Future<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson> rotateAppPassword({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/apppassword/rotate';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson),
      )! as CoreAppPasswordRotateAppPasswordResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete app password
  Future<CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson> deleteAppPassword({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/apppassword';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson),
      )! as CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreAutoCompleteClient {
  CoreAutoCompleteClient(this._rootClient);

  final CoreClient _rootClient;

  /// Autocomplete a query
  Future<CoreAutoCompleteGetResponse200ApplicationJson> $get({
    required final String search,
    final String? itemType,
    final String? itemId,
    final String? sorter,
    final List<int>? shareTypes,
    final int limit = 10,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/autocomplete/get';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreAutoCompleteGetResponse200ApplicationJson),
      )! as CoreAutoCompleteGetResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

/// Class AvatarController
class CoreAvatarClient {
  CoreAvatarClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the dark avatar
  Future<CoreResponse<Uint8List, CoreAvatarAvatarGetAvatarDarkHeaders>> getAvatarDark({
    required final String userId,
    required final int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}/dark';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreResponse<Uint8List, CoreAvatarAvatarGetAvatarDarkHeaders>(
        await response.bodyBytes,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(CoreAvatarAvatarGetAvatarDarkHeaders),
        )! as CoreAvatarAvatarGetAvatarDarkHeaders,
      );
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the avatar
  Future<CoreResponse<Uint8List, CoreAvatarAvatarGetAvatarHeaders>> getAvatar({
    required final String userId,
    required final int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreResponse<Uint8List, CoreAvatarAvatarGetAvatarHeaders>(
        await response.bodyBytes,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(CoreAvatarAvatarGetAvatarHeaders),
        )! as CoreAvatarAvatarGetAvatarHeaders,
      );
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreClientFlowLoginV2Client {
  CoreClientFlowLoginV2Client(this._rootClient);

  final CoreClient _rootClient;

  /// Poll the login flow credentials
  Future<CoreLoginFlowV2Credentials> poll({required final String token}) async {
    const path = '/index.php/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    queryParameters['token'] = token;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreLoginFlowV2Credentials),
      )! as CoreLoginFlowV2Credentials;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Init a login flow
  Future<CoreLoginFlowV2> init() async {
    const path = '/index.php/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreLoginFlowV2))!
          as CoreLoginFlowV2;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreCollaborationResourcesClient {
  CoreCollaborationResourcesClient(this._rootClient);

  final CoreClient _rootClient;

  /// Search for collections
  Future<CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson> searchCollections({
    required final String filter,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/collections/search/{filter}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{filter}', Uri.encodeQueryComponent(filter));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson),
      )! as CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a collection
  Future<CoreCollaborationResourcesListCollectionResponse200ApplicationJson> listCollection({
    required final int collectionId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesListCollectionResponse200ApplicationJson),
      )! as CoreCollaborationResourcesListCollectionResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Rename a collection
  Future<CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson> renameCollection({
    required final String collectionName,
    required final int collectionId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['collectionName'] = collectionName;
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson),
      )! as CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Add a resource to a collection
  Future<CoreCollaborationResourcesAddResourceResponse200ApplicationJson> addResource({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesAddResourceResponse200ApplicationJson),
      )! as CoreCollaborationResourcesAddResourceResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a resource from a collection
  Future<CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson> removeResource({
    required final String resourceType,
    required final String resourceId,
    required final int collectionId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/collections/{collectionId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['resourceType'] = resourceType;
    queryParameters['resourceId'] = resourceId;
    path = path.replaceAll('{collectionId}', Uri.encodeQueryComponent(collectionId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson),
      )! as CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get collections by resource
  Future<CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson> getCollectionsByResource({
    required final String resourceType,
    required final String resourceId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/{resourceType}/{resourceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{resourceType}', Uri.encodeQueryComponent(resourceType));
    path = path.replaceAll('{resourceId}', Uri.encodeQueryComponent(resourceId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson),
      )! as CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a collection for a resource
  Future<CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson> createCollectionOnResource({
    required final String name,
    required final String baseResourceType,
    required final String baseResourceId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/collaboration/resources/{baseResourceType}/{baseResourceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['name'] = name;
    path = path.replaceAll('{baseResourceType}', Uri.encodeQueryComponent(baseResourceType));
    path = path.replaceAll('{baseResourceId}', Uri.encodeQueryComponent(baseResourceId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson),
      )! as CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

/// This controller handles guest avatar requests.
class CoreGuestAvatarClient {
  CoreGuestAvatarClient(this._rootClient);

  final CoreClient _rootClient;

  /// Returns a dark guest avatar image response
  Future<Uint8List> getAvatarDark({
    required final String guestName,
    required final String size,
  }) async {
    var path = '/index.php/avatar/guest/{guestName}/{size}/dark';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{guestName}', Uri.encodeQueryComponent(guestName));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Returns a guest avatar image response
  Future<Uint8List> getAvatar({
    required final String guestName,
    required final String size,
    final int? darkTheme = 0,
  }) async {
    var path = '/index.php/avatar/guest/{guestName}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreHoverCardClient {
  CoreHoverCardClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the user details for a hovercard
  Future<CoreHoverCardGetUserResponse200ApplicationJson> getUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/hovercard/v1/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreHoverCardGetUserResponse200ApplicationJson),
      )! as CoreHoverCardGetUserResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreNavigationClient {
  CoreNavigationClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the apps navigation
  Future<CoreNavigationGetAppsNavigationResponse200ApplicationJson> getAppsNavigation({
    final int absolute = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreNavigationGetAppsNavigationResponse200ApplicationJson),
      )! as CoreNavigationGetAppsNavigationResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the settings navigation
  Future<CoreNavigationGetSettingsNavigationResponse200ApplicationJson> getSettingsNavigation({
    final int absolute = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/navigation/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (absolute != 0) {
      queryParameters['absolute'] = absolute.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreNavigationGetSettingsNavigationResponse200ApplicationJson),
      )! as CoreNavigationGetSettingsNavigationResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreOcsClient {
  CoreOcsClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the capabilities
  Future<CoreOcsGetCapabilitiesResponse200ApplicationJson> getCapabilities({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson),
      )! as CoreOcsGetCapabilitiesResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CorePreviewClient {
  CorePreviewClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get a preview by file ID
  Future<Uint8List> getPreviewByFileId({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) async {
    const path = '/index.php/core/preview';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a preview by file path
  Future<Uint8List> getPreview({
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
    final int mimeFallback = 0,
  }) async {
    const path = '/index.php/core/preview.png';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreProfileApiClient {
  CoreProfileApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Update the visiblity of a parameter
  Future<CoreProfileApiSetVisibilityResponse200ApplicationJson> setVisibility({
    required final String paramId,
    required final String visibility,
    required final String targetUserId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/profile/{targetUserId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['paramId'] = paramId;
    queryParameters['visibility'] = visibility;
    path = path.replaceAll('{targetUserId}', Uri.encodeQueryComponent(targetUserId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreProfileApiSetVisibilityResponse200ApplicationJson),
      )! as CoreProfileApiSetVisibilityResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreReferenceClient {
  CoreReferenceClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get a preview for a reference
  Future<Uint8List> preview({required final String referenceId}) async {
    var path = '/index.php/core/references/preview/{referenceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{referenceId}', Uri.encodeQueryComponent(referenceId));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreReferenceApiClient {
  CoreReferenceApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Resolve a reference
  Future<CoreReferenceApiResolveOneResponse200ApplicationJson> resolveOne({
    required final String reference,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/references/resolve';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['reference'] = reference;
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreReferenceApiResolveOneResponse200ApplicationJson),
      )! as CoreReferenceApiResolveOneResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Resolve multiple references
  Future<CoreReferenceApiResolveResponse200ApplicationJson> resolve({
    required final List<String> references,
    final int limit = 1,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/references/resolve';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['references[]'] = references.map((final e) => e);
    if (limit != 1) {
      queryParameters['limit'] = limit.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreReferenceApiResolveResponse200ApplicationJson),
      )! as CoreReferenceApiResolveResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Extract references from a text
  Future<CoreReferenceApiExtractResponse200ApplicationJson> extract({
    required final String text,
    final int resolve = 0,
    final int limit = 1,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/references/extract';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreReferenceApiExtractResponse200ApplicationJson),
      )! as CoreReferenceApiExtractResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the providers
  Future<CoreReferenceApiGetProvidersInfoResponse200ApplicationJson> getProvidersInfo({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/references/providers';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson),
      )! as CoreReferenceApiGetProvidersInfoResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Touch a provider
  Future<CoreReferenceApiTouchProviderResponse200ApplicationJson> touchProvider({
    required final String providerId,
    final int? timestamp,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/references/provider/{providerId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{providerId}', Uri.encodeQueryComponent(providerId));
    if (timestamp != null) {
      queryParameters['timestamp'] = timestamp.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreReferenceApiTouchProviderResponse200ApplicationJson),
      )! as CoreReferenceApiTouchProviderResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreTextProcessingApiClient {
  CoreTextProcessingApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// This endpoint returns all available LanguageModel task types
  Future<CoreTextProcessingApiTaskTypesResponse200ApplicationJson> taskTypes({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/textprocessing/tasktypes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson),
      )! as CoreTextProcessingApiTaskTypesResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// This endpoint allows scheduling a language model task
  Future<CoreTextProcessingApiScheduleResponse200ApplicationJson> schedule({
    required final String input,
    required final String type,
    required final String appId,
    final String identifier = '',
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/textprocessing/schedule';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    queryParameters['input'] = input;
    queryParameters['type'] = type;
    queryParameters['appId'] = appId;
    if (identifier != '') {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTextProcessingApiScheduleResponse200ApplicationJson),
      )! as CoreTextProcessingApiScheduleResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// This endpoint allows checking the status and results of a task. Tasks are removed 1 week after receiving their last update.
  Future<CoreTextProcessingApiGetTaskResponse200ApplicationJson> getTask({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/textprocessing/task/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTextProcessingApiGetTaskResponse200ApplicationJson),
      )! as CoreTextProcessingApiGetTaskResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// This endpoint allows to delete a scheduled task for a user
  Future<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson> deleteTask({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/textprocessing/task/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson),
      )! as CoreTextProcessingApiDeleteTaskResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// This endpoint returns a list of tasks of a user that are related with a specific appId and optionally with an identifier
  Future<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson> listTasksByApp({
    required final String appId,
    final String? identifier,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/textprocessing/tasks/app/{appId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    if (identifier != null) {
      queryParameters['identifier'] = identifier;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson),
      )! as CoreTextProcessingApiListTasksByAppResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreTranslationApiClient {
  CoreTranslationApiClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the list of supported languages
  Future<CoreTranslationApiLanguagesResponse200ApplicationJson> languages({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/translation/languages';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTranslationApiLanguagesResponse200ApplicationJson),
      )! as CoreTranslationApiLanguagesResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Translate a text
  Future<CoreTranslationApiTranslateResponse200ApplicationJson> translate({
    required final String text,
    required final String toLanguage,
    final String? fromLanguage,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/translation/translate';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    queryParameters['text'] = text;
    queryParameters['toLanguage'] = toLanguage;
    if (fromLanguage != null) {
      queryParameters['fromLanguage'] = fromLanguage;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreTranslationApiTranslateResponse200ApplicationJson),
      )! as CoreTranslationApiTranslateResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreUnifiedSearchClient {
  CoreUnifiedSearchClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the providers for unified search
  Future<CoreUnifiedSearchGetProvidersResponse200ApplicationJson> getProviders({
    final String from = '',
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/search/providers';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (from != '') {
      queryParameters['from'] = from;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreUnifiedSearchGetProvidersResponse200ApplicationJson),
      )! as CoreUnifiedSearchGetProvidersResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Search
  Future<CoreUnifiedSearchSearchResponse200ApplicationJson> search({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<CoreUnifiedSearchSearchCursor>? cursor,
    final String from = '',
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/search/providers/{providerId}/search';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
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
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreUnifiedSearchSearchResponse200ApplicationJson),
      )! as CoreUnifiedSearchSearchResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreWhatsNewClient {
  CoreWhatsNewClient(this._rootClient);

  final CoreClient _rootClient;

  /// Get the changes
  Future<CoreWhatsNewGetResponse200ApplicationJson> $get({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/core/whatsnew';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreWhatsNewGetResponse200ApplicationJson),
      )! as CoreWhatsNewGetResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Dismiss the changes
  Future<CoreWhatsNewDismissResponse200ApplicationJson> dismiss({
    required final String version,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/core/whatsnew';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['version'] = version;
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreWhatsNewDismissResponse200ApplicationJson),
      )! as CoreWhatsNewDismissResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

class CoreWipeClient {
  CoreWipeClient(this._rootClient);

  final CoreClient _rootClient;

  /// Check if the device should be wiped
  Future<CoreWipeCheckWipeResponse200ApplicationJson> checkWipe({required final String token}) async {
    const path = '/index.php/core/wipe/check';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    queryParameters['token'] = token;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreWipeCheckWipeResponse200ApplicationJson),
      )! as CoreWipeCheckWipeResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Finish the wipe
  Future<JsonObject> wipeDone({required final String token}) async {
    const path = '/index.php/core/wipe/success';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    queryParameters['token'] = token;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return JsonObject(await response.body);
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class CoreStatus implements Built<CoreStatus, CoreStatusBuilder> {
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
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
  static Serializer<CoreStatus> get serializer => _$coreStatusSerializer;
}

abstract class CoreOCSMeta implements Built<CoreOCSMeta, CoreOCSMetaBuilder> {
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
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<CoreOCSMeta> get serializer => _$coreOCSMetaSerializer;
}

abstract class CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data,
            CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get apppassword;
  static Serializer<CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreAppPasswordGetAppPasswordResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs
    implements
        Built<CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs,
            CoreAppPasswordGetAppPasswordResponse200ApplicationJson_OcsBuilder> {
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs([
    final void Function(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordGetAppPasswordResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreAppPasswordGetAppPasswordResponse200ApplicationJson
    implements
        Built<CoreAppPasswordGetAppPasswordResponse200ApplicationJson,
            CoreAppPasswordGetAppPasswordResponse200ApplicationJsonBuilder> {
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson([
    final void Function(CoreAppPasswordGetAppPasswordResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordGetAppPasswordResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordGetAppPasswordResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordGetAppPasswordResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreAppPasswordGetAppPasswordResponse200ApplicationJson> get serializer =>
      _$coreAppPasswordGetAppPasswordResponse200ApplicationJsonSerializer;
}

abstract class CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data,
            CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get apppassword;
  static Serializer<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs
    implements
        Built<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs,
            CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_OcsBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs([
    final void Function(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreAppPasswordRotateAppPasswordResponse200ApplicationJson
    implements
        Built<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson,
            CoreAppPasswordRotateAppPasswordResponse200ApplicationJsonBuilder> {
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson([
    final void Function(CoreAppPasswordRotateAppPasswordResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordRotateAppPasswordResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordRotateAppPasswordResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordRotateAppPasswordResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreAppPasswordRotateAppPasswordResponse200ApplicationJson> get serializer =>
      _$coreAppPasswordRotateAppPasswordResponse200ApplicationJsonSerializer;
}

abstract class CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs
    implements
        Built<CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs,
            CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_OcsBuilder> {
  factory CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs([
    final void Function(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  JsonObject get data;
  static Serializer<CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs> get serializer =>
      _$coreAppPasswordDeleteAppPasswordResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson
    implements
        Built<CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson,
            CoreAppPasswordDeleteAppPasswordResponse200ApplicationJsonBuilder> {
  factory CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson([
    final void Function(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson> get serializer =>
      _$coreAppPasswordDeleteAppPasswordResponse200ApplicationJsonSerializer;
}

abstract class CoreAutocompleteResult implements Built<CoreAutocompleteResult, CoreAutocompleteResultBuilder> {
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
  String get id;
  String get label;
  String get icon;
  String get source;
  String get status;
  String get subline;
  String get shareWithDisplayNameUnique;
  static Serializer<CoreAutocompleteResult> get serializer => _$coreAutocompleteResultSerializer;
}

abstract class CoreAutoCompleteGetResponse200ApplicationJson_Ocs
    implements
        Built<CoreAutoCompleteGetResponse200ApplicationJson_Ocs,
            CoreAutoCompleteGetResponse200ApplicationJson_OcsBuilder> {
  factory CoreAutoCompleteGetResponse200ApplicationJson_Ocs([
    final void Function(CoreAutoCompleteGetResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreAutoCompleteGetResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreAutoCompleteGetResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAutoCompleteGetResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreAutocompleteResult> get data;
  static Serializer<CoreAutoCompleteGetResponse200ApplicationJson_Ocs> get serializer =>
      _$coreAutoCompleteGetResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreAutoCompleteGetResponse200ApplicationJson
    implements
        Built<CoreAutoCompleteGetResponse200ApplicationJson, CoreAutoCompleteGetResponse200ApplicationJsonBuilder> {
  factory CoreAutoCompleteGetResponse200ApplicationJson([
    final void Function(CoreAutoCompleteGetResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreAutoCompleteGetResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreAutoCompleteGetResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreAutoCompleteGetResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreAutoCompleteGetResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreAutoCompleteGetResponse200ApplicationJson> get serializer =>
      _$coreAutoCompleteGetResponse200ApplicationJsonSerializer;
}

abstract class CoreAvatarAvatarGetAvatarDarkHeaders
    implements Built<CoreAvatarAvatarGetAvatarDarkHeaders, CoreAvatarAvatarGetAvatarDarkHeadersBuilder> {
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
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
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
          result.xNcIscustomavatar = int.parse(value);
      }
    }

    return result.build();
  }
}

abstract class CoreAvatarAvatarGetAvatarHeaders
    implements Built<CoreAvatarAvatarGetAvatarHeaders, CoreAvatarAvatarGetAvatarHeadersBuilder> {
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
  @BuiltValueField(wireName: 'x-nc-iscustomavatar')
  int? get xNcIscustomavatar;
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
          result.xNcIscustomavatar = int.parse(value);
      }
    }

    return result.build();
  }
}

abstract class CoreLoginFlowV2Credentials
    implements Built<CoreLoginFlowV2Credentials, CoreLoginFlowV2CredentialsBuilder> {
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
  String get server;
  String get loginName;
  String get appPassword;
  static Serializer<CoreLoginFlowV2Credentials> get serializer => _$coreLoginFlowV2CredentialsSerializer;
}

abstract class CoreLoginFlowV2_Poll implements Built<CoreLoginFlowV2_Poll, CoreLoginFlowV2_PollBuilder> {
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
  String get token;
  String get endpoint;
  static Serializer<CoreLoginFlowV2_Poll> get serializer => _$coreLoginFlowV2PollSerializer;
}

abstract class CoreLoginFlowV2 implements Built<CoreLoginFlowV2, CoreLoginFlowV2Builder> {
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
  CoreLoginFlowV2_Poll get poll;
  String get login;
  static Serializer<CoreLoginFlowV2> get serializer => _$coreLoginFlowV2Serializer;
}

abstract class CoreOpenGraphObject_OpenGraphObject
    implements Built<CoreOpenGraphObject_OpenGraphObject, CoreOpenGraphObject_OpenGraphObjectBuilder> {
  factory CoreOpenGraphObject_OpenGraphObject([final void Function(CoreOpenGraphObject_OpenGraphObjectBuilder)? b]) =
      _$CoreOpenGraphObject_OpenGraphObject;

  // coverage:ignore-start
  const CoreOpenGraphObject_OpenGraphObject._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOpenGraphObject_OpenGraphObject.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get id;
  String get name;
  String? get description;
  String? get thumb;
  String get link;
  static Serializer<CoreOpenGraphObject_OpenGraphObject> get serializer =>
      _$coreOpenGraphObjectOpenGraphObjectSerializer;
}

abstract class CoreOpenGraphObject implements Built<CoreOpenGraphObject, CoreOpenGraphObjectBuilder> {
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
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  CoreOpenGraphObject_OpenGraphObject get openGraphObject;
  bool get accessible;
  static Serializer<CoreOpenGraphObject> get serializer => _$coreOpenGraphObjectSerializer;
}

abstract class CoreCollection implements Built<CoreCollection, CoreCollectionBuilder> {
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
  int get id;
  String get name;
  BuiltList<CoreOpenGraphObject> get resources;
  static Serializer<CoreCollection> get serializer => _$coreCollectionSerializer;
}

abstract class CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreCollection> get data;
  static Serializer<CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesSearchCollectionsResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson,
            CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesSearchCollectionsResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesListCollectionResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesListCollectionResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreCollection get data;
  static Serializer<CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesListCollectionResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesListCollectionResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesListCollectionResponse200ApplicationJson,
            CoreCollaborationResourcesListCollectionResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesListCollectionResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesListCollectionResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesListCollectionResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesListCollectionResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesListCollectionResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesListCollectionResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesListCollectionResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreCollection get data;
  static Serializer<CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesRenameCollectionResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson,
            CoreCollaborationResourcesRenameCollectionResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesRenameCollectionResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesAddResourceResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesAddResourceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreCollection get data;
  static Serializer<CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesAddResourceResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesAddResourceResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesAddResourceResponse200ApplicationJson,
            CoreCollaborationResourcesAddResourceResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesAddResourceResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesAddResourceResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesAddResourceResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesAddResourceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesAddResourceResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesAddResourceResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesAddResourceResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreCollection get data;
  static Serializer<CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesRemoveResourceResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson,
            CoreCollaborationResourcesRemoveResourceResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesRemoveResourceResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreCollection> get data;
  static Serializer<CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs> get serializer =>
      _$coreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson,
            CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJsonSerializer;
}

abstract class CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs
    implements
        Built<CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs,
            CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_OcsBuilder> {
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs([
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreCollection get data;
  static Serializer<CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs>
      get serializer => _$coreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson
    implements
        Built<CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson,
            CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJsonBuilder> {
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson([
    final void Function(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson> get serializer =>
      _$coreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJsonSerializer;
}

abstract class CoreContactsAction implements Built<CoreContactsAction, CoreContactsActionBuilder> {
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
  String get title;
  String get icon;
  String get hyperlink;
  String get appId;
  static Serializer<CoreContactsAction> get serializer => _$coreContactsActionSerializer;
}

abstract class CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data,
            CoreHoverCardGetUserResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreHoverCardGetUserResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get userId;
  String get displayName;
  BuiltList<CoreContactsAction> get actions;
  static Serializer<CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreHoverCardGetUserResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreHoverCardGetUserResponse200ApplicationJson_Ocs
    implements
        Built<CoreHoverCardGetUserResponse200ApplicationJson_Ocs,
            CoreHoverCardGetUserResponse200ApplicationJson_OcsBuilder> {
  factory CoreHoverCardGetUserResponse200ApplicationJson_Ocs([
    final void Function(CoreHoverCardGetUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreHoverCardGetUserResponse200ApplicationJson_Ocs> get serializer =>
      _$coreHoverCardGetUserResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreHoverCardGetUserResponse200ApplicationJson
    implements
        Built<CoreHoverCardGetUserResponse200ApplicationJson, CoreHoverCardGetUserResponse200ApplicationJsonBuilder> {
  factory CoreHoverCardGetUserResponse200ApplicationJson([
    final void Function(CoreHoverCardGetUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreHoverCardGetUserResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreHoverCardGetUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreHoverCardGetUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreHoverCardGetUserResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreHoverCardGetUserResponse200ApplicationJson> get serializer =>
      _$coreHoverCardGetUserResponse200ApplicationJsonSerializer;
}

abstract class CoreNavigationEntry_Order implements Built<CoreNavigationEntry_Order, CoreNavigationEntry_OrderBuilder> {
  // coverage:ignore-end

  factory CoreNavigationEntry_Order([final void Function(CoreNavigationEntry_OrderBuilder)? b]) =
      _$CoreNavigationEntry_Order;
  // coverage:ignore-start
  const CoreNavigationEntry_Order._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreNavigationEntry_Order fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
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
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class CoreNavigationEntry implements Built<CoreNavigationEntry, CoreNavigationEntryBuilder> {
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
  String get id;
  CoreNavigationEntry_Order get order;
  String get href;
  String get icon;
  String get type;
  String get name;
  bool get active;
  String get classes;
  int get unread;
  static Serializer<CoreNavigationEntry> get serializer => _$coreNavigationEntrySerializer;
}

abstract class CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs
    implements
        Built<CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs,
            CoreNavigationGetAppsNavigationResponse200ApplicationJson_OcsBuilder> {
  factory CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs([
    final void Function(CoreNavigationGetAppsNavigationResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreNavigationEntry> get data;
  static Serializer<CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs> get serializer =>
      _$coreNavigationGetAppsNavigationResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreNavigationGetAppsNavigationResponse200ApplicationJson
    implements
        Built<CoreNavigationGetAppsNavigationResponse200ApplicationJson,
            CoreNavigationGetAppsNavigationResponse200ApplicationJsonBuilder> {
  factory CoreNavigationGetAppsNavigationResponse200ApplicationJson([
    final void Function(CoreNavigationGetAppsNavigationResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreNavigationGetAppsNavigationResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreNavigationGetAppsNavigationResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetAppsNavigationResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreNavigationGetAppsNavigationResponse200ApplicationJson> get serializer =>
      _$coreNavigationGetAppsNavigationResponse200ApplicationJsonSerializer;
}

abstract class CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs
    implements
        Built<CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs,
            CoreNavigationGetSettingsNavigationResponse200ApplicationJson_OcsBuilder> {
  factory CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs([
    final void Function(CoreNavigationGetSettingsNavigationResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreNavigationEntry> get data;
  static Serializer<CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs> get serializer =>
      _$coreNavigationGetSettingsNavigationResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreNavigationGetSettingsNavigationResponse200ApplicationJson
    implements
        Built<CoreNavigationGetSettingsNavigationResponse200ApplicationJson,
            CoreNavigationGetSettingsNavigationResponse200ApplicationJsonBuilder> {
  factory CoreNavigationGetSettingsNavigationResponse200ApplicationJson([
    final void Function(CoreNavigationGetSettingsNavigationResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreNavigationGetSettingsNavigationResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreNavigationGetSettingsNavigationResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreNavigationGetSettingsNavigationResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreNavigationGetSettingsNavigationResponse200ApplicationJson> get serializer =>
      _$coreNavigationGetSettingsNavigationResponse200ApplicationJsonSerializer;
}

abstract class CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version
    implements
        Built<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version,
            CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_VersionBuilder> {
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version([
    final void Function(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_VersionBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int get major;
  int get minor;
  int get micro;
  String get string;
  String get edition;
  bool get extendedSupport;
  static Serializer<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version> get serializer =>
      _$coreOcsGetCapabilitiesResponse200ApplicationJsonOcsDataVersionSerializer;
}

abstract class CoreCommentsCapabilities_Files
    implements Built<CoreCommentsCapabilities_Files, CoreCommentsCapabilities_FilesBuilder> {
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
  bool get comments;
  static Serializer<CoreCommentsCapabilities_Files> get serializer => _$coreCommentsCapabilitiesFilesSerializer;
}

abstract class CoreCommentsCapabilities implements Built<CoreCommentsCapabilities, CoreCommentsCapabilitiesBuilder> {
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
  CoreCommentsCapabilities_Files get files;
  static Serializer<CoreCommentsCapabilities> get serializer => _$coreCommentsCapabilitiesSerializer;
}

abstract class CoreDavCapabilities_Dav implements Built<CoreDavCapabilities_Dav, CoreDavCapabilities_DavBuilder> {
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
  String get chunking;
  String? get bulkupload;
  static Serializer<CoreDavCapabilities_Dav> get serializer => _$coreDavCapabilitiesDavSerializer;
}

abstract class CoreDavCapabilities implements Built<CoreDavCapabilities, CoreDavCapabilitiesBuilder> {
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
  CoreDavCapabilities_Dav get dav;
  static Serializer<CoreDavCapabilities> get serializer => _$coreDavCapabilitiesSerializer;
}

abstract class CoreFilesCapabilities_Files_DirectEditing
    implements Built<CoreFilesCapabilities_Files_DirectEditing, CoreFilesCapabilities_Files_DirectEditingBuilder> {
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
  String get url;
  String get etag;
  bool get supportsFileId;
  static Serializer<CoreFilesCapabilities_Files_DirectEditing> get serializer =>
      _$coreFilesCapabilitiesFilesDirectEditingSerializer;
}

abstract class CoreFilesCapabilities_Files
    implements Built<CoreFilesCapabilities_Files, CoreFilesCapabilities_FilesBuilder> {
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
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  CoreFilesCapabilities_Files_DirectEditing get directEditing;
  static Serializer<CoreFilesCapabilities_Files> get serializer => _$coreFilesCapabilitiesFilesSerializer;
}

abstract class CoreFilesCapabilities implements Built<CoreFilesCapabilities, CoreFilesCapabilitiesBuilder> {
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
  CoreFilesCapabilities_Files get files;
  static Serializer<CoreFilesCapabilities> get serializer => _$coreFilesCapabilitiesSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_Password
    implements
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
  bool get enforced;
  bool get askForOptionalPassword;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicPasswordSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Public
    implements
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
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Public> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingPublicSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingUserExpireDateSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_User
    implements
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
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_User_ExpireDate? get expireDate;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_User> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingUserSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingGroupExpireDateSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Group
    implements
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
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_Group_ExpireDate? get expireDate;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Group> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingGroupSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationExpireDateSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    implements
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
  bool get enabled;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Federation
    implements
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
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  CoreFilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingFederationSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing_Sharee
    implements
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
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
  static Serializer<CoreFilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingShareeSerializer;
}

abstract class CoreFilesSharingCapabilities_FilesSharing
    implements Built<CoreFilesSharingCapabilities_FilesSharing, CoreFilesSharingCapabilities_FilesSharingBuilder> {
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
  static Serializer<CoreFilesSharingCapabilities_FilesSharing> get serializer =>
      _$coreFilesSharingCapabilitiesFilesSharingSerializer;
}

abstract class CoreFilesSharingCapabilities
    implements Built<CoreFilesSharingCapabilities, CoreFilesSharingCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'files_sharing')
  CoreFilesSharingCapabilities_FilesSharing get filesSharing;
  static Serializer<CoreFilesSharingCapabilities> get serializer => _$coreFilesSharingCapabilitiesSerializer;
}

abstract class CoreFilesTrashbinCapabilities_Files
    implements Built<CoreFilesTrashbinCapabilities_Files, CoreFilesTrashbinCapabilities_FilesBuilder> {
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
  bool get undelete;
  static Serializer<CoreFilesTrashbinCapabilities_Files> get serializer =>
      _$coreFilesTrashbinCapabilitiesFilesSerializer;
}

abstract class CoreFilesTrashbinCapabilities
    implements Built<CoreFilesTrashbinCapabilities, CoreFilesTrashbinCapabilitiesBuilder> {
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
  CoreFilesTrashbinCapabilities_Files get files;
  static Serializer<CoreFilesTrashbinCapabilities> get serializer => _$coreFilesTrashbinCapabilitiesSerializer;
}

abstract class CoreFilesVersionsCapabilities_Files
    implements Built<CoreFilesVersionsCapabilities_Files, CoreFilesVersionsCapabilities_FilesBuilder> {
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
  bool get versioning;
  @BuiltValueField(wireName: 'version_labeling')
  bool get versionLabeling;
  @BuiltValueField(wireName: 'version_deletion')
  bool get versionDeletion;
  static Serializer<CoreFilesVersionsCapabilities_Files> get serializer =>
      _$coreFilesVersionsCapabilitiesFilesSerializer;
}

abstract class CoreFilesVersionsCapabilities
    implements Built<CoreFilesVersionsCapabilities, CoreFilesVersionsCapabilitiesBuilder> {
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
  CoreFilesVersionsCapabilities_Files get files;
  static Serializer<CoreFilesVersionsCapabilities> get serializer => _$coreFilesVersionsCapabilitiesSerializer;
}

abstract class CoreNotesCapabilities_Notes
    implements Built<CoreNotesCapabilities_Notes, CoreNotesCapabilities_NotesBuilder> {
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
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  static Serializer<CoreNotesCapabilities_Notes> get serializer => _$coreNotesCapabilitiesNotesSerializer;
}

abstract class CoreNotesCapabilities implements Built<CoreNotesCapabilities, CoreNotesCapabilitiesBuilder> {
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
  CoreNotesCapabilities_Notes get notes;
  static Serializer<CoreNotesCapabilities> get serializer => _$coreNotesCapabilitiesSerializer;
}

abstract class CoreNotificationsCapabilities_Notifications
    implements Built<CoreNotificationsCapabilities_Notifications, CoreNotificationsCapabilities_NotificationsBuilder> {
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
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String>? get ocsEndpoints;
  BuiltList<String>? get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String>? get adminNotifications;
  static Serializer<CoreNotificationsCapabilities_Notifications> get serializer =>
      _$coreNotificationsCapabilitiesNotificationsSerializer;
}

abstract class CoreNotificationsCapabilities
    implements Built<CoreNotificationsCapabilities, CoreNotificationsCapabilitiesBuilder> {
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
  CoreNotificationsCapabilities_Notifications get notifications;
  static Serializer<CoreNotificationsCapabilities> get serializer => _$coreNotificationsCapabilitiesSerializer;
}

abstract class CoreProvisioningApiCapabilities_ProvisioningApi
    implements
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
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
  static Serializer<CoreProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      _$coreProvisioningApiCapabilitiesProvisioningApiSerializer;
}

abstract class CoreProvisioningApiCapabilities
    implements Built<CoreProvisioningApiCapabilities, CoreProvisioningApiCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'provisioning_api')
  CoreProvisioningApiCapabilities_ProvisioningApi get provisioningApi;
  static Serializer<CoreProvisioningApiCapabilities> get serializer => _$coreProvisioningApiCapabilitiesSerializer;
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
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
  bool get enabled;
  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password
    implements
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
  bool get enabled;
  bool get enforced;
  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate
    implements
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
  bool get enabled;
  bool get enforced;
  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

abstract class CoreSharebymailCapabilities_FilesSharing_Sharebymail
    implements
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
  bool get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_UploadFilesDrop get uploadFilesDrop;
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_Password get password;
  @BuiltValueField(wireName: 'expire_date')
  CoreSharebymailCapabilities_FilesSharing_Sharebymail_ExpireDate get expireDate;
  static Serializer<CoreSharebymailCapabilities_FilesSharing_Sharebymail> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSharebymailSerializer;
}

abstract class CoreSharebymailCapabilities_FilesSharing
    implements Built<CoreSharebymailCapabilities_FilesSharing, CoreSharebymailCapabilities_FilesSharingBuilder> {
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
  CoreSharebymailCapabilities_FilesSharing_Sharebymail get sharebymail;
  static Serializer<CoreSharebymailCapabilities_FilesSharing> get serializer =>
      _$coreSharebymailCapabilitiesFilesSharingSerializer;
}

abstract class CoreSharebymailCapabilities
    implements Built<CoreSharebymailCapabilities, CoreSharebymailCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'files_sharing')
  CoreSharebymailCapabilities_FilesSharing get filesSharing;
  static Serializer<CoreSharebymailCapabilities> get serializer => _$coreSharebymailCapabilitiesSerializer;
}

abstract class CoreThemingPublicCapabilities_Theming
    implements Built<CoreThemingPublicCapabilities_Theming, CoreThemingPublicCapabilities_ThemingBuilder> {
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
  static Serializer<CoreThemingPublicCapabilities_Theming> get serializer =>
      _$coreThemingPublicCapabilitiesThemingSerializer;
}

abstract class CoreThemingPublicCapabilities
    implements Built<CoreThemingPublicCapabilities, CoreThemingPublicCapabilitiesBuilder> {
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
  CoreThemingPublicCapabilities_Theming get theming;
  static Serializer<CoreThemingPublicCapabilities> get serializer => _$coreThemingPublicCapabilitiesSerializer;
}

abstract class CoreUserStatusCapabilities_UserStatus
    implements Built<CoreUserStatusCapabilities_UserStatus, CoreUserStatusCapabilities_UserStatusBuilder> {
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
  bool get enabled;
  bool get restore;
  @BuiltValueField(wireName: 'supports_emoji')
  bool get supportsEmoji;
  static Serializer<CoreUserStatusCapabilities_UserStatus> get serializer =>
      _$coreUserStatusCapabilitiesUserStatusSerializer;
}

abstract class CoreUserStatusCapabilities
    implements Built<CoreUserStatusCapabilities, CoreUserStatusCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'user_status')
  CoreUserStatusCapabilities_UserStatus get userStatus;
  static Serializer<CoreUserStatusCapabilities> get serializer => _$coreUserStatusCapabilitiesSerializer;
}

abstract class CoreWeatherStatusCapabilities_WeatherStatus
    implements Built<CoreWeatherStatusCapabilities_WeatherStatus, CoreWeatherStatusCapabilities_WeatherStatusBuilder> {
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
  bool get enabled;
  static Serializer<CoreWeatherStatusCapabilities_WeatherStatus> get serializer =>
      _$coreWeatherStatusCapabilitiesWeatherStatusSerializer;
}

abstract class CoreWeatherStatusCapabilities
    implements Built<CoreWeatherStatusCapabilities, CoreWeatherStatusCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'weather_status')
  CoreWeatherStatusCapabilities_WeatherStatus get weatherStatus;
  static Serializer<CoreWeatherStatusCapabilities> get serializer => _$coreWeatherStatusCapabilitiesSerializer;
}

abstract class CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities
    implements
        Built<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities,
            CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_CapabilitiesBuilder> {
  // coverage:ignore-end

  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities([
    final void Function(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_CapabilitiesBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities;
  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities._();

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
  static CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities> get serializer =>
      _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_CapabilitiesSerializer();
}

class _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_CapabilitiesSerializer
    implements PrimitiveSerializer<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities> {
  @override
  final Iterable<Type> types = const [
    CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities,
    _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities,
  ];

  @override
  final String wireName = 'CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_CapabilitiesBuilder()
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

abstract class CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data,
            CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version get version;
  CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities get capabilities;
  static Serializer<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreOcsGetCapabilitiesResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs
    implements
        Built<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs,
            CoreOcsGetCapabilitiesResponse200ApplicationJson_OcsBuilder> {
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs([
    final void Function(CoreOcsGetCapabilitiesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs> get serializer =>
      _$coreOcsGetCapabilitiesResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreOcsGetCapabilitiesResponse200ApplicationJson
    implements
        Built<CoreOcsGetCapabilitiesResponse200ApplicationJson,
            CoreOcsGetCapabilitiesResponse200ApplicationJsonBuilder> {
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson([
    final void Function(CoreOcsGetCapabilitiesResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreOcsGetCapabilitiesResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreOcsGetCapabilitiesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreOcsGetCapabilitiesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreOcsGetCapabilitiesResponse200ApplicationJson> get serializer =>
      _$coreOcsGetCapabilitiesResponse200ApplicationJsonSerializer;
}

abstract class CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs
    implements
        Built<CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs,
            CoreProfileApiSetVisibilityResponse200ApplicationJson_OcsBuilder> {
  factory CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs([
    final void Function(CoreProfileApiSetVisibilityResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  JsonObject get data;
  static Serializer<CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs> get serializer =>
      _$coreProfileApiSetVisibilityResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreProfileApiSetVisibilityResponse200ApplicationJson
    implements
        Built<CoreProfileApiSetVisibilityResponse200ApplicationJson,
            CoreProfileApiSetVisibilityResponse200ApplicationJsonBuilder> {
  factory CoreProfileApiSetVisibilityResponse200ApplicationJson([
    final void Function(CoreProfileApiSetVisibilityResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreProfileApiSetVisibilityResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreProfileApiSetVisibilityResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreProfileApiSetVisibilityResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreProfileApiSetVisibilityResponse200ApplicationJson> get serializer =>
      _$coreProfileApiSetVisibilityResponse200ApplicationJsonSerializer;
}

abstract class CoreReference implements Built<CoreReference, CoreReferenceBuilder> {
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
  String get richObjectType;
  BuiltMap<String, JsonObject> get richObject;
  CoreOpenGraphObject get openGraphObject;
  bool get accessible;
  static Serializer<CoreReference> get serializer => _$coreReferenceSerializer;
}

abstract class CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data,
            CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltMap<String, CoreReference> get references;
  static Serializer<CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiResolveOneResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs
    implements
        Built<CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs,
            CoreReferenceApiResolveOneResponse200ApplicationJson_OcsBuilder> {
  factory CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs([
    final void Function(CoreReferenceApiResolveOneResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiResolveOneResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreReferenceApiResolveOneResponse200ApplicationJson
    implements
        Built<CoreReferenceApiResolveOneResponse200ApplicationJson,
            CoreReferenceApiResolveOneResponse200ApplicationJsonBuilder> {
  factory CoreReferenceApiResolveOneResponse200ApplicationJson([
    final void Function(CoreReferenceApiResolveOneResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiResolveOneResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiResolveOneResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveOneResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreReferenceApiResolveOneResponse200ApplicationJson> get serializer =>
      _$coreReferenceApiResolveOneResponse200ApplicationJsonSerializer;
}

abstract class CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References
    implements
        Built<CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References,
            CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_ReferencesBuilder> {
  // coverage:ignore-end

  factory CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References([
    final void Function(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_ReferencesBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References;
  // coverage:ignore-start
  const CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References._();

  JsonObject get data;
  CoreReference? get reference;
  JsonObject? get jsonObject;
  static CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References> get serializer =>
      _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_ReferencesSerializer();
}

class _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_ReferencesSerializer
    implements PrimitiveSerializer<CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References> {
  @override
  final Iterable<Type> types = const [
    CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References,
    _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References,
  ];

  @override
  final String wireName = 'CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_ReferencesBuilder()
      ..data = JsonObject(data);
    try {
      result._reference =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(CoreReference))! as CoreReference)
              .toBuilder();
    } catch (_) {}
    try {
      result._jsonObject = data as JsonObject?;
    } catch (_) {}
    assert(
      [result._reference, result._jsonObject].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data,
            CoreReferenceApiResolveResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltMap<String, CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References> get references;
  static Serializer<CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiResolveResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreReferenceApiResolveResponse200ApplicationJson_Ocs
    implements
        Built<CoreReferenceApiResolveResponse200ApplicationJson_Ocs,
            CoreReferenceApiResolveResponse200ApplicationJson_OcsBuilder> {
  factory CoreReferenceApiResolveResponse200ApplicationJson_Ocs([
    final void Function(CoreReferenceApiResolveResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreReferenceApiResolveResponse200ApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiResolveResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreReferenceApiResolveResponse200ApplicationJson
    implements
        Built<CoreReferenceApiResolveResponse200ApplicationJson,
            CoreReferenceApiResolveResponse200ApplicationJsonBuilder> {
  factory CoreReferenceApiResolveResponse200ApplicationJson([
    final void Function(CoreReferenceApiResolveResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiResolveResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiResolveResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiResolveResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreReferenceApiResolveResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreReferenceApiResolveResponse200ApplicationJson> get serializer =>
      _$coreReferenceApiResolveResponse200ApplicationJsonSerializer;
}

abstract class CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References
    implements
        Built<CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References,
            CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_ReferencesBuilder> {
  // coverage:ignore-end

  factory CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References([
    final void Function(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_ReferencesBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References;
  // coverage:ignore-start
  const CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References._();

  JsonObject get data;
  CoreReference? get reference;
  JsonObject? get jsonObject;
  static CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References> get serializer =>
      _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_ReferencesSerializer();
}

class _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_ReferencesSerializer
    implements PrimitiveSerializer<CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References> {
  @override
  final Iterable<Type> types = const [
    CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References,
    _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References,
  ];

  @override
  final String wireName = 'CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_ReferencesBuilder()
      ..data = JsonObject(data);
    try {
      result._reference =
          (_jsonSerializers.deserialize(data, specifiedType: const FullType(CoreReference))! as CoreReference)
              .toBuilder();
    } catch (_) {}
    try {
      result._jsonObject = data as JsonObject?;
    } catch (_) {}
    assert(
      [result._reference, result._jsonObject].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data,
            CoreReferenceApiExtractResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltMap<String, CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References> get references;
  static Serializer<CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiExtractResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreReferenceApiExtractResponse200ApplicationJson_Ocs
    implements
        Built<CoreReferenceApiExtractResponse200ApplicationJson_Ocs,
            CoreReferenceApiExtractResponse200ApplicationJson_OcsBuilder> {
  factory CoreReferenceApiExtractResponse200ApplicationJson_Ocs([
    final void Function(CoreReferenceApiExtractResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreReferenceApiExtractResponse200ApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiExtractResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreReferenceApiExtractResponse200ApplicationJson
    implements
        Built<CoreReferenceApiExtractResponse200ApplicationJson,
            CoreReferenceApiExtractResponse200ApplicationJsonBuilder> {
  factory CoreReferenceApiExtractResponse200ApplicationJson([
    final void Function(CoreReferenceApiExtractResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiExtractResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiExtractResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiExtractResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreReferenceApiExtractResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreReferenceApiExtractResponse200ApplicationJson> get serializer =>
      _$coreReferenceApiExtractResponse200ApplicationJsonSerializer;
}

abstract class CoreReferenceProvider implements Built<CoreReferenceProvider, CoreReferenceProviderBuilder> {
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
  String get id;
  String get title;
  @BuiltValueField(wireName: 'icon_url')
  String get iconUrl;
  int get order;
  @BuiltValueField(wireName: 'search_providers_ids')
  BuiltList<String>? get searchProvidersIds;
  static Serializer<CoreReferenceProvider> get serializer => _$coreReferenceProviderSerializer;
}

abstract class CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs
    implements
        Built<CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs,
            CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_OcsBuilder> {
  factory CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs([
    final void Function(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreReferenceProvider> get data;
  static Serializer<CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiGetProvidersInfoResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreReferenceApiGetProvidersInfoResponse200ApplicationJson
    implements
        Built<CoreReferenceApiGetProvidersInfoResponse200ApplicationJson,
            CoreReferenceApiGetProvidersInfoResponse200ApplicationJsonBuilder> {
  factory CoreReferenceApiGetProvidersInfoResponse200ApplicationJson([
    final void Function(CoreReferenceApiGetProvidersInfoResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiGetProvidersInfoResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiGetProvidersInfoResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiGetProvidersInfoResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreReferenceApiGetProvidersInfoResponse200ApplicationJson> get serializer =>
      _$coreReferenceApiGetProvidersInfoResponse200ApplicationJsonSerializer;
}

abstract class CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data,
            CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get success;
  static Serializer<CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreReferenceApiTouchProviderResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs
    implements
        Built<CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs,
            CoreReferenceApiTouchProviderResponse200ApplicationJson_OcsBuilder> {
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs([
    final void Function(CoreReferenceApiTouchProviderResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs> get serializer =>
      _$coreReferenceApiTouchProviderResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreReferenceApiTouchProviderResponse200ApplicationJson
    implements
        Built<CoreReferenceApiTouchProviderResponse200ApplicationJson,
            CoreReferenceApiTouchProviderResponse200ApplicationJsonBuilder> {
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson([
    final void Function(CoreReferenceApiTouchProviderResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreReferenceApiTouchProviderResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreReferenceApiTouchProviderResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreReferenceApiTouchProviderResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreReferenceApiTouchProviderResponse200ApplicationJson> get serializer =>
      _$coreReferenceApiTouchProviderResponse200ApplicationJsonSerializer;
}

abstract class CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types
    implements
        Built<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types,
            CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_TypesBuilder> {
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types([
    final void Function(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_TypesBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get id;
  String get name;
  String get description;
  static Serializer<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types> get serializer =>
      _$coreTextProcessingApiTaskTypesResponse200ApplicationJsonOcsDataTypesSerializer;
}

abstract class CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data,
            CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types> get types;
  static Serializer<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiTaskTypesResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs
    implements
        Built<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs,
            CoreTextProcessingApiTaskTypesResponse200ApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiTaskTypesResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTextProcessingApiTaskTypesResponse200ApplicationJson
    implements
        Built<CoreTextProcessingApiTaskTypesResponse200ApplicationJson,
            CoreTextProcessingApiTaskTypesResponse200ApplicationJsonBuilder> {
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson([
    final void Function(CoreTextProcessingApiTaskTypesResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiTaskTypesResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiTaskTypesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiTaskTypesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTextProcessingApiTaskTypesResponse200ApplicationJson> get serializer =>
      _$coreTextProcessingApiTaskTypesResponse200ApplicationJsonSerializer;
}

abstract class CoreTextProcessingTask implements Built<CoreTextProcessingTask, CoreTextProcessingTaskBuilder> {
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
  int? get id;
  String get type;
  int get status;
  String? get userId;
  String get appId;
  String get input;
  String? get output;
  String get identifier;
  static Serializer<CoreTextProcessingTask> get serializer => _$coreTextProcessingTaskSerializer;
}

abstract class CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data,
            CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingTask get task;
  static Serializer<CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiScheduleResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs
    implements
        Built<CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs,
            CoreTextProcessingApiScheduleResponse200ApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiScheduleResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiScheduleResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTextProcessingApiScheduleResponse200ApplicationJson
    implements
        Built<CoreTextProcessingApiScheduleResponse200ApplicationJson,
            CoreTextProcessingApiScheduleResponse200ApplicationJsonBuilder> {
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson([
    final void Function(CoreTextProcessingApiScheduleResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiScheduleResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiScheduleResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiScheduleResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTextProcessingApiScheduleResponse200ApplicationJson> get serializer =>
      _$coreTextProcessingApiScheduleResponse200ApplicationJsonSerializer;
}

abstract class CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data,
            CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingTask get task;
  static Serializer<CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiGetTaskResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs
    implements
        Built<CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs,
            CoreTextProcessingApiGetTaskResponse200ApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiGetTaskResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiGetTaskResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTextProcessingApiGetTaskResponse200ApplicationJson
    implements
        Built<CoreTextProcessingApiGetTaskResponse200ApplicationJson,
            CoreTextProcessingApiGetTaskResponse200ApplicationJsonBuilder> {
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson([
    final void Function(CoreTextProcessingApiGetTaskResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiGetTaskResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiGetTaskResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiGetTaskResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTextProcessingApiGetTaskResponse200ApplicationJson> get serializer =>
      _$coreTextProcessingApiGetTaskResponse200ApplicationJsonSerializer;
}

abstract class CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data,
            CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingTask get task;
  static Serializer<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs
    implements
        Built<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs,
            CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTextProcessingApiDeleteTaskResponse200ApplicationJson
    implements
        Built<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson,
            CoreTextProcessingApiDeleteTaskResponse200ApplicationJsonBuilder> {
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson([
    final void Function(CoreTextProcessingApiDeleteTaskResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiDeleteTaskResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiDeleteTaskResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiDeleteTaskResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTextProcessingApiDeleteTaskResponse200ApplicationJson> get serializer =>
      _$coreTextProcessingApiDeleteTaskResponse200ApplicationJsonSerializer;
}

abstract class CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data,
            CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<CoreTextProcessingTask> get tasks;
  static Serializer<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs
    implements
        Built<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs,
            CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_OcsBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs([
    final void Function(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTextProcessingApiListTasksByAppResponse200ApplicationJson
    implements
        Built<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson,
            CoreTextProcessingApiListTasksByAppResponse200ApplicationJsonBuilder> {
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson([
    final void Function(CoreTextProcessingApiListTasksByAppResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTextProcessingApiListTasksByAppResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTextProcessingApiListTasksByAppResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTextProcessingApiListTasksByAppResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTextProcessingApiListTasksByAppResponse200ApplicationJson> get serializer =>
      _$coreTextProcessingApiListTasksByAppResponse200ApplicationJsonSerializer;
}

abstract class CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages
    implements
        Built<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages,
            CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_LanguagesBuilder> {
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages([
    final void Function(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_LanguagesBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get from;
  String get fromLabel;
  String get to;
  String get toLabel;
  static Serializer<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages> get serializer =>
      _$coreTranslationApiLanguagesResponse200ApplicationJsonOcsDataLanguagesSerializer;
}

abstract class CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data,
            CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages> get languages;
  bool get languageDetection;
  static Serializer<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTranslationApiLanguagesResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs
    implements
        Built<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs,
            CoreTranslationApiLanguagesResponse200ApplicationJson_OcsBuilder> {
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs([
    final void Function(CoreTranslationApiLanguagesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTranslationApiLanguagesResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTranslationApiLanguagesResponse200ApplicationJson
    implements
        Built<CoreTranslationApiLanguagesResponse200ApplicationJson,
            CoreTranslationApiLanguagesResponse200ApplicationJsonBuilder> {
  factory CoreTranslationApiLanguagesResponse200ApplicationJson([
    final void Function(CoreTranslationApiLanguagesResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTranslationApiLanguagesResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTranslationApiLanguagesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiLanguagesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTranslationApiLanguagesResponse200ApplicationJson> get serializer =>
      _$coreTranslationApiLanguagesResponse200ApplicationJsonSerializer;
}

abstract class CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data,
            CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get text;
  String? get from;
  static Serializer<CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreTranslationApiTranslateResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreTranslationApiTranslateResponse200ApplicationJson_Ocs
    implements
        Built<CoreTranslationApiTranslateResponse200ApplicationJson_Ocs,
            CoreTranslationApiTranslateResponse200ApplicationJson_OcsBuilder> {
  factory CoreTranslationApiTranslateResponse200ApplicationJson_Ocs([
    final void Function(CoreTranslationApiTranslateResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreTranslationApiTranslateResponse200ApplicationJson_Ocs> get serializer =>
      _$coreTranslationApiTranslateResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreTranslationApiTranslateResponse200ApplicationJson
    implements
        Built<CoreTranslationApiTranslateResponse200ApplicationJson,
            CoreTranslationApiTranslateResponse200ApplicationJsonBuilder> {
  factory CoreTranslationApiTranslateResponse200ApplicationJson([
    final void Function(CoreTranslationApiTranslateResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreTranslationApiTranslateResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreTranslationApiTranslateResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreTranslationApiTranslateResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreTranslationApiTranslateResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreTranslationApiTranslateResponse200ApplicationJson> get serializer =>
      _$coreTranslationApiTranslateResponse200ApplicationJsonSerializer;
}

abstract class CoreUnifiedSearchProvider implements Built<CoreUnifiedSearchProvider, CoreUnifiedSearchProviderBuilder> {
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
  String get id;
  String get name;
  int get order;
  static Serializer<CoreUnifiedSearchProvider> get serializer => _$coreUnifiedSearchProviderSerializer;
}

abstract class CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs
    implements
        Built<CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs,
            CoreUnifiedSearchGetProvidersResponse200ApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchGetProvidersResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  BuiltList<CoreUnifiedSearchProvider> get data;
  static Serializer<CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchGetProvidersResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreUnifiedSearchGetProvidersResponse200ApplicationJson
    implements
        Built<CoreUnifiedSearchGetProvidersResponse200ApplicationJson,
            CoreUnifiedSearchGetProvidersResponse200ApplicationJsonBuilder> {
  factory CoreUnifiedSearchGetProvidersResponse200ApplicationJson([
    final void Function(CoreUnifiedSearchGetProvidersResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchGetProvidersResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreUnifiedSearchGetProvidersResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchGetProvidersResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreUnifiedSearchGetProvidersResponse200ApplicationJson> get serializer =>
      _$coreUnifiedSearchGetProvidersResponse200ApplicationJsonSerializer;
}

abstract class CoreUnifiedSearchSearchCursor
    implements Built<CoreUnifiedSearchSearchCursor, CoreUnifiedSearchSearchCursorBuilder> {
  // coverage:ignore-end

  factory CoreUnifiedSearchSearchCursor([final void Function(CoreUnifiedSearchSearchCursorBuilder)? b]) =
      _$CoreUnifiedSearchSearchCursor;
  // coverage:ignore-start
  const CoreUnifiedSearchSearchCursor._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreUnifiedSearchSearchCursor fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
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
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class CoreUnifiedSearchResultEntry
    implements Built<CoreUnifiedSearchResultEntry, CoreUnifiedSearchResultEntryBuilder> {
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
  String get thumbnailUrl;
  String get title;
  String get subline;
  String get resourceUrl;
  String get icon;
  bool get rounded;
  BuiltList<String> get attributes;
  static Serializer<CoreUnifiedSearchResultEntry> get serializer => _$coreUnifiedSearchResultEntrySerializer;
}

abstract class CoreUnifiedSearchResult_Cursor
    implements Built<CoreUnifiedSearchResult_Cursor, CoreUnifiedSearchResult_CursorBuilder> {
  // coverage:ignore-end

  factory CoreUnifiedSearchResult_Cursor([final void Function(CoreUnifiedSearchResult_CursorBuilder)? b]) =
      _$CoreUnifiedSearchResult_Cursor;
  // coverage:ignore-start
  const CoreUnifiedSearchResult_Cursor._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreUnifiedSearchResult_Cursor fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
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
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class CoreUnifiedSearchResult implements Built<CoreUnifiedSearchResult, CoreUnifiedSearchResultBuilder> {
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
  String get name;
  bool get isPaginated;
  BuiltList<CoreUnifiedSearchResultEntry> get entries;
  CoreUnifiedSearchResult_Cursor? get cursor;
  static Serializer<CoreUnifiedSearchResult> get serializer => _$coreUnifiedSearchResultSerializer;
}

abstract class CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs
    implements
        Built<CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs,
            CoreUnifiedSearchSearchResponse200ApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchSearchResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreUnifiedSearchResult get data;
  static Serializer<CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchSearchResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreUnifiedSearchSearchResponse200ApplicationJson
    implements
        Built<CoreUnifiedSearchSearchResponse200ApplicationJson,
            CoreUnifiedSearchSearchResponse200ApplicationJsonBuilder> {
  factory CoreUnifiedSearchSearchResponse200ApplicationJson([
    final void Function(CoreUnifiedSearchSearchResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchSearchResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreUnifiedSearchSearchResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreUnifiedSearchSearchResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreUnifiedSearchSearchResponse200ApplicationJson> get serializer =>
      _$coreUnifiedSearchSearchResponse200ApplicationJsonSerializer;
}

abstract class CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew
    implements
        Built<CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew,
            CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNewBuilder> {
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew([
    final void Function(CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNewBuilder)? b,
  ]) = _$CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew;

  // coverage:ignore-start
  const CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<String> get regular;
  BuiltList<String> get admin;
  static Serializer<CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew> get serializer =>
      _$coreWhatsNewGetResponse200ApplicationJsonOcsDataWhatsNewSerializer;
}

abstract class CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data
    implements
        Built<CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data,
            CoreWhatsNewGetResponse200ApplicationJson_Ocs_DataBuilder> {
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data([
    final void Function(CoreWhatsNewGetResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get changelogURL;
  String get product;
  String get version;
  CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew? get whatsNew;
  static Serializer<CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$coreWhatsNewGetResponse200ApplicationJsonOcsDataSerializer;
}

abstract class CoreWhatsNewGetResponse200ApplicationJson_Ocs
    implements
        Built<CoreWhatsNewGetResponse200ApplicationJson_Ocs, CoreWhatsNewGetResponse200ApplicationJson_OcsBuilder> {
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs([
    final void Function(CoreWhatsNewGetResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreWhatsNewGetResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreWhatsNewGetResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<CoreWhatsNewGetResponse200ApplicationJson_Ocs> get serializer =>
      _$coreWhatsNewGetResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreWhatsNewGetResponse200ApplicationJson
    implements Built<CoreWhatsNewGetResponse200ApplicationJson, CoreWhatsNewGetResponse200ApplicationJsonBuilder> {
  factory CoreWhatsNewGetResponse200ApplicationJson([
    final void Function(CoreWhatsNewGetResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreWhatsNewGetResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreWhatsNewGetResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewGetResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreWhatsNewGetResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreWhatsNewGetResponse200ApplicationJson> get serializer =>
      _$coreWhatsNewGetResponse200ApplicationJsonSerializer;
}

abstract class CoreWhatsNewDismissResponse200ApplicationJson_Ocs
    implements
        Built<CoreWhatsNewDismissResponse200ApplicationJson_Ocs,
            CoreWhatsNewDismissResponse200ApplicationJson_OcsBuilder> {
  factory CoreWhatsNewDismissResponse200ApplicationJson_Ocs([
    final void Function(CoreWhatsNewDismissResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreWhatsNewDismissResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const CoreWhatsNewDismissResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewDismissResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreOCSMeta get meta;
  JsonObject get data;
  static Serializer<CoreWhatsNewDismissResponse200ApplicationJson_Ocs> get serializer =>
      _$coreWhatsNewDismissResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreWhatsNewDismissResponse200ApplicationJson
    implements
        Built<CoreWhatsNewDismissResponse200ApplicationJson, CoreWhatsNewDismissResponse200ApplicationJsonBuilder> {
  factory CoreWhatsNewDismissResponse200ApplicationJson([
    final void Function(CoreWhatsNewDismissResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreWhatsNewDismissResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreWhatsNewDismissResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWhatsNewDismissResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CoreWhatsNewDismissResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreWhatsNewDismissResponse200ApplicationJson> get serializer =>
      _$coreWhatsNewDismissResponse200ApplicationJsonSerializer;
}

abstract class CoreWipeCheckWipeResponse200ApplicationJson
    implements Built<CoreWipeCheckWipeResponse200ApplicationJson, CoreWipeCheckWipeResponse200ApplicationJsonBuilder> {
  factory CoreWipeCheckWipeResponse200ApplicationJson([
    final void Function(CoreWipeCheckWipeResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreWipeCheckWipeResponse200ApplicationJson;

  // coverage:ignore-start
  const CoreWipeCheckWipeResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CoreWipeCheckWipeResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get wipe;
  static Serializer<CoreWipeCheckWipeResponse200ApplicationJson> get serializer =>
      _$coreWipeCheckWipeResponse200ApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(CoreStatus), CoreStatus.new)
      ..add(CoreStatus.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponse200ApplicationJson),
        CoreAppPasswordGetAppPasswordResponse200ApplicationJson.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs),
        CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreOCSMeta), CoreOCSMeta.new)
      ..add(CoreOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data),
        CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreAppPasswordGetAppPasswordResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson),
        CoreAppPasswordRotateAppPasswordResponse200ApplicationJson.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs),
        CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data),
        CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreAppPasswordRotateAppPasswordResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson),
        CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson.new,
      )
      ..add(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs),
        CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreAppPasswordDeleteAppPasswordResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(CoreAutoCompleteGetResponse200ApplicationJson),
        CoreAutoCompleteGetResponse200ApplicationJson.new,
      )
      ..add(CoreAutoCompleteGetResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreAutoCompleteGetResponse200ApplicationJson_Ocs),
        CoreAutoCompleteGetResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreAutoCompleteGetResponse200ApplicationJson_Ocs.serializer)
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
        const FullType(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson),
        CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesSearchCollectionsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreCollection), CoreCollection.new)
      ..add(CoreCollection.serializer)
      ..addBuilderFactory(const FullType(CoreOpenGraphObject), CoreOpenGraphObject.new)
      ..add(CoreOpenGraphObject.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(const FullType(CoreOpenGraphObject_OpenGraphObject), CoreOpenGraphObject_OpenGraphObject.new)
      ..add(CoreOpenGraphObject_OpenGraphObject.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreOpenGraphObject)]),
        ListBuilder<CoreOpenGraphObject>.new,
      )
      ..addBuilderFactory(const FullType(BuiltList, [FullType(CoreCollection)]), ListBuilder<CoreCollection>.new)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesListCollectionResponse200ApplicationJson),
        CoreCollaborationResourcesListCollectionResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesListCollectionResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesListCollectionResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson),
        CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesRenameCollectionResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesAddResourceResponse200ApplicationJson),
        CoreCollaborationResourcesAddResourceResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesAddResourceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesAddResourceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson),
        CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesRemoveResourceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson),
        CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesGetCollectionsByResourceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson),
        CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson.new,
      )
      ..add(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs),
        CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreCollaborationResourcesCreateCollectionOnResourceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponse200ApplicationJson),
        CoreHoverCardGetUserResponse200ApplicationJson.new,
      )
      ..add(CoreHoverCardGetUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponse200ApplicationJson_Ocs),
        CoreHoverCardGetUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreHoverCardGetUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data),
        CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreHoverCardGetUserResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreContactsAction), CoreContactsAction.new)
      ..add(CoreContactsAction.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreContactsAction)]),
        ListBuilder<CoreContactsAction>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreNavigationGetAppsNavigationResponse200ApplicationJson),
        CoreNavigationGetAppsNavigationResponse200ApplicationJson.new,
      )
      ..add(CoreNavigationGetAppsNavigationResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs),
        CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreNavigationGetAppsNavigationResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreNavigationEntry), CoreNavigationEntry.new)
      ..add(CoreNavigationEntry.serializer)
      ..addBuilderFactory(const FullType(CoreNavigationEntry_Order), CoreNavigationEntry_Order.new)
      ..add(CoreNavigationEntry_Order.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreNavigationEntry)]),
        ListBuilder<CoreNavigationEntry>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreNavigationGetSettingsNavigationResponse200ApplicationJson),
        CoreNavigationGetSettingsNavigationResponse200ApplicationJson.new,
      )
      ..add(CoreNavigationGetSettingsNavigationResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs),
        CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreNavigationGetSettingsNavigationResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson),
        CoreOcsGetCapabilitiesResponse200ApplicationJson.new,
      )
      ..add(CoreOcsGetCapabilitiesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs),
        CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data),
        CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version),
        CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version.new,
      )
      ..add(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Version.serializer)
      ..addBuilderFactory(
        const FullType(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities),
        CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities.new,
      )
      ..add(CoreOcsGetCapabilitiesResponse200ApplicationJson_Ocs_Data_Capabilities.serializer)
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
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
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
        const FullType(CoreProfileApiSetVisibilityResponse200ApplicationJson),
        CoreProfileApiSetVisibilityResponse200ApplicationJson.new,
      )
      ..add(CoreProfileApiSetVisibilityResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs),
        CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreProfileApiSetVisibilityResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponse200ApplicationJson),
        CoreReferenceApiResolveOneResponse200ApplicationJson.new,
      )
      ..add(CoreReferenceApiResolveOneResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs),
        CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data),
        CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiResolveOneResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreReference), CoreReference.new)
      ..add(CoreReference.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(CoreReference)]),
        MapBuilder<String, CoreReference>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponse200ApplicationJson),
        CoreReferenceApiResolveResponse200ApplicationJson.new,
      )
      ..add(CoreReferenceApiResolveResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponse200ApplicationJson_Ocs),
        CoreReferenceApiResolveResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiResolveResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data),
        CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References),
        CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References.new,
      )
      ..add(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References)],
        ),
        MapBuilder<String, CoreReferenceApiResolveResponse200ApplicationJson_Ocs_Data_References>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponse200ApplicationJson),
        CoreReferenceApiExtractResponse200ApplicationJson.new,
      )
      ..add(CoreReferenceApiExtractResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponse200ApplicationJson_Ocs),
        CoreReferenceApiExtractResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiExtractResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data),
        CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References),
        CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References.new,
      )
      ..add(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References)],
        ),
        MapBuilder<String, CoreReferenceApiExtractResponse200ApplicationJson_Ocs_Data_References>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson),
        CoreReferenceApiGetProvidersInfoResponse200ApplicationJson.new,
      )
      ..add(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs),
        CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiGetProvidersInfoResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(CoreReferenceProvider), CoreReferenceProvider.new)
      ..add(CoreReferenceProvider.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreReferenceProvider)]),
        ListBuilder<CoreReferenceProvider>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponse200ApplicationJson),
        CoreReferenceApiTouchProviderResponse200ApplicationJson.new,
      )
      ..add(CoreReferenceApiTouchProviderResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs),
        CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data),
        CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreReferenceApiTouchProviderResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson),
        CoreTextProcessingApiTaskTypesResponse200ApplicationJson.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs),
        CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data),
        CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types),
        CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types.new,
      )
      ..add(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types)]),
        ListBuilder<CoreTextProcessingApiTaskTypesResponse200ApplicationJson_Ocs_Data_Types>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponse200ApplicationJson),
        CoreTextProcessingApiScheduleResponse200ApplicationJson.new,
      )
      ..add(CoreTextProcessingApiScheduleResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs),
        CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data),
        CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiScheduleResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(CoreTextProcessingTask), CoreTextProcessingTask.new)
      ..add(CoreTextProcessingTask.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponse200ApplicationJson),
        CoreTextProcessingApiGetTaskResponse200ApplicationJson.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs),
        CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data),
        CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiGetTaskResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson),
        CoreTextProcessingApiDeleteTaskResponse200ApplicationJson.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs),
        CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data),
        CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiDeleteTaskResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson),
        CoreTextProcessingApiListTasksByAppResponse200ApplicationJson.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs),
        CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data),
        CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTextProcessingApiListTasksByAppResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTextProcessingTask)]),
        ListBuilder<CoreTextProcessingTask>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponse200ApplicationJson),
        CoreTranslationApiLanguagesResponse200ApplicationJson.new,
      )
      ..add(CoreTranslationApiLanguagesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs),
        CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data),
        CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages),
        CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages.new,
      )
      ..add(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages)]),
        ListBuilder<CoreTranslationApiLanguagesResponse200ApplicationJson_Ocs_Data_Languages>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponse200ApplicationJson),
        CoreTranslationApiTranslateResponse200ApplicationJson.new,
      )
      ..add(CoreTranslationApiTranslateResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponse200ApplicationJson_Ocs),
        CoreTranslationApiTranslateResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreTranslationApiTranslateResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data),
        CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreTranslationApiTranslateResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchGetProvidersResponse200ApplicationJson),
        CoreUnifiedSearchGetProvidersResponse200ApplicationJson.new,
      )
      ..add(CoreUnifiedSearchGetProvidersResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs),
        CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreUnifiedSearchGetProvidersResponse200ApplicationJson_Ocs.serializer)
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
        const FullType(CoreUnifiedSearchSearchResponse200ApplicationJson),
        CoreUnifiedSearchSearchResponse200ApplicationJson.new,
      )
      ..add(CoreUnifiedSearchSearchResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs),
        CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreUnifiedSearchSearchResponse200ApplicationJson_Ocs.serializer)
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
        const FullType(CoreWhatsNewGetResponse200ApplicationJson),
        CoreWhatsNewGetResponse200ApplicationJson.new,
      )
      ..add(CoreWhatsNewGetResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponse200ApplicationJson_Ocs),
        CoreWhatsNewGetResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreWhatsNewGetResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data),
        CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew),
        CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew.new,
      )
      ..add(CoreWhatsNewGetResponse200ApplicationJson_Ocs_Data_WhatsNew.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewDismissResponse200ApplicationJson),
        CoreWhatsNewDismissResponse200ApplicationJson.new,
      )
      ..add(CoreWhatsNewDismissResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(CoreWhatsNewDismissResponse200ApplicationJson_Ocs),
        CoreWhatsNewDismissResponse200ApplicationJson_Ocs.new,
      )
      ..add(CoreWhatsNewDismissResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(CoreWipeCheckWipeResponse200ApplicationJson),
        CoreWipeCheckWipeResponse200ApplicationJson.new,
      )
      ..add(CoreWipeCheckWipeResponse200ApplicationJson.serializer))
    .build();

Serializers get coreSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeCore<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeCore<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
