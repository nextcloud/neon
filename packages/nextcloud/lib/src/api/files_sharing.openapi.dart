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
  Future<FilesSharingDeletedShareapiListResponseApplicationJson> list({final bool oCSAPIRequest = true}) async {
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingDeletedShareapiListResponseApplicationJson),
      )! as FilesSharingDeletedShareapiListResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Undelete a deleted share
  Future<FilesSharingDeletedShareapiUndeleteResponseApplicationJson> undelete({
    required final String id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingDeletedShareapiUndeleteResponseApplicationJson),
      )! as FilesSharingDeletedShareapiUndeleteResponseApplicationJson;
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
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
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
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
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
  Future<FilesSharingRemoteGetSharesResponseApplicationJson> getShares({final bool oCSAPIRequest = true}) async {
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteGetSharesResponseApplicationJson),
      )! as FilesSharingRemoteGetSharesResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get list of pending remote shares
  Future<FilesSharingRemoteGetOpenSharesResponseApplicationJson> getOpenShares({
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteGetOpenSharesResponseApplicationJson),
      )! as FilesSharingRemoteGetOpenSharesResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Accept a remote share
  Future<FilesSharingRemoteAcceptShareResponseApplicationJson> acceptShare({
    required final int id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteAcceptShareResponseApplicationJson),
      )! as FilesSharingRemoteAcceptShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Decline a remote share
  Future<FilesSharingRemoteDeclineShareResponseApplicationJson> declineShare({
    required final int id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteDeclineShareResponseApplicationJson),
      )! as FilesSharingRemoteDeclineShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get info of a remote share
  Future<FilesSharingRemoteGetShareResponseApplicationJson> getShare({
    required final int id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteGetShareResponseApplicationJson),
      )! as FilesSharingRemoteGetShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unshare a remote share
  Future<FilesSharingRemoteUnshareResponseApplicationJson> unshare({
    required final int id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingRemoteUnshareResponseApplicationJson),
      )! as FilesSharingRemoteUnshareResponseApplicationJson;
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
  Future<FilesSharingShareapiGetSharesResponseApplicationJson> getShares({
    final String sharedWithMe = 'false',
    final String reshares = 'false',
    final String subfiles = 'false',
    final String path = '',
    final String includeTags = 'false',
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiGetSharesResponseApplicationJson),
      )! as FilesSharingShareapiGetSharesResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a share
  Future<FilesSharingShareapiCreateShareResponseApplicationJson> createShare({
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
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiCreateShareResponseApplicationJson),
      )! as FilesSharingShareapiCreateShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get all shares relative to a file, including parent folders shares rights
  Future<FilesSharingShareapiGetInheritedSharesResponseApplicationJson> getInheritedShares({
    required final String path,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiGetInheritedSharesResponseApplicationJson),
      )! as FilesSharingShareapiGetInheritedSharesResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get all shares that are still pending
  Future<FilesSharingShareapiPendingSharesResponseApplicationJson> pendingShares({
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiPendingSharesResponseApplicationJson),
      )! as FilesSharingShareapiPendingSharesResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a specific share by id
  Future<FilesSharingShareapiGetShareResponseApplicationJson> getShare({
    required final String id,
    final int includeTags = 0,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiGetShareResponseApplicationJson),
      )! as FilesSharingShareapiGetShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a share
  Future<FilesSharingShareapiUpdateShareResponseApplicationJson> updateShare({
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
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiUpdateShareResponseApplicationJson),
      )! as FilesSharingShareapiUpdateShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a share
  Future<FilesSharingShareapiDeleteShareResponseApplicationJson> deleteShare({
    required final String id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiDeleteShareResponseApplicationJson),
      )! as FilesSharingShareapiDeleteShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Accept a share
  Future<FilesSharingShareapiAcceptShareResponseApplicationJson> acceptShare({
    required final String id,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareapiAcceptShareResponseApplicationJson),
      )! as FilesSharingShareapiAcceptShareResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesSharingShareesapiClient {
  FilesSharingShareesapiClient(this._rootClient);

  final FilesSharingClient _rootClient;

  /// Search for sharees
  Future<
      FilesSharingResponse<FilesSharingShareesapiSearchResponseApplicationJson,
          FilesSharingShareesapiShareesapiSearchHeaders>> search({
    final String search = '',
    final String? itemType,
    final int page = 1,
    final int perPage = 200,
    final ContentString<FilesSharingShareesapiSearchShareType>? shareType,
    final int lookup = 0,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return FilesSharingResponse<FilesSharingShareesapiSearchResponseApplicationJson,
          FilesSharingShareesapiShareesapiSearchHeaders>(
        _jsonSerializers.deserialize(
          await response.jsonBody,
          specifiedType: const FullType(FilesSharingShareesapiSearchResponseApplicationJson),
        )! as FilesSharingShareesapiSearchResponseApplicationJson,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(FilesSharingShareesapiShareesapiSearchHeaders),
        )! as FilesSharingShareesapiShareesapiSearchHeaders,
      );
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Find recommended sharees
  Future<FilesSharingShareesapiFindRecommendedResponseApplicationJson> findRecommended({
    required final String itemType,
    final ContentString<FilesSharingShareesapiFindRecommendedShareType>? shareType,
    final bool oCSAPIRequest = true,
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
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesSharingShareesapiFindRecommendedResponseApplicationJson),
      )! as FilesSharingShareesapiFindRecommendedResponseApplicationJson;
    }
    throw await FilesSharingApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  FilesSharingOCSMetaInterface rebuild(final void Function(FilesSharingOCSMetaInterfaceBuilder) updates);
  FilesSharingOCSMetaInterfaceBuilder toBuilder();
}

