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

part 'files.openapi.g.dart';

class FilesResponse<T, U> extends DynamiteResponse<T, U> {
  FilesResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesResponse(data: $data, headers: $headers)';
}

class FilesApiException extends DynamiteApiException {
  FilesApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class FilesClient extends DynamiteClient {
  FilesClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesApiClient get api => FilesApiClient(this);
  FilesDirectEditingClient get directEditing => FilesDirectEditingClient(this);
  FilesOpenLocalEditorClient get openLocalEditor => FilesOpenLocalEditorClient(this);
  FilesTemplateClient get template => FilesTemplateClient(this);
  FilesTransferOwnershipClient get transferOwnership => FilesTransferOwnershipClient(this);
}

class FilesApiClient {
  FilesApiClient(this._rootClient);

  final FilesClient _rootClient;

  /// Gets a thumbnail of the specified file
  Future<Uint8List> getThumbnail({
    required final int x,
    required final int y,
    required final String file,
  }) async {
    var path = '/index.php/apps/files/api/v1/thumbnail/{x}/{y}/{file}';
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
    path = path.replaceAll('{x}', Uri.encodeQueryComponent(x.toString()));
    path = path.replaceAll('{y}', Uri.encodeQueryComponent(y.toString()));
    if (!RegExp(r'^.+$').hasMatch(file)) {
      throw Exception('Invalid value "$file" for parameter "file" with pattern "${r'^.+$'}"'); // coverage:ignore-line
    }
    path = path.replaceAll('{file}', Uri.encodeQueryComponent(file));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the service-worker Javascript for previews
  Future<FilesResponse<String, FilesApiApiServiceWorkerHeaders>> serviceWorker() async {
    const path = '/index.php/apps/files/preview-service-worker.js';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/javascript',
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
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return FilesResponse<String, FilesApiApiServiceWorkerHeaders>(
        await response.body,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(FilesApiApiServiceWorkerHeaders),
        )! as FilesApiApiServiceWorkerHeaders,
      );
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesDirectEditingClient {
  FilesDirectEditingClient(this._rootClient);

  final FilesClient _rootClient;

  /// Get the direct editing capabilities
  Future<FilesDirectEditingInfoResponse200ApplicationJson> info({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/apps/files/api/v1/directEditing';
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
        specifiedType: const FullType(FilesDirectEditingInfoResponse200ApplicationJson),
      )! as FilesDirectEditingInfoResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the templates for direct editing
  Future<FilesDirectEditingTemplatesResponse200ApplicationJson> templates({
    required final String editorId,
    required final String creatorId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files/api/v1/directEditing/templates/{editorId}/{creatorId}';
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
    path = path.replaceAll('{editorId}', Uri.encodeQueryComponent(editorId));
    path = path.replaceAll('{creatorId}', Uri.encodeQueryComponent(creatorId));
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
        specifiedType: const FullType(FilesDirectEditingTemplatesResponse200ApplicationJson),
      )! as FilesDirectEditingTemplatesResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Open a file for direct editing
  Future<FilesDirectEditingOpenResponse200ApplicationJson> open({
    required final String path,
    final String? editorId,
    final int? fileId,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/open';
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
    if (editorId != null) {
      queryParameters['editorId'] = editorId;
    }
    if (fileId != null) {
      queryParameters['fileId'] = fileId.toString();
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
        specifiedType: const FullType(FilesDirectEditingOpenResponse200ApplicationJson),
      )! as FilesDirectEditingOpenResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a file for direct editing
  Future<FilesDirectEditingCreateResponse200ApplicationJson> create({
    required final String path,
    required final String editorId,
    required final String creatorId,
    final String? templateId,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/create';
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
    queryParameters['editorId'] = editorId;
    queryParameters['creatorId'] = creatorId;
    if (templateId != null) {
      queryParameters['templateId'] = templateId;
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
        specifiedType: const FullType(FilesDirectEditingCreateResponse200ApplicationJson),
      )! as FilesDirectEditingCreateResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesOpenLocalEditorClient {
  FilesOpenLocalEditorClient(this._rootClient);

  final FilesClient _rootClient;

  /// Create a local editor
  Future<FilesOpenLocalEditorCreateResponse200ApplicationJson> create({
    required final String path,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor';
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
      'post',
      Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesOpenLocalEditorCreateResponse200ApplicationJson),
      )! as FilesOpenLocalEditorCreateResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Validate a local editor
  Future<FilesOpenLocalEditorValidateResponse200ApplicationJson> validate({
    required final String path,
    required final String token,
    final String oCSAPIRequest = 'true',
  }) async {
    var path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor/{token}';
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
    path0 = path0.replaceAll('{token}', Uri.encodeQueryComponent(token));
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
        specifiedType: const FullType(FilesOpenLocalEditorValidateResponse200ApplicationJson),
      )! as FilesOpenLocalEditorValidateResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesTemplateClient {
  FilesTemplateClient(this._rootClient);

  final FilesClient _rootClient;

  /// List the available templates
  Future<FilesTemplateListResponse200ApplicationJson> list({final String oCSAPIRequest = 'true'}) async {
    const path = '/ocs/v2.php/apps/files/api/v1/templates';
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
        specifiedType: const FullType(FilesTemplateListResponse200ApplicationJson),
      )! as FilesTemplateListResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a template
  Future<FilesTemplateCreateResponse200ApplicationJson> create({
    required final String filePath,
    final String templatePath = '',
    final String templateType = 'user',
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files/api/v1/templates/create';
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
    queryParameters['filePath'] = filePath;
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (templateType != 'user') {
      queryParameters['templateType'] = templateType;
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
        specifiedType: const FullType(FilesTemplateCreateResponse200ApplicationJson),
      )! as FilesTemplateCreateResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Initialize the template directory
  Future<FilesTemplatePathResponse200ApplicationJson> path({
    final String templatePath = '',
    final int copySystemTemplates = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/files/api/v1/templates/path';
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
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (copySystemTemplates != 0) {
      queryParameters['copySystemTemplates'] = copySystemTemplates.toString();
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
        specifiedType: const FullType(FilesTemplatePathResponse200ApplicationJson),
      )! as FilesTemplatePathResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }
}

class FilesTransferOwnershipClient {
  FilesTransferOwnershipClient(this._rootClient);

  final FilesClient _rootClient;

  /// Transfer the ownership to another user
  Future<FilesTransferOwnershipTransferResponse200ApplicationJson> transfer({
    required final String recipient,
    required final String path,
    final String oCSAPIRequest = 'true',
  }) async {
    const path0 = '/ocs/v2.php/apps/files/api/v1/transferownership';
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
    queryParameters['recipient'] = recipient;
    queryParameters['path'] = path;
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
        specifiedType: const FullType(FilesTransferOwnershipTransferResponse200ApplicationJson),
      )! as FilesTransferOwnershipTransferResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Accept an ownership transfer
  Future<FilesTransferOwnershipAcceptResponse200ApplicationJson> accept({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files/api/v1/transferownership/{id}';
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
        specifiedType: const FullType(FilesTransferOwnershipAcceptResponse200ApplicationJson),
      )! as FilesTransferOwnershipAcceptResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Reject an ownership transfer
  Future<FilesTransferOwnershipRejectResponse200ApplicationJson> reject({
    required final int id,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files/api/v1/transferownership/{id}';
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
        specifiedType: const FullType(FilesTransferOwnershipRejectResponse200ApplicationJson),
      )! as FilesTransferOwnershipRejectResponse200ApplicationJson;
    }
    throw await FilesApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesApiApiServiceWorkerHeadersInterface {
  @BuiltValueField(wireName: 'service-worker-allowed')
  String? get serviceWorkerAllowed;
  FilesApiApiServiceWorkerHeadersInterface rebuild(
    final void Function(FilesApiApiServiceWorkerHeadersInterfaceBuilder) updates,
  );
  FilesApiApiServiceWorkerHeadersInterfaceBuilder toBuilder();
}

abstract class FilesApiApiServiceWorkerHeaders
    implements
        FilesApiApiServiceWorkerHeadersInterface,
        Built<FilesApiApiServiceWorkerHeaders, FilesApiApiServiceWorkerHeadersBuilder> {
  factory FilesApiApiServiceWorkerHeaders([final void Function(FilesApiApiServiceWorkerHeadersBuilder)? b]) =
      _$FilesApiApiServiceWorkerHeaders;

  // coverage:ignore-start
  const FilesApiApiServiceWorkerHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesApiApiServiceWorkerHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<FilesApiApiServiceWorkerHeaders> get serializer => _$FilesApiApiServiceWorkerHeadersSerializer();
}

class _$FilesApiApiServiceWorkerHeadersSerializer implements StructuredSerializer<FilesApiApiServiceWorkerHeaders> {
  @override
  final Iterable<Type> types = const [FilesApiApiServiceWorkerHeaders, _$FilesApiApiServiceWorkerHeaders];

  @override
  final String wireName = 'FilesApiApiServiceWorkerHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final FilesApiApiServiceWorkerHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  FilesApiApiServiceWorkerHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilesApiApiServiceWorkerHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'service-worker-allowed':
          result.serviceWorkerAllowed = value;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  FilesOCSMetaInterface rebuild(final void Function(FilesOCSMetaInterfaceBuilder) updates);
  FilesOCSMetaInterfaceBuilder toBuilder();
}

abstract class FilesOCSMeta implements FilesOCSMetaInterface, Built<FilesOCSMeta, FilesOCSMetaBuilder> {
  factory FilesOCSMeta([final void Function(FilesOCSMetaBuilder)? b]) = _$FilesOCSMeta;

  // coverage:ignore-start
  const FilesOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOCSMeta> get serializer => _$filesOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsInterface {
  String get id;
  String get name;
  BuiltList<String> get mimetypes;
  BuiltList<String> get optionalMimetypes;
  bool get secure;
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors
    implements
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsInterface,
        Built<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors,
            FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsBuilder> {
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors([
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_EditorsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors> get serializer =>
      _$filesDirectEditingInfoResponse200ApplicationJsonOcsDataEditorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsInterface {
  String get id;
  String get editor;
  String get name;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  bool get templates;
  BuiltList<String> get mimetypes;
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators
    implements
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsInterface,
        Built<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators,
            FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsBuilder> {
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators([
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_CreatorsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators> get serializer =>
      _$filesDirectEditingInfoResponse200ApplicationJsonOcsDataCreatorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataInterface {
  BuiltMap<String, FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors> get editors;
  BuiltMap<String, FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators> get creators;
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data
    implements
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data,
            FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingInfoResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data get data;
  FilesDirectEditingInfoResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponse200ApplicationJson_Ocs
    implements
        FilesDirectEditingInfoResponse200ApplicationJson_OcsInterface,
        Built<FilesDirectEditingInfoResponse200ApplicationJson_Ocs,
            FilesDirectEditingInfoResponse200ApplicationJson_OcsBuilder> {
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs([
    final void Function(FilesDirectEditingInfoResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingInfoResponse200ApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingInfoResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponse200ApplicationJsonInterface {
  FilesDirectEditingInfoResponse200ApplicationJson_Ocs get ocs;
  FilesDirectEditingInfoResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingInfoResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponse200ApplicationJson
    implements
        FilesDirectEditingInfoResponse200ApplicationJsonInterface,
        Built<FilesDirectEditingInfoResponse200ApplicationJson,
            FilesDirectEditingInfoResponse200ApplicationJsonBuilder> {
  factory FilesDirectEditingInfoResponse200ApplicationJson([
    final void Function(FilesDirectEditingInfoResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingInfoResponse200ApplicationJson> get serializer =>
      _$filesDirectEditingInfoResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesInterface {
  String get id;
  String get title;
  String? get preview;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String get mimetype;
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesInterfaceBuilder)
        updates,
  );
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates
    implements
        FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesInterface,
        Built<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates,
            FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesBuilder> {
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates([
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_TemplatesBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates> get serializer =>
      _$filesDirectEditingTemplatesResponse200ApplicationJsonOcsDataTemplatesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataInterface {
  BuiltMap<String, FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates> get templates;
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data
    implements
        FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data,
            FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingTemplatesResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data get data;
  FilesDirectEditingTemplatesResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs
    implements
        FilesDirectEditingTemplatesResponse200ApplicationJson_OcsInterface,
        Built<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs,
            FilesDirectEditingTemplatesResponse200ApplicationJson_OcsBuilder> {
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs([
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingTemplatesResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponse200ApplicationJsonInterface {
  FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs get ocs;
  FilesDirectEditingTemplatesResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponse200ApplicationJson
    implements
        FilesDirectEditingTemplatesResponse200ApplicationJsonInterface,
        Built<FilesDirectEditingTemplatesResponse200ApplicationJson,
            FilesDirectEditingTemplatesResponse200ApplicationJsonBuilder> {
  factory FilesDirectEditingTemplatesResponse200ApplicationJson([
    final void Function(FilesDirectEditingTemplatesResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingTemplatesResponse200ApplicationJson> get serializer =>
      _$filesDirectEditingTemplatesResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataInterface {
  String get url;
  FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data
    implements
        FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data,
            FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingOpenResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingOpenResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data get data;
  FilesDirectEditingOpenResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingOpenResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponse200ApplicationJson_Ocs
    implements
        FilesDirectEditingOpenResponse200ApplicationJson_OcsInterface,
        Built<FilesDirectEditingOpenResponse200ApplicationJson_Ocs,
            FilesDirectEditingOpenResponse200ApplicationJson_OcsBuilder> {
  factory FilesDirectEditingOpenResponse200ApplicationJson_Ocs([
    final void Function(FilesDirectEditingOpenResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingOpenResponse200ApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingOpenResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponse200ApplicationJsonInterface {
  FilesDirectEditingOpenResponse200ApplicationJson_Ocs get ocs;
  FilesDirectEditingOpenResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingOpenResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponse200ApplicationJson
    implements
        FilesDirectEditingOpenResponse200ApplicationJsonInterface,
        Built<FilesDirectEditingOpenResponse200ApplicationJson,
            FilesDirectEditingOpenResponse200ApplicationJsonBuilder> {
  factory FilesDirectEditingOpenResponse200ApplicationJson([
    final void Function(FilesDirectEditingOpenResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingOpenResponse200ApplicationJson> get serializer =>
      _$filesDirectEditingOpenResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataInterface {
  String get url;
  FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data
    implements
        FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data,
            FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingCreateResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingCreateResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data get data;
  FilesDirectEditingCreateResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingCreateResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponse200ApplicationJson_Ocs
    implements
        FilesDirectEditingCreateResponse200ApplicationJson_OcsInterface,
        Built<FilesDirectEditingCreateResponse200ApplicationJson_Ocs,
            FilesDirectEditingCreateResponse200ApplicationJson_OcsBuilder> {
  factory FilesDirectEditingCreateResponse200ApplicationJson_Ocs([
    final void Function(FilesDirectEditingCreateResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingCreateResponse200ApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingCreateResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponse200ApplicationJsonInterface {
  FilesDirectEditingCreateResponse200ApplicationJson_Ocs get ocs;
  FilesDirectEditingCreateResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingCreateResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponse200ApplicationJson
    implements
        FilesDirectEditingCreateResponse200ApplicationJsonInterface,
        Built<FilesDirectEditingCreateResponse200ApplicationJson,
            FilesDirectEditingCreateResponse200ApplicationJsonBuilder> {
  factory FilesDirectEditingCreateResponse200ApplicationJson([
    final void Function(FilesDirectEditingCreateResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesDirectEditingCreateResponse200ApplicationJson> get serializer =>
      _$filesDirectEditingCreateResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataInterface {
  String? get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
  FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data
    implements
        FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data,
            FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesOpenLocalEditorCreateResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data get data;
  FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs
    implements
        FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsInterface,
        Built<FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs,
            FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsBuilder> {
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs([
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs> get serializer =>
      _$filesOpenLocalEditorCreateResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponse200ApplicationJsonInterface {
  FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs get ocs;
  FilesOpenLocalEditorCreateResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponse200ApplicationJson
    implements
        FilesOpenLocalEditorCreateResponse200ApplicationJsonInterface,
        Built<FilesOpenLocalEditorCreateResponse200ApplicationJson,
            FilesOpenLocalEditorCreateResponse200ApplicationJsonBuilder> {
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson([
    final void Function(FilesOpenLocalEditorCreateResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorCreateResponse200ApplicationJson> get serializer =>
      _$filesOpenLocalEditorCreateResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataInterface {
  String get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
  FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data
    implements
        FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data,
            FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesOpenLocalEditorValidateResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data get data;
  FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs
    implements
        FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsInterface,
        Built<FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs,
            FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsBuilder> {
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs([
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs> get serializer =>
      _$filesOpenLocalEditorValidateResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponse200ApplicationJsonInterface {
  FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs get ocs;
  FilesOpenLocalEditorValidateResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponse200ApplicationJson
    implements
        FilesOpenLocalEditorValidateResponse200ApplicationJsonInterface,
        Built<FilesOpenLocalEditorValidateResponse200ApplicationJson,
            FilesOpenLocalEditorValidateResponse200ApplicationJsonBuilder> {
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson([
    final void Function(FilesOpenLocalEditorValidateResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesOpenLocalEditorValidateResponse200ApplicationJson> get serializer =>
      _$filesOpenLocalEditorValidateResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateFileCreatorInterface {
  String get app;
  String get label;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String? get iconClass;
  BuiltList<String> get mimetypes;
  num? get ratio;
  String get actionLabel;
  FilesTemplateFileCreatorInterface rebuild(final void Function(FilesTemplateFileCreatorInterfaceBuilder) updates);
  FilesTemplateFileCreatorInterfaceBuilder toBuilder();
}

abstract class FilesTemplateFileCreator
    implements FilesTemplateFileCreatorInterface, Built<FilesTemplateFileCreator, FilesTemplateFileCreatorBuilder> {
  factory FilesTemplateFileCreator([final void Function(FilesTemplateFileCreatorBuilder)? b]) =
      _$FilesTemplateFileCreator;

  // coverage:ignore-start
  const FilesTemplateFileCreator._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateFileCreator.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateFileCreator> get serializer => _$filesTemplateFileCreatorSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateListResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  BuiltList<FilesTemplateFileCreator> get data;
  FilesTemplateListResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplateListResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplateListResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplateListResponse200ApplicationJson_Ocs
    implements
        FilesTemplateListResponse200ApplicationJson_OcsInterface,
        Built<FilesTemplateListResponse200ApplicationJson_Ocs, FilesTemplateListResponse200ApplicationJson_OcsBuilder> {
  factory FilesTemplateListResponse200ApplicationJson_Ocs([
    final void Function(FilesTemplateListResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplateListResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplateListResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateListResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateListResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTemplateListResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateListResponse200ApplicationJsonInterface {
  FilesTemplateListResponse200ApplicationJson_Ocs get ocs;
  FilesTemplateListResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTemplateListResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplateListResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplateListResponse200ApplicationJson
    implements
        FilesTemplateListResponse200ApplicationJsonInterface,
        Built<FilesTemplateListResponse200ApplicationJson, FilesTemplateListResponse200ApplicationJsonBuilder> {
  factory FilesTemplateListResponse200ApplicationJson([
    final void Function(FilesTemplateListResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTemplateListResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTemplateListResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateListResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateListResponse200ApplicationJson> get serializer =>
      _$filesTemplateListResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateFileInterface {
  String get basename;
  String get etag;
  int get fileid;
  String? get filename;
  int get lastmod;
  String get mime;
  int get size;
  String get type;
  bool get hasPreview;
  FilesTemplateFileInterface rebuild(final void Function(FilesTemplateFileInterfaceBuilder) updates);
  FilesTemplateFileInterfaceBuilder toBuilder();
}

abstract class FilesTemplateFile
    implements FilesTemplateFileInterface, Built<FilesTemplateFile, FilesTemplateFileBuilder> {
  factory FilesTemplateFile([final void Function(FilesTemplateFileBuilder)? b]) = _$FilesTemplateFile;

  // coverage:ignore-start
  const FilesTemplateFile._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateFile.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateFile> get serializer => _$filesTemplateFileSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateCreateResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesTemplateFile get data;
  FilesTemplateCreateResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplateCreateResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplateCreateResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplateCreateResponse200ApplicationJson_Ocs
    implements
        FilesTemplateCreateResponse200ApplicationJson_OcsInterface,
        Built<FilesTemplateCreateResponse200ApplicationJson_Ocs,
            FilesTemplateCreateResponse200ApplicationJson_OcsBuilder> {
  factory FilesTemplateCreateResponse200ApplicationJson_Ocs([
    final void Function(FilesTemplateCreateResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplateCreateResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplateCreateResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateCreateResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateCreateResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTemplateCreateResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateCreateResponse200ApplicationJsonInterface {
  FilesTemplateCreateResponse200ApplicationJson_Ocs get ocs;
  FilesTemplateCreateResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTemplateCreateResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplateCreateResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplateCreateResponse200ApplicationJson
    implements
        FilesTemplateCreateResponse200ApplicationJsonInterface,
        Built<FilesTemplateCreateResponse200ApplicationJson, FilesTemplateCreateResponse200ApplicationJsonBuilder> {
  factory FilesTemplateCreateResponse200ApplicationJson([
    final void Function(FilesTemplateCreateResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTemplateCreateResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTemplateCreateResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateCreateResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplateCreateResponse200ApplicationJson> get serializer =>
      _$filesTemplateCreateResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponse200ApplicationJson_Ocs_DataInterface {
  @BuiltValueField(wireName: 'template_path')
  String get templatePath;
  BuiltList<FilesTemplateFileCreator> get templates;
  FilesTemplatePathResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesTemplatePathResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesTemplatePathResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponse200ApplicationJson_Ocs_Data
    implements
        FilesTemplatePathResponse200ApplicationJson_Ocs_DataInterface,
        Built<FilesTemplatePathResponse200ApplicationJson_Ocs_Data,
            FilesTemplatePathResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesTemplatePathResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesTemplatePathResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesTemplatePathResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesTemplatePathResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplatePathResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesTemplatePathResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesTemplatePathResponse200ApplicationJson_Ocs_Data get data;
  FilesTemplatePathResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplatePathResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplatePathResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponse200ApplicationJson_Ocs
    implements
        FilesTemplatePathResponse200ApplicationJson_OcsInterface,
        Built<FilesTemplatePathResponse200ApplicationJson_Ocs, FilesTemplatePathResponse200ApplicationJson_OcsBuilder> {
  factory FilesTemplatePathResponse200ApplicationJson_Ocs([
    final void Function(FilesTemplatePathResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplatePathResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplatePathResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplatePathResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTemplatePathResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponse200ApplicationJsonInterface {
  FilesTemplatePathResponse200ApplicationJson_Ocs get ocs;
  FilesTemplatePathResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTemplatePathResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplatePathResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponse200ApplicationJson
    implements
        FilesTemplatePathResponse200ApplicationJsonInterface,
        Built<FilesTemplatePathResponse200ApplicationJson, FilesTemplatePathResponse200ApplicationJsonBuilder> {
  factory FilesTemplatePathResponse200ApplicationJson([
    final void Function(FilesTemplatePathResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTemplatePathResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTemplatePathResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplatePathResponse200ApplicationJson> get serializer =>
      _$filesTemplatePathResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipTransferResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipTransferResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipTransferResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipTransferResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs
    implements
        FilesTransferOwnershipTransferResponse200ApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs,
            FilesTransferOwnershipTransferResponse200ApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipTransferResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipTransferResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipTransferResponse200ApplicationJsonInterface {
  FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs get ocs;
  FilesTransferOwnershipTransferResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipTransferResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipTransferResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipTransferResponse200ApplicationJson
    implements
        FilesTransferOwnershipTransferResponse200ApplicationJsonInterface,
        Built<FilesTransferOwnershipTransferResponse200ApplicationJson,
            FilesTransferOwnershipTransferResponse200ApplicationJsonBuilder> {
  factory FilesTransferOwnershipTransferResponse200ApplicationJson([
    final void Function(FilesTransferOwnershipTransferResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipTransferResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipTransferResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipTransferResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipTransferResponse200ApplicationJson> get serializer =>
      _$filesTransferOwnershipTransferResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs
    implements
        FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs,
            FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipAcceptResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipAcceptResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipAcceptResponse200ApplicationJsonInterface {
  FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs get ocs;
  FilesTransferOwnershipAcceptResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipAcceptResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipAcceptResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipAcceptResponse200ApplicationJson
    implements
        FilesTransferOwnershipAcceptResponse200ApplicationJsonInterface,
        Built<FilesTransferOwnershipAcceptResponse200ApplicationJson,
            FilesTransferOwnershipAcceptResponse200ApplicationJsonBuilder> {
  factory FilesTransferOwnershipAcceptResponse200ApplicationJson([
    final void Function(FilesTransferOwnershipAcceptResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipAcceptResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipAcceptResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipAcceptResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipAcceptResponse200ApplicationJson> get serializer =>
      _$filesTransferOwnershipAcceptResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipRejectResponse200ApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipRejectResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipRejectResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipRejectResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs
    implements
        FilesTransferOwnershipRejectResponse200ApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs,
            FilesTransferOwnershipRejectResponse200ApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipRejectResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipRejectResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipRejectResponse200ApplicationJsonInterface {
  FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs get ocs;
  FilesTransferOwnershipRejectResponse200ApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipRejectResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipRejectResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipRejectResponse200ApplicationJson
    implements
        FilesTransferOwnershipRejectResponse200ApplicationJsonInterface,
        Built<FilesTransferOwnershipRejectResponse200ApplicationJson,
            FilesTransferOwnershipRejectResponse200ApplicationJsonBuilder> {
  factory FilesTransferOwnershipRejectResponse200ApplicationJson([
    final void Function(FilesTransferOwnershipRejectResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipRejectResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipRejectResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipRejectResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTransferOwnershipRejectResponse200ApplicationJson> get serializer =>
      _$filesTransferOwnershipRejectResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesCapabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
  FilesCapabilities_Files_DirectEditingInterface rebuild(
    final void Function(FilesCapabilities_Files_DirectEditingInterfaceBuilder) updates,
  );
  FilesCapabilities_Files_DirectEditingInterfaceBuilder toBuilder();
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
  FilesCapabilities_FilesInterface rebuild(final void Function(FilesCapabilities_FilesInterfaceBuilder) updates);
  FilesCapabilities_FilesInterfaceBuilder toBuilder();
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
  FilesCapabilitiesInterface rebuild(final void Function(FilesCapabilitiesInterfaceBuilder) updates);
  FilesCapabilitiesInterfaceBuilder toBuilder();
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
abstract interface class FilesTemplateInterface {
  String get templateType;
  String get templateId;
  String get basename;
  String get etag;
  int get fileid;
  String get filename;
  int get lastmod;
  String get mime;
  int get size;
  String get type;
  bool get hasPreview;
  String? get previewUrl;
  FilesTemplateInterface rebuild(final void Function(FilesTemplateInterfaceBuilder) updates);
  FilesTemplateInterfaceBuilder toBuilder();
}

abstract class FilesTemplate implements FilesTemplateInterface, Built<FilesTemplate, FilesTemplateBuilder> {
  factory FilesTemplate([final void Function(FilesTemplateBuilder)? b]) = _$FilesTemplate;

  // coverage:ignore-start
  const FilesTemplate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<FilesTemplate> get serializer => _$filesTemplateSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(FilesApiApiServiceWorkerHeaders), FilesApiApiServiceWorkerHeaders.new)
      ..add(FilesApiApiServiceWorkerHeaders.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponse200ApplicationJson),
        FilesDirectEditingInfoResponse200ApplicationJson.new,
      )
      ..add(FilesDirectEditingInfoResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs),
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingInfoResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesOCSMeta), FilesOCSMeta.new)
      ..add(FilesOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data),
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors),
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors.new,
      )
      ..add(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors)],
        ),
        MapBuilder<String, FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Editors>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators),
        FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators.new,
      )
      ..add(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators)],
        ),
        MapBuilder<String, FilesDirectEditingInfoResponse200ApplicationJson_Ocs_Data_Creators>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponse200ApplicationJson),
        FilesDirectEditingTemplatesResponse200ApplicationJson.new,
      )
      ..add(FilesDirectEditingTemplatesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs),
        FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data),
        FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates),
        FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates.new,
      )
      ..add(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates)],
        ),
        MapBuilder<String, FilesDirectEditingTemplatesResponse200ApplicationJson_Ocs_Data_Templates>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponse200ApplicationJson),
        FilesDirectEditingOpenResponse200ApplicationJson.new,
      )
      ..add(FilesDirectEditingOpenResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponse200ApplicationJson_Ocs),
        FilesDirectEditingOpenResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingOpenResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data),
        FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingOpenResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponse200ApplicationJson),
        FilesDirectEditingCreateResponse200ApplicationJson.new,
      )
      ..add(FilesDirectEditingCreateResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponse200ApplicationJson_Ocs),
        FilesDirectEditingCreateResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingCreateResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data),
        FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingCreateResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponse200ApplicationJson),
        FilesOpenLocalEditorCreateResponse200ApplicationJson.new,
      )
      ..add(FilesOpenLocalEditorCreateResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs),
        FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data),
        FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesOpenLocalEditorCreateResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponse200ApplicationJson),
        FilesOpenLocalEditorValidateResponse200ApplicationJson.new,
      )
      ..add(FilesOpenLocalEditorValidateResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs),
        FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data),
        FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesOpenLocalEditorValidateResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateListResponse200ApplicationJson),
        FilesTemplateListResponse200ApplicationJson.new,
      )
      ..add(FilesTemplateListResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateListResponse200ApplicationJson_Ocs),
        FilesTemplateListResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTemplateListResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesTemplateFileCreator), FilesTemplateFileCreator.new)
      ..add(FilesTemplateFileCreator.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesTemplateFileCreator)]),
        ListBuilder<FilesTemplateFileCreator>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesTemplateCreateResponse200ApplicationJson),
        FilesTemplateCreateResponse200ApplicationJson.new,
      )
      ..add(FilesTemplateCreateResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateCreateResponse200ApplicationJson_Ocs),
        FilesTemplateCreateResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTemplateCreateResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesTemplateFile), FilesTemplateFile.new)
      ..add(FilesTemplateFile.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponse200ApplicationJson),
        FilesTemplatePathResponse200ApplicationJson.new,
      )
      ..add(FilesTemplatePathResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponse200ApplicationJson_Ocs),
        FilesTemplatePathResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTemplatePathResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponse200ApplicationJson_Ocs_Data),
        FilesTemplatePathResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesTemplatePathResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipTransferResponse200ApplicationJson),
        FilesTransferOwnershipTransferResponse200ApplicationJson.new,
      )
      ..add(FilesTransferOwnershipTransferResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs),
        FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipTransferResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipAcceptResponse200ApplicationJson),
        FilesTransferOwnershipAcceptResponse200ApplicationJson.new,
      )
      ..add(FilesTransferOwnershipAcceptResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs),
        FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipAcceptResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipRejectResponse200ApplicationJson),
        FilesTransferOwnershipRejectResponse200ApplicationJson.new,
      )
      ..add(FilesTransferOwnershipRejectResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs),
        FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipRejectResponse200ApplicationJson_Ocs.serializer)
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
      ..addBuilderFactory(const FullType(FilesTemplate), FilesTemplate.new)
      ..add(FilesTemplate.serializer))
    .build();

Serializers get filesSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFiles<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFiles<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
