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

part 'files_sharing.openapi.g.dart';

class FilesSharingResponse<T, U> extends DynamiteResponse<T, U> {
  FilesSharingResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesSharingResponse(data: $data, headers: $headers)';
}

class FilesSharingApiException extends DynamiteApiException {
  FilesSharingApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesSharingApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesSharingApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesSharingApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class FilesSharingClient extends DynamiteClient {
  FilesSharingClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesSharingClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesSharingDeletedShareapiClient get deletedShareapi => FilesSharingDeletedShareapiClient(this);
  FilesSharingPublicPreviewClient get publicPreview => FilesSharingPublicPreviewClient(this);
  FilesSharingRemoteClient get remote => FilesSharingRemoteClient(this);
  FilesSharingShareInfoClient get shareInfo => FilesSharingShareInfoClient(this);
  FilesSharingShareapiClient get shareapi => FilesSharingShareapiClient(this);
  FilesSharingShareesapiClient get shareesapi => FilesSharingShareesapiClient(this);
}

class FilesSharingDeletedShareapiClient {
  FilesSharingDeletedShareapiClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Get a list of all deleted shares
  Future<FilesSharingDeletedShareapiListResponse200ApplicationJson> list({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/deletedshares';
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
        specifiedType: const FullType(FilesSharingDeletedShareapiListResponse200ApplicationJson),
      )! as FilesSharingDeletedShareapiListResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Undelete a deleted share
  Future<FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson> undelete({
    required final String id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/deletedshares/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
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
        specifiedType: const FullType(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson),
      )! as FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingPublicPreviewClient {
  FilesSharingPublicPreviewClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Get a direct link preview for a shared file
  Future<Uint8List> directLink({
    required final String token,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/index.php/s/{token}/preview';
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
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a preview for a shared file
  Future<Uint8List> getPreview({
    required final String token,
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/index.php/apps/files_sharing/publicpreview/{token}';
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
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
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
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingRemoteClient {
  FilesSharingRemoteClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Get a list of accepted remote shares
  Future<FilesSharingRemoteGetSharesResponse200ApplicationJson> getShares({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares';
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
        specifiedType: const FullType(FilesSharingRemoteGetSharesResponse200ApplicationJson),
      )! as FilesSharingRemoteGetSharesResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get list of pending remote shares
  Future<FilesSharingRemoteGetOpenSharesResponse200ApplicationJson> getOpenShares({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending';
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
        specifiedType: const FullType(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson),
      )! as FilesSharingRemoteGetOpenSharesResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Accept a remote share
  Future<FilesSharingRemoteAcceptShareResponse200ApplicationJson> acceptShare({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/{id}';
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
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteAcceptShareResponse200ApplicationJson),
      )! as FilesSharingRemoteAcceptShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Decline a remote share
  Future<FilesSharingRemoteDeclineShareResponse200ApplicationJson> declineShare({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/{id}';
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
        specifiedType: const FullType(FilesSharingRemoteDeclineShareResponse200ApplicationJson),
      )! as FilesSharingRemoteDeclineShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get info of a remote share
  Future<FilesSharingRemoteGetShareResponse200ApplicationJson> getShare({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/{id}';
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
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteGetShareResponse200ApplicationJson),
      )! as FilesSharingRemoteGetShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unshare a remote share
  Future<FilesSharingRemoteUnshareResponse200ApplicationJson> unshare({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/{id}';
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
        specifiedType: const FullType(FilesSharingRemoteUnshareResponse200ApplicationJson),
      )! as FilesSharingRemoteUnshareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingShareInfoClient {
  FilesSharingShareInfoClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Get the info about a share
  Future<FilesSharingShareInfo> info({
    required final String t,
    final String? password,
    final String? dir,
    final int depth = -1,
  }) async {
    const path = '/index.php/apps/files_sharing/shareinfo';
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
    queryParameters['t'] = t;
    if (password != null) {
      queryParameters['password'] = password;
    }
    if (dir != null) {
      queryParameters['dir'] = dir;
    }
    if (depth != -1) {
      queryParameters['depth'] = depth.toString();
    }
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareInfo),
      )! as FilesSharingShareInfo;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingShareapiClient {
  FilesSharingShareapiClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Get shares of the current user
  Future<FilesSharingShareapiGetSharesResponse200ApplicationJson> getShares({
    final String sharedWithMe = 'false',
    final String reshares = 'false',
    final String subfiles = 'false',
    final String path = '',
    final String includeTags = 'false',
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files_sharing/api/v1/shares';
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
    if (sharedWithMe != 'false') {
      queryParameters['shared_with_me'] = sharedWithMe;
    }
    if (reshares != 'false') {
      queryParameters['reshares'] = reshares;
    }
    if (subfiles != 'false') {
      queryParameters['subfiles'] = subfiles;
    }
    if (path != '') {
      queryParameters['path'] = path;
    }
    if (includeTags != 'false') {
      queryParameters['include_tags'] = includeTags;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiGetSharesResponse200ApplicationJson),
      )! as FilesSharingShareapiGetSharesResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a share
  Future<FilesSharingShareapiCreateShareResponse200ApplicationJson> createShare({
    final String? path,
    final int? permissions,
    final int shareType = -1,
    final String? shareWith,
    final String publicUpload = 'false',
    final String password = '',
    final String? sendPasswordByTalk,
    final String expireDate = '',
    final String note = '',
    final String label = '',
    final String? attributes,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files_sharing/api/v1/shares';
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
    if (path != null) {
      queryParameters['path'] = path;
    }
    if (permissions != null) {
      queryParameters['permissions'] = permissions.toString();
    }
    if (shareType != -1) {
      queryParameters['shareType'] = shareType.toString();
    }
    if (shareWith != null) {
      queryParameters['shareWith'] = shareWith;
    }
    if (publicUpload != 'false') {
      queryParameters['publicUpload'] = publicUpload;
    }
    if (password != '') {
      queryParameters['password'] = password;
    }
    if (sendPasswordByTalk != null) {
      queryParameters['sendPasswordByTalk'] = sendPasswordByTalk;
    }
    if (expireDate != '') {
      queryParameters['expireDate'] = expireDate;
    }
    if (note != '') {
      queryParameters['note'] = note;
    }
    if (label != '') {
      queryParameters['label'] = label;
    }
    if (attributes != null) {
      queryParameters['attributes'] = attributes;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiCreateShareResponse200ApplicationJson),
      )! as FilesSharingShareapiCreateShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get all shares relative to a file, including parent folders shares rights
  Future<FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson> getInheritedShares({
    required final String path,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files_sharing/api/v1/shares/inherited';
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
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson),
      )! as FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get all shares that are still pending
  Future<FilesSharingShareapiPendingSharesResponse200ApplicationJson> pendingShares({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/shares/pending';
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
        specifiedType: const FullType(FilesSharingShareapiPendingSharesResponse200ApplicationJson),
      )! as FilesSharingShareapiPendingSharesResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a specific share by id
  Future<FilesSharingShareapiGetShareResponse200ApplicationJson> getShare({
    required final String id,
    final int includeTags = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
    if (includeTags != 0) {
      queryParameters['include_tags'] = includeTags.toString();
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
        specifiedType: const FullType(FilesSharingShareapiGetShareResponse200ApplicationJson),
      )! as FilesSharingShareapiGetShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a share
  Future<FilesSharingShareapiUpdateShareResponse200ApplicationJson> updateShare({
    required final String id,
    final int? permissions,
    final String? password,
    final String? sendPasswordByTalk,
    final String? publicUpload,
    final String? expireDate,
    final String? note,
    final String? label,
    final String? hideDownload,
    final String? attributes,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
    if (permissions != null) {
      queryParameters['permissions'] = permissions.toString();
    }
    if (password != null) {
      queryParameters['password'] = password;
    }
    if (sendPasswordByTalk != null) {
      queryParameters['sendPasswordByTalk'] = sendPasswordByTalk;
    }
    if (publicUpload != null) {
      queryParameters['publicUpload'] = publicUpload;
    }
    if (expireDate != null) {
      queryParameters['expireDate'] = expireDate;
    }
    if (note != null) {
      queryParameters['note'] = note;
    }
    if (label != null) {
      queryParameters['label'] = label;
    }
    if (hideDownload != null) {
      queryParameters['hideDownload'] = hideDownload;
    }
    if (attributes != null) {
      queryParameters['attributes'] = attributes;
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
        specifiedType: const FullType(FilesSharingShareapiUpdateShareResponse200ApplicationJson),
      )! as FilesSharingShareapiUpdateShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a share
  Future<FilesSharingShareapiDeleteShareResponse200ApplicationJson> deleteShare({
    required final String id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
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
        specifiedType: const FullType(FilesSharingShareapiDeleteShareResponse200ApplicationJson),
      )! as FilesSharingShareapiDeleteShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Accept a share
  Future<FilesSharingShareapiAcceptShareResponse200ApplicationJson> acceptShare({
    required final String id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_sharing/api/v1/shares/pending/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
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
        specifiedType: const FullType(FilesSharingShareapiAcceptShareResponse200ApplicationJson),
      )! as FilesSharingShareapiAcceptShareResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingShareesapiClient {
  FilesSharingShareesapiClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Search for sharees
  Future<
      FilesSharingResponse<FilesSharingShareesapiSearchResponse200ApplicationJson,
          FilesSharingShareesapiShareesapiSearchHeaders>> search({
    final String search = '',
    final String? itemType,
    final int page = 1,
    final int perPage = 200,
    final ContentString<FilesSharingShareesapiSearchShareType>? shareType,
    final int lookup = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/sharees';
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
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (itemType != null) {
      queryParameters['itemType'] = itemType;
    }
    if (page != 1) {
      queryParameters['page'] = page.toString();
    }
    if (perPage != 200) {
      queryParameters['perPage'] = perPage.toString();
    }
    if (shareType != null) {
      queryParameters['shareType'] = _jsonSerializers.serialize(
        shareType,
        specifiedType: const FullType(ContentString, [FullType(FilesSharingShareesapiSearchShareType)]),
      );
    }
    if (lookup != 0) {
      queryParameters['lookup'] = lookup.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return FilesSharingResponse<FilesSharingShareesapiSearchResponse200ApplicationJson,
          FilesSharingShareesapiShareesapiSearchHeaders>(
        _jsonSerializers.deserialize(
          await response.jsonBody,
          specifiedType: const FullType(FilesSharingShareesapiSearchResponse200ApplicationJson),
        )! as FilesSharingShareesapiSearchResponse200ApplicationJson,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(FilesSharingShareesapiShareesapiSearchHeaders),
        )! as FilesSharingShareesapiShareesapiSearchHeaders,
      );
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find recommended sharees
  Future<FilesSharingShareesapiFindRecommendedResponse200ApplicationJson> findRecommended({
    required final String itemType,
    final ContentString<FilesSharingShareesapiFindRecommendedShareType>? shareType,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files_sharing/api/v1/sharees_recommended';
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
    queryParameters['itemType'] = itemType;
    if (shareType != null) {
      queryParameters['shareType'] = _jsonSerializers.serialize(
        shareType,
        specifiedType: const FullType(ContentString, [FullType(FilesSharingShareesapiFindRecommendedShareType)]),
      );
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
        specifiedType: const FullType(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson),
      )! as FilesSharingShareesapiFindRecommendedResponse200ApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class FilesSharingOCSMeta implements Built<FilesSharingOCSMeta, FilesSharingOCSMetaBuilder> {
  factory FilesSharingOCSMeta([final void Function(FilesSharingOCSMetaBuilder)? b]) = _$FilesSharingOCSMeta;

  // coverage:ignore-start
  const FilesSharingOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<FilesSharingOCSMeta> get serializer => _$filesSharingOCSMetaSerializer;
}

abstract class FilesSharingDeletedShare implements Built<FilesSharingDeletedShare, FilesSharingDeletedShareBuilder> {
  factory FilesSharingDeletedShare([final void Function(FilesSharingDeletedShareBuilder)? b]) =
      _$FilesSharingDeletedShare;

  // coverage:ignore-start
  const FilesSharingDeletedShare._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShare.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get id;
  @BuiltValueField(wireName: 'share_type')
  int get shareType;
  @BuiltValueField(wireName: 'uid_owner')
  String get uidOwner;
  @BuiltValueField(wireName: 'displayname_owner')
  String get displaynameOwner;
  int get permissions;
  int get stime;
  @BuiltValueField(wireName: 'uid_file_owner')
  String get uidFileOwner;
  @BuiltValueField(wireName: 'displayname_file_owner')
  String get displaynameFileOwner;
  String get path;
  @BuiltValueField(wireName: 'item_type')
  String get itemType;
  String get mimetype;
  int get storage;
  @BuiltValueField(wireName: 'item_source')
  int get itemSource;
  @BuiltValueField(wireName: 'file_source')
  int get fileSource;
  @BuiltValueField(wireName: 'file_parent')
  int get fileParent;
  @BuiltValueField(wireName: 'file_target')
  int get fileTarget;
  String? get expiration;
  @BuiltValueField(wireName: 'share_with')
  String? get shareWith;
  @BuiltValueField(wireName: 'share_with_displayname')
  String? get shareWithDisplayname;
  @BuiltValueField(wireName: 'share_with_link')
  String? get shareWithLink;
  static Serializer<FilesSharingDeletedShare> get serializer => _$filesSharingDeletedShareSerializer;
}

abstract class FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs,
            FilesSharingDeletedShareapiListResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingDeletedShareapiListResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingDeletedShare> get data;
  static Serializer<FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingDeletedShareapiListResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingDeletedShareapiListResponse200ApplicationJson
    implements
        Built<FilesSharingDeletedShareapiListResponse200ApplicationJson,
            FilesSharingDeletedShareapiListResponse200ApplicationJsonBuilder> {
  factory FilesSharingDeletedShareapiListResponse200ApplicationJson([
    final void Function(FilesSharingDeletedShareapiListResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiListResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiListResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiListResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingDeletedShareapiListResponse200ApplicationJson> get serializer =>
      _$filesSharingDeletedShareapiListResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs,
            FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingDeletedShareapiUndeleteResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson
    implements
        Built<FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson,
            FilesSharingDeletedShareapiUndeleteResponse200ApplicationJsonBuilder> {
  factory FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson([
    final void Function(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson> get serializer =>
      _$filesSharingDeletedShareapiUndeleteResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteShare implements Built<FilesSharingRemoteShare, FilesSharingRemoteShareBuilder> {
  factory FilesSharingRemoteShare([final void Function(FilesSharingRemoteShareBuilder)? b]) = _$FilesSharingRemoteShare;

  // coverage:ignore-start
  const FilesSharingRemoteShare._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteShare.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get accepted;
  @BuiltValueField(wireName: 'file_id')
  int? get fileId;
  int get id;
  String? get mimetype;
  String get mountpoint;
  int? get mtime;
  String get name;
  String get owner;
  int? get parent;
  int? get permissions;
  String get remote;
  @BuiltValueField(wireName: 'remote_id')
  String get remoteId;
  @BuiltValueField(wireName: 'share_token')
  String get shareToken;
  @BuiltValueField(wireName: 'share_type')
  int get shareType;
  String? get type;
  String get user;
  static Serializer<FilesSharingRemoteShare> get serializer => _$filesSharingRemoteShareSerializer;
}

abstract class FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs,
            FilesSharingRemoteGetSharesResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetSharesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingRemoteShare> get data;
  static Serializer<FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetSharesResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteGetSharesResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteGetSharesResponse200ApplicationJson,
            FilesSharingRemoteGetSharesResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteGetSharesResponse200ApplicationJson([
    final void Function(FilesSharingRemoteGetSharesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetSharesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetSharesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetSharesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteGetSharesResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteGetSharesResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs,
            FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingRemoteShare> get data;
  static Serializer<FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetOpenSharesResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteGetOpenSharesResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteGetOpenSharesResponse200ApplicationJson,
            FilesSharingRemoteGetOpenSharesResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteGetOpenSharesResponse200ApplicationJson([
    final void Function(FilesSharingRemoteGetOpenSharesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetOpenSharesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetOpenSharesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetOpenSharesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteGetOpenSharesResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteGetOpenSharesResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs,
            FilesSharingRemoteAcceptShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteAcceptShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteAcceptShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteAcceptShareResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteAcceptShareResponse200ApplicationJson,
            FilesSharingRemoteAcceptShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteAcceptShareResponse200ApplicationJson([
    final void Function(FilesSharingRemoteAcceptShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteAcceptShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteAcceptShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteAcceptShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteAcceptShareResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteAcceptShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs,
            FilesSharingRemoteDeclineShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteDeclineShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteDeclineShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteDeclineShareResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteDeclineShareResponse200ApplicationJson,
            FilesSharingRemoteDeclineShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteDeclineShareResponse200ApplicationJson([
    final void Function(FilesSharingRemoteDeclineShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteDeclineShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteDeclineShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteDeclineShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteDeclineShareResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteDeclineShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs,
            FilesSharingRemoteGetShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingRemoteShare get data;
  static Serializer<FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteGetShareResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteGetShareResponse200ApplicationJson,
            FilesSharingRemoteGetShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteGetShareResponse200ApplicationJson([
    final void Function(FilesSharingRemoteGetShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteGetShareResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteGetShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs,
            FilesSharingRemoteUnshareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingRemoteUnshareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteUnshareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingRemoteUnshareResponse200ApplicationJson
    implements
        Built<FilesSharingRemoteUnshareResponse200ApplicationJson,
            FilesSharingRemoteUnshareResponse200ApplicationJsonBuilder> {
  factory FilesSharingRemoteUnshareResponse200ApplicationJson([
    final void Function(FilesSharingRemoteUnshareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteUnshareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteUnshareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteUnshareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingRemoteUnshareResponse200ApplicationJson> get serializer =>
      _$filesSharingRemoteUnshareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareInfo_Size
    implements Built<FilesSharingShareInfo_Size, FilesSharingShareInfo_SizeBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareInfo_Size([final void Function(FilesSharingShareInfo_SizeBuilder)? b]) =
      _$FilesSharingShareInfo_Size;
  // coverage:ignore-start
  const FilesSharingShareInfo_Size._();

  JsonObject get data;
  int? get $int;
  num? get $num;
  static FilesSharingShareInfo_Size fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareInfo_Size> get serializer => _$FilesSharingShareInfo_SizeSerializer();
}

class _$FilesSharingShareInfo_SizeSerializer implements PrimitiveSerializer<FilesSharingShareInfo_Size> {
  @override
  final Iterable<Type> types = const [FilesSharingShareInfo_Size, _$FilesSharingShareInfo_Size];

  @override
  final String wireName = 'FilesSharingShareInfo_Size';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareInfo_Size object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareInfo_Size deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareInfo_SizeBuilder()..data = JsonObject(data);
    try {
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._$num = data as num?;
    } catch (_) {}
    assert([result._$int, result._$num].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class FilesSharingShareInfo implements Built<FilesSharingShareInfo, FilesSharingShareInfoBuilder> {
  factory FilesSharingShareInfo([final void Function(FilesSharingShareInfoBuilder)? b]) = _$FilesSharingShareInfo;

  // coverage:ignore-start
  const FilesSharingShareInfo._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareInfo.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int get id;
  int get parentId;
  int get mtime;
  String get name;
  int get permissions;
  String get mimetype;
  FilesSharingShareInfo_Size get size;
  String get type;
  String get etag;
  BuiltList<BuiltMap<String, JsonObject>>? get children;
  static Serializer<FilesSharingShareInfo> get serializer => _$filesSharingShareInfoSerializer;
}

abstract class FilesSharingShare_ItemSize
    implements Built<FilesSharingShare_ItemSize, FilesSharingShare_ItemSizeBuilder> {
  // coverage:ignore-end

  factory FilesSharingShare_ItemSize([final void Function(FilesSharingShare_ItemSizeBuilder)? b]) =
      _$FilesSharingShare_ItemSize;
  // coverage:ignore-start
  const FilesSharingShare_ItemSize._();

  JsonObject get data;
  num? get $num;
  int? get $int;
  static FilesSharingShare_ItemSize fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShare_ItemSize> get serializer => _$FilesSharingShare_ItemSizeSerializer();
}

class _$FilesSharingShare_ItemSizeSerializer implements PrimitiveSerializer<FilesSharingShare_ItemSize> {
  @override
  final Iterable<Type> types = const [FilesSharingShare_ItemSize, _$FilesSharingShare_ItemSize];

  @override
  final String wireName = 'FilesSharingShare_ItemSize';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShare_ItemSize object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShare_ItemSize deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShare_ItemSizeBuilder()..data = JsonObject(data);
    try {
      result._$num = data as num?;
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert([result._$num, result._$int].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

class FilesSharingShare_ItemType extends EnumClass {
  const FilesSharingShare_ItemType._(super.name);

  static const FilesSharingShare_ItemType file = _$filesSharingShareItemTypeFile;

  static const FilesSharingShare_ItemType folder = _$filesSharingShareItemTypeFolder;

  // coverage:ignore-start
  static BuiltSet<FilesSharingShare_ItemType> get values => _$filesSharingShareItemTypeValues;
  // coverage:ignore-end
  static FilesSharingShare_ItemType valueOf(final String name) => _$valueOfFilesSharingShare_ItemType(name);
  static Serializer<FilesSharingShare_ItemType> get serializer => _$filesSharingShareItemTypeSerializer;
}

abstract class FilesSharingShare_Status implements Built<FilesSharingShare_Status, FilesSharingShare_StatusBuilder> {
  factory FilesSharingShare_Status([final void Function(FilesSharingShare_StatusBuilder)? b]) =
      _$FilesSharingShare_Status;

  // coverage:ignore-start
  const FilesSharingShare_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShare_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int? get clearAt;
  String? get icon;
  String? get message;
  String? get status;
  static Serializer<FilesSharingShare_Status> get serializer => _$filesSharingShareStatusSerializer;
}

abstract class FilesSharingShare implements Built<FilesSharingShare, FilesSharingShareBuilder> {
  factory FilesSharingShare([final void Function(FilesSharingShareBuilder)? b]) = _$FilesSharingShare;

  // coverage:ignore-start
  const FilesSharingShare._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShare.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String? get attributes;
  @BuiltValueField(wireName: 'can_delete')
  bool get canDelete;
  @BuiltValueField(wireName: 'can_edit')
  bool get canEdit;
  @BuiltValueField(wireName: 'displayname_file_owner')
  String get displaynameFileOwner;
  @BuiltValueField(wireName: 'displayname_owner')
  String get displaynameOwner;
  String? get expiration;
  @BuiltValueField(wireName: 'file_parent')
  int get fileParent;
  @BuiltValueField(wireName: 'file_source')
  int get fileSource;
  @BuiltValueField(wireName: 'file_target')
  String get fileTarget;
  @BuiltValueField(wireName: 'has_preview')
  bool get hasPreview;
  @BuiltValueField(wireName: 'hide_download')
  int get hideDownload;
  String get id;
  @BuiltValueField(wireName: 'item_mtime')
  int get itemMtime;
  @BuiltValueField(wireName: 'item_permissions')
  int? get itemPermissions;
  @BuiltValueField(wireName: 'item_size')
  FilesSharingShare_ItemSize get itemSize;
  @BuiltValueField(wireName: 'item_source')
  int get itemSource;
  @BuiltValueField(wireName: 'item_type')
  FilesSharingShare_ItemType get itemType;
  String get label;
  @BuiltValueField(wireName: 'mail_send')
  int get mailSend;
  String get mimetype;
  String get note;
  JsonObject? get parent;
  String? get password;
  @BuiltValueField(wireName: 'password_expiration_time')
  String? get passwordExpirationTime;
  String? get path;
  int get permissions;
  @BuiltValueField(wireName: 'send_password_by_talk')
  bool? get sendPasswordByTalk;
  @BuiltValueField(wireName: 'share_type')
  int get shareType;
  @BuiltValueField(wireName: 'share_with')
  String? get shareWith;
  @BuiltValueField(wireName: 'share_with_avatar')
  String? get shareWithAvatar;
  @BuiltValueField(wireName: 'share_with_displayname')
  String? get shareWithDisplayname;
  @BuiltValueField(wireName: 'share_with_displayname_unique')
  String? get shareWithDisplaynameUnique;
  @BuiltValueField(wireName: 'share_with_link')
  String? get shareWithLink;
  FilesSharingShare_Status? get status;
  int get stime;
  int get storage;
  @BuiltValueField(wireName: 'storage_id')
  String get storageId;
  String? get token;
  @BuiltValueField(wireName: 'uid_file_owner')
  String get uidFileOwner;
  @BuiltValueField(wireName: 'uid_owner')
  String get uidOwner;
  String? get url;
  static Serializer<FilesSharingShare> get serializer => _$filesSharingShareSerializer;
}

abstract class FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs,
            FilesSharingShareapiGetSharesResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetSharesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  static Serializer<FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetSharesResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiGetSharesResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiGetSharesResponse200ApplicationJson,
            FilesSharingShareapiGetSharesResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiGetSharesResponse200ApplicationJson([
    final void Function(FilesSharingShareapiGetSharesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetSharesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetSharesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetSharesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiGetSharesResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiGetSharesResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs,
            FilesSharingShareapiCreateShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiCreateShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  static Serializer<FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiCreateShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiCreateShareResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiCreateShareResponse200ApplicationJson,
            FilesSharingShareapiCreateShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiCreateShareResponse200ApplicationJson([
    final void Function(FilesSharingShareapiCreateShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiCreateShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiCreateShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiCreateShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiCreateShareResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiCreateShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs,
            FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  static Serializer<FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetInheritedSharesResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson,
            FilesSharingShareapiGetInheritedSharesResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson([
    final void Function(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiGetInheritedSharesResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs,
            FilesSharingShareapiPendingSharesResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiPendingSharesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  static Serializer<FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiPendingSharesResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiPendingSharesResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiPendingSharesResponse200ApplicationJson,
            FilesSharingShareapiPendingSharesResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiPendingSharesResponse200ApplicationJson([
    final void Function(FilesSharingShareapiPendingSharesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiPendingSharesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiPendingSharesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiPendingSharesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiPendingSharesResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiPendingSharesResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs,
            FilesSharingShareapiGetShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  static Serializer<FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiGetShareResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiGetShareResponse200ApplicationJson,
            FilesSharingShareapiGetShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiGetShareResponse200ApplicationJson([
    final void Function(FilesSharingShareapiGetShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiGetShareResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiGetShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs,
            FilesSharingShareapiUpdateShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiUpdateShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  static Serializer<FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiUpdateShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiUpdateShareResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiUpdateShareResponse200ApplicationJson,
            FilesSharingShareapiUpdateShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiUpdateShareResponse200ApplicationJson([
    final void Function(FilesSharingShareapiUpdateShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiUpdateShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiUpdateShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiUpdateShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiUpdateShareResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiUpdateShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs,
            FilesSharingShareapiDeleteShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiDeleteShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiDeleteShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiDeleteShareResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiDeleteShareResponse200ApplicationJson,
            FilesSharingShareapiDeleteShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiDeleteShareResponse200ApplicationJson([
    final void Function(FilesSharingShareapiDeleteShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiDeleteShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiDeleteShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiDeleteShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiDeleteShareResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiDeleteShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs,
            FilesSharingShareapiAcceptShareResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareapiAcceptShareResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiAcceptShareResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareapiAcceptShareResponse200ApplicationJson
    implements
        Built<FilesSharingShareapiAcceptShareResponse200ApplicationJson,
            FilesSharingShareapiAcceptShareResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareapiAcceptShareResponse200ApplicationJson([
    final void Function(FilesSharingShareapiAcceptShareResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiAcceptShareResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiAcceptShareResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiAcceptShareResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareapiAcceptShareResponse200ApplicationJson> get serializer =>
      _$filesSharingShareapiAcceptShareResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareesapiSearchShareType
    implements Built<FilesSharingShareesapiSearchShareType, FilesSharingShareesapiSearchShareTypeBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareesapiSearchShareType([
    final void Function(FilesSharingShareesapiSearchShareTypeBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchShareType;
  // coverage:ignore-start
  const FilesSharingShareesapiSearchShareType._();

  JsonObject get data;
  int? get $int;
  BuiltList<int>? get builtListInt;
  static FilesSharingShareesapiSearchShareType fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareesapiSearchShareType> get serializer =>
      _$FilesSharingShareesapiSearchShareTypeSerializer();
}

class _$FilesSharingShareesapiSearchShareTypeSerializer
    implements PrimitiveSerializer<FilesSharingShareesapiSearchShareType> {
  @override
  final Iterable<Type> types = const [FilesSharingShareesapiSearchShareType, _$FilesSharingShareesapiSearchShareType];

  @override
  final String wireName = 'FilesSharingShareesapiSearchShareType';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareesapiSearchShareType object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareesapiSearchShareType deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareesapiSearchShareTypeBuilder()..data = JsonObject(data);
    try {
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._builtListInt = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      )! as BuiltList<int>)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._$int, result._builtListInt].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class FilesSharingShareesapiShareesapiSearchHeaders
    implements
        Built<FilesSharingShareesapiShareesapiSearchHeaders, FilesSharingShareesapiShareesapiSearchHeadersBuilder> {
  factory FilesSharingShareesapiShareesapiSearchHeaders([
    final void Function(FilesSharingShareesapiShareesapiSearchHeadersBuilder)? b,
  ]) = _$FilesSharingShareesapiShareesapiSearchHeaders;

  // coverage:ignore-start
  const FilesSharingShareesapiShareesapiSearchHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiShareesapiSearchHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String? get link;
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareesapiShareesapiSearchHeaders> get serializer =>
      _$FilesSharingShareesapiShareesapiSearchHeadersSerializer();
}

class _$FilesSharingShareesapiShareesapiSearchHeadersSerializer
    implements StructuredSerializer<FilesSharingShareesapiShareesapiSearchHeaders> {
  @override
  final Iterable<Type> types = const [
    FilesSharingShareesapiShareesapiSearchHeaders,
    _$FilesSharingShareesapiShareesapiSearchHeaders,
  ];

  @override
  final String wireName = 'FilesSharingShareesapiShareesapiSearchHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesSharingShareesapiShareesapiSearchHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  FilesSharingShareesapiShareesapiSearchHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareesapiShareesapiSearchHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'link':
          result.link = value;
      }
    }

    return result.build();
  }
}

abstract class FilesSharingSharee implements Built<FilesSharingSharee, FilesSharingShareeBuilder> {
  factory FilesSharingSharee([final void Function(FilesSharingShareeBuilder)? b]) = _$FilesSharingSharee;

  // coverage:ignore-start
  const FilesSharingSharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingSharee.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int? get count;
  String get label;
  static Serializer<FilesSharingSharee> get serializer => _$filesSharingShareeSerializer;
}

abstract class FilesSharingShareeValue implements Built<FilesSharingShareeValue, FilesSharingShareeValueBuilder> {
  factory FilesSharingShareeValue([final void Function(FilesSharingShareeValueBuilder)? b]) = _$FilesSharingShareeValue;

  // coverage:ignore-start
  const FilesSharingShareeValue._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeValue.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int get shareType;
  String get shareWith;
  static Serializer<FilesSharingShareeValue> get serializer => _$filesSharingShareeValueSerializer;
}

abstract class FilesSharingShareeCircle1_Value1
    implements Built<FilesSharingShareeCircle1_Value1, FilesSharingShareeCircle1_Value1Builder> {
  factory FilesSharingShareeCircle1_Value1([final void Function(FilesSharingShareeCircle1_Value1Builder)? b]) =
      _$FilesSharingShareeCircle1_Value1;

  // coverage:ignore-start
  const FilesSharingShareeCircle1_Value1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeCircle1_Value1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get circle;
  static Serializer<FilesSharingShareeCircle1_Value1> get serializer => _$filesSharingShareeCircle1Value1Serializer;
}

abstract class FilesSharingShareeCircle1_Value
    implements Built<FilesSharingShareeCircle1_Value, FilesSharingShareeCircle1_ValueBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeCircle1_Value([final void Function(FilesSharingShareeCircle1_ValueBuilder)? b]) =
      _$FilesSharingShareeCircle1_Value;
  // coverage:ignore-start
  const FilesSharingShareeCircle1_Value._();

  JsonObject get data;
  FilesSharingShareeValue get shareeValue;
  FilesSharingShareeCircle1_Value1 get shareeCircle1Value1;
  static FilesSharingShareeCircle1_Value fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeCircle1_Value> get serializer => _$FilesSharingShareeCircle1_ValueSerializer();
}

class _$FilesSharingShareeCircle1_ValueSerializer implements PrimitiveSerializer<FilesSharingShareeCircle1_Value> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeCircle1_Value, _$FilesSharingShareeCircle1_Value];

  @override
  final String wireName = 'FilesSharingShareeCircle1_Value';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeCircle1_Value object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeCircle1_Value deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeCircle1_ValueBuilder()..data = JsonObject(data);
    result.shareeValue.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeValue),
      )! as FilesSharingShareeValue,
    );
    result.shareeCircle1Value1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeCircle1_Value1),
      )! as FilesSharingShareeCircle1_Value1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeCircle1 implements Built<FilesSharingShareeCircle1, FilesSharingShareeCircle1Builder> {
  factory FilesSharingShareeCircle1([final void Function(FilesSharingShareeCircle1Builder)? b]) =
      _$FilesSharingShareeCircle1;

  // coverage:ignore-start
  const FilesSharingShareeCircle1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeCircle1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get shareWithDescription;
  FilesSharingShareeCircle1_Value get value;
  static Serializer<FilesSharingShareeCircle1> get serializer => _$filesSharingShareeCircle1Serializer;
}

abstract class FilesSharingShareeCircle implements Built<FilesSharingShareeCircle, FilesSharingShareeCircleBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeCircle([final void Function(FilesSharingShareeCircleBuilder)? b]) =
      _$FilesSharingShareeCircle;
  // coverage:ignore-start
  const FilesSharingShareeCircle._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeCircle1 get shareeCircle1;
  static FilesSharingShareeCircle fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeCircle> get serializer => _$FilesSharingShareeCircleSerializer();
}

class _$FilesSharingShareeCircleSerializer implements PrimitiveSerializer<FilesSharingShareeCircle> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeCircle, _$FilesSharingShareeCircle];

  @override
  final String wireName = 'FilesSharingShareeCircle';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeCircle object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeCircle deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeCircleBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeCircle1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeCircle1),
      )! as FilesSharingShareeCircle1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeEmail1 implements Built<FilesSharingShareeEmail1, FilesSharingShareeEmail1Builder> {
  factory FilesSharingShareeEmail1([final void Function(FilesSharingShareeEmail1Builder)? b]) =
      _$FilesSharingShareeEmail1;

  // coverage:ignore-start
  const FilesSharingShareeEmail1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeEmail1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get uuid;
  String get name;
  String get type;
  String get shareWithDisplayNameUnique;
  FilesSharingShareeValue get value;
  static Serializer<FilesSharingShareeEmail1> get serializer => _$filesSharingShareeEmail1Serializer;
}

abstract class FilesSharingShareeEmail implements Built<FilesSharingShareeEmail, FilesSharingShareeEmailBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeEmail([final void Function(FilesSharingShareeEmailBuilder)? b]) = _$FilesSharingShareeEmail;
  // coverage:ignore-start
  const FilesSharingShareeEmail._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeEmail1 get shareeEmail1;
  static FilesSharingShareeEmail fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeEmail> get serializer => _$FilesSharingShareeEmailSerializer();
}

class _$FilesSharingShareeEmailSerializer implements PrimitiveSerializer<FilesSharingShareeEmail> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeEmail, _$FilesSharingShareeEmail];

  @override
  final String wireName = 'FilesSharingShareeEmail';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeEmail object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeEmail deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeEmailBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeEmail1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeEmail1),
      )! as FilesSharingShareeEmail1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeRemoteGroup1_Value1
    implements Built<FilesSharingShareeRemoteGroup1_Value1, FilesSharingShareeRemoteGroup1_Value1Builder> {
  factory FilesSharingShareeRemoteGroup1_Value1([
    final void Function(FilesSharingShareeRemoteGroup1_Value1Builder)? b,
  ]) = _$FilesSharingShareeRemoteGroup1_Value1;

  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup1_Value1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemoteGroup1_Value1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get server;
  static Serializer<FilesSharingShareeRemoteGroup1_Value1> get serializer =>
      _$filesSharingShareeRemoteGroup1Value1Serializer;
}

abstract class FilesSharingShareeRemoteGroup1_Value
    implements Built<FilesSharingShareeRemoteGroup1_Value, FilesSharingShareeRemoteGroup1_ValueBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeRemoteGroup1_Value([final void Function(FilesSharingShareeRemoteGroup1_ValueBuilder)? b]) =
      _$FilesSharingShareeRemoteGroup1_Value;
  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup1_Value._();

  JsonObject get data;
  FilesSharingShareeValue get shareeValue;
  FilesSharingShareeRemoteGroup1_Value1 get shareeRemoteGroup1Value1;
  static FilesSharingShareeRemoteGroup1_Value fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeRemoteGroup1_Value> get serializer =>
      _$FilesSharingShareeRemoteGroup1_ValueSerializer();
}

class _$FilesSharingShareeRemoteGroup1_ValueSerializer
    implements PrimitiveSerializer<FilesSharingShareeRemoteGroup1_Value> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeRemoteGroup1_Value, _$FilesSharingShareeRemoteGroup1_Value];

  @override
  final String wireName = 'FilesSharingShareeRemoteGroup1_Value';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeRemoteGroup1_Value object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeRemoteGroup1_Value deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeRemoteGroup1_ValueBuilder()..data = JsonObject(data);
    result.shareeValue.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeValue),
      )! as FilesSharingShareeValue,
    );
    result.shareeRemoteGroup1Value1.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingShareeRemoteGroup1_Value1))!
          as FilesSharingShareeRemoteGroup1_Value1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeRemoteGroup1
    implements Built<FilesSharingShareeRemoteGroup1, FilesSharingShareeRemoteGroup1Builder> {
  factory FilesSharingShareeRemoteGroup1([final void Function(FilesSharingShareeRemoteGroup1Builder)? b]) =
      _$FilesSharingShareeRemoteGroup1;

  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemoteGroup1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get guid;
  String get name;
  FilesSharingShareeRemoteGroup1_Value get value;
  static Serializer<FilesSharingShareeRemoteGroup1> get serializer => _$filesSharingShareeRemoteGroup1Serializer;
}

abstract class FilesSharingShareeRemoteGroup
    implements Built<FilesSharingShareeRemoteGroup, FilesSharingShareeRemoteGroupBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeRemoteGroup([final void Function(FilesSharingShareeRemoteGroupBuilder)? b]) =
      _$FilesSharingShareeRemoteGroup;
  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeRemoteGroup1 get shareeRemoteGroup1;
  static FilesSharingShareeRemoteGroup fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeRemoteGroup> get serializer => _$FilesSharingShareeRemoteGroupSerializer();
}

class _$FilesSharingShareeRemoteGroupSerializer implements PrimitiveSerializer<FilesSharingShareeRemoteGroup> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeRemoteGroup, _$FilesSharingShareeRemoteGroup];

  @override
  final String wireName = 'FilesSharingShareeRemoteGroup';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeRemoteGroup object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeRemoteGroup deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeRemoteGroupBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeRemoteGroup1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeRemoteGroup1),
      )! as FilesSharingShareeRemoteGroup1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeRemote1_Value1
    implements Built<FilesSharingShareeRemote1_Value1, FilesSharingShareeRemote1_Value1Builder> {
  factory FilesSharingShareeRemote1_Value1([final void Function(FilesSharingShareeRemote1_Value1Builder)? b]) =
      _$FilesSharingShareeRemote1_Value1;

  // coverage:ignore-start
  const FilesSharingShareeRemote1_Value1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemote1_Value1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get server;
  static Serializer<FilesSharingShareeRemote1_Value1> get serializer => _$filesSharingShareeRemote1Value1Serializer;
}

abstract class FilesSharingShareeRemote1_Value
    implements Built<FilesSharingShareeRemote1_Value, FilesSharingShareeRemote1_ValueBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeRemote1_Value([final void Function(FilesSharingShareeRemote1_ValueBuilder)? b]) =
      _$FilesSharingShareeRemote1_Value;
  // coverage:ignore-start
  const FilesSharingShareeRemote1_Value._();

  JsonObject get data;
  FilesSharingShareeValue get shareeValue;
  FilesSharingShareeRemote1_Value1 get shareeRemote1Value1;
  static FilesSharingShareeRemote1_Value fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeRemote1_Value> get serializer => _$FilesSharingShareeRemote1_ValueSerializer();
}

class _$FilesSharingShareeRemote1_ValueSerializer implements PrimitiveSerializer<FilesSharingShareeRemote1_Value> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeRemote1_Value, _$FilesSharingShareeRemote1_Value];

  @override
  final String wireName = 'FilesSharingShareeRemote1_Value';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeRemote1_Value object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeRemote1_Value deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeRemote1_ValueBuilder()..data = JsonObject(data);
    result.shareeValue.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeValue),
      )! as FilesSharingShareeValue,
    );
    result.shareeRemote1Value1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeRemote1_Value1),
      )! as FilesSharingShareeRemote1_Value1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeRemote1 implements Built<FilesSharingShareeRemote1, FilesSharingShareeRemote1Builder> {
  factory FilesSharingShareeRemote1([final void Function(FilesSharingShareeRemote1Builder)? b]) =
      _$FilesSharingShareeRemote1;

  // coverage:ignore-start
  const FilesSharingShareeRemote1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemote1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get uuid;
  String get name;
  String get type;
  FilesSharingShareeRemote1_Value get value;
  static Serializer<FilesSharingShareeRemote1> get serializer => _$filesSharingShareeRemote1Serializer;
}

abstract class FilesSharingShareeRemote implements Built<FilesSharingShareeRemote, FilesSharingShareeRemoteBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeRemote([final void Function(FilesSharingShareeRemoteBuilder)? b]) =
      _$FilesSharingShareeRemote;
  // coverage:ignore-start
  const FilesSharingShareeRemote._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeRemote1 get shareeRemote1;
  static FilesSharingShareeRemote fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeRemote> get serializer => _$FilesSharingShareeRemoteSerializer();
}

class _$FilesSharingShareeRemoteSerializer implements PrimitiveSerializer<FilesSharingShareeRemote> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeRemote, _$FilesSharingShareeRemote];

  @override
  final String wireName = 'FilesSharingShareeRemote';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeRemote object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeRemote deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeRemoteBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeRemote1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeRemote1),
      )! as FilesSharingShareeRemote1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeUser1_Status
    implements Built<FilesSharingShareeUser1_Status, FilesSharingShareeUser1_StatusBuilder> {
  factory FilesSharingShareeUser1_Status([final void Function(FilesSharingShareeUser1_StatusBuilder)? b]) =
      _$FilesSharingShareeUser1_Status;

  // coverage:ignore-start
  const FilesSharingShareeUser1_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeUser1_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  String get message;
  String get icon;
  int? get clearAt;
  static Serializer<FilesSharingShareeUser1_Status> get serializer => _$filesSharingShareeUser1StatusSerializer;
}

abstract class FilesSharingShareeUser1 implements Built<FilesSharingShareeUser1, FilesSharingShareeUser1Builder> {
  factory FilesSharingShareeUser1([final void Function(FilesSharingShareeUser1Builder)? b]) = _$FilesSharingShareeUser1;

  // coverage:ignore-start
  const FilesSharingShareeUser1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeUser1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get subline;
  String get icon;
  String get shareWithDisplayNameUnique;
  FilesSharingShareeUser1_Status get status;
  FilesSharingShareeValue get value;
  static Serializer<FilesSharingShareeUser1> get serializer => _$filesSharingShareeUser1Serializer;
}

abstract class FilesSharingShareeUser implements Built<FilesSharingShareeUser, FilesSharingShareeUserBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeUser([final void Function(FilesSharingShareeUserBuilder)? b]) = _$FilesSharingShareeUser;
  // coverage:ignore-start
  const FilesSharingShareeUser._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeUser1 get shareeUser1;
  static FilesSharingShareeUser fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeUser> get serializer => _$FilesSharingShareeUserSerializer();
}

class _$FilesSharingShareeUserSerializer implements PrimitiveSerializer<FilesSharingShareeUser> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeUser, _$FilesSharingShareeUser];

  @override
  final String wireName = 'FilesSharingShareeUser';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeUser object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeUser deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeUserBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeUser1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeUser1),
      )! as FilesSharingShareeUser1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareesSearchResult_Exact
    implements Built<FilesSharingShareesSearchResult_Exact, FilesSharingShareesSearchResult_ExactBuilder> {
  factory FilesSharingShareesSearchResult_Exact([
    final void Function(FilesSharingShareesSearchResult_ExactBuilder)? b,
  ]) = _$FilesSharingShareesSearchResult_Exact;

  // coverage:ignore-start
  const FilesSharingShareesSearchResult_Exact._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesSearchResult_Exact.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<FilesSharingShareeCircle> get circles;
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingSharee> get rooms;
  BuiltList<FilesSharingShareeUser> get users;
  static Serializer<FilesSharingShareesSearchResult_Exact> get serializer =>
      _$filesSharingShareesSearchResultExactSerializer;
}

abstract class FilesSharingLookup implements Built<FilesSharingLookup, FilesSharingLookupBuilder> {
  factory FilesSharingLookup([final void Function(FilesSharingLookupBuilder)? b]) = _$FilesSharingLookup;

  // coverage:ignore-start
  const FilesSharingLookup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingLookup.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get value;
  int get verified;
  static Serializer<FilesSharingLookup> get serializer => _$filesSharingLookupSerializer;
}

abstract class FilesSharingShareeLookup1_Extra
    implements Built<FilesSharingShareeLookup1_Extra, FilesSharingShareeLookup1_ExtraBuilder> {
  factory FilesSharingShareeLookup1_Extra([final void Function(FilesSharingShareeLookup1_ExtraBuilder)? b]) =
      _$FilesSharingShareeLookup1_Extra;

  // coverage:ignore-start
  const FilesSharingShareeLookup1_Extra._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup1_Extra.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get federationId;
  FilesSharingLookup? get name;
  FilesSharingLookup? get email;
  FilesSharingLookup? get address;
  FilesSharingLookup? get website;
  FilesSharingLookup? get twitter;
  FilesSharingLookup? get phone;
  @BuiltValueField(wireName: 'twitter_signature')
  FilesSharingLookup? get twitterSignature;
  @BuiltValueField(wireName: 'website_signature')
  FilesSharingLookup? get websiteSignature;
  FilesSharingLookup? get userid;
  static Serializer<FilesSharingShareeLookup1_Extra> get serializer => _$filesSharingShareeLookup1ExtraSerializer;
}

abstract class FilesSharingShareeLookup1_Value1
    implements Built<FilesSharingShareeLookup1_Value1, FilesSharingShareeLookup1_Value1Builder> {
  factory FilesSharingShareeLookup1_Value1([final void Function(FilesSharingShareeLookup1_Value1Builder)? b]) =
      _$FilesSharingShareeLookup1_Value1;

  // coverage:ignore-start
  const FilesSharingShareeLookup1_Value1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup1_Value1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get globalScale;
  static Serializer<FilesSharingShareeLookup1_Value1> get serializer => _$filesSharingShareeLookup1Value1Serializer;
}

abstract class FilesSharingShareeLookup1_Value
    implements Built<FilesSharingShareeLookup1_Value, FilesSharingShareeLookup1_ValueBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeLookup1_Value([final void Function(FilesSharingShareeLookup1_ValueBuilder)? b]) =
      _$FilesSharingShareeLookup1_Value;
  // coverage:ignore-start
  const FilesSharingShareeLookup1_Value._();

  JsonObject get data;
  FilesSharingShareeValue get shareeValue;
  FilesSharingShareeLookup1_Value1 get shareeLookup1Value1;
  static FilesSharingShareeLookup1_Value fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeLookup1_Value> get serializer => _$FilesSharingShareeLookup1_ValueSerializer();
}

class _$FilesSharingShareeLookup1_ValueSerializer implements PrimitiveSerializer<FilesSharingShareeLookup1_Value> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeLookup1_Value, _$FilesSharingShareeLookup1_Value];

  @override
  final String wireName = 'FilesSharingShareeLookup1_Value';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeLookup1_Value object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeLookup1_Value deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeLookup1_ValueBuilder()..data = JsonObject(data);
    result.shareeValue.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeValue),
      )! as FilesSharingShareeValue,
    );
    result.shareeLookup1Value1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeLookup1_Value1),
      )! as FilesSharingShareeLookup1_Value1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareeLookup1 implements Built<FilesSharingShareeLookup1, FilesSharingShareeLookup1Builder> {
  factory FilesSharingShareeLookup1([final void Function(FilesSharingShareeLookup1Builder)? b]) =
      _$FilesSharingShareeLookup1;

  // coverage:ignore-start
  const FilesSharingShareeLookup1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup1.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareeLookup1_Extra get extra;
  FilesSharingShareeLookup1_Value get value;
  static Serializer<FilesSharingShareeLookup1> get serializer => _$filesSharingShareeLookup1Serializer;
}

abstract class FilesSharingShareeLookup implements Built<FilesSharingShareeLookup, FilesSharingShareeLookupBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareeLookup([final void Function(FilesSharingShareeLookupBuilder)? b]) =
      _$FilesSharingShareeLookup;
  // coverage:ignore-start
  const FilesSharingShareeLookup._();

  JsonObject get data;
  FilesSharingSharee get sharee;
  FilesSharingShareeLookup1 get shareeLookup1;
  static FilesSharingShareeLookup fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareeLookup> get serializer => _$FilesSharingShareeLookupSerializer();
}

class _$FilesSharingShareeLookupSerializer implements PrimitiveSerializer<FilesSharingShareeLookup> {
  @override
  final Iterable<Type> types = const [FilesSharingShareeLookup, _$FilesSharingShareeLookup];

  @override
  final String wireName = 'FilesSharingShareeLookup';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareeLookup object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareeLookup deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareeLookupBuilder()..data = JsonObject(data);
    result.sharee.replace(
      _jsonSerializers.deserialize(data, specifiedType: const FullType(FilesSharingSharee))! as FilesSharingSharee,
    );
    result.shareeLookup1.replace(
      _jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(FilesSharingShareeLookup1),
      )! as FilesSharingShareeLookup1,
    );
    return result.build();
  }
}

abstract class FilesSharingShareesSearchResult
    implements Built<FilesSharingShareesSearchResult, FilesSharingShareesSearchResultBuilder> {
  factory FilesSharingShareesSearchResult([final void Function(FilesSharingShareesSearchResultBuilder)? b]) =
      _$FilesSharingShareesSearchResult;

  // coverage:ignore-start
  const FilesSharingShareesSearchResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesSearchResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareesSearchResult_Exact get exact;
  BuiltList<FilesSharingShareeCircle> get circles;
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  BuiltList<FilesSharingShareeLookup> get lookup;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingSharee> get rooms;
  BuiltList<FilesSharingShareeUser> get users;
  bool get lookupEnabled;
  static Serializer<FilesSharingShareesSearchResult> get serializer => _$filesSharingShareesSearchResultSerializer;
}

abstract class FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs,
            FilesSharingShareesapiSearchResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareesapiSearchResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingShareesSearchResult get data;
  static Serializer<FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareesapiSearchResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareesapiSearchResponse200ApplicationJson
    implements
        Built<FilesSharingShareesapiSearchResponse200ApplicationJson,
            FilesSharingShareesapiSearchResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareesapiSearchResponse200ApplicationJson([
    final void Function(FilesSharingShareesapiSearchResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareesapiSearchResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiSearchResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareesapiSearchResponse200ApplicationJson> get serializer =>
      _$filesSharingShareesapiSearchResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingShareesapiFindRecommendedShareType
    implements
        Built<FilesSharingShareesapiFindRecommendedShareType, FilesSharingShareesapiFindRecommendedShareTypeBuilder> {
  // coverage:ignore-end

  factory FilesSharingShareesapiFindRecommendedShareType([
    final void Function(FilesSharingShareesapiFindRecommendedShareTypeBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedShareType;
  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedShareType._();

  JsonObject get data;
  int? get $int;
  BuiltList<int>? get builtListInt;
  static FilesSharingShareesapiFindRecommendedShareType fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesSharingShareesapiFindRecommendedShareType> get serializer =>
      _$FilesSharingShareesapiFindRecommendedShareTypeSerializer();
}

class _$FilesSharingShareesapiFindRecommendedShareTypeSerializer
    implements PrimitiveSerializer<FilesSharingShareesapiFindRecommendedShareType> {
  @override
  final Iterable<Type> types = const [
    FilesSharingShareesapiFindRecommendedShareType,
    _$FilesSharingShareesapiFindRecommendedShareType,
  ];

  @override
  final String wireName = 'FilesSharingShareesapiFindRecommendedShareType';

  @override
  Object serialize(
    final Serializers serializers,
    final FilesSharingShareesapiFindRecommendedShareType object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  FilesSharingShareesapiFindRecommendedShareType deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesSharingShareesapiFindRecommendedShareTypeBuilder()..data = JsonObject(data);
    try {
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._builtListInt = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      )! as BuiltList<int>)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._$int, result._builtListInt].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class FilesSharingShareesRecommendedResult_Exact
    implements Built<FilesSharingShareesRecommendedResult_Exact, FilesSharingShareesRecommendedResult_ExactBuilder> {
  factory FilesSharingShareesRecommendedResult_Exact([
    final void Function(FilesSharingShareesRecommendedResult_ExactBuilder)? b,
  ]) = _$FilesSharingShareesRecommendedResult_Exact;

  // coverage:ignore-start
  const FilesSharingShareesRecommendedResult_Exact._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesRecommendedResult_Exact.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingShareeUser> get users;
  static Serializer<FilesSharingShareesRecommendedResult_Exact> get serializer =>
      _$filesSharingShareesRecommendedResultExactSerializer;
}

abstract class FilesSharingShareesRecommendedResult
    implements Built<FilesSharingShareesRecommendedResult, FilesSharingShareesRecommendedResultBuilder> {
  factory FilesSharingShareesRecommendedResult([final void Function(FilesSharingShareesRecommendedResultBuilder)? b]) =
      _$FilesSharingShareesRecommendedResult;

  // coverage:ignore-start
  const FilesSharingShareesRecommendedResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesRecommendedResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareesRecommendedResult_Exact get exact;
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingShareeUser> get users;
  static Serializer<FilesSharingShareesRecommendedResult> get serializer =>
      _$filesSharingShareesRecommendedResultSerializer;
}

abstract class FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs
    implements
        Built<FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs,
            FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_OcsBuilder> {
  factory FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs([
    final void Function(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingOCSMeta get meta;
  FilesSharingShareesRecommendedResult get data;
  static Serializer<FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs> get serializer =>
      _$filesSharingShareesapiFindRecommendedResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesSharingShareesapiFindRecommendedResponse200ApplicationJson
    implements
        Built<FilesSharingShareesapiFindRecommendedResponse200ApplicationJson,
            FilesSharingShareesapiFindRecommendedResponse200ApplicationJsonBuilder> {
  factory FilesSharingShareesapiFindRecommendedResponse200ApplicationJson([
    final void Function(FilesSharingShareesapiFindRecommendedResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiFindRecommendedResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesSharingShareesapiFindRecommendedResponse200ApplicationJson> get serializer =>
      _$filesSharingShareesapiFindRecommendedResponse200ApplicationJsonSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_Password
    implements
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
  bool get enforced;
  bool get askForOptionalPassword;
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_Password> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicPasswordSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDate
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote
    implements
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
  bool get enabled;
  int? get days;
  bool? get enforced;
  static Serializer<FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Public
    implements
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
  static Serializer<FilesSharingCapabilities_FilesSharing_Public> get serializer =>
      _$filesSharingCapabilitiesFilesSharingPublicSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_User_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<FilesSharingCapabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserExpireDateSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_User
    implements Built<FilesSharingCapabilities_FilesSharing_User, FilesSharingCapabilities_FilesSharing_UserBuilder> {
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
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_User_ExpireDate? get expireDate;
  static Serializer<FilesSharingCapabilities_FilesSharing_User> get serializer =>
      _$filesSharingCapabilitiesFilesSharingUserSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Group_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<FilesSharingCapabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupExpireDateSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Group
    implements Built<FilesSharingCapabilities_FilesSharing_Group, FilesSharingCapabilities_FilesSharing_GroupBuilder> {
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
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Group_ExpireDate? get expireDate;
  static Serializer<FilesSharingCapabilities_FilesSharing_Group> get serializer =>
      _$filesSharingCapabilitiesFilesSharingGroupSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDate
    implements
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
  bool get enabled;
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported
    implements
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
  bool get enabled;
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Federation
    implements
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
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
  static Serializer<FilesSharingCapabilities_FilesSharing_Federation> get serializer =>
      _$filesSharingCapabilitiesFilesSharingFederationSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing_Sharee
    implements
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
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
  static Serializer<FilesSharingCapabilities_FilesSharing_Sharee> get serializer =>
      _$filesSharingCapabilitiesFilesSharingShareeSerializer;
}

abstract class FilesSharingCapabilities_FilesSharing
    implements Built<FilesSharingCapabilities_FilesSharing, FilesSharingCapabilities_FilesSharingBuilder> {
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
  static Serializer<FilesSharingCapabilities_FilesSharing> get serializer =>
      _$filesSharingCapabilitiesFilesSharingSerializer;
}

abstract class FilesSharingCapabilities implements Built<FilesSharingCapabilities, FilesSharingCapabilitiesBuilder> {
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
  @BuiltValueField(wireName: 'files_sharing')
  FilesSharingCapabilities_FilesSharing get filesSharing;
  static Serializer<FilesSharingCapabilities> get serializer => _$filesSharingCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiListResponse200ApplicationJson),
        FilesSharingDeletedShareapiListResponse200ApplicationJson.new,
      )
      ..add(FilesSharingDeletedShareapiListResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs),
        FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingDeletedShareapiListResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingOCSMeta), FilesSharingOCSMeta.new)
      ..add(FilesSharingOCSMeta.serializer)
      ..addBuilderFactory(const FullType(FilesSharingDeletedShare), FilesSharingDeletedShare.new)
      ..add(FilesSharingDeletedShare.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingDeletedShare)]),
        ListBuilder<FilesSharingDeletedShare>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson),
        FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson.new,
      )
      ..add(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs),
        FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingDeletedShareapiUndeleteResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetSharesResponse200ApplicationJson),
        FilesSharingRemoteGetSharesResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetSharesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs),
        FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetSharesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingRemoteShare), FilesSharingRemoteShare.new)
      ..add(FilesSharingRemoteShare.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingRemoteShare)]),
        ListBuilder<FilesSharingRemoteShare>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson),
        FilesSharingRemoteGetOpenSharesResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs),
        FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetOpenSharesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteAcceptShareResponse200ApplicationJson),
        FilesSharingRemoteAcceptShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteAcceptShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs),
        FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteAcceptShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteDeclineShareResponse200ApplicationJson),
        FilesSharingRemoteDeclineShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteDeclineShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs),
        FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteDeclineShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetShareResponse200ApplicationJson),
        FilesSharingRemoteGetShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs),
        FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteUnshareResponse200ApplicationJson),
        FilesSharingRemoteUnshareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingRemoteUnshareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs),
        FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteUnshareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareInfo), FilesSharingShareInfo.new)
      ..add(FilesSharingShareInfo.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareInfo_Size), FilesSharingShareInfo_Size.new)
      ..add(FilesSharingShareInfo_Size.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
        ListBuilder<BuiltMap>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetSharesResponse200ApplicationJson),
        FilesSharingShareapiGetSharesResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetSharesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs),
        FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetSharesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare), FilesSharingShare.new)
      ..add(FilesSharingShare.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare_ItemSize), FilesSharingShare_ItemSize.new)
      ..add(FilesSharingShare_ItemSize.serializer)
      ..add(FilesSharingShare_ItemType.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare_Status), FilesSharingShare_Status.new)
      ..add(FilesSharingShare_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(FilesSharingShare)]), ListBuilder<FilesSharingShare>.new)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiCreateShareResponse200ApplicationJson),
        FilesSharingShareapiCreateShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiCreateShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs),
        FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiCreateShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson),
        FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs),
        FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetInheritedSharesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiPendingSharesResponse200ApplicationJson),
        FilesSharingShareapiPendingSharesResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiPendingSharesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs),
        FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiPendingSharesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetShareResponse200ApplicationJson),
        FilesSharingShareapiGetShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs),
        FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiUpdateShareResponse200ApplicationJson),
        FilesSharingShareapiUpdateShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiUpdateShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs),
        FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiUpdateShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiDeleteShareResponse200ApplicationJson),
        FilesSharingShareapiDeleteShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiDeleteShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs),
        FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiDeleteShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiAcceptShareResponse200ApplicationJson),
        FilesSharingShareapiAcceptShareResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareapiAcceptShareResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs),
        FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiAcceptShareResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiSearchShareType),
        FilesSharingShareesapiSearchShareType.new,
      )
      ..add(FilesSharingShareesapiSearchShareType.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(FilesSharingShareesapiSearchShareType)]),
        ContentString<FilesSharingShareesapiSearchShareType>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiShareesapiSearchHeaders),
        FilesSharingShareesapiShareesapiSearchHeaders.new,
      )
      ..add(FilesSharingShareesapiShareesapiSearchHeaders.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiSearchResponse200ApplicationJson),
        FilesSharingShareesapiSearchResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareesapiSearchResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs),
        FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareesapiSearchResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareesSearchResult), FilesSharingShareesSearchResult.new)
      ..add(FilesSharingShareesSearchResult.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesSearchResult_Exact),
        FilesSharingShareesSearchResult_Exact.new,
      )
      ..add(FilesSharingShareesSearchResult_Exact.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeCircle), FilesSharingShareeCircle.new)
      ..add(FilesSharingShareeCircle.serializer)
      ..addBuilderFactory(const FullType(FilesSharingSharee), FilesSharingSharee.new)
      ..add(FilesSharingSharee.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeCircle1), FilesSharingShareeCircle1.new)
      ..add(FilesSharingShareeCircle1.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeCircle1_Value), FilesSharingShareeCircle1_Value.new)
      ..add(FilesSharingShareeCircle1_Value.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeValue), FilesSharingShareeValue.new)
      ..add(FilesSharingShareeValue.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeCircle1_Value1), FilesSharingShareeCircle1_Value1.new)
      ..add(FilesSharingShareeCircle1_Value1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeCircle)]),
        ListBuilder<FilesSharingShareeCircle>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeEmail), FilesSharingShareeEmail.new)
      ..add(FilesSharingShareeEmail.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeEmail1), FilesSharingShareeEmail1.new)
      ..add(FilesSharingShareeEmail1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeEmail)]),
        ListBuilder<FilesSharingShareeEmail>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingSharee)]),
        ListBuilder<FilesSharingSharee>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeRemoteGroup), FilesSharingShareeRemoteGroup.new)
      ..add(FilesSharingShareeRemoteGroup.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeRemoteGroup1), FilesSharingShareeRemoteGroup1.new)
      ..add(FilesSharingShareeRemoteGroup1.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareeRemoteGroup1_Value),
        FilesSharingShareeRemoteGroup1_Value.new,
      )
      ..add(FilesSharingShareeRemoteGroup1_Value.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareeRemoteGroup1_Value1),
        FilesSharingShareeRemoteGroup1_Value1.new,
      )
      ..add(FilesSharingShareeRemoteGroup1_Value1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeRemoteGroup)]),
        ListBuilder<FilesSharingShareeRemoteGroup>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote), FilesSharingShareeRemote.new)
      ..add(FilesSharingShareeRemote.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote1), FilesSharingShareeRemote1.new)
      ..add(FilesSharingShareeRemote1.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote1_Value), FilesSharingShareeRemote1_Value.new)
      ..add(FilesSharingShareeRemote1_Value.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote1_Value1), FilesSharingShareeRemote1_Value1.new)
      ..add(FilesSharingShareeRemote1_Value1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeRemote)]),
        ListBuilder<FilesSharingShareeRemote>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeUser), FilesSharingShareeUser.new)
      ..add(FilesSharingShareeUser.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeUser1), FilesSharingShareeUser1.new)
      ..add(FilesSharingShareeUser1.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeUser1_Status), FilesSharingShareeUser1_Status.new)
      ..add(FilesSharingShareeUser1_Status.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeUser)]),
        ListBuilder<FilesSharingShareeUser>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup), FilesSharingShareeLookup.new)
      ..add(FilesSharingShareeLookup.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup1), FilesSharingShareeLookup1.new)
      ..add(FilesSharingShareeLookup1.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup1_Extra), FilesSharingShareeLookup1_Extra.new)
      ..add(FilesSharingShareeLookup1_Extra.serializer)
      ..addBuilderFactory(const FullType(FilesSharingLookup), FilesSharingLookup.new)
      ..add(FilesSharingLookup.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup1_Value), FilesSharingShareeLookup1_Value.new)
      ..add(FilesSharingShareeLookup1_Value.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup1_Value1), FilesSharingShareeLookup1_Value1.new)
      ..add(FilesSharingShareeLookup1_Value1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeLookup)]),
        ListBuilder<FilesSharingShareeLookup>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiFindRecommendedShareType),
        FilesSharingShareesapiFindRecommendedShareType.new,
      )
      ..add(FilesSharingShareesapiFindRecommendedShareType.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(FilesSharingShareesapiFindRecommendedShareType)]),
        ContentString<FilesSharingShareesapiFindRecommendedShareType>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson),
        FilesSharingShareesapiFindRecommendedResponse200ApplicationJson.new,
      )
      ..add(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs),
        FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareesapiFindRecommendedResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesRecommendedResult),
        FilesSharingShareesRecommendedResult.new,
      )
      ..add(FilesSharingShareesRecommendedResult.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesRecommendedResult_Exact),
        FilesSharingShareesRecommendedResult_Exact.new,
      )
      ..add(FilesSharingShareesRecommendedResult_Exact.serializer)
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
      ..add(FilesSharingCapabilities_FilesSharing_Sharee.serializer))
    .build();

Serializers get filesSharingSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesSharing<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesSharing<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