abstract class FilesSharingOCSMeta
    implements FilesSharingOCSMetaInterface, Built<FilesSharingOCSMeta, FilesSharingOCSMetaBuilder> {
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

  static Serializer<FilesSharingOCSMeta> get serializer => _$filesSharingOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingDeletedShareInterface {
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
  FilesSharingDeletedShareInterface rebuild(final void Function(FilesSharingDeletedShareInterfaceBuilder) updates);
  FilesSharingDeletedShareInterfaceBuilder toBuilder();
}

abstract class FilesSharingDeletedShare
    implements FilesSharingDeletedShareInterface, Built<FilesSharingDeletedShare, FilesSharingDeletedShareBuilder> {
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

  static Serializer<FilesSharingDeletedShare> get serializer => _$filesSharingDeletedShareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingDeletedShareapiListResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingDeletedShare> get data;
  FilesSharingDeletedShareapiListResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingDeletedShareapiListResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingDeletedShareapiListResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingDeletedShareapiListResponseApplicationJson_Ocs
    implements
        FilesSharingDeletedShareapiListResponseApplicationJson_OcsInterface,
        Built<FilesSharingDeletedShareapiListResponseApplicationJson_Ocs,
            FilesSharingDeletedShareapiListResponseApplicationJson_OcsBuilder> {
  factory FilesSharingDeletedShareapiListResponseApplicationJson_Ocs([
    final void Function(FilesSharingDeletedShareapiListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingDeletedShareapiListResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingDeletedShareapiListResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingDeletedShareapiListResponseApplicationJsonInterface {
  FilesSharingDeletedShareapiListResponseApplicationJson_Ocs get ocs;
  FilesSharingDeletedShareapiListResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingDeletedShareapiListResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingDeletedShareapiListResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingDeletedShareapiListResponseApplicationJson
    implements
        FilesSharingDeletedShareapiListResponseApplicationJsonInterface,
        Built<FilesSharingDeletedShareapiListResponseApplicationJson,
            FilesSharingDeletedShareapiListResponseApplicationJsonBuilder> {
  factory FilesSharingDeletedShareapiListResponseApplicationJson([
    final void Function(FilesSharingDeletedShareapiListResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiListResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingDeletedShareapiListResponseApplicationJson> get serializer =>
      _$filesSharingDeletedShareapiListResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs
    implements
        FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsInterface,
        Built<FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs,
            FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsBuilder> {
  factory FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs([
    final void Function(FilesSharingDeletedShareapiUndeleteResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingDeletedShareapiUndeleteResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingDeletedShareapiUndeleteResponseApplicationJsonInterface {
  FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs get ocs;
  FilesSharingDeletedShareapiUndeleteResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingDeletedShareapiUndeleteResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingDeletedShareapiUndeleteResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingDeletedShareapiUndeleteResponseApplicationJson
    implements
        FilesSharingDeletedShareapiUndeleteResponseApplicationJsonInterface,
        Built<FilesSharingDeletedShareapiUndeleteResponseApplicationJson,
            FilesSharingDeletedShareapiUndeleteResponseApplicationJsonBuilder> {
  factory FilesSharingDeletedShareapiUndeleteResponseApplicationJson([
    final void Function(FilesSharingDeletedShareapiUndeleteResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingDeletedShareapiUndeleteResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingDeletedShareapiUndeleteResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingDeletedShareapiUndeleteResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingDeletedShareapiUndeleteResponseApplicationJson> get serializer =>
      _$filesSharingDeletedShareapiUndeleteResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteShareInterface {
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
  FilesSharingRemoteShareInterface rebuild(final void Function(FilesSharingRemoteShareInterfaceBuilder) updates);
  FilesSharingRemoteShareInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteShare
    implements FilesSharingRemoteShareInterface, Built<FilesSharingRemoteShare, FilesSharingRemoteShareBuilder> {
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

  static Serializer<FilesSharingRemoteShare> get serializer => _$filesSharingRemoteShareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetSharesResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingRemoteShare> get data;
  FilesSharingRemoteGetSharesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteGetSharesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetSharesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetSharesResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteGetSharesResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteGetSharesResponseApplicationJson_Ocs,
            FilesSharingRemoteGetSharesResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetSharesResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetSharesResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetSharesResponseApplicationJsonInterface {
  FilesSharingRemoteGetSharesResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteGetSharesResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteGetSharesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetSharesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetSharesResponseApplicationJson
    implements
        FilesSharingRemoteGetSharesResponseApplicationJsonInterface,
        Built<FilesSharingRemoteGetSharesResponseApplicationJson,
            FilesSharingRemoteGetSharesResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteGetSharesResponseApplicationJson([
    final void Function(FilesSharingRemoteGetSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetSharesResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetSharesResponseApplicationJson> get serializer =>
      _$filesSharingRemoteGetSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingRemoteShare> get data;
  FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs,
            FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetOpenSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetOpenSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetOpenSharesResponseApplicationJsonInterface {
  FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteGetOpenSharesResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteGetOpenSharesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetOpenSharesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetOpenSharesResponseApplicationJson
    implements
        FilesSharingRemoteGetOpenSharesResponseApplicationJsonInterface,
        Built<FilesSharingRemoteGetOpenSharesResponseApplicationJson,
            FilesSharingRemoteGetOpenSharesResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteGetOpenSharesResponseApplicationJson([
    final void Function(FilesSharingRemoteGetOpenSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetOpenSharesResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetOpenSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetOpenSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetOpenSharesResponseApplicationJson> get serializer =>
      _$filesSharingRemoteGetOpenSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteAcceptShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingRemoteAcceptShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteAcceptShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteAcceptShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteAcceptShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs,
            FilesSharingRemoteAcceptShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteAcceptShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteAcceptShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteAcceptShareResponseApplicationJsonInterface {
  FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteAcceptShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteAcceptShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteAcceptShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteAcceptShareResponseApplicationJson
    implements
        FilesSharingRemoteAcceptShareResponseApplicationJsonInterface,
        Built<FilesSharingRemoteAcceptShareResponseApplicationJson,
            FilesSharingRemoteAcceptShareResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteAcceptShareResponseApplicationJson([
    final void Function(FilesSharingRemoteAcceptShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteAcceptShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteAcceptShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteAcceptShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteAcceptShareResponseApplicationJson> get serializer =>
      _$filesSharingRemoteAcceptShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteDeclineShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingRemoteDeclineShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteDeclineShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteDeclineShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteDeclineShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs,
            FilesSharingRemoteDeclineShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteDeclineShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteDeclineShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteDeclineShareResponseApplicationJsonInterface {
  FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteDeclineShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteDeclineShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteDeclineShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteDeclineShareResponseApplicationJson
    implements
        FilesSharingRemoteDeclineShareResponseApplicationJsonInterface,
        Built<FilesSharingRemoteDeclineShareResponseApplicationJson,
            FilesSharingRemoteDeclineShareResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteDeclineShareResponseApplicationJson([
    final void Function(FilesSharingRemoteDeclineShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteDeclineShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteDeclineShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteDeclineShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteDeclineShareResponseApplicationJson> get serializer =>
      _$filesSharingRemoteDeclineShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingRemoteShare get data;
  FilesSharingRemoteGetShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteGetShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetShareResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteGetShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteGetShareResponseApplicationJson_Ocs,
            FilesSharingRemoteGetShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteGetShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteGetShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteGetShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteGetShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteGetShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteGetShareResponseApplicationJsonInterface {
  FilesSharingRemoteGetShareResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteGetShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteGetShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteGetShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteGetShareResponseApplicationJson
    implements
        FilesSharingRemoteGetShareResponseApplicationJsonInterface,
        Built<FilesSharingRemoteGetShareResponseApplicationJson,
            FilesSharingRemoteGetShareResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteGetShareResponseApplicationJson([
    final void Function(FilesSharingRemoteGetShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteGetShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteGetShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteGetShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteGetShareResponseApplicationJson> get serializer =>
      _$filesSharingRemoteGetShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteUnshareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingRemoteUnshareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingRemoteUnshareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingRemoteUnshareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteUnshareResponseApplicationJson_Ocs
    implements
        FilesSharingRemoteUnshareResponseApplicationJson_OcsInterface,
        Built<FilesSharingRemoteUnshareResponseApplicationJson_Ocs,
            FilesSharingRemoteUnshareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingRemoteUnshareResponseApplicationJson_Ocs([
    final void Function(FilesSharingRemoteUnshareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingRemoteUnshareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingRemoteUnshareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteUnshareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteUnshareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingRemoteUnshareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingRemoteUnshareResponseApplicationJsonInterface {
  FilesSharingRemoteUnshareResponseApplicationJson_Ocs get ocs;
  FilesSharingRemoteUnshareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingRemoteUnshareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingRemoteUnshareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingRemoteUnshareResponseApplicationJson
    implements
        FilesSharingRemoteUnshareResponseApplicationJsonInterface,
        Built<FilesSharingRemoteUnshareResponseApplicationJson,
            FilesSharingRemoteUnshareResponseApplicationJsonBuilder> {
  factory FilesSharingRemoteUnshareResponseApplicationJson([
    final void Function(FilesSharingRemoteUnshareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingRemoteUnshareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingRemoteUnshareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingRemoteUnshareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingRemoteUnshareResponseApplicationJson> get serializer =>
      _$filesSharingRemoteUnshareResponseApplicationJsonSerializer;
}

abstract class FilesSharingShareInfo_Size
    implements Built<FilesSharingShareInfo_Size, FilesSharingShareInfo_SizeBuilder> {
  factory FilesSharingShareInfo_Size([final void Function(FilesSharingShareInfo_SizeBuilder)? b]) =
      _$FilesSharingShareInfo_Size;

  // coverage:ignore-start
  const FilesSharingShareInfo_Size._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareInfo_Size.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  num? get $num;
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

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareInfoInterface {
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
  FilesSharingShareInfoInterface rebuild(final void Function(FilesSharingShareInfoInterfaceBuilder) updates);
  FilesSharingShareInfoInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareInfo
    implements FilesSharingShareInfoInterface, Built<FilesSharingShareInfo, FilesSharingShareInfoBuilder> {
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

  static Serializer<FilesSharingShareInfo> get serializer => _$filesSharingShareInfoSerializer;
}

abstract class FilesSharingShare_ItemSize
    implements Built<FilesSharingShare_ItemSize, FilesSharingShare_ItemSizeBuilder> {
  factory FilesSharingShare_ItemSize([final void Function(FilesSharingShare_ItemSizeBuilder)? b]) =
      _$FilesSharingShare_ItemSize;

  // coverage:ignore-start
  const FilesSharingShare_ItemSize._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShare_ItemSize.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  num? get $num;
  int? get $int;
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

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShare_StatusInterface {
  int? get clearAt;
  String? get icon;
  String? get message;
  String? get status;
  FilesSharingShare_StatusInterface rebuild(final void Function(FilesSharingShare_StatusInterfaceBuilder) updates);
  FilesSharingShare_StatusInterfaceBuilder toBuilder();
}

abstract class FilesSharingShare_Status
    implements FilesSharingShare_StatusInterface, Built<FilesSharingShare_Status, FilesSharingShare_StatusBuilder> {
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

  static Serializer<FilesSharingShare_Status> get serializer => _$filesSharingShareStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareInterface {
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
  FilesSharingShareInterface rebuild(final void Function(FilesSharingShareInterfaceBuilder) updates);
  FilesSharingShareInterfaceBuilder toBuilder();
}

abstract class FilesSharingShare
    implements FilesSharingShareInterface, Built<FilesSharingShare, FilesSharingShareBuilder> {
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

  static Serializer<FilesSharingShare> get serializer => _$filesSharingShareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetSharesResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  FilesSharingShareapiGetSharesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiGetSharesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetSharesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetSharesResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiGetSharesResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiGetSharesResponseApplicationJson_Ocs,
            FilesSharingShareapiGetSharesResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetSharesResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetSharesResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetSharesResponseApplicationJsonInterface {
  FilesSharingShareapiGetSharesResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiGetSharesResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiGetSharesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetSharesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetSharesResponseApplicationJson
    implements
        FilesSharingShareapiGetSharesResponseApplicationJsonInterface,
        Built<FilesSharingShareapiGetSharesResponseApplicationJson,
            FilesSharingShareapiGetSharesResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiGetSharesResponseApplicationJson([
    final void Function(FilesSharingShareapiGetSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetSharesResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetSharesResponseApplicationJson> get serializer =>
      _$filesSharingShareapiGetSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiCreateShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  FilesSharingShareapiCreateShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiCreateShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiCreateShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiCreateShareResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiCreateShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiCreateShareResponseApplicationJson_Ocs,
            FilesSharingShareapiCreateShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiCreateShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiCreateShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiCreateShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiCreateShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiCreateShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiCreateShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiCreateShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiCreateShareResponseApplicationJsonInterface {
  FilesSharingShareapiCreateShareResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiCreateShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiCreateShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiCreateShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiCreateShareResponseApplicationJson
    implements
        FilesSharingShareapiCreateShareResponseApplicationJsonInterface,
        Built<FilesSharingShareapiCreateShareResponseApplicationJson,
            FilesSharingShareapiCreateShareResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiCreateShareResponseApplicationJson([
    final void Function(FilesSharingShareapiCreateShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiCreateShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiCreateShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiCreateShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiCreateShareResponseApplicationJson> get serializer =>
      _$filesSharingShareapiCreateShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs,
            FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetInheritedSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetInheritedSharesResponseApplicationJsonInterface {
  FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiGetInheritedSharesResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiGetInheritedSharesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetInheritedSharesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetInheritedSharesResponseApplicationJson
    implements
        FilesSharingShareapiGetInheritedSharesResponseApplicationJsonInterface,
        Built<FilesSharingShareapiGetInheritedSharesResponseApplicationJson,
            FilesSharingShareapiGetInheritedSharesResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiGetInheritedSharesResponseApplicationJson([
    final void Function(FilesSharingShareapiGetInheritedSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetInheritedSharesResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetInheritedSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetInheritedSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetInheritedSharesResponseApplicationJson> get serializer =>
      _$filesSharingShareapiGetInheritedSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiPendingSharesResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  BuiltList<FilesSharingShare> get data;
  FilesSharingShareapiPendingSharesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiPendingSharesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiPendingSharesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiPendingSharesResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs,
            FilesSharingShareapiPendingSharesResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiPendingSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiPendingSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiPendingSharesResponseApplicationJsonInterface {
  FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiPendingSharesResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiPendingSharesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiPendingSharesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiPendingSharesResponseApplicationJson
    implements
        FilesSharingShareapiPendingSharesResponseApplicationJsonInterface,
        Built<FilesSharingShareapiPendingSharesResponseApplicationJson,
            FilesSharingShareapiPendingSharesResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiPendingSharesResponseApplicationJson([
    final void Function(FilesSharingShareapiPendingSharesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiPendingSharesResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiPendingSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiPendingSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiPendingSharesResponseApplicationJson> get serializer =>
      _$filesSharingShareapiPendingSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  FilesSharingShareapiGetShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiGetShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetShareResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiGetShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiGetShareResponseApplicationJson_Ocs,
            FilesSharingShareapiGetShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiGetShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiGetShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiGetShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiGetShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiGetShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiGetShareResponseApplicationJsonInterface {
  FilesSharingShareapiGetShareResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiGetShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiGetShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiGetShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiGetShareResponseApplicationJson
    implements
        FilesSharingShareapiGetShareResponseApplicationJsonInterface,
        Built<FilesSharingShareapiGetShareResponseApplicationJson,
            FilesSharingShareapiGetShareResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiGetShareResponseApplicationJson([
    final void Function(FilesSharingShareapiGetShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiGetShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiGetShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiGetShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiGetShareResponseApplicationJson> get serializer =>
      _$filesSharingShareapiGetShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiUpdateShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingShare get data;
  FilesSharingShareapiUpdateShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiUpdateShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiUpdateShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiUpdateShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs,
            FilesSharingShareapiUpdateShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiUpdateShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiUpdateShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiUpdateShareResponseApplicationJsonInterface {
  FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiUpdateShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiUpdateShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiUpdateShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiUpdateShareResponseApplicationJson
    implements
        FilesSharingShareapiUpdateShareResponseApplicationJsonInterface,
        Built<FilesSharingShareapiUpdateShareResponseApplicationJson,
            FilesSharingShareapiUpdateShareResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiUpdateShareResponseApplicationJson([
    final void Function(FilesSharingShareapiUpdateShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiUpdateShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiUpdateShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiUpdateShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiUpdateShareResponseApplicationJson> get serializer =>
      _$filesSharingShareapiUpdateShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiDeleteShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingShareapiDeleteShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiDeleteShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiDeleteShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiDeleteShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs,
            FilesSharingShareapiDeleteShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiDeleteShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiDeleteShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiDeleteShareResponseApplicationJsonInterface {
  FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiDeleteShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiDeleteShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiDeleteShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiDeleteShareResponseApplicationJson
    implements
        FilesSharingShareapiDeleteShareResponseApplicationJsonInterface,
        Built<FilesSharingShareapiDeleteShareResponseApplicationJson,
            FilesSharingShareapiDeleteShareResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiDeleteShareResponseApplicationJson([
    final void Function(FilesSharingShareapiDeleteShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiDeleteShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiDeleteShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiDeleteShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiDeleteShareResponseApplicationJson> get serializer =>
      _$filesSharingShareapiDeleteShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiAcceptShareResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  JsonObject get data;
  FilesSharingShareapiAcceptShareResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareapiAcceptShareResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareapiAcceptShareResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs
    implements
        FilesSharingShareapiAcceptShareResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs,
            FilesSharingShareapiAcceptShareResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareapiAcceptShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareapiAcceptShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareapiAcceptShareResponseApplicationJsonInterface {
  FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs get ocs;
  FilesSharingShareapiAcceptShareResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareapiAcceptShareResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareapiAcceptShareResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareapiAcceptShareResponseApplicationJson
    implements
        FilesSharingShareapiAcceptShareResponseApplicationJsonInterface,
        Built<FilesSharingShareapiAcceptShareResponseApplicationJson,
            FilesSharingShareapiAcceptShareResponseApplicationJsonBuilder> {
  factory FilesSharingShareapiAcceptShareResponseApplicationJson([
    final void Function(FilesSharingShareapiAcceptShareResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareapiAcceptShareResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareapiAcceptShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareapiAcceptShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareapiAcceptShareResponseApplicationJson> get serializer =>
      _$filesSharingShareapiAcceptShareResponseApplicationJsonSerializer;
}

abstract class FilesSharingShareesapiSearchShareType
    implements Built<FilesSharingShareesapiSearchShareType, FilesSharingShareesapiSearchShareTypeBuilder> {
  factory FilesSharingShareesapiSearchShareType([
    final void Function(FilesSharingShareesapiSearchShareTypeBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchShareType;

  // coverage:ignore-start
  const FilesSharingShareesapiSearchShareType._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiSearchShareType.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  BuiltList<int>? get builtListInt;
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

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesapiShareesapiSearchHeadersInterface {
  String? get link;
  FilesSharingShareesapiShareesapiSearchHeadersInterface rebuild(
    final void Function(FilesSharingShareesapiShareesapiSearchHeadersInterfaceBuilder) updates,
  );
  FilesSharingShareesapiShareesapiSearchHeadersInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesapiShareesapiSearchHeaders
    implements
        FilesSharingShareesapiShareesapiSearchHeadersInterface,
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

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeInterface {
  int? get count;
  String get label;
  FilesSharingShareeInterface rebuild(final void Function(FilesSharingShareeInterfaceBuilder) updates);
  FilesSharingShareeInterfaceBuilder toBuilder();
}

abstract class FilesSharingSharee
    implements FilesSharingShareeInterface, Built<FilesSharingSharee, FilesSharingShareeBuilder> {
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

  static Serializer<FilesSharingSharee> get serializer => _$filesSharingShareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeValueInterface {
  int get shareType;
  String get shareWith;
  FilesSharingShareeValueInterface rebuild(final void Function(FilesSharingShareeValueInterfaceBuilder) updates);
  FilesSharingShareeValueInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeValue
    implements FilesSharingShareeValueInterface, Built<FilesSharingShareeValue, FilesSharingShareeValueBuilder> {
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

  static Serializer<FilesSharingShareeValue> get serializer => _$filesSharingShareeValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeCircle_1_Value_1Interface {
  String get circle;
  FilesSharingShareeCircle_1_Value_1Interface rebuild(
    final void Function(FilesSharingShareeCircle_1_Value_1InterfaceBuilder) updates,
  );
  FilesSharingShareeCircle_1_Value_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeCircle_1_Value
    implements
        FilesSharingShareeValueInterface,
        FilesSharingShareeCircle_1_Value_1Interface,
        Built<FilesSharingShareeCircle_1_Value, FilesSharingShareeCircle_1_ValueBuilder> {
  factory FilesSharingShareeCircle_1_Value([final void Function(FilesSharingShareeCircle_1_ValueBuilder)? b]) =
      _$FilesSharingShareeCircle_1_Value;

  // coverage:ignore-start
  const FilesSharingShareeCircle_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeCircle_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeCircle_1_Value> get serializer => _$filesSharingShareeCircle1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeCircle_1Interface {
  String get shareWithDescription;
  FilesSharingShareeCircle_1_Value get value;
  FilesSharingShareeCircle_1Interface rebuild(final void Function(FilesSharingShareeCircle_1InterfaceBuilder) updates);
  FilesSharingShareeCircle_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeCircle
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeCircle_1Interface,
        Built<FilesSharingShareeCircle, FilesSharingShareeCircleBuilder> {
  factory FilesSharingShareeCircle([final void Function(FilesSharingShareeCircleBuilder)? b]) =
      _$FilesSharingShareeCircle;

  // coverage:ignore-start
  const FilesSharingShareeCircle._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeCircle.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeCircle> get serializer => _$filesSharingShareeCircleSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeEmail_1Interface {
  String get uuid;
  String get name;
  String get type;
  String get shareWithDisplayNameUnique;
  FilesSharingShareeValue get value;
  FilesSharingShareeEmail_1Interface rebuild(final void Function(FilesSharingShareeEmail_1InterfaceBuilder) updates);
  FilesSharingShareeEmail_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeEmail
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeEmail_1Interface,
        Built<FilesSharingShareeEmail, FilesSharingShareeEmailBuilder> {
  factory FilesSharingShareeEmail([final void Function(FilesSharingShareeEmailBuilder)? b]) = _$FilesSharingShareeEmail;

  // coverage:ignore-start
  const FilesSharingShareeEmail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeEmail.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeEmail> get serializer => _$filesSharingShareeEmailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeRemoteGroup_1_Value_1Interface {
  String get server;
  FilesSharingShareeRemoteGroup_1_Value_1Interface rebuild(
    final void Function(FilesSharingShareeRemoteGroup_1_Value_1InterfaceBuilder) updates,
  );
  FilesSharingShareeRemoteGroup_1_Value_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeRemoteGroup_1_Value
    implements
        FilesSharingShareeValueInterface,
        FilesSharingShareeRemoteGroup_1_Value_1Interface,
        Built<FilesSharingShareeRemoteGroup_1_Value, FilesSharingShareeRemoteGroup_1_ValueBuilder> {
  factory FilesSharingShareeRemoteGroup_1_Value([
    final void Function(FilesSharingShareeRemoteGroup_1_ValueBuilder)? b,
  ]) = _$FilesSharingShareeRemoteGroup_1_Value;

  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemoteGroup_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeRemoteGroup_1_Value> get serializer =>
      _$filesSharingShareeRemoteGroup1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeRemoteGroup_1Interface {
  String get guid;
  String get name;
  FilesSharingShareeRemoteGroup_1_Value get value;
  FilesSharingShareeRemoteGroup_1Interface rebuild(
    final void Function(FilesSharingShareeRemoteGroup_1InterfaceBuilder) updates,
  );
  FilesSharingShareeRemoteGroup_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeRemoteGroup
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeRemoteGroup_1Interface,
        Built<FilesSharingShareeRemoteGroup, FilesSharingShareeRemoteGroupBuilder> {
  factory FilesSharingShareeRemoteGroup([final void Function(FilesSharingShareeRemoteGroupBuilder)? b]) =
      _$FilesSharingShareeRemoteGroup;

  // coverage:ignore-start
  const FilesSharingShareeRemoteGroup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemoteGroup.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeRemoteGroup> get serializer => _$filesSharingShareeRemoteGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeRemote_1_Value_1Interface {
  String get server;
  FilesSharingShareeRemote_1_Value_1Interface rebuild(
    final void Function(FilesSharingShareeRemote_1_Value_1InterfaceBuilder) updates,
  );
  FilesSharingShareeRemote_1_Value_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeRemote_1_Value
    implements
        FilesSharingShareeValueInterface,
        FilesSharingShareeRemote_1_Value_1Interface,
        Built<FilesSharingShareeRemote_1_Value, FilesSharingShareeRemote_1_ValueBuilder> {
  factory FilesSharingShareeRemote_1_Value([final void Function(FilesSharingShareeRemote_1_ValueBuilder)? b]) =
      _$FilesSharingShareeRemote_1_Value;

  // coverage:ignore-start
  const FilesSharingShareeRemote_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemote_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeRemote_1_Value> get serializer => _$filesSharingShareeRemote1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeRemote_1Interface {
  String get uuid;
  String get name;
  String get type;
  FilesSharingShareeRemote_1_Value get value;
  FilesSharingShareeRemote_1Interface rebuild(final void Function(FilesSharingShareeRemote_1InterfaceBuilder) updates);
  FilesSharingShareeRemote_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeRemote
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeRemote_1Interface,
        Built<FilesSharingShareeRemote, FilesSharingShareeRemoteBuilder> {
  factory FilesSharingShareeRemote([final void Function(FilesSharingShareeRemoteBuilder)? b]) =
      _$FilesSharingShareeRemote;

  // coverage:ignore-start
  const FilesSharingShareeRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeRemote.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeRemote> get serializer => _$filesSharingShareeRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeUser_1_StatusInterface {
  String get status;
  String get message;
  String get icon;
  int? get clearAt;
  FilesSharingShareeUser_1_StatusInterface rebuild(
    final void Function(FilesSharingShareeUser_1_StatusInterfaceBuilder) updates,
  );
  FilesSharingShareeUser_1_StatusInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeUser_1_Status
    implements
        FilesSharingShareeUser_1_StatusInterface,
        Built<FilesSharingShareeUser_1_Status, FilesSharingShareeUser_1_StatusBuilder> {
  factory FilesSharingShareeUser_1_Status([final void Function(FilesSharingShareeUser_1_StatusBuilder)? b]) =
      _$FilesSharingShareeUser_1_Status;

  // coverage:ignore-start
  const FilesSharingShareeUser_1_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeUser_1_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeUser_1_Status> get serializer => _$filesSharingShareeUser1StatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeUser_1Interface {
  String get subline;
  String get icon;
  String get shareWithDisplayNameUnique;
  FilesSharingShareeUser_1_Status get status;
  FilesSharingShareeValue get value;
  FilesSharingShareeUser_1Interface rebuild(final void Function(FilesSharingShareeUser_1InterfaceBuilder) updates);
  FilesSharingShareeUser_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeUser
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeUser_1Interface,
        Built<FilesSharingShareeUser, FilesSharingShareeUserBuilder> {
  factory FilesSharingShareeUser([final void Function(FilesSharingShareeUserBuilder)? b]) = _$FilesSharingShareeUser;

  // coverage:ignore-start
  const FilesSharingShareeUser._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeUser.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeUser> get serializer => _$filesSharingShareeUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesSearchResult_ExactInterface {
  BuiltList<FilesSharingShareeCircle> get circles;
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingSharee> get rooms;
  BuiltList<FilesSharingShareeUser> get users;
  FilesSharingShareesSearchResult_ExactInterface rebuild(
    final void Function(FilesSharingShareesSearchResult_ExactInterfaceBuilder) updates,
  );
  FilesSharingShareesSearchResult_ExactInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesSearchResult_Exact
    implements
        FilesSharingShareesSearchResult_ExactInterface,
        Built<FilesSharingShareesSearchResult_Exact, FilesSharingShareesSearchResult_ExactBuilder> {
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

  static Serializer<FilesSharingShareesSearchResult_Exact> get serializer =>
      _$filesSharingShareesSearchResultExactSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingLookupInterface {
  String get value;
  int get verified;
  FilesSharingLookupInterface rebuild(final void Function(FilesSharingLookupInterfaceBuilder) updates);
  FilesSharingLookupInterfaceBuilder toBuilder();
}

abstract class FilesSharingLookup
    implements FilesSharingLookupInterface, Built<FilesSharingLookup, FilesSharingLookupBuilder> {
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

  static Serializer<FilesSharingLookup> get serializer => _$filesSharingLookupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeLookup_1_ExtraInterface {
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
  FilesSharingShareeLookup_1_ExtraInterface rebuild(
    final void Function(FilesSharingShareeLookup_1_ExtraInterfaceBuilder) updates,
  );
  FilesSharingShareeLookup_1_ExtraInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeLookup_1_Extra
    implements
        FilesSharingShareeLookup_1_ExtraInterface,
        Built<FilesSharingShareeLookup_1_Extra, FilesSharingShareeLookup_1_ExtraBuilder> {
  factory FilesSharingShareeLookup_1_Extra([final void Function(FilesSharingShareeLookup_1_ExtraBuilder)? b]) =
      _$FilesSharingShareeLookup_1_Extra;

  // coverage:ignore-start
  const FilesSharingShareeLookup_1_Extra._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup_1_Extra.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeLookup_1_Extra> get serializer => _$filesSharingShareeLookup1ExtraSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeLookup_1_Value_1Interface {
  bool get globalScale;
  FilesSharingShareeLookup_1_Value_1Interface rebuild(
    final void Function(FilesSharingShareeLookup_1_Value_1InterfaceBuilder) updates,
  );
  FilesSharingShareeLookup_1_Value_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeLookup_1_Value
    implements
        FilesSharingShareeValueInterface,
        FilesSharingShareeLookup_1_Value_1Interface,
        Built<FilesSharingShareeLookup_1_Value, FilesSharingShareeLookup_1_ValueBuilder> {
  factory FilesSharingShareeLookup_1_Value([final void Function(FilesSharingShareeLookup_1_ValueBuilder)? b]) =
      _$FilesSharingShareeLookup_1_Value;

  // coverage:ignore-start
  const FilesSharingShareeLookup_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeLookup_1_Value> get serializer => _$filesSharingShareeLookup1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareeLookup_1Interface {
  FilesSharingShareeLookup_1_Extra get extra;
  FilesSharingShareeLookup_1_Value get value;
  FilesSharingShareeLookup_1Interface rebuild(final void Function(FilesSharingShareeLookup_1InterfaceBuilder) updates);
  FilesSharingShareeLookup_1InterfaceBuilder toBuilder();
}

abstract class FilesSharingShareeLookup
    implements
        FilesSharingShareeInterface,
        FilesSharingShareeLookup_1Interface,
        Built<FilesSharingShareeLookup, FilesSharingShareeLookupBuilder> {
  factory FilesSharingShareeLookup([final void Function(FilesSharingShareeLookupBuilder)? b]) =
      _$FilesSharingShareeLookup;

  // coverage:ignore-start
  const FilesSharingShareeLookup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareeLookup.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareeLookup> get serializer => _$filesSharingShareeLookupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesSearchResultInterface {
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
  FilesSharingShareesSearchResultInterface rebuild(
    final void Function(FilesSharingShareesSearchResultInterfaceBuilder) updates,
  );
  FilesSharingShareesSearchResultInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesSearchResult
    implements
        FilesSharingShareesSearchResultInterface,
        Built<FilesSharingShareesSearchResult, FilesSharingShareesSearchResultBuilder> {
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

  static Serializer<FilesSharingShareesSearchResult> get serializer => _$filesSharingShareesSearchResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesapiSearchResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingShareesSearchResult get data;
  FilesSharingShareesapiSearchResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareesapiSearchResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareesapiSearchResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesapiSearchResponseApplicationJson_Ocs
    implements
        FilesSharingShareesapiSearchResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareesapiSearchResponseApplicationJson_Ocs,
            FilesSharingShareesapiSearchResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareesapiSearchResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareesapiSearchResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareesapiSearchResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiSearchResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareesapiSearchResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareesapiSearchResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesapiSearchResponseApplicationJsonInterface {
  FilesSharingShareesapiSearchResponseApplicationJson_Ocs get ocs;
  FilesSharingShareesapiSearchResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareesapiSearchResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareesapiSearchResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesapiSearchResponseApplicationJson
    implements
        FilesSharingShareesapiSearchResponseApplicationJsonInterface,
        Built<FilesSharingShareesapiSearchResponseApplicationJson,
            FilesSharingShareesapiSearchResponseApplicationJsonBuilder> {
  factory FilesSharingShareesapiSearchResponseApplicationJson([
    final void Function(FilesSharingShareesapiSearchResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareesapiSearchResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareesapiSearchResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiSearchResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareesapiSearchResponseApplicationJson> get serializer =>
      _$filesSharingShareesapiSearchResponseApplicationJsonSerializer;
}

abstract class FilesSharingShareesapiFindRecommendedShareType
    implements
        Built<FilesSharingShareesapiFindRecommendedShareType, FilesSharingShareesapiFindRecommendedShareTypeBuilder> {
  factory FilesSharingShareesapiFindRecommendedShareType([
    final void Function(FilesSharingShareesapiFindRecommendedShareTypeBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedShareType;

  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedShareType._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiFindRecommendedShareType.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  JsonObject get data;
  int? get $int;
  BuiltList<int>? get builtListInt;
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

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesRecommendedResult_ExactInterface {
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingShareeUser> get users;
  FilesSharingShareesRecommendedResult_ExactInterface rebuild(
    final void Function(FilesSharingShareesRecommendedResult_ExactInterfaceBuilder) updates,
  );
  FilesSharingShareesRecommendedResult_ExactInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesRecommendedResult_Exact
    implements
        FilesSharingShareesRecommendedResult_ExactInterface,
        Built<FilesSharingShareesRecommendedResult_Exact, FilesSharingShareesRecommendedResult_ExactBuilder> {
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

  static Serializer<FilesSharingShareesRecommendedResult_Exact> get serializer =>
      _$filesSharingShareesRecommendedResultExactSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesRecommendedResultInterface {
  FilesSharingShareesRecommendedResult_Exact get exact;
  BuiltList<FilesSharingShareeEmail> get emails;
  BuiltList<FilesSharingSharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<FilesSharingShareeRemoteGroup> get remoteGroups;
  BuiltList<FilesSharingShareeRemote> get remotes;
  BuiltList<FilesSharingShareeUser> get users;
  FilesSharingShareesRecommendedResultInterface rebuild(
    final void Function(FilesSharingShareesRecommendedResultInterfaceBuilder) updates,
  );
  FilesSharingShareesRecommendedResultInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesRecommendedResult
    implements
        FilesSharingShareesRecommendedResultInterface,
        Built<FilesSharingShareesRecommendedResult, FilesSharingShareesRecommendedResultBuilder> {
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

  static Serializer<FilesSharingShareesRecommendedResult> get serializer =>
      _$filesSharingShareesRecommendedResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsInterface {
  FilesSharingOCSMeta get meta;
  FilesSharingShareesRecommendedResult get data;
  FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs
    implements
        FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsInterface,
        Built<FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs,
            FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsBuilder> {
  factory FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs([
    final void Function(FilesSharingShareesapiFindRecommendedResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs> get serializer =>
      _$filesSharingShareesapiFindRecommendedResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingShareesapiFindRecommendedResponseApplicationJsonInterface {
  FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs get ocs;
  FilesSharingShareesapiFindRecommendedResponseApplicationJsonInterface rebuild(
    final void Function(FilesSharingShareesapiFindRecommendedResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesSharingShareesapiFindRecommendedResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesSharingShareesapiFindRecommendedResponseApplicationJson
    implements
        FilesSharingShareesapiFindRecommendedResponseApplicationJsonInterface,
        Built<FilesSharingShareesapiFindRecommendedResponseApplicationJson,
            FilesSharingShareesapiFindRecommendedResponseApplicationJsonBuilder> {
  factory FilesSharingShareesapiFindRecommendedResponseApplicationJson([
    final void Function(FilesSharingShareesapiFindRecommendedResponseApplicationJsonBuilder)? b,
  ]) = _$FilesSharingShareesapiFindRecommendedResponseApplicationJson;

  // coverage:ignore-start
  const FilesSharingShareesapiFindRecommendedResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesSharingShareesapiFindRecommendedResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesSharingShareesapiFindRecommendedResponseApplicationJson> get serializer =>
      _$filesSharingShareesapiFindRecommendedResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesSharingCapabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
  FilesSharingCapabilities_FilesSharing_Public_PasswordInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Public_PasswordInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateInternalInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Public_ExpireDateRemoteInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_PublicInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_PublicInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_User_ExpireDateInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_User_ExpireDateInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_UserInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_UserInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_UserInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Group_ExpireDateInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_GroupInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_GroupInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_Federation_ExpireDateSupportedInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_FederationInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_FederationInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharing_ShareeInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharing_ShareeInterfaceBuilder toBuilder();
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
  FilesSharingCapabilities_FilesSharingInterface rebuild(
    final void Function(FilesSharingCapabilities_FilesSharingInterfaceBuilder) updates,
  );
  FilesSharingCapabilities_FilesSharingInterfaceBuilder toBuilder();
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
  FilesSharingCapabilitiesInterface rebuild(final void Function(FilesSharingCapabilitiesInterfaceBuilder) updates);
  FilesSharingCapabilitiesInterfaceBuilder toBuilder();
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

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiListResponseApplicationJson),
        FilesSharingDeletedShareapiListResponseApplicationJson.new,
      )
      ..add(FilesSharingDeletedShareapiListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiListResponseApplicationJson_Ocs),
        FilesSharingDeletedShareapiListResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingDeletedShareapiListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingOCSMeta), FilesSharingOCSMeta.new)
      ..add(FilesSharingOCSMeta.serializer)
      ..addBuilderFactory(const FullType(FilesSharingDeletedShare), FilesSharingDeletedShare.new)
      ..add(FilesSharingDeletedShare.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingDeletedShare)]),
        ListBuilder<FilesSharingDeletedShare>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiUndeleteResponseApplicationJson),
        FilesSharingDeletedShareapiUndeleteResponseApplicationJson.new,
      )
      ..add(FilesSharingDeletedShareapiUndeleteResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs),
        FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingDeletedShareapiUndeleteResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetSharesResponseApplicationJson),
        FilesSharingRemoteGetSharesResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetSharesResponseApplicationJson_Ocs),
        FilesSharingRemoteGetSharesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingRemoteShare), FilesSharingRemoteShare.new)
      ..add(FilesSharingRemoteShare.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingRemoteShare)]),
        ListBuilder<FilesSharingRemoteShare>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetOpenSharesResponseApplicationJson),
        FilesSharingRemoteGetOpenSharesResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetOpenSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs),
        FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetOpenSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteAcceptShareResponseApplicationJson),
        FilesSharingRemoteAcceptShareResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs),
        FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteAcceptShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteDeclineShareResponseApplicationJson),
        FilesSharingRemoteDeclineShareResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteDeclineShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs),
        FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteDeclineShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetShareResponseApplicationJson),
        FilesSharingRemoteGetShareResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteGetShareResponseApplicationJson_Ocs),
        FilesSharingRemoteGetShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteUnshareResponseApplicationJson),
        FilesSharingRemoteUnshareResponseApplicationJson.new,
      )
      ..add(FilesSharingRemoteUnshareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingRemoteUnshareResponseApplicationJson_Ocs),
        FilesSharingRemoteUnshareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingRemoteUnshareResponseApplicationJson_Ocs.serializer)
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
        const FullType(FilesSharingShareapiGetSharesResponseApplicationJson),
        FilesSharingShareapiGetSharesResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetSharesResponseApplicationJson_Ocs),
        FilesSharingShareapiGetSharesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare), FilesSharingShare.new)
      ..add(FilesSharingShare.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare_ItemSize), FilesSharingShare_ItemSize.new)
      ..add(FilesSharingShare_ItemSize.serializer)
      ..add(FilesSharingShare_ItemType.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShare_Status), FilesSharingShare_Status.new)
      ..add(FilesSharingShare_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(FilesSharingShare)]), ListBuilder<FilesSharingShare>.new)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiCreateShareResponseApplicationJson),
        FilesSharingShareapiCreateShareResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiCreateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiCreateShareResponseApplicationJson_Ocs),
        FilesSharingShareapiCreateShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiCreateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetInheritedSharesResponseApplicationJson),
        FilesSharingShareapiGetInheritedSharesResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetInheritedSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs),
        FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetInheritedSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiPendingSharesResponseApplicationJson),
        FilesSharingShareapiPendingSharesResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiPendingSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs),
        FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiPendingSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetShareResponseApplicationJson),
        FilesSharingShareapiGetShareResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiGetShareResponseApplicationJson_Ocs),
        FilesSharingShareapiGetShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiUpdateShareResponseApplicationJson),
        FilesSharingShareapiUpdateShareResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiUpdateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs),
        FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiUpdateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiDeleteShareResponseApplicationJson),
        FilesSharingShareapiDeleteShareResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiDeleteShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs),
        FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiDeleteShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiAcceptShareResponseApplicationJson),
        FilesSharingShareapiAcceptShareResponseApplicationJson.new,
      )
      ..add(FilesSharingShareapiAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs),
        FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareapiAcceptShareResponseApplicationJson_Ocs.serializer)
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
        const FullType(FilesSharingShareesapiSearchResponseApplicationJson),
        FilesSharingShareesapiSearchResponseApplicationJson.new,
      )
      ..add(FilesSharingShareesapiSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiSearchResponseApplicationJson_Ocs),
        FilesSharingShareesapiSearchResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareesapiSearchResponseApplicationJson_Ocs.serializer)
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
      ..addBuilderFactory(const FullType(FilesSharingShareeCircle_1_Value), FilesSharingShareeCircle_1_Value.new)
      ..add(FilesSharingShareeCircle_1_Value.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeValue), FilesSharingShareeValue.new)
      ..add(FilesSharingShareeValue.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeCircle)]),
        ListBuilder<FilesSharingShareeCircle>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeEmail), FilesSharingShareeEmail.new)
      ..add(FilesSharingShareeEmail.serializer)
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
      ..addBuilderFactory(
        const FullType(FilesSharingShareeRemoteGroup_1_Value),
        FilesSharingShareeRemoteGroup_1_Value.new,
      )
      ..add(FilesSharingShareeRemoteGroup_1_Value.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeRemoteGroup)]),
        ListBuilder<FilesSharingShareeRemoteGroup>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote), FilesSharingShareeRemote.new)
      ..add(FilesSharingShareeRemote.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeRemote_1_Value), FilesSharingShareeRemote_1_Value.new)
      ..add(FilesSharingShareeRemote_1_Value.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeRemote)]),
        ListBuilder<FilesSharingShareeRemote>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeUser), FilesSharingShareeUser.new)
      ..add(FilesSharingShareeUser.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeUser_1_Status), FilesSharingShareeUser_1_Status.new)
      ..add(FilesSharingShareeUser_1_Status.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesSharingShareeUser)]),
        ListBuilder<FilesSharingShareeUser>.new,
      )
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup), FilesSharingShareeLookup.new)
      ..add(FilesSharingShareeLookup.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup_1_Extra), FilesSharingShareeLookup_1_Extra.new)
      ..add(FilesSharingShareeLookup_1_Extra.serializer)
      ..addBuilderFactory(const FullType(FilesSharingLookup), FilesSharingLookup.new)
      ..add(FilesSharingLookup.serializer)
      ..addBuilderFactory(const FullType(FilesSharingShareeLookup_1_Value), FilesSharingShareeLookup_1_Value.new)
      ..add(FilesSharingShareeLookup_1_Value.serializer)
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
        const FullType(FilesSharingShareesapiFindRecommendedResponseApplicationJson),
        FilesSharingShareesapiFindRecommendedResponseApplicationJson.new,
      )
      ..add(FilesSharingShareesapiFindRecommendedResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs),
        FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs.new,
      )
      ..add(FilesSharingShareesapiFindRecommendedResponseApplicationJson_Ocs.serializer)
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
