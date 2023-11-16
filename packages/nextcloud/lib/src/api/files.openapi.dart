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
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'files.openapi.g.dart';

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

  ApiClient get api => ApiClient(this);

  DirectEditingClient get directEditing => DirectEditingClient(this);

  OpenLocalEditorClient get openLocalEditor => OpenLocalEditorClient(this);

  TemplateClient get template => TemplateClient(this);

  TransferOwnershipClient get transferOwnership => TransferOwnershipClient(this);
}

class ApiClient {
  ApiClient(this._rootClient);

  final Client _rootClient;

  /// Gets a thumbnail of the specified file.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [x] Width of the thumbnail.
  ///   * [y] Height of the thumbnail.
  ///   * [file] URL-encoded filename.
  ///
  /// Status codes:
  ///   * 200: Thumbnail returned
  ///   * 400: Getting thumbnail is not possible
  ///   * 404: File not found
  ///
  /// See:
  ///  * [getThumbnailRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
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

  /// Gets a thumbnail of the specified file.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [x] Width of the thumbnail.
  ///   * [y] Height of the thumbnail.
  ///   * [file] URL-encoded filename.
  ///
  /// Status codes:
  ///   * 200: Thumbnail returned
  ///   * 400: Getting thumbnail is not possible
  ///   * 404: File not found
  ///
  /// See:
  ///  * [getThumbnail] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getThumbnailRaw({
    required final int x,
    required final int y,
    required final String file,
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
    final x0 = Uri.encodeQueryComponent(x.toString());
    final y0 = Uri.encodeQueryComponent(y.toString());
    checkPattern(file, RegExp(r'^.+$'), 'file'); // coverage:ignore-line
    final file0 = Uri.encodeQueryComponent(file);
    final path = '/index.php/apps/files/api/v1/thumbnail/$x0/$y0/$file0';
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

class DirectEditingClient {
  DirectEditingClient(this._rootClient);

  final Client _rootClient;

  /// Get the direct editing capabilities.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Direct editing capabilities returned
  ///
  /// See:
  ///  * [infoRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DirectEditingInfoResponseApplicationJson, void>> info({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = infoRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get the direct editing capabilities.
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
  ///   * 200: Direct editing capabilities returned
  ///
  /// See:
  ///  * [info] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DirectEditingInfoResponseApplicationJson, void> infoRaw({final bool oCSAPIRequest = true}) {
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
    const path = '/ocs/v2.php/apps/files/api/v1/directEditing';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<DirectEditingInfoResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DirectEditingInfoResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get the templates for direct editing.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [editorId] ID of the editor.
  ///   * [creatorId] ID of the creator.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Templates returned
  ///   * 500
  ///
  /// See:
  ///  * [templatesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DirectEditingTemplatesResponseApplicationJson, void>> templates({
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

  /// Get the templates for direct editing.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [editorId] ID of the editor.
  ///   * [creatorId] ID of the creator.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Templates returned
  ///   * 500
  ///
  /// See:
  ///  * [templates] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DirectEditingTemplatesResponseApplicationJson, void> templatesRaw({
    required final String editorId,
    required final String creatorId,
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
    final editorId0 = Uri.encodeQueryComponent(editorId);
    final creatorId0 = Uri.encodeQueryComponent(creatorId);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path = '/ocs/v2.php/apps/files/api/v1/directEditing/templates/$editorId0/$creatorId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<DirectEditingTemplatesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DirectEditingTemplatesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Open a file for direct editing.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [editorId] ID of the editor.
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: URL for direct editing returned
  ///   * 403: Opening file is not allowed
  ///   * 500
  ///
  /// See:
  ///  * [openRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DirectEditingOpenResponseApplicationJson, void>> open({
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

