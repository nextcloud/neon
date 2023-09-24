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
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files.openapi.g.dart';

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
  Future<DynamiteResponse<Uint8List, void>> getThumbnail({
    required final int x,
    required final int y,
    required final String file,
  }) async {
    final rawResponse = getThumbnailRaw(
      x: x,
      y: y,
      file: file,
    );

    return rawResponse.future;
  }

  /// Gets a thumbnail of the specified file
  DynamiteRawResponse<Uint8List, void> getThumbnailRaw({
    required final int x,
    required final int y,
    required final String file,
  }) {
    var path = '/index.php/apps/files/api/v1/thumbnail/{x}/{y}/{file}';
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
    path = path.replaceAll('{x}', Uri.encodeQueryComponent(x.toString()));
    path = path.replaceAll('{y}', Uri.encodeQueryComponent(y.toString()));
    checkPattern(file, RegExp(r'^.+$'), 'file'); // coverage:ignore-line
    path = path.replaceAll('{file}', Uri.encodeQueryComponent(file));
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

class FilesDirectEditingClient {
  FilesDirectEditingClient(this._rootClient);

  final FilesClient _rootClient;

  /// Get the direct editing capabilities
  Future<DynamiteResponse<FilesDirectEditingInfoResponseApplicationJson, void>> info({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = infoRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the direct editing capabilities
  DynamiteRawResponse<FilesDirectEditingInfoResponseApplicationJson, void> infoRaw({final bool oCSAPIRequest = true}) {
    const path = '/ocs/v2.php/apps/files/api/v1/directEditing';
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
    return DynamiteRawResponse<FilesDirectEditingInfoResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesDirectEditingInfoResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the templates for direct editing
  Future<DynamiteResponse<FilesDirectEditingTemplatesResponseApplicationJson, void>> templates({
    required final String editorId,
    required final String creatorId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = templatesRaw(
      editorId: editorId,
      creatorId: creatorId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the templates for direct editing
  DynamiteRawResponse<FilesDirectEditingTemplatesResponseApplicationJson, void> templatesRaw({
    required final String editorId,
    required final String creatorId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files/api/v1/directEditing/templates/{editorId}/{creatorId}';
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
    path = path.replaceAll('{editorId}', Uri.encodeQueryComponent(editorId));
    path = path.replaceAll('{creatorId}', Uri.encodeQueryComponent(creatorId));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesDirectEditingTemplatesResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesDirectEditingTemplatesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Open a file for direct editing
  Future<DynamiteResponse<FilesDirectEditingOpenResponseApplicationJson, void>> open({
    required final String path,
    final String? editorId,
    final int? fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = openRaw(
      path: path,
      editorId: editorId,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Open a file for direct editing
  DynamiteRawResponse<FilesDirectEditingOpenResponseApplicationJson, void> openRaw({
    required final String path,
    final String? editorId,
    final int? fileId,
    final bool oCSAPIRequest = true,
  }) {
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/open';
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
    queryParameters['path'] = path;
    if (editorId != null) {
      queryParameters['editorId'] = editorId;
    }
    if (fileId != null) {
      queryParameters['fileId'] = fileId.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesDirectEditingOpenResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesDirectEditingOpenResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a file for direct editing
  Future<DynamiteResponse<FilesDirectEditingCreateResponseApplicationJson, void>> create({
    required final String path,
    required final String editorId,
    required final String creatorId,
    final String? templateId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = createRaw(
      path: path,
      editorId: editorId,
      creatorId: creatorId,
      templateId: templateId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a file for direct editing
  DynamiteRawResponse<FilesDirectEditingCreateResponseApplicationJson, void> createRaw({
    required final String path,
    required final String editorId,
    required final String creatorId,
    final String? templateId,
    final bool oCSAPIRequest = true,
  }) {
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/create';
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
    queryParameters['path'] = path;
    queryParameters['editorId'] = editorId;
    queryParameters['creatorId'] = creatorId;
    if (templateId != null) {
      queryParameters['templateId'] = templateId;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesDirectEditingCreateResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesDirectEditingCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class FilesOpenLocalEditorClient {
  FilesOpenLocalEditorClient(this._rootClient);

  final FilesClient _rootClient;

  /// Create a local editor
  Future<DynamiteResponse<FilesOpenLocalEditorCreateResponseApplicationJson, void>> create({
    required final String path,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = createRaw(
      path: path,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a local editor
  DynamiteRawResponse<FilesOpenLocalEditorCreateResponseApplicationJson, void> createRaw({
    required final String path,
    final bool oCSAPIRequest = true,
  }) {
    const path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor';
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
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesOpenLocalEditorCreateResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesOpenLocalEditorCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Validate a local editor
  Future<DynamiteResponse<FilesOpenLocalEditorValidateResponseApplicationJson, void>> validate({
    required final String path,
    required final String token,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = validateRaw(
      path: path,
      token: token,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Validate a local editor
  DynamiteRawResponse<FilesOpenLocalEditorValidateResponseApplicationJson, void> validateRaw({
    required final String path,
    required final String token,
    final bool oCSAPIRequest = true,
  }) {
    var path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor/{token}';
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
    queryParameters['path'] = path;
    path0 = path0.replaceAll('{token}', Uri.encodeQueryComponent(token));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesOpenLocalEditorValidateResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesOpenLocalEditorValidateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class FilesTemplateClient {
  FilesTemplateClient(this._rootClient);

  final FilesClient _rootClient;

  /// List the available templates
  Future<DynamiteResponse<FilesTemplateListResponseApplicationJson, void>> list({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// List the available templates
  DynamiteRawResponse<FilesTemplateListResponseApplicationJson, void> listRaw({final bool oCSAPIRequest = true}) {
    const path = '/ocs/v2.php/apps/files/api/v1/templates';
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
    return DynamiteRawResponse<FilesTemplateListResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesTemplateListResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a template
  Future<DynamiteResponse<FilesTemplateCreateResponseApplicationJson, void>> create({
    required final String filePath,
    final String templatePath = '',
    final String templateType = 'user',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = createRaw(
      filePath: filePath,
      templatePath: templatePath,
      templateType: templateType,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a template
  DynamiteRawResponse<FilesTemplateCreateResponseApplicationJson, void> createRaw({
    required final String filePath,
    final String templatePath = '',
    final String templateType = 'user',
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/apps/files/api/v1/templates/create';
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
    queryParameters['filePath'] = filePath;
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (templateType != 'user') {
      queryParameters['templateType'] = templateType;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesTemplateCreateResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesTemplateCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Initialize the template directory
  Future<DynamiteResponse<FilesTemplatePathResponseApplicationJson, void>> path({
    final String templatePath = '',
    final int copySystemTemplates = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = pathRaw(
      templatePath: templatePath,
      copySystemTemplates: copySystemTemplates,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Initialize the template directory
  DynamiteRawResponse<FilesTemplatePathResponseApplicationJson, void> pathRaw({
    final String templatePath = '',
    final int copySystemTemplates = 0,
    final bool oCSAPIRequest = true,
  }) {
    const path = '/ocs/v2.php/apps/files/api/v1/templates/path';
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
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (copySystemTemplates != 0) {
      queryParameters['copySystemTemplates'] = copySystemTemplates.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesTemplatePathResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesTemplatePathResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class FilesTransferOwnershipClient {
  FilesTransferOwnershipClient(this._rootClient);

  final FilesClient _rootClient;

  /// Transfer the ownership to another user
  Future<DynamiteResponse<FilesTransferOwnershipTransferResponseApplicationJson, void>> transfer({
    required final String recipient,
    required final String path,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = transferRaw(
      recipient: recipient,
      path: path,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Transfer the ownership to another user
  DynamiteRawResponse<FilesTransferOwnershipTransferResponseApplicationJson, void> transferRaw({
    required final String recipient,
    required final String path,
    final bool oCSAPIRequest = true,
  }) {
    const path0 = '/ocs/v2.php/apps/files/api/v1/transferownership';
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
    queryParameters['recipient'] = recipient;
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesTransferOwnershipTransferResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 400, 403},
      ),
      bodyType: const FullType(FilesTransferOwnershipTransferResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Accept an ownership transfer
  Future<DynamiteResponse<FilesTransferOwnershipAcceptResponseApplicationJson, void>> accept({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = acceptRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Accept an ownership transfer
  DynamiteRawResponse<FilesTransferOwnershipAcceptResponseApplicationJson, void> acceptRaw({
    required final int id,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files/api/v1/transferownership/{id}';
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
    return DynamiteRawResponse<FilesTransferOwnershipAcceptResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 403, 404},
      ),
      bodyType: const FullType(FilesTransferOwnershipAcceptResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Reject an ownership transfer
  Future<DynamiteResponse<FilesTransferOwnershipRejectResponseApplicationJson, void>> reject({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = rejectRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Reject an ownership transfer
  DynamiteRawResponse<FilesTransferOwnershipRejectResponseApplicationJson, void> rejectRaw({
    required final int id,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files/api/v1/transferownership/{id}';
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
    return DynamiteRawResponse<FilesTransferOwnershipRejectResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 403, 404},
      ),
      bodyType: const FullType(FilesTransferOwnershipRejectResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
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
abstract interface class FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface {
  String get id;
  String get name;
  BuiltList<String> get mimetypes;
  BuiltList<String> get optionalMimetypes;
  bool get secure;
  FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors
    implements
        FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface,
        Built<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors,
            FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder> {
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors([
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get serializer =>
      _$filesDirectEditingInfoResponseApplicationJsonOcsDataEditorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface {
  String get id;
  String get editor;
  String get name;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  bool get templates;
  BuiltList<String> get mimetypes;
  FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators
    implements
        FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface,
        Built<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators,
            FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder> {
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators([
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get serializer =>
      _$filesDirectEditingInfoResponseApplicationJsonOcsDataCreatorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get editors;
  BuiltMap<String, FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get creators;
  FilesDirectEditingInfoResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponseApplicationJson_Ocs_Data
    implements
        FilesDirectEditingInfoResponseApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data,
            FilesDirectEditingInfoResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingInfoResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingInfoResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingInfoResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingInfoResponseApplicationJson_Ocs_Data get data;
  FilesDirectEditingInfoResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingInfoResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponseApplicationJson_Ocs
    implements
        FilesDirectEditingInfoResponseApplicationJson_OcsInterface,
        Built<FilesDirectEditingInfoResponseApplicationJson_Ocs,
            FilesDirectEditingInfoResponseApplicationJson_OcsBuilder> {
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs([
    final void Function(FilesDirectEditingInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingInfoResponseApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingInfoResponseApplicationJsonInterface {
  FilesDirectEditingInfoResponseApplicationJson_Ocs get ocs;
  FilesDirectEditingInfoResponseApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingInfoResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingInfoResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingInfoResponseApplicationJson
    implements
        FilesDirectEditingInfoResponseApplicationJsonInterface,
        Built<FilesDirectEditingInfoResponseApplicationJson, FilesDirectEditingInfoResponseApplicationJsonBuilder> {
  factory FilesDirectEditingInfoResponseApplicationJson([
    final void Function(FilesDirectEditingInfoResponseApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingInfoResponseApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingInfoResponseApplicationJson> get serializer =>
      _$filesDirectEditingInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface {
  String get id;
  String get title;
  String? get preview;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String get mimetype;
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates
    implements
        FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface,
        Built<FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates,
            FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder> {
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates([
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get serializer =>
      _$filesDirectEditingTemplatesResponseApplicationJsonOcsDataTemplatesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get templates;
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data
    implements
        FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data,
            FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingTemplatesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data get data;
  FilesDirectEditingTemplatesResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponseApplicationJson_Ocs
    implements
        FilesDirectEditingTemplatesResponseApplicationJson_OcsInterface,
        Built<FilesDirectEditingTemplatesResponseApplicationJson_Ocs,
            FilesDirectEditingTemplatesResponseApplicationJson_OcsBuilder> {
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs([
    final void Function(FilesDirectEditingTemplatesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingTemplatesResponseApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingTemplatesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingTemplatesResponseApplicationJsonInterface {
  FilesDirectEditingTemplatesResponseApplicationJson_Ocs get ocs;
  FilesDirectEditingTemplatesResponseApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingTemplatesResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingTemplatesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingTemplatesResponseApplicationJson
    implements
        FilesDirectEditingTemplatesResponseApplicationJsonInterface,
        Built<FilesDirectEditingTemplatesResponseApplicationJson,
            FilesDirectEditingTemplatesResponseApplicationJsonBuilder> {
  factory FilesDirectEditingTemplatesResponseApplicationJson([
    final void Function(FilesDirectEditingTemplatesResponseApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingTemplatesResponseApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingTemplatesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingTemplatesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingTemplatesResponseApplicationJson> get serializer =>
      _$filesDirectEditingTemplatesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponseApplicationJson_Ocs_DataInterface {
  String get url;
  FilesDirectEditingOpenResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingOpenResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponseApplicationJson_Ocs_Data
    implements
        FilesDirectEditingOpenResponseApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingOpenResponseApplicationJson_Ocs_Data,
            FilesDirectEditingOpenResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingOpenResponseApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingOpenResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingOpenResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingOpenResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingOpenResponseApplicationJson_Ocs_Data get data;
  FilesDirectEditingOpenResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingOpenResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponseApplicationJson_Ocs
    implements
        FilesDirectEditingOpenResponseApplicationJson_OcsInterface,
        Built<FilesDirectEditingOpenResponseApplicationJson_Ocs,
            FilesDirectEditingOpenResponseApplicationJson_OcsBuilder> {
  factory FilesDirectEditingOpenResponseApplicationJson_Ocs([
    final void Function(FilesDirectEditingOpenResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingOpenResponseApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingOpenResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingOpenResponseApplicationJsonInterface {
  FilesDirectEditingOpenResponseApplicationJson_Ocs get ocs;
  FilesDirectEditingOpenResponseApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingOpenResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingOpenResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingOpenResponseApplicationJson
    implements
        FilesDirectEditingOpenResponseApplicationJsonInterface,
        Built<FilesDirectEditingOpenResponseApplicationJson, FilesDirectEditingOpenResponseApplicationJsonBuilder> {
  factory FilesDirectEditingOpenResponseApplicationJson([
    final void Function(FilesDirectEditingOpenResponseApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingOpenResponseApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingOpenResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingOpenResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingOpenResponseApplicationJson> get serializer =>
      _$filesDirectEditingOpenResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponseApplicationJson_Ocs_DataInterface {
  String get url;
  FilesDirectEditingCreateResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesDirectEditingCreateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponseApplicationJson_Ocs_Data
    implements
        FilesDirectEditingCreateResponseApplicationJson_Ocs_DataInterface,
        Built<FilesDirectEditingCreateResponseApplicationJson_Ocs_Data,
            FilesDirectEditingCreateResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesDirectEditingCreateResponseApplicationJson_Ocs_Data([
    final void Function(FilesDirectEditingCreateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingCreateResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesDirectEditingCreateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesDirectEditingCreateResponseApplicationJson_Ocs_Data get data;
  FilesDirectEditingCreateResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesDirectEditingCreateResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponseApplicationJson_Ocs
    implements
        FilesDirectEditingCreateResponseApplicationJson_OcsInterface,
        Built<FilesDirectEditingCreateResponseApplicationJson_Ocs,
            FilesDirectEditingCreateResponseApplicationJson_OcsBuilder> {
  factory FilesDirectEditingCreateResponseApplicationJson_Ocs([
    final void Function(FilesDirectEditingCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingCreateResponseApplicationJson_Ocs> get serializer =>
      _$filesDirectEditingCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesDirectEditingCreateResponseApplicationJsonInterface {
  FilesDirectEditingCreateResponseApplicationJson_Ocs get ocs;
  FilesDirectEditingCreateResponseApplicationJsonInterface rebuild(
    final void Function(FilesDirectEditingCreateResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesDirectEditingCreateResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesDirectEditingCreateResponseApplicationJson
    implements
        FilesDirectEditingCreateResponseApplicationJsonInterface,
        Built<FilesDirectEditingCreateResponseApplicationJson, FilesDirectEditingCreateResponseApplicationJsonBuilder> {
  factory FilesDirectEditingCreateResponseApplicationJson([
    final void Function(FilesDirectEditingCreateResponseApplicationJsonBuilder)? b,
  ]) = _$FilesDirectEditingCreateResponseApplicationJson;

  // coverage:ignore-start
  const FilesDirectEditingCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesDirectEditingCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesDirectEditingCreateResponseApplicationJson> get serializer =>
      _$filesDirectEditingCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface {
  String? get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
  FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data
    implements
        FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface,
        Built<FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
            FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data([
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesOpenLocalEditorCreateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data get data;
  FilesOpenLocalEditorCreateResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponseApplicationJson_Ocs
    implements
        FilesOpenLocalEditorCreateResponseApplicationJson_OcsInterface,
        Built<FilesOpenLocalEditorCreateResponseApplicationJson_Ocs,
            FilesOpenLocalEditorCreateResponseApplicationJson_OcsBuilder> {
  factory FilesOpenLocalEditorCreateResponseApplicationJson_Ocs([
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorCreateResponseApplicationJson_Ocs> get serializer =>
      _$filesOpenLocalEditorCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorCreateResponseApplicationJsonInterface {
  FilesOpenLocalEditorCreateResponseApplicationJson_Ocs get ocs;
  FilesOpenLocalEditorCreateResponseApplicationJsonInterface rebuild(
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorCreateResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorCreateResponseApplicationJson
    implements
        FilesOpenLocalEditorCreateResponseApplicationJsonInterface,
        Built<FilesOpenLocalEditorCreateResponseApplicationJson,
            FilesOpenLocalEditorCreateResponseApplicationJsonBuilder> {
  factory FilesOpenLocalEditorCreateResponseApplicationJson([
    final void Function(FilesOpenLocalEditorCreateResponseApplicationJsonBuilder)? b,
  ]) = _$FilesOpenLocalEditorCreateResponseApplicationJson;

  // coverage:ignore-start
  const FilesOpenLocalEditorCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorCreateResponseApplicationJson> get serializer =>
      _$filesOpenLocalEditorCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
  FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data
    implements
        FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface,
        Built<FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
            FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data([
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesOpenLocalEditorValidateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data get data;
  FilesOpenLocalEditorValidateResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponseApplicationJson_Ocs
    implements
        FilesOpenLocalEditorValidateResponseApplicationJson_OcsInterface,
        Built<FilesOpenLocalEditorValidateResponseApplicationJson_Ocs,
            FilesOpenLocalEditorValidateResponseApplicationJson_OcsBuilder> {
  factory FilesOpenLocalEditorValidateResponseApplicationJson_Ocs([
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorValidateResponseApplicationJson_Ocs> get serializer =>
      _$filesOpenLocalEditorValidateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesOpenLocalEditorValidateResponseApplicationJsonInterface {
  FilesOpenLocalEditorValidateResponseApplicationJson_Ocs get ocs;
  FilesOpenLocalEditorValidateResponseApplicationJsonInterface rebuild(
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesOpenLocalEditorValidateResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesOpenLocalEditorValidateResponseApplicationJson
    implements
        FilesOpenLocalEditorValidateResponseApplicationJsonInterface,
        Built<FilesOpenLocalEditorValidateResponseApplicationJson,
            FilesOpenLocalEditorValidateResponseApplicationJsonBuilder> {
  factory FilesOpenLocalEditorValidateResponseApplicationJson([
    final void Function(FilesOpenLocalEditorValidateResponseApplicationJsonBuilder)? b,
  ]) = _$FilesOpenLocalEditorValidateResponseApplicationJson;

  // coverage:ignore-start
  const FilesOpenLocalEditorValidateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesOpenLocalEditorValidateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesOpenLocalEditorValidateResponseApplicationJson> get serializer =>
      _$filesOpenLocalEditorValidateResponseApplicationJsonSerializer;
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
abstract interface class FilesTemplateListResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  BuiltList<FilesTemplateFileCreator> get data;
  FilesTemplateListResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplateListResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplateListResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplateListResponseApplicationJson_Ocs
    implements
        FilesTemplateListResponseApplicationJson_OcsInterface,
        Built<FilesTemplateListResponseApplicationJson_Ocs, FilesTemplateListResponseApplicationJson_OcsBuilder> {
  factory FilesTemplateListResponseApplicationJson_Ocs([
    final void Function(FilesTemplateListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplateListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplateListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplateListResponseApplicationJson_Ocs> get serializer =>
      _$filesTemplateListResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateListResponseApplicationJsonInterface {
  FilesTemplateListResponseApplicationJson_Ocs get ocs;
  FilesTemplateListResponseApplicationJsonInterface rebuild(
    final void Function(FilesTemplateListResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplateListResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplateListResponseApplicationJson
    implements
        FilesTemplateListResponseApplicationJsonInterface,
        Built<FilesTemplateListResponseApplicationJson, FilesTemplateListResponseApplicationJsonBuilder> {
  factory FilesTemplateListResponseApplicationJson([
    final void Function(FilesTemplateListResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTemplateListResponseApplicationJson;

  // coverage:ignore-start
  const FilesTemplateListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplateListResponseApplicationJson> get serializer =>
      _$filesTemplateListResponseApplicationJsonSerializer;
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
abstract interface class FilesTemplateCreateResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesTemplateFile get data;
  FilesTemplateCreateResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplateCreateResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplateCreateResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplateCreateResponseApplicationJson_Ocs
    implements
        FilesTemplateCreateResponseApplicationJson_OcsInterface,
        Built<FilesTemplateCreateResponseApplicationJson_Ocs, FilesTemplateCreateResponseApplicationJson_OcsBuilder> {
  factory FilesTemplateCreateResponseApplicationJson_Ocs([
    final void Function(FilesTemplateCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplateCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplateCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplateCreateResponseApplicationJson_Ocs> get serializer =>
      _$filesTemplateCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplateCreateResponseApplicationJsonInterface {
  FilesTemplateCreateResponseApplicationJson_Ocs get ocs;
  FilesTemplateCreateResponseApplicationJsonInterface rebuild(
    final void Function(FilesTemplateCreateResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplateCreateResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplateCreateResponseApplicationJson
    implements
        FilesTemplateCreateResponseApplicationJsonInterface,
        Built<FilesTemplateCreateResponseApplicationJson, FilesTemplateCreateResponseApplicationJsonBuilder> {
  factory FilesTemplateCreateResponseApplicationJson([
    final void Function(FilesTemplateCreateResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTemplateCreateResponseApplicationJson;

  // coverage:ignore-start
  const FilesTemplateCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplateCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplateCreateResponseApplicationJson> get serializer =>
      _$filesTemplateCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponseApplicationJson_Ocs_DataInterface {
  @BuiltValueField(wireName: 'template_path')
  String get templatePath;
  BuiltList<FilesTemplateFileCreator> get templates;
  FilesTemplatePathResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesTemplatePathResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesTemplatePathResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponseApplicationJson_Ocs_Data
    implements
        FilesTemplatePathResponseApplicationJson_Ocs_DataInterface,
        Built<FilesTemplatePathResponseApplicationJson_Ocs_Data,
            FilesTemplatePathResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesTemplatePathResponseApplicationJson_Ocs_Data([
    final void Function(FilesTemplatePathResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesTemplatePathResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesTemplatePathResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplatePathResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesTemplatePathResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  FilesTemplatePathResponseApplicationJson_Ocs_Data get data;
  FilesTemplatePathResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTemplatePathResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTemplatePathResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponseApplicationJson_Ocs
    implements
        FilesTemplatePathResponseApplicationJson_OcsInterface,
        Built<FilesTemplatePathResponseApplicationJson_Ocs, FilesTemplatePathResponseApplicationJson_OcsBuilder> {
  factory FilesTemplatePathResponseApplicationJson_Ocs([
    final void Function(FilesTemplatePathResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTemplatePathResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTemplatePathResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplatePathResponseApplicationJson_Ocs> get serializer =>
      _$filesTemplatePathResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTemplatePathResponseApplicationJsonInterface {
  FilesTemplatePathResponseApplicationJson_Ocs get ocs;
  FilesTemplatePathResponseApplicationJsonInterface rebuild(
    final void Function(FilesTemplatePathResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTemplatePathResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTemplatePathResponseApplicationJson
    implements
        FilesTemplatePathResponseApplicationJsonInterface,
        Built<FilesTemplatePathResponseApplicationJson, FilesTemplatePathResponseApplicationJsonBuilder> {
  factory FilesTemplatePathResponseApplicationJson([
    final void Function(FilesTemplatePathResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTemplatePathResponseApplicationJson;

  // coverage:ignore-start
  const FilesTemplatePathResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTemplatePathResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTemplatePathResponseApplicationJson> get serializer =>
      _$filesTemplatePathResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipTransferResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipTransferResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipTransferResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipTransferResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipTransferResponseApplicationJson_Ocs
    implements
        FilesTransferOwnershipTransferResponseApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipTransferResponseApplicationJson_Ocs,
            FilesTransferOwnershipTransferResponseApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipTransferResponseApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipTransferResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipTransferResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipTransferResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipTransferResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipTransferResponseApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipTransferResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipTransferResponseApplicationJsonInterface {
  FilesTransferOwnershipTransferResponseApplicationJson_Ocs get ocs;
  FilesTransferOwnershipTransferResponseApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipTransferResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipTransferResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipTransferResponseApplicationJson
    implements
        FilesTransferOwnershipTransferResponseApplicationJsonInterface,
        Built<FilesTransferOwnershipTransferResponseApplicationJson,
            FilesTransferOwnershipTransferResponseApplicationJsonBuilder> {
  factory FilesTransferOwnershipTransferResponseApplicationJson([
    final void Function(FilesTransferOwnershipTransferResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipTransferResponseApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipTransferResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipTransferResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipTransferResponseApplicationJson> get serializer =>
      _$filesTransferOwnershipTransferResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipAcceptResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipAcceptResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipAcceptResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipAcceptResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipAcceptResponseApplicationJson_Ocs
    implements
        FilesTransferOwnershipAcceptResponseApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipAcceptResponseApplicationJson_Ocs,
            FilesTransferOwnershipAcceptResponseApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipAcceptResponseApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipAcceptResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipAcceptResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipAcceptResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipAcceptResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipAcceptResponseApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipAcceptResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipAcceptResponseApplicationJsonInterface {
  FilesTransferOwnershipAcceptResponseApplicationJson_Ocs get ocs;
  FilesTransferOwnershipAcceptResponseApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipAcceptResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipAcceptResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipAcceptResponseApplicationJson
    implements
        FilesTransferOwnershipAcceptResponseApplicationJsonInterface,
        Built<FilesTransferOwnershipAcceptResponseApplicationJson,
            FilesTransferOwnershipAcceptResponseApplicationJsonBuilder> {
  factory FilesTransferOwnershipAcceptResponseApplicationJson([
    final void Function(FilesTransferOwnershipAcceptResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipAcceptResponseApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipAcceptResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipAcceptResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipAcceptResponseApplicationJson> get serializer =>
      _$filesTransferOwnershipAcceptResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipRejectResponseApplicationJson_OcsInterface {
  FilesOCSMeta get meta;
  JsonObject get data;
  FilesTransferOwnershipRejectResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesTransferOwnershipRejectResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesTransferOwnershipRejectResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipRejectResponseApplicationJson_Ocs
    implements
        FilesTransferOwnershipRejectResponseApplicationJson_OcsInterface,
        Built<FilesTransferOwnershipRejectResponseApplicationJson_Ocs,
            FilesTransferOwnershipRejectResponseApplicationJson_OcsBuilder> {
  factory FilesTransferOwnershipRejectResponseApplicationJson_Ocs([
    final void Function(FilesTransferOwnershipRejectResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesTransferOwnershipRejectResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesTransferOwnershipRejectResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipRejectResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipRejectResponseApplicationJson_Ocs> get serializer =>
      _$filesTransferOwnershipRejectResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTransferOwnershipRejectResponseApplicationJsonInterface {
  FilesTransferOwnershipRejectResponseApplicationJson_Ocs get ocs;
  FilesTransferOwnershipRejectResponseApplicationJsonInterface rebuild(
    final void Function(FilesTransferOwnershipRejectResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesTransferOwnershipRejectResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesTransferOwnershipRejectResponseApplicationJson
    implements
        FilesTransferOwnershipRejectResponseApplicationJsonInterface,
        Built<FilesTransferOwnershipRejectResponseApplicationJson,
            FilesTransferOwnershipRejectResponseApplicationJsonBuilder> {
  factory FilesTransferOwnershipRejectResponseApplicationJson([
    final void Function(FilesTransferOwnershipRejectResponseApplicationJsonBuilder)? b,
  ]) = _$FilesTransferOwnershipRejectResponseApplicationJson;

  // coverage:ignore-start
  const FilesTransferOwnershipRejectResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTransferOwnershipRejectResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTransferOwnershipRejectResponseApplicationJson> get serializer =>
      _$filesTransferOwnershipRejectResponseApplicationJsonSerializer;
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
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponseApplicationJson),
        FilesDirectEditingInfoResponseApplicationJson.new,
      )
      ..add(FilesDirectEditingInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs),
        FilesDirectEditingInfoResponseApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesOCSMeta), FilesOCSMeta.new)
      ..add(FilesOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data),
        FilesDirectEditingInfoResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors),
        FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.new,
      )
      ..add(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors)],
        ),
        MapBuilder<String, FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators),
        FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.new,
      )
      ..add(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators)],
        ),
        MapBuilder<String, FilesDirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponseApplicationJson),
        FilesDirectEditingTemplatesResponseApplicationJson.new,
      )
      ..add(FilesDirectEditingTemplatesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponseApplicationJson_Ocs),
        FilesDirectEditingTemplatesResponseApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingTemplatesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data),
        FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates),
        FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.new,
      )
      ..add(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates)],
        ),
        MapBuilder<String, FilesDirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponseApplicationJson),
        FilesDirectEditingOpenResponseApplicationJson.new,
      )
      ..add(FilesDirectEditingOpenResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponseApplicationJson_Ocs),
        FilesDirectEditingOpenResponseApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingOpenResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingOpenResponseApplicationJson_Ocs_Data),
        FilesDirectEditingOpenResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingOpenResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponseApplicationJson),
        FilesDirectEditingCreateResponseApplicationJson.new,
      )
      ..add(FilesDirectEditingCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponseApplicationJson_Ocs),
        FilesDirectEditingCreateResponseApplicationJson_Ocs.new,
      )
      ..add(FilesDirectEditingCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesDirectEditingCreateResponseApplicationJson_Ocs_Data),
        FilesDirectEditingCreateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesDirectEditingCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponseApplicationJson),
        FilesOpenLocalEditorCreateResponseApplicationJson.new,
      )
      ..add(FilesOpenLocalEditorCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs),
        FilesOpenLocalEditorCreateResponseApplicationJson_Ocs.new,
      )
      ..add(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data),
        FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesOpenLocalEditorCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponseApplicationJson),
        FilesOpenLocalEditorValidateResponseApplicationJson.new,
      )
      ..add(FilesOpenLocalEditorValidateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs),
        FilesOpenLocalEditorValidateResponseApplicationJson_Ocs.new,
      )
      ..add(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data),
        FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesOpenLocalEditorValidateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateListResponseApplicationJson),
        FilesTemplateListResponseApplicationJson.new,
      )
      ..add(FilesTemplateListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateListResponseApplicationJson_Ocs),
        FilesTemplateListResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTemplateListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesTemplateFileCreator), FilesTemplateFileCreator.new)
      ..add(FilesTemplateFileCreator.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FilesTemplateFileCreator)]),
        ListBuilder<FilesTemplateFileCreator>.new,
      )
      ..addBuilderFactory(
        const FullType(FilesTemplateCreateResponseApplicationJson),
        FilesTemplateCreateResponseApplicationJson.new,
      )
      ..add(FilesTemplateCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplateCreateResponseApplicationJson_Ocs),
        FilesTemplateCreateResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTemplateCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesTemplateFile), FilesTemplateFile.new)
      ..add(FilesTemplateFile.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponseApplicationJson),
        FilesTemplatePathResponseApplicationJson.new,
      )
      ..add(FilesTemplatePathResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponseApplicationJson_Ocs),
        FilesTemplatePathResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTemplatePathResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTemplatePathResponseApplicationJson_Ocs_Data),
        FilesTemplatePathResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesTemplatePathResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipTransferResponseApplicationJson),
        FilesTransferOwnershipTransferResponseApplicationJson.new,
      )
      ..add(FilesTransferOwnershipTransferResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipTransferResponseApplicationJson_Ocs),
        FilesTransferOwnershipTransferResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipTransferResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipAcceptResponseApplicationJson),
        FilesTransferOwnershipAcceptResponseApplicationJson.new,
      )
      ..add(FilesTransferOwnershipAcceptResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipAcceptResponseApplicationJson_Ocs),
        FilesTransferOwnershipAcceptResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipAcceptResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipRejectResponseApplicationJson),
        FilesTransferOwnershipRejectResponseApplicationJson.new,
      )
      ..add(FilesTransferOwnershipRejectResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesTransferOwnershipRejectResponseApplicationJson_Ocs),
        FilesTransferOwnershipRejectResponseApplicationJson_Ocs.new,
      )
      ..add(FilesTransferOwnershipRejectResponseApplicationJson_Ocs.serializer)
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