  /// Open a file for direct editing.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [editorId] ID of the editor.
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: URL for direct editing returned
  ///   * 403: Opening file is not allowed
  ///   * 500
  ///
  /// See:
  ///  * [open] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DirectEditingOpenResponseApplicationJson, void> openRaw({
    required final String path,
    final String? editorId,
    final int? fileId,
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
    queryParameters['path'] = path;
    if (editorId != null) {
      queryParameters['editorId'] = editorId;
    }
    if (fileId != null) {
      queryParameters['fileId'] = fileId.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/open';
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<DirectEditingOpenResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DirectEditingOpenResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a file for direct editing.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [editorId] ID of the editor.
  ///   * [creatorId] ID of the creator.
  ///   * [templateId] ID of the template.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: URL for direct editing returned
  ///   * 403: Opening file is not allowed
  ///   * 500
  ///
  /// See:
  ///  * [createRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DirectEditingCreateResponseApplicationJson, void>> create({
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

  /// Create a file for direct editing.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [editorId] ID of the editor.
  ///   * [creatorId] ID of the creator.
  ///   * [templateId] ID of the template.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: URL for direct editing returned
  ///   * 403: Opening file is not allowed
  ///   * 500
  ///
  /// See:
  ///  * [create] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DirectEditingCreateResponseApplicationJson, void> createRaw({
    required final String path,
    required final String editorId,
    required final String creatorId,
    final String? templateId,
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
    queryParameters['path'] = path;
    queryParameters['editorId'] = editorId;
    queryParameters['creatorId'] = creatorId;
    if (templateId != null) {
      queryParameters['templateId'] = templateId;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path0 = '/ocs/v2.php/apps/files/api/v1/directEditing/create';
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<DirectEditingCreateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DirectEditingCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class OpenLocalEditorClient {
  OpenLocalEditorClient(this._rootClient);

  final Client _rootClient;

  /// Create a local editor.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Local editor returned
  ///   * 500
  ///
  /// See:
  ///  * [createRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<OpenLocalEditorCreateResponseApplicationJson, void>> create({
    required final String path,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = createRaw(
      path: path,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a local editor.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Local editor returned
  ///   * 500
  ///
  /// See:
  ///  * [create] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<OpenLocalEditorCreateResponseApplicationJson, void> createRaw({
    required final String path,
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
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor';
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<OpenLocalEditorCreateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(OpenLocalEditorCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Validate a local editor.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [token] Token of the local editor.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Local editor validated successfully
  ///   * 404: Local editor not found
  ///
  /// See:
  ///  * [validateRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<OpenLocalEditorValidateResponseApplicationJson, void>> validate({
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

  /// Validate a local editor.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the file.
  ///   * [token] Token of the local editor.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Local editor validated successfully
  ///   * 404: Local editor not found
  ///
  /// See:
  ///  * [validate] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<OpenLocalEditorValidateResponseApplicationJson, void> validateRaw({
    required final String path,
    required final String token,
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
    queryParameters['path'] = path;
    final token0 = Uri.encodeQueryComponent(token);
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final path0 = '/ocs/v2.php/apps/files/api/v1/openlocaleditor/$token0';
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<OpenLocalEditorValidateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(OpenLocalEditorValidateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class TemplateClient {
  TemplateClient(this._rootClient);

  final Client _rootClient;

  /// List the available templates.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Available templates returned
  ///
  /// See:
  ///  * [listRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TemplateListResponseApplicationJson, void>> list({final bool oCSAPIRequest = true}) async {
    final rawResponse = listRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// List the available templates.
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
  ///   * 200: Available templates returned
  ///
  /// See:
  ///  * [list] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TemplateListResponseApplicationJson, void> listRaw({final bool oCSAPIRequest = true}) {
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
    const path = '/ocs/v2.php/apps/files/api/v1/templates';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TemplateListResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TemplateListResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a template.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filePath] Path of the file.
  ///   * [templatePath] Name of the template. Defaults to `''`.
  ///   * [templateType] Type of the template. Defaults to `user`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Template created successfully
  ///   * 403: Creating template is not allowed
  ///
  /// See:
  ///  * [createRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TemplateCreateResponseApplicationJson, void>> create({
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

  /// Create a template.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [filePath] Path of the file.
  ///   * [templatePath] Name of the template. Defaults to `''`.
  ///   * [templateType] Type of the template. Defaults to `user`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Template created successfully
  ///   * 403: Creating template is not allowed
  ///
  /// See:
  ///  * [create] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TemplateCreateResponseApplicationJson, void> createRaw({
    required final String filePath,
    final String templatePath = '',
    final String templateType = 'user',
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
    queryParameters['filePath'] = filePath;
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (templateType != 'user') {
      queryParameters['templateType'] = templateType;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/files/api/v1/templates/create';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TemplateCreateResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TemplateCreateResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Initialize the template directory.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [templatePath] Path of the template directory. Defaults to `''`.
  ///   * [copySystemTemplates] Whether to copy the system templates to the template directory. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Template directory initialized successfully
  ///   * 403: Initializing the template directory is not allowed
  ///
  /// See:
  ///  * [pathRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TemplatePathResponseApplicationJson, void>> path({
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

  /// Initialize the template directory.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [templatePath] Path of the template directory. Defaults to `''`.
  ///   * [copySystemTemplates] Whether to copy the system templates to the template directory. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Template directory initialized successfully
  ///   * 403: Initializing the template directory is not allowed
  ///
  /// See:
  ///  * [path] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TemplatePathResponseApplicationJson, void> pathRaw({
    final String templatePath = '',
    final int copySystemTemplates = 0,
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
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (copySystemTemplates != 0) {
      queryParameters['copySystemTemplates'] = copySystemTemplates.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path = '/ocs/v2.php/apps/files/api/v1/templates/path';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TemplatePathResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(TemplatePathResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class TransferOwnershipClient {
  TransferOwnershipClient(this._rootClient);

  final Client _rootClient;

  /// Transfer the ownership to another user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [recipient] Username of the recipient.
  ///   * [path] Path of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transferred successfully
  ///   * 400: Transferring ownership is not possible
  ///   * 403: Transferring ownership is not allowed
  ///
  /// See:
  ///  * [transferRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TransferOwnershipTransferResponseApplicationJson, void>> transfer({
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

  /// Transfer the ownership to another user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [recipient] Username of the recipient.
  ///   * [path] Path of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transferred successfully
  ///   * 400: Transferring ownership is not possible
  ///   * 403: Transferring ownership is not allowed
  ///
  /// See:
  ///  * [transfer] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TransferOwnershipTransferResponseApplicationJson, void> transferRaw({
    required final String recipient,
    required final String path,
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
    queryParameters['recipient'] = recipient;
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    const path0 = '/ocs/v2.php/apps/files/api/v1/transferownership';
    final uri = Uri(path: path0, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TransferOwnershipTransferResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 400, 403},
      ),
      bodyType: const FullType(TransferOwnershipTransferResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Accept an ownership transfer.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the ownership transfer.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transfer accepted successfully
  ///   * 403: Accepting ownership transfer is not allowed
  ///   * 404: Ownership transfer not found
  ///
  /// See:
  ///  * [acceptRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TransferOwnershipAcceptResponseApplicationJson, void>> accept({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = acceptRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Accept an ownership transfer.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the ownership transfer.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transfer accepted successfully
  ///   * 403: Accepting ownership transfer is not allowed
  ///   * 404: Ownership transfer not found
  ///
  /// See:
  ///  * [accept] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TransferOwnershipAcceptResponseApplicationJson, void> acceptRaw({
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
    final path = '/ocs/v2.php/apps/files/api/v1/transferownership/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TransferOwnershipAcceptResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200, 403, 404},
      ),
      bodyType: const FullType(TransferOwnershipAcceptResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Reject an ownership transfer.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the ownership transfer.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transfer rejected successfully
  ///   * 403: Rejecting ownership transfer is not allowed
  ///   * 404: Ownership transfer not found
  ///
  /// See:
  ///  * [rejectRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<TransferOwnershipRejectResponseApplicationJson, void>> reject({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = rejectRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Reject an ownership transfer.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the ownership transfer.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Ownership transfer rejected successfully
  ///   * 403: Rejecting ownership transfer is not allowed
  ///   * 404: Ownership transfer not found
  ///
  /// See:
  ///  * [reject] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<TransferOwnershipRejectResponseApplicationJson, void> rejectRaw({
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
    final path = '/ocs/v2.php/apps/files/api/v1/transferownership/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<TransferOwnershipRejectResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 403, 404},
      ),
      bodyType: const FullType(TransferOwnershipRejectResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
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
abstract interface class DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface {
  String get id;
  String get name;
  BuiltList<String> get mimetypes;
  BuiltList<String> get optionalMimetypes;
  bool get secure;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors
    implements
        DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface,
        Built<DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors,
            DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder> {
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors([
    final void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get serializer =>
      const _$DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsSerializer();
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsSerializer
    implements StructuredSerializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> {
  const _$DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsSerializer();

  @override
  Iterable<Type> get types => const [
        DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors,
        _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors,
      ];

  @override
  String get wireName => 'DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'mimetypes',
      serializers.serialize(object.mimetypes, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'optionalMimetypes',
      serializers.serialize(object.optionalMimetypes, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'secure',
      serializers.serialize(object.secure, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder();

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
        case 'mimetypes':
          result.mimetypes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'optionalMimetypes':
          result.optionalMimetypes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'secure':
          result.secure = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface {
  String get id;
  String get editor;
  String get name;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  bool get templates;
  BuiltList<String> get mimetypes;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators
    implements
        DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface,
        Built<DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators,
            DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder> {
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators([
    final void Function(DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get serializer =>
      const _$DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsSerializer();
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsSerializer
    implements StructuredSerializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> {
  const _$DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsSerializer();

  @override
  Iterable<Type> get types => const [
        DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators,
        _$DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators,
      ];

  @override
  String get wireName => 'DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'editor',
      serializers.serialize(object.editor, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'extension',
      serializers.serialize(object.$extension, specifiedType: const FullType(String)),
      'templates',
      serializers.serialize(object.templates, specifiedType: const FullType(bool)),
      'mimetypes',
      serializers.serialize(object.mimetypes, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];
    return result;
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'editor':
          result.editor = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'extension':
          result.$extension = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'templates':
          result.templates = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'mimetypes':
          result.mimetypes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingInfoResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get editors;
  BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get creators;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs_Data
    implements
        DirectEditingInfoResponseApplicationJson_Ocs_DataInterface,
        Built<DirectEditingInfoResponseApplicationJson_Ocs_Data,
            DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder> {
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data([
    final void Function(DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data> get serializer =>
      const _$DirectEditingInfoResponseApplicationJson_Ocs_DataSerializer();
}

class _$DirectEditingInfoResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectEditingInfoResponseApplicationJson_Ocs_Data> {
  const _$DirectEditingInfoResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingInfoResponseApplicationJson_Ocs_Data, _$DirectEditingInfoResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'DirectEditingInfoResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingInfoResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'editors',
      serializers.serialize(
        object.editors,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors)],
        ),
      ),
      'creators',
      serializers.serialize(
        object.creators,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators)],
        ),
      ),
    ];
    return result;
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'editors':
          result.editors.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors),
              ]),
            )! as BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>,
          );
        case 'creators':
          result.creators.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators),
              ]),
            )! as BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingInfoResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs
    implements
        DirectEditingInfoResponseApplicationJson_OcsInterface,
        Built<DirectEditingInfoResponseApplicationJson_Ocs, DirectEditingInfoResponseApplicationJson_OcsBuilder> {
  factory DirectEditingInfoResponseApplicationJson_Ocs([
    final void Function(DirectEditingInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs> get serializer =>
      const _$DirectEditingInfoResponseApplicationJson_OcsSerializer();
}

class _$DirectEditingInfoResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectEditingInfoResponseApplicationJson_Ocs> {
  const _$DirectEditingInfoResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingInfoResponseApplicationJson_Ocs, _$DirectEditingInfoResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DirectEditingInfoResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingInfoResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  DirectEditingInfoResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingInfoResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data),
            )! as DirectEditingInfoResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingInfoResponseApplicationJsonInterface {
  DirectEditingInfoResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingInfoResponseApplicationJson
    implements
        DirectEditingInfoResponseApplicationJsonInterface,
        Built<DirectEditingInfoResponseApplicationJson, DirectEditingInfoResponseApplicationJsonBuilder> {
  factory DirectEditingInfoResponseApplicationJson([
    final void Function(DirectEditingInfoResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingInfoResponseApplicationJson> get serializer =>
      const _$DirectEditingInfoResponseApplicationJsonSerializer();
}

class _$DirectEditingInfoResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectEditingInfoResponseApplicationJson> {
  const _$DirectEditingInfoResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingInfoResponseApplicationJson, _$DirectEditingInfoResponseApplicationJson];

  @override
  String get wireName => 'DirectEditingInfoResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingInfoResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DirectEditingInfoResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  DirectEditingInfoResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingInfoResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DirectEditingInfoResponseApplicationJson_Ocs),
            )! as DirectEditingInfoResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface {
  String get id;
  String get title;
  String? get preview;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String get mimetype;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates
    implements
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface,
        Built<DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates,
            DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder> {
  factory DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates([
    final void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder)? b,
  ]) = _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates;

  // coverage:ignore-start
  const DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get serializer =>
      const _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesSerializer();
}

class _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesSerializer
    implements StructuredSerializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> {
  const _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesSerializer();

  @override
  Iterable<Type> get types => const [
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates,
        _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates,
      ];

  @override
  String get wireName => 'DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'extension',
      serializers.serialize(object.$extension, specifiedType: const FullType(String)),
      'mimetype',
      serializers.serialize(object.mimetype, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.preview;
    if (value != null) {
      result
        ..add('preview')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder();

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
        case 'preview':
          result.preview = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'extension':
          result.$extension = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mimetype':
          result.mimetype = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get templates;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs_Data
    implements
        DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface,
        Built<DirectEditingTemplatesResponseApplicationJson_Ocs_Data,
            DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder> {
  factory DirectEditingTemplatesResponseApplicationJson_Ocs_Data([
    final void Function(DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DirectEditingTemplatesResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingTemplatesResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data> get serializer =>
      const _$DirectEditingTemplatesResponseApplicationJson_Ocs_DataSerializer();
}

class _$DirectEditingTemplatesResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data> {
  const _$DirectEditingTemplatesResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data,
        _$DirectEditingTemplatesResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'DirectEditingTemplatesResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingTemplatesResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'templates',
      serializers.serialize(
        object.templates,
        specifiedType: const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates)],
        ),
      ),
    ];
    return result;
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'templates':
          result.templates.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, [
                FullType(String),
                FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates),
              ]),
            )! as BuiltMap<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingTemplatesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs
    implements
        DirectEditingTemplatesResponseApplicationJson_OcsInterface,
        Built<DirectEditingTemplatesResponseApplicationJson_Ocs,
            DirectEditingTemplatesResponseApplicationJson_OcsBuilder> {
  factory DirectEditingTemplatesResponseApplicationJson_Ocs([
    final void Function(DirectEditingTemplatesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingTemplatesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingTemplatesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingTemplatesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs> get serializer =>
      const _$DirectEditingTemplatesResponseApplicationJson_OcsSerializer();
}

class _$DirectEditingTemplatesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectEditingTemplatesResponseApplicationJson_Ocs> {
  const _$DirectEditingTemplatesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingTemplatesResponseApplicationJson_Ocs, _$DirectEditingTemplatesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DirectEditingTemplatesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingTemplatesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  DirectEditingTemplatesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingTemplatesResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data),
            )! as DirectEditingTemplatesResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingTemplatesResponseApplicationJsonInterface {
  DirectEditingTemplatesResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingTemplatesResponseApplicationJson
    implements
        DirectEditingTemplatesResponseApplicationJsonInterface,
        Built<DirectEditingTemplatesResponseApplicationJson, DirectEditingTemplatesResponseApplicationJsonBuilder> {
  factory DirectEditingTemplatesResponseApplicationJson([
    final void Function(DirectEditingTemplatesResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingTemplatesResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingTemplatesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingTemplatesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingTemplatesResponseApplicationJson> get serializer =>
      const _$DirectEditingTemplatesResponseApplicationJsonSerializer();
}

class _$DirectEditingTemplatesResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectEditingTemplatesResponseApplicationJson> {
  const _$DirectEditingTemplatesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingTemplatesResponseApplicationJson, _$DirectEditingTemplatesResponseApplicationJson];

  @override
  String get wireName => 'DirectEditingTemplatesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingTemplatesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  DirectEditingTemplatesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingTemplatesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs),
            )! as DirectEditingTemplatesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingOpenResponseApplicationJson_Ocs_DataInterface {
  String get url;
}

abstract class DirectEditingOpenResponseApplicationJson_Ocs_Data
    implements
        DirectEditingOpenResponseApplicationJson_Ocs_DataInterface,
        Built<DirectEditingOpenResponseApplicationJson_Ocs_Data,
            DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder> {
  factory DirectEditingOpenResponseApplicationJson_Ocs_Data([
    final void Function(DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DirectEditingOpenResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DirectEditingOpenResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingOpenResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingOpenResponseApplicationJson_Ocs_Data> get serializer =>
      const _$DirectEditingOpenResponseApplicationJson_Ocs_DataSerializer();
}

class _$DirectEditingOpenResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectEditingOpenResponseApplicationJson_Ocs_Data> {
  const _$DirectEditingOpenResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingOpenResponseApplicationJson_Ocs_Data, _$DirectEditingOpenResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'DirectEditingOpenResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingOpenResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingOpenResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingOpenResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingOpenResponseApplicationJson_Ocs
    implements
        DirectEditingOpenResponseApplicationJson_OcsInterface,
        Built<DirectEditingOpenResponseApplicationJson_Ocs, DirectEditingOpenResponseApplicationJson_OcsBuilder> {
  factory DirectEditingOpenResponseApplicationJson_Ocs([
    final void Function(DirectEditingOpenResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingOpenResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingOpenResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingOpenResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingOpenResponseApplicationJson_Ocs> get serializer =>
      const _$DirectEditingOpenResponseApplicationJson_OcsSerializer();
}

class _$DirectEditingOpenResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectEditingOpenResponseApplicationJson_Ocs> {
  const _$DirectEditingOpenResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingOpenResponseApplicationJson_Ocs, _$DirectEditingOpenResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DirectEditingOpenResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingOpenResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(DirectEditingOpenResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  DirectEditingOpenResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingOpenResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(DirectEditingOpenResponseApplicationJson_Ocs_Data),
            )! as DirectEditingOpenResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingOpenResponseApplicationJsonInterface {
  DirectEditingOpenResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingOpenResponseApplicationJson
    implements
        DirectEditingOpenResponseApplicationJsonInterface,
        Built<DirectEditingOpenResponseApplicationJson, DirectEditingOpenResponseApplicationJsonBuilder> {
  factory DirectEditingOpenResponseApplicationJson([
    final void Function(DirectEditingOpenResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingOpenResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingOpenResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingOpenResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingOpenResponseApplicationJson> get serializer =>
      const _$DirectEditingOpenResponseApplicationJsonSerializer();
}

class _$DirectEditingOpenResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectEditingOpenResponseApplicationJson> {
  const _$DirectEditingOpenResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingOpenResponseApplicationJson, _$DirectEditingOpenResponseApplicationJson];

  @override
  String get wireName => 'DirectEditingOpenResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingOpenResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DirectEditingOpenResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  DirectEditingOpenResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingOpenResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DirectEditingOpenResponseApplicationJson_Ocs),
            )! as DirectEditingOpenResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingCreateResponseApplicationJson_Ocs_DataInterface {
  String get url;
}

abstract class DirectEditingCreateResponseApplicationJson_Ocs_Data
    implements
        DirectEditingCreateResponseApplicationJson_Ocs_DataInterface,
        Built<DirectEditingCreateResponseApplicationJson_Ocs_Data,
            DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder> {
  factory DirectEditingCreateResponseApplicationJson_Ocs_Data([
    final void Function(DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$DirectEditingCreateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const DirectEditingCreateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingCreateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingCreateResponseApplicationJson_Ocs_Data> get serializer =>
      const _$DirectEditingCreateResponseApplicationJson_Ocs_DataSerializer();
}

class _$DirectEditingCreateResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<DirectEditingCreateResponseApplicationJson_Ocs_Data> {
  const _$DirectEditingCreateResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        DirectEditingCreateResponseApplicationJson_Ocs_Data,
        _$DirectEditingCreateResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'DirectEditingCreateResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingCreateResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingCreateResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingCreateResponseApplicationJson_Ocs
    implements
        DirectEditingCreateResponseApplicationJson_OcsInterface,
        Built<DirectEditingCreateResponseApplicationJson_Ocs, DirectEditingCreateResponseApplicationJson_OcsBuilder> {
  factory DirectEditingCreateResponseApplicationJson_Ocs([
    final void Function(DirectEditingCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingCreateResponseApplicationJson_Ocs> get serializer =>
      const _$DirectEditingCreateResponseApplicationJson_OcsSerializer();
}

class _$DirectEditingCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DirectEditingCreateResponseApplicationJson_Ocs> {
  const _$DirectEditingCreateResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingCreateResponseApplicationJson_Ocs, _$DirectEditingCreateResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DirectEditingCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingCreateResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(DirectEditingCreateResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  DirectEditingCreateResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingCreateResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(DirectEditingCreateResponseApplicationJson_Ocs_Data),
            )! as DirectEditingCreateResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DirectEditingCreateResponseApplicationJsonInterface {
  DirectEditingCreateResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingCreateResponseApplicationJson
    implements
        DirectEditingCreateResponseApplicationJsonInterface,
        Built<DirectEditingCreateResponseApplicationJson, DirectEditingCreateResponseApplicationJsonBuilder> {
  factory DirectEditingCreateResponseApplicationJson([
    final void Function(DirectEditingCreateResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingCreateResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<DirectEditingCreateResponseApplicationJson> get serializer =>
      const _$DirectEditingCreateResponseApplicationJsonSerializer();
}

class _$DirectEditingCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<DirectEditingCreateResponseApplicationJson> {
  const _$DirectEditingCreateResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DirectEditingCreateResponseApplicationJson, _$DirectEditingCreateResponseApplicationJson];

  @override
  String get wireName => 'DirectEditingCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DirectEditingCreateResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DirectEditingCreateResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  DirectEditingCreateResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DirectEditingCreateResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DirectEditingCreateResponseApplicationJson_Ocs),
            )! as DirectEditingCreateResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface {
  String? get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
}

abstract class OpenLocalEditorCreateResponseApplicationJson_Ocs_Data
    implements
        OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface,
        Built<OpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
            OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder> {
  factory OpenLocalEditorCreateResponseApplicationJson_Ocs_Data([
    final void Function(OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const OpenLocalEditorCreateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorCreateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorCreateResponseApplicationJson_Ocs_Data> get serializer =>
      const _$OpenLocalEditorCreateResponseApplicationJson_Ocs_DataSerializer();
}

class _$OpenLocalEditorCreateResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<OpenLocalEditorCreateResponseApplicationJson_Ocs_Data> {
  const _$OpenLocalEditorCreateResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        OpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
        _$OpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'OpenLocalEditorCreateResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorCreateResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'pathHash',
      serializers.serialize(object.pathHash, specifiedType: const FullType(String)),
      'expirationTime',
      serializers.serialize(object.expirationTime, specifiedType: const FullType(int)),
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'pathHash':
          result.pathHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'expirationTime':
          result.expirationTime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OpenLocalEditorCreateResponseApplicationJson_Ocs_Data get data;
}

abstract class OpenLocalEditorCreateResponseApplicationJson_Ocs
    implements
        OpenLocalEditorCreateResponseApplicationJson_OcsInterface,
        Built<OpenLocalEditorCreateResponseApplicationJson_Ocs,
            OpenLocalEditorCreateResponseApplicationJson_OcsBuilder> {
  factory OpenLocalEditorCreateResponseApplicationJson_Ocs([
    final void Function(OpenLocalEditorCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$OpenLocalEditorCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const OpenLocalEditorCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorCreateResponseApplicationJson_Ocs> get serializer =>
      const _$OpenLocalEditorCreateResponseApplicationJson_OcsSerializer();
}

class _$OpenLocalEditorCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<OpenLocalEditorCreateResponseApplicationJson_Ocs> {
  const _$OpenLocalEditorCreateResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [OpenLocalEditorCreateResponseApplicationJson_Ocs, _$OpenLocalEditorCreateResponseApplicationJson_Ocs];

  @override
  String get wireName => 'OpenLocalEditorCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorCreateResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorCreateResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data),
            )! as OpenLocalEditorCreateResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorCreateResponseApplicationJsonInterface {
  OpenLocalEditorCreateResponseApplicationJson_Ocs get ocs;
}

abstract class OpenLocalEditorCreateResponseApplicationJson
    implements
        OpenLocalEditorCreateResponseApplicationJsonInterface,
        Built<OpenLocalEditorCreateResponseApplicationJson, OpenLocalEditorCreateResponseApplicationJsonBuilder> {
  factory OpenLocalEditorCreateResponseApplicationJson([
    final void Function(OpenLocalEditorCreateResponseApplicationJsonBuilder)? b,
  ]) = _$OpenLocalEditorCreateResponseApplicationJson;

  // coverage:ignore-start
  const OpenLocalEditorCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorCreateResponseApplicationJson> get serializer =>
      const _$OpenLocalEditorCreateResponseApplicationJsonSerializer();
}

class _$OpenLocalEditorCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<OpenLocalEditorCreateResponseApplicationJson> {
  const _$OpenLocalEditorCreateResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [OpenLocalEditorCreateResponseApplicationJson, _$OpenLocalEditorCreateResponseApplicationJson];

  @override
  String get wireName => 'OpenLocalEditorCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorCreateResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  OpenLocalEditorCreateResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorCreateResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs),
            )! as OpenLocalEditorCreateResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
}

abstract class OpenLocalEditorValidateResponseApplicationJson_Ocs_Data
    implements
        OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface,
        Built<OpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
            OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder> {
  factory OpenLocalEditorValidateResponseApplicationJson_Ocs_Data([
    final void Function(OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const OpenLocalEditorValidateResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorValidateResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorValidateResponseApplicationJson_Ocs_Data> get serializer =>
      const _$OpenLocalEditorValidateResponseApplicationJson_Ocs_DataSerializer();
}

class _$OpenLocalEditorValidateResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<OpenLocalEditorValidateResponseApplicationJson_Ocs_Data> {
  const _$OpenLocalEditorValidateResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types => const [
        OpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
        _$OpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
      ];

  @override
  String get wireName => 'OpenLocalEditorValidateResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorValidateResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'pathHash',
      serializers.serialize(object.pathHash, specifiedType: const FullType(String)),
      'expirationTime',
      serializers.serialize(object.expirationTime, specifiedType: const FullType(int)),
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'pathHash':
          result.pathHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'expirationTime':
          result.expirationTime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorValidateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OpenLocalEditorValidateResponseApplicationJson_Ocs_Data get data;
}

abstract class OpenLocalEditorValidateResponseApplicationJson_Ocs
    implements
        OpenLocalEditorValidateResponseApplicationJson_OcsInterface,
        Built<OpenLocalEditorValidateResponseApplicationJson_Ocs,
            OpenLocalEditorValidateResponseApplicationJson_OcsBuilder> {
  factory OpenLocalEditorValidateResponseApplicationJson_Ocs([
    final void Function(OpenLocalEditorValidateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$OpenLocalEditorValidateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const OpenLocalEditorValidateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorValidateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorValidateResponseApplicationJson_Ocs> get serializer =>
      const _$OpenLocalEditorValidateResponseApplicationJson_OcsSerializer();
}

class _$OpenLocalEditorValidateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<OpenLocalEditorValidateResponseApplicationJson_Ocs> {
  const _$OpenLocalEditorValidateResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [OpenLocalEditorValidateResponseApplicationJson_Ocs, _$OpenLocalEditorValidateResponseApplicationJson_Ocs];

  @override
  String get wireName => 'OpenLocalEditorValidateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorValidateResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(
        object.data,
        specifiedType: const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data),
      ),
    ];
    return result;
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorValidateResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data),
            )! as OpenLocalEditorValidateResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OpenLocalEditorValidateResponseApplicationJsonInterface {
  OpenLocalEditorValidateResponseApplicationJson_Ocs get ocs;
}

abstract class OpenLocalEditorValidateResponseApplicationJson
    implements
        OpenLocalEditorValidateResponseApplicationJsonInterface,
        Built<OpenLocalEditorValidateResponseApplicationJson, OpenLocalEditorValidateResponseApplicationJsonBuilder> {
  factory OpenLocalEditorValidateResponseApplicationJson([
    final void Function(OpenLocalEditorValidateResponseApplicationJsonBuilder)? b,
  ]) = _$OpenLocalEditorValidateResponseApplicationJson;

  // coverage:ignore-start
  const OpenLocalEditorValidateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorValidateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OpenLocalEditorValidateResponseApplicationJson> get serializer =>
      const _$OpenLocalEditorValidateResponseApplicationJsonSerializer();
}

class _$OpenLocalEditorValidateResponseApplicationJsonSerializer
    implements StructuredSerializer<OpenLocalEditorValidateResponseApplicationJson> {
  const _$OpenLocalEditorValidateResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [OpenLocalEditorValidateResponseApplicationJson, _$OpenLocalEditorValidateResponseApplicationJson];

  @override
  String get wireName => 'OpenLocalEditorValidateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OpenLocalEditorValidateResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  OpenLocalEditorValidateResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OpenLocalEditorValidateResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs),
            )! as OpenLocalEditorValidateResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateFileCreatorInterface {
  String get app;
  String get label;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String? get iconClass;
  BuiltList<String> get mimetypes;
  double? get ratio;
  String get actionLabel;
}

abstract class TemplateFileCreator
    implements TemplateFileCreatorInterface, Built<TemplateFileCreator, TemplateFileCreatorBuilder> {
  factory TemplateFileCreator([final void Function(TemplateFileCreatorBuilder)? b]) = _$TemplateFileCreator;

  // coverage:ignore-start
  const TemplateFileCreator._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateFileCreator.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateFileCreator> get serializer => const _$TemplateFileCreatorSerializer();
}

class _$TemplateFileCreatorSerializer implements StructuredSerializer<TemplateFileCreator> {
  const _$TemplateFileCreatorSerializer();

  @override
  Iterable<Type> get types => const [TemplateFileCreator, _$TemplateFileCreator];

  @override
  String get wireName => 'TemplateFileCreator';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateFileCreator object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'app',
      serializers.serialize(object.app, specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'extension',
      serializers.serialize(object.$extension, specifiedType: const FullType(String)),
      'mimetypes',
      serializers.serialize(object.mimetypes, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'actionLabel',
      serializers.serialize(object.actionLabel, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.iconClass;
    if (value != null) {
      result
        ..add('iconClass')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.ratio;
    if (value != null) {
      result
        ..add('ratio')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(double)),
        );
    }

    return result;
  }

  @override
  TemplateFileCreator deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateFileCreatorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'extension':
          result.$extension = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'iconClass':
          result.iconClass = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mimetypes':
          result.mimetypes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'ratio':
          result.ratio = serializers.deserialize(value, specifiedType: const FullType(double))! as double;
        case 'actionLabel':
          result.actionLabel = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateListResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<TemplateFileCreator> get data;
}

abstract class TemplateListResponseApplicationJson_Ocs
    implements
        TemplateListResponseApplicationJson_OcsInterface,
        Built<TemplateListResponseApplicationJson_Ocs, TemplateListResponseApplicationJson_OcsBuilder> {
  factory TemplateListResponseApplicationJson_Ocs([
    final void Function(TemplateListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplateListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplateListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateListResponseApplicationJson_Ocs> get serializer =>
      const _$TemplateListResponseApplicationJson_OcsSerializer();
}

class _$TemplateListResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TemplateListResponseApplicationJson_Ocs> {
  const _$TemplateListResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TemplateListResponseApplicationJson_Ocs, _$TemplateListResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TemplateListResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateListResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(TemplateFileCreator)])),
    ];
    return result;
  }

  @override
  TemplateListResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateListResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(TemplateFileCreator)]))!
                as BuiltList<TemplateFileCreator>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateListResponseApplicationJsonInterface {
  TemplateListResponseApplicationJson_Ocs get ocs;
}

abstract class TemplateListResponseApplicationJson
    implements
        TemplateListResponseApplicationJsonInterface,
        Built<TemplateListResponseApplicationJson, TemplateListResponseApplicationJsonBuilder> {
  factory TemplateListResponseApplicationJson([final void Function(TemplateListResponseApplicationJsonBuilder)? b]) =
      _$TemplateListResponseApplicationJson;

  // coverage:ignore-start
  const TemplateListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateListResponseApplicationJson> get serializer =>
      const _$TemplateListResponseApplicationJsonSerializer();
}

class _$TemplateListResponseApplicationJsonSerializer
    implements StructuredSerializer<TemplateListResponseApplicationJson> {
  const _$TemplateListResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [TemplateListResponseApplicationJson, _$TemplateListResponseApplicationJson];

  @override
  String get wireName => 'TemplateListResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateListResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TemplateListResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  TemplateListResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateListResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(TemplateListResponseApplicationJson_Ocs))!
                as TemplateListResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateFileInterface {
  String get basename;
  String get etag;
  int get fileid;
  String? get filename;
  int get lastmod;
  String get mime;
  int get size;
  String get type;
  bool get hasPreview;
}

abstract class TemplateFile implements TemplateFileInterface, Built<TemplateFile, TemplateFileBuilder> {
  factory TemplateFile([final void Function(TemplateFileBuilder)? b]) = _$TemplateFile;

  // coverage:ignore-start
  const TemplateFile._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateFile.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateFile> get serializer => const _$TemplateFileSerializer();
}

class _$TemplateFileSerializer implements StructuredSerializer<TemplateFile> {
  const _$TemplateFileSerializer();

  @override
  Iterable<Type> get types => const [TemplateFile, _$TemplateFile];

  @override
  String get wireName => 'TemplateFile';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateFile object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'basename',
      serializers.serialize(object.basename, specifiedType: const FullType(String)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'fileid',
      serializers.serialize(object.fileid, specifiedType: const FullType(int)),
      'lastmod',
      serializers.serialize(object.lastmod, specifiedType: const FullType(int)),
      'mime',
      serializers.serialize(object.mime, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'hasPreview',
      serializers.serialize(object.hasPreview, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.filename;
    if (value != null) {
      result
        ..add('filename')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  TemplateFile deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateFileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'basename':
          result.basename = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'fileid':
          result.fileid = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'filename':
          result.filename = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'lastmod':
          result.lastmod = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mime':
          result.mime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'size':
          result.size = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'hasPreview':
          result.hasPreview = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TemplateFile get data;
}

abstract class TemplateCreateResponseApplicationJson_Ocs
    implements
        TemplateCreateResponseApplicationJson_OcsInterface,
        Built<TemplateCreateResponseApplicationJson_Ocs, TemplateCreateResponseApplicationJson_OcsBuilder> {
  factory TemplateCreateResponseApplicationJson_Ocs([
    final void Function(TemplateCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplateCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplateCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateCreateResponseApplicationJson_Ocs> get serializer =>
      const _$TemplateCreateResponseApplicationJson_OcsSerializer();
}

class _$TemplateCreateResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TemplateCreateResponseApplicationJson_Ocs> {
  const _$TemplateCreateResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TemplateCreateResponseApplicationJson_Ocs, _$TemplateCreateResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TemplateCreateResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateCreateResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(TemplateFile)),
    ];
    return result;
  }

  @override
  TemplateCreateResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateCreateResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(TemplateFile))! as TemplateFile,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateCreateResponseApplicationJsonInterface {
  TemplateCreateResponseApplicationJson_Ocs get ocs;
}

abstract class TemplateCreateResponseApplicationJson
    implements
        TemplateCreateResponseApplicationJsonInterface,
        Built<TemplateCreateResponseApplicationJson, TemplateCreateResponseApplicationJsonBuilder> {
  factory TemplateCreateResponseApplicationJson([
    final void Function(TemplateCreateResponseApplicationJsonBuilder)? b,
  ]) = _$TemplateCreateResponseApplicationJson;

  // coverage:ignore-start
  const TemplateCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateCreateResponseApplicationJson> get serializer =>
      const _$TemplateCreateResponseApplicationJsonSerializer();
}

class _$TemplateCreateResponseApplicationJsonSerializer
    implements StructuredSerializer<TemplateCreateResponseApplicationJson> {
  const _$TemplateCreateResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [TemplateCreateResponseApplicationJson, _$TemplateCreateResponseApplicationJson];

  @override
  String get wireName => 'TemplateCreateResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplateCreateResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TemplateCreateResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  TemplateCreateResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateCreateResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(TemplateCreateResponseApplicationJson_Ocs))!
                as TemplateCreateResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplatePathResponseApplicationJson_Ocs_DataInterface {
  @BuiltValueField(wireName: 'template_path')
  String get templatePath;
  BuiltList<TemplateFileCreator> get templates;
}

abstract class TemplatePathResponseApplicationJson_Ocs_Data
    implements
        TemplatePathResponseApplicationJson_Ocs_DataInterface,
        Built<TemplatePathResponseApplicationJson_Ocs_Data, TemplatePathResponseApplicationJson_Ocs_DataBuilder> {
  factory TemplatePathResponseApplicationJson_Ocs_Data([
    final void Function(TemplatePathResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TemplatePathResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplatePathResponseApplicationJson_Ocs_Data> get serializer =>
      const _$TemplatePathResponseApplicationJson_Ocs_DataSerializer();
}

class _$TemplatePathResponseApplicationJson_Ocs_DataSerializer
    implements StructuredSerializer<TemplatePathResponseApplicationJson_Ocs_Data> {
  const _$TemplatePathResponseApplicationJson_Ocs_DataSerializer();

  @override
  Iterable<Type> get types =>
      const [TemplatePathResponseApplicationJson_Ocs_Data, _$TemplatePathResponseApplicationJson_Ocs_Data];

  @override
  String get wireName => 'TemplatePathResponseApplicationJson_Ocs_Data';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplatePathResponseApplicationJson_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'template_path',
      serializers.serialize(object.templatePath, specifiedType: const FullType(String)),
      'templates',
      serializers.serialize(
        object.templates,
        specifiedType: const FullType(BuiltList, [FullType(TemplateFileCreator)]),
      ),
    ];
    return result;
  }

  @override
  TemplatePathResponseApplicationJson_Ocs_Data deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplatePathResponseApplicationJson_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'template_path':
          result.templatePath = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'templates':
          result.templates.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(TemplateFileCreator)]))!
                as BuiltList<TemplateFileCreator>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplatePathResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TemplatePathResponseApplicationJson_Ocs_Data get data;
}

abstract class TemplatePathResponseApplicationJson_Ocs
    implements
        TemplatePathResponseApplicationJson_OcsInterface,
        Built<TemplatePathResponseApplicationJson_Ocs, TemplatePathResponseApplicationJson_OcsBuilder> {
  factory TemplatePathResponseApplicationJson_Ocs([
    final void Function(TemplatePathResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplatePathResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplatePathResponseApplicationJson_Ocs> get serializer =>
      const _$TemplatePathResponseApplicationJson_OcsSerializer();
}

class _$TemplatePathResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TemplatePathResponseApplicationJson_Ocs> {
  const _$TemplatePathResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TemplatePathResponseApplicationJson_Ocs, _$TemplatePathResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TemplatePathResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplatePathResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(TemplatePathResponseApplicationJson_Ocs_Data)),
    ];
    return result;
  }

  @override
  TemplatePathResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplatePathResponseApplicationJson_OcsBuilder();

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
              specifiedType: const FullType(TemplatePathResponseApplicationJson_Ocs_Data),
            )! as TemplatePathResponseApplicationJson_Ocs_Data,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplatePathResponseApplicationJsonInterface {
  TemplatePathResponseApplicationJson_Ocs get ocs;
}

abstract class TemplatePathResponseApplicationJson
    implements
        TemplatePathResponseApplicationJsonInterface,
        Built<TemplatePathResponseApplicationJson, TemplatePathResponseApplicationJsonBuilder> {
  factory TemplatePathResponseApplicationJson([final void Function(TemplatePathResponseApplicationJsonBuilder)? b]) =
      _$TemplatePathResponseApplicationJson;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplatePathResponseApplicationJson> get serializer =>
      const _$TemplatePathResponseApplicationJsonSerializer();
}

class _$TemplatePathResponseApplicationJsonSerializer
    implements StructuredSerializer<TemplatePathResponseApplicationJson> {
  const _$TemplatePathResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [TemplatePathResponseApplicationJson, _$TemplatePathResponseApplicationJson];

  @override
  String get wireName => 'TemplatePathResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TemplatePathResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(TemplatePathResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  TemplatePathResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplatePathResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(TemplatePathResponseApplicationJson_Ocs))!
                as TemplatePathResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TransferOwnershipTransferResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipTransferResponseApplicationJson_Ocs
    implements
        TransferOwnershipTransferResponseApplicationJson_OcsInterface,
        Built<TransferOwnershipTransferResponseApplicationJson_Ocs,
            TransferOwnershipTransferResponseApplicationJson_OcsBuilder> {
  factory TransferOwnershipTransferResponseApplicationJson_Ocs([
    final void Function(TransferOwnershipTransferResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TransferOwnershipTransferResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TransferOwnershipTransferResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipTransferResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipTransferResponseApplicationJson_Ocs> get serializer =>
      const _$TransferOwnershipTransferResponseApplicationJson_OcsSerializer();
}

class _$TransferOwnershipTransferResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TransferOwnershipTransferResponseApplicationJson_Ocs> {
  const _$TransferOwnershipTransferResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        TransferOwnershipTransferResponseApplicationJson_Ocs,
        _$TransferOwnershipTransferResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'TransferOwnershipTransferResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipTransferResponseApplicationJson_Ocs object, {
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
  TransferOwnershipTransferResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipTransferResponseApplicationJson_OcsBuilder();

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
abstract interface class TransferOwnershipTransferResponseApplicationJsonInterface {
  TransferOwnershipTransferResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipTransferResponseApplicationJson
    implements
        TransferOwnershipTransferResponseApplicationJsonInterface,
        Built<TransferOwnershipTransferResponseApplicationJson,
            TransferOwnershipTransferResponseApplicationJsonBuilder> {
  factory TransferOwnershipTransferResponseApplicationJson([
    final void Function(TransferOwnershipTransferResponseApplicationJsonBuilder)? b,
  ]) = _$TransferOwnershipTransferResponseApplicationJson;

  // coverage:ignore-start
  const TransferOwnershipTransferResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipTransferResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipTransferResponseApplicationJson> get serializer =>
      const _$TransferOwnershipTransferResponseApplicationJsonSerializer();
}

class _$TransferOwnershipTransferResponseApplicationJsonSerializer
    implements StructuredSerializer<TransferOwnershipTransferResponseApplicationJson> {
  const _$TransferOwnershipTransferResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TransferOwnershipTransferResponseApplicationJson, _$TransferOwnershipTransferResponseApplicationJson];

  @override
  String get wireName => 'TransferOwnershipTransferResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipTransferResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TransferOwnershipTransferResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TransferOwnershipTransferResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipTransferResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TransferOwnershipTransferResponseApplicationJson_Ocs),
            )! as TransferOwnershipTransferResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TransferOwnershipAcceptResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipAcceptResponseApplicationJson_Ocs
    implements
        TransferOwnershipAcceptResponseApplicationJson_OcsInterface,
        Built<TransferOwnershipAcceptResponseApplicationJson_Ocs,
            TransferOwnershipAcceptResponseApplicationJson_OcsBuilder> {
  factory TransferOwnershipAcceptResponseApplicationJson_Ocs([
    final void Function(TransferOwnershipAcceptResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TransferOwnershipAcceptResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TransferOwnershipAcceptResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipAcceptResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipAcceptResponseApplicationJson_Ocs> get serializer =>
      const _$TransferOwnershipAcceptResponseApplicationJson_OcsSerializer();
}

class _$TransferOwnershipAcceptResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TransferOwnershipAcceptResponseApplicationJson_Ocs> {
  const _$TransferOwnershipAcceptResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TransferOwnershipAcceptResponseApplicationJson_Ocs, _$TransferOwnershipAcceptResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TransferOwnershipAcceptResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipAcceptResponseApplicationJson_Ocs object, {
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
  TransferOwnershipAcceptResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipAcceptResponseApplicationJson_OcsBuilder();

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
abstract interface class TransferOwnershipAcceptResponseApplicationJsonInterface {
  TransferOwnershipAcceptResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipAcceptResponseApplicationJson
    implements
        TransferOwnershipAcceptResponseApplicationJsonInterface,
        Built<TransferOwnershipAcceptResponseApplicationJson, TransferOwnershipAcceptResponseApplicationJsonBuilder> {
  factory TransferOwnershipAcceptResponseApplicationJson([
    final void Function(TransferOwnershipAcceptResponseApplicationJsonBuilder)? b,
  ]) = _$TransferOwnershipAcceptResponseApplicationJson;

  // coverage:ignore-start
  const TransferOwnershipAcceptResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipAcceptResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipAcceptResponseApplicationJson> get serializer =>
      const _$TransferOwnershipAcceptResponseApplicationJsonSerializer();
}

class _$TransferOwnershipAcceptResponseApplicationJsonSerializer
    implements StructuredSerializer<TransferOwnershipAcceptResponseApplicationJson> {
  const _$TransferOwnershipAcceptResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TransferOwnershipAcceptResponseApplicationJson, _$TransferOwnershipAcceptResponseApplicationJson];

  @override
  String get wireName => 'TransferOwnershipAcceptResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipAcceptResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TransferOwnershipAcceptResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TransferOwnershipAcceptResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipAcceptResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TransferOwnershipAcceptResponseApplicationJson_Ocs),
            )! as TransferOwnershipAcceptResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TransferOwnershipRejectResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipRejectResponseApplicationJson_Ocs
    implements
        TransferOwnershipRejectResponseApplicationJson_OcsInterface,
        Built<TransferOwnershipRejectResponseApplicationJson_Ocs,
            TransferOwnershipRejectResponseApplicationJson_OcsBuilder> {
  factory TransferOwnershipRejectResponseApplicationJson_Ocs([
    final void Function(TransferOwnershipRejectResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TransferOwnershipRejectResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TransferOwnershipRejectResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipRejectResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipRejectResponseApplicationJson_Ocs> get serializer =>
      const _$TransferOwnershipRejectResponseApplicationJson_OcsSerializer();
}

class _$TransferOwnershipRejectResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<TransferOwnershipRejectResponseApplicationJson_Ocs> {
  const _$TransferOwnershipRejectResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [TransferOwnershipRejectResponseApplicationJson_Ocs, _$TransferOwnershipRejectResponseApplicationJson_Ocs];

  @override
  String get wireName => 'TransferOwnershipRejectResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipRejectResponseApplicationJson_Ocs object, {
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
  TransferOwnershipRejectResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipRejectResponseApplicationJson_OcsBuilder();

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
abstract interface class TransferOwnershipRejectResponseApplicationJsonInterface {
  TransferOwnershipRejectResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipRejectResponseApplicationJson
    implements
        TransferOwnershipRejectResponseApplicationJsonInterface,
        Built<TransferOwnershipRejectResponseApplicationJson, TransferOwnershipRejectResponseApplicationJsonBuilder> {
  factory TransferOwnershipRejectResponseApplicationJson([
    final void Function(TransferOwnershipRejectResponseApplicationJsonBuilder)? b,
  ]) = _$TransferOwnershipRejectResponseApplicationJson;

  // coverage:ignore-start
  const TransferOwnershipRejectResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipRejectResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferOwnershipRejectResponseApplicationJson> get serializer =>
      const _$TransferOwnershipRejectResponseApplicationJsonSerializer();
}

class _$TransferOwnershipRejectResponseApplicationJsonSerializer
    implements StructuredSerializer<TransferOwnershipRejectResponseApplicationJson> {
  const _$TransferOwnershipRejectResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [TransferOwnershipRejectResponseApplicationJson, _$TransferOwnershipRejectResponseApplicationJson];

  @override
  String get wireName => 'TransferOwnershipRejectResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final TransferOwnershipRejectResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(TransferOwnershipRejectResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  TransferOwnershipRejectResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferOwnershipRejectResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(TransferOwnershipRejectResponseApplicationJson_Ocs),
            )! as TransferOwnershipRejectResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
}

abstract class Capabilities_Files_DirectEditing
    implements
        Capabilities_Files_DirectEditingInterface,
        Built<Capabilities_Files_DirectEditing, Capabilities_Files_DirectEditingBuilder> {
  factory Capabilities_Files_DirectEditing([final void Function(Capabilities_Files_DirectEditingBuilder)? b]) =
      _$Capabilities_Files_DirectEditing;

  // coverage:ignore-start
  const Capabilities_Files_DirectEditing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Files_DirectEditing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_Files_DirectEditing> get serializer =>
      const _$Capabilities_Files_DirectEditingSerializer();
}

class _$Capabilities_Files_DirectEditingSerializer implements StructuredSerializer<Capabilities_Files_DirectEditing> {
  const _$Capabilities_Files_DirectEditingSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_Files_DirectEditing, _$Capabilities_Files_DirectEditing];

  @override
  String get wireName => 'Capabilities_Files_DirectEditing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_Files_DirectEditing object, {
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
  Capabilities_Files_DirectEditing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_Files_DirectEditingBuilder();

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
abstract interface class Capabilities_FilesInterface {
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  Capabilities_Files_DirectEditing get directEditing;
}

abstract class Capabilities_Files
    implements Capabilities_FilesInterface, Built<Capabilities_Files, Capabilities_FilesBuilder> {
  factory Capabilities_Files([final void Function(Capabilities_FilesBuilder)? b]) = _$Capabilities_Files;

  // coverage:ignore-start
  const Capabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_Files> get serializer => const _$Capabilities_FilesSerializer();
}

class _$Capabilities_FilesSerializer implements StructuredSerializer<Capabilities_Files> {
  const _$Capabilities_FilesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_Files, _$Capabilities_Files];

  @override
  String get wireName => 'Capabilities_Files';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_Files object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'bigfilechunking',
      serializers.serialize(object.bigfilechunking, specifiedType: const FullType(bool)),
      'blacklisted_files',
      serializers.serialize(object.blacklistedFiles, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
      'directEditing',
      serializers.serialize(object.directEditing, specifiedType: const FullType(Capabilities_Files_DirectEditing)),
    ];
    return result;
  }

  @override
  Capabilities_Files deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_Files_DirectEditing))!
                as Capabilities_Files_DirectEditing,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  Capabilities_Files get files;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'files',
      serializers.serialize(object.files, specifiedType: const FullType(Capabilities_Files)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'files':
          result.files.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_Files))! as Capabilities_Files,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class TemplateInterface {
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
}

abstract class Template implements TemplateInterface, Built<Template, TemplateBuilder> {
  factory Template([final void Function(TemplateBuilder)? b]) = _$Template;

  // coverage:ignore-start
  const Template._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Template.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Template> get serializer => const _$TemplateSerializer();
}

class _$TemplateSerializer implements StructuredSerializer<Template> {
  const _$TemplateSerializer();

  @override
  Iterable<Type> get types => const [Template, _$Template];

  @override
  String get wireName => 'Template';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Template object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'templateType',
      serializers.serialize(object.templateType, specifiedType: const FullType(String)),
      'templateId',
      serializers.serialize(object.templateId, specifiedType: const FullType(String)),
      'basename',
      serializers.serialize(object.basename, specifiedType: const FullType(String)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'fileid',
      serializers.serialize(object.fileid, specifiedType: const FullType(int)),
      'filename',
      serializers.serialize(object.filename, specifiedType: const FullType(String)),
      'lastmod',
      serializers.serialize(object.lastmod, specifiedType: const FullType(int)),
      'mime',
      serializers.serialize(object.mime, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'hasPreview',
      serializers.serialize(object.hasPreview, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.previewUrl;
    if (value != null) {
      result
        ..add('previewUrl')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Template deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'templateType':
          result.templateType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'templateId':
          result.templateId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'basename':
          result.basename = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'fileid':
          result.fileid = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'filename':
          result.filename = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'lastmod':
          result.lastmod = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mime':
          result.mime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'size':
          result.size = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'hasPreview':
          result.hasPreview = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'previewUrl':
          result.previewUrl = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson),
        DirectEditingInfoResponseApplicationJson.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs),
        DirectEditingInfoResponseApplicationJson_Ocs.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data),
        DirectEditingInfoResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors),
        DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors)],
        ),
        MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors>.new,
      )
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators),
        DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators)],
        ),
        MapBuilder<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators>.new,
      )
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson),
        DirectEditingTemplatesResponseApplicationJson.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs),
        DirectEditingTemplatesResponseApplicationJson_Ocs.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data),
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates),
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates)],
        ),
        MapBuilder<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates>.new,
      )
      ..addBuilderFactory(
        const FullType(DirectEditingOpenResponseApplicationJson),
        DirectEditingOpenResponseApplicationJson.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingOpenResponseApplicationJson_Ocs),
        DirectEditingOpenResponseApplicationJson_Ocs.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingOpenResponseApplicationJson_Ocs_Data),
        DirectEditingOpenResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson),
        DirectEditingCreateResponseApplicationJson.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson_Ocs),
        DirectEditingCreateResponseApplicationJson_Ocs.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson_Ocs_Data),
        DirectEditingCreateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson),
        OpenLocalEditorCreateResponseApplicationJson.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs),
        OpenLocalEditorCreateResponseApplicationJson_Ocs.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data),
        OpenLocalEditorCreateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson),
        OpenLocalEditorValidateResponseApplicationJson.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs),
        OpenLocalEditorValidateResponseApplicationJson_Ocs.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data),
        OpenLocalEditorValidateResponseApplicationJson_Ocs_Data.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(TemplateListResponseApplicationJson), TemplateListResponseApplicationJson.new)
      ..add(TemplateListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplateListResponseApplicationJson_Ocs),
        TemplateListResponseApplicationJson_Ocs.new,
      )
      ..add(TemplateListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(TemplateFileCreator), TemplateFileCreator.new)
      ..add(TemplateFileCreator.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TemplateFileCreator)]),
        ListBuilder<TemplateFileCreator>.new,
      )
      ..addBuilderFactory(
        const FullType(TemplateCreateResponseApplicationJson),
        TemplateCreateResponseApplicationJson.new,
      )
      ..add(TemplateCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplateCreateResponseApplicationJson_Ocs),
        TemplateCreateResponseApplicationJson_Ocs.new,
      )
      ..add(TemplateCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(TemplateFile), TemplateFile.new)
      ..add(TemplateFile.serializer)
      ..addBuilderFactory(const FullType(TemplatePathResponseApplicationJson), TemplatePathResponseApplicationJson.new)
      ..add(TemplatePathResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplatePathResponseApplicationJson_Ocs),
        TemplatePathResponseApplicationJson_Ocs.new,
      )
      ..add(TemplatePathResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TemplatePathResponseApplicationJson_Ocs_Data),
        TemplatePathResponseApplicationJson_Ocs_Data.new,
      )
      ..add(TemplatePathResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipTransferResponseApplicationJson),
        TransferOwnershipTransferResponseApplicationJson.new,
      )
      ..add(TransferOwnershipTransferResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipTransferResponseApplicationJson_Ocs),
        TransferOwnershipTransferResponseApplicationJson_Ocs.new,
      )
      ..add(TransferOwnershipTransferResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipAcceptResponseApplicationJson),
        TransferOwnershipAcceptResponseApplicationJson.new,
      )
      ..add(TransferOwnershipAcceptResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipAcceptResponseApplicationJson_Ocs),
        TransferOwnershipAcceptResponseApplicationJson_Ocs.new,
      )
      ..add(TransferOwnershipAcceptResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipRejectResponseApplicationJson),
        TransferOwnershipRejectResponseApplicationJson.new,
      )
      ..add(TransferOwnershipRejectResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipRejectResponseApplicationJson_Ocs),
        TransferOwnershipRejectResponseApplicationJson_Ocs.new,
      )
      ..add(TransferOwnershipRejectResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Files), Capabilities_Files.new)
      ..add(Capabilities_Files.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(Capabilities_Files_DirectEditing), Capabilities_Files_DirectEditing.new)
      ..add(Capabilities_Files_DirectEditing.serializer)
      ..addBuilderFactory(const FullType(Template), Template.new)
      ..add(Template.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
