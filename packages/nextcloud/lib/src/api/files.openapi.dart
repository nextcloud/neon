// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

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
    pathParameters['x'] = x.toString();
    pathParameters['y'] = y.toString();
    dynamite_utils.checkPattern(file, RegExp(r'^.+$'), 'file');
    pathParameters['file'] = file;
    var uri = Uri.parse(UriTemplate('/index.php/apps/files/api/v1/thumbnail/{x}/{y}/{file}').expand(pathParameters));
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
      serializers: jsonSerializers,
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/directEditing').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    pathParameters['editorId'] = editorId;
    pathParameters['creatorId'] = creatorId;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/files/api/v1/directEditing/templates/{editorId}/{creatorId}')
          .expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['path'] = path;
    if (editorId != null) {
      queryParameters['editorId'] = editorId;
    }
    if (fileId != null) {
      queryParameters['fileId'] = fileId.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/directEditing/open').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['path'] = path;
    queryParameters['editorId'] = editorId;
    queryParameters['creatorId'] = creatorId;
    if (templateId != null) {
      queryParameters['templateId'] = templateId;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/directEditing/create').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/openlocaleditor').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['path'] = path;
    pathParameters['token'] = token;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/openlocaleditor/{token}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/templates').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['filePath'] = filePath;
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (templateType != 'user') {
      queryParameters['templateType'] = templateType;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/templates/create').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    if (templatePath != '') {
      queryParameters['templatePath'] = templatePath;
    }
    if (copySystemTemplates != 0) {
      queryParameters['copySystemTemplates'] = copySystemTemplates.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/templates/path').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    queryParameters['recipient'] = recipient;
    queryParameters['path'] = path;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/transferownership').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/transferownership/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files/api/v1/transferownership/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

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
      serializers: jsonSerializers,
    );
  }
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
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface {
  String get id;
  String get name;
  BuiltList<String> get mimetypes;
  BuiltList<String> get optionalMimetypes;
  bool get secure;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors
    implements
        $DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get serializer =>
      _$directEditingInfoResponseApplicationJsonOcsDataEditorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface {
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
        $DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get serializer =>
      _$directEditingInfoResponseApplicationJsonOcsDataCreatorsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingInfoResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors> get editors;
  BuiltMap<String, DirectEditingInfoResponseApplicationJson_Ocs_Data_Creators> get creators;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs_Data
    implements
        $DirectEditingInfoResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs_Data> get serializer =>
      _$directEditingInfoResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingInfoResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingInfoResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingInfoResponseApplicationJson_Ocs
    implements
        $DirectEditingInfoResponseApplicationJson_OcsInterface,
        Built<DirectEditingInfoResponseApplicationJson_Ocs, DirectEditingInfoResponseApplicationJson_OcsBuilder> {
  factory DirectEditingInfoResponseApplicationJson_Ocs([
    final void Function(DirectEditingInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingInfoResponseApplicationJson_Ocs> get serializer =>
      _$directEditingInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingInfoResponseApplicationJsonInterface {
  DirectEditingInfoResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingInfoResponseApplicationJson
    implements
        $DirectEditingInfoResponseApplicationJsonInterface,
        Built<DirectEditingInfoResponseApplicationJson, DirectEditingInfoResponseApplicationJsonBuilder> {
  factory DirectEditingInfoResponseApplicationJson([
    final void Function(DirectEditingInfoResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingInfoResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingInfoResponseApplicationJson> get serializer =>
      _$directEditingInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface {
  String get id;
  String get title;
  String? get preview;
  @BuiltValueField(wireName: 'extension')
  String get $extension;
  String get mimetype;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates
    implements
        $DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get serializer =>
      _$directEditingTemplatesResponseApplicationJsonOcsDataTemplatesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates> get templates;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs_Data
    implements
        $DirectEditingTemplatesResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs_Data> get serializer =>
      _$directEditingTemplatesResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingTemplatesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingTemplatesResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingTemplatesResponseApplicationJson_Ocs
    implements
        $DirectEditingTemplatesResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingTemplatesResponseApplicationJson_Ocs> get serializer =>
      _$directEditingTemplatesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingTemplatesResponseApplicationJsonInterface {
  DirectEditingTemplatesResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingTemplatesResponseApplicationJson
    implements
        $DirectEditingTemplatesResponseApplicationJsonInterface,
        Built<DirectEditingTemplatesResponseApplicationJson, DirectEditingTemplatesResponseApplicationJsonBuilder> {
  factory DirectEditingTemplatesResponseApplicationJson([
    final void Function(DirectEditingTemplatesResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingTemplatesResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingTemplatesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingTemplatesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingTemplatesResponseApplicationJson> get serializer =>
      _$directEditingTemplatesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingOpenResponseApplicationJson_Ocs_DataInterface {
  String get url;
}

abstract class DirectEditingOpenResponseApplicationJson_Ocs_Data
    implements
        $DirectEditingOpenResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingOpenResponseApplicationJson_Ocs_Data> get serializer =>
      _$directEditingOpenResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingOpenResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingOpenResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingOpenResponseApplicationJson_Ocs
    implements
        $DirectEditingOpenResponseApplicationJson_OcsInterface,
        Built<DirectEditingOpenResponseApplicationJson_Ocs, DirectEditingOpenResponseApplicationJson_OcsBuilder> {
  factory DirectEditingOpenResponseApplicationJson_Ocs([
    final void Function(DirectEditingOpenResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingOpenResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingOpenResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingOpenResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingOpenResponseApplicationJson_Ocs> get serializer =>
      _$directEditingOpenResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingOpenResponseApplicationJsonInterface {
  DirectEditingOpenResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingOpenResponseApplicationJson
    implements
        $DirectEditingOpenResponseApplicationJsonInterface,
        Built<DirectEditingOpenResponseApplicationJson, DirectEditingOpenResponseApplicationJsonBuilder> {
  factory DirectEditingOpenResponseApplicationJson([
    final void Function(DirectEditingOpenResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingOpenResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingOpenResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingOpenResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingOpenResponseApplicationJson> get serializer =>
      _$directEditingOpenResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingCreateResponseApplicationJson_Ocs_DataInterface {
  String get url;
}

abstract class DirectEditingCreateResponseApplicationJson_Ocs_Data
    implements
        $DirectEditingCreateResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingCreateResponseApplicationJson_Ocs_Data> get serializer =>
      _$directEditingCreateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  DirectEditingCreateResponseApplicationJson_Ocs_Data get data;
}

abstract class DirectEditingCreateResponseApplicationJson_Ocs
    implements
        $DirectEditingCreateResponseApplicationJson_OcsInterface,
        Built<DirectEditingCreateResponseApplicationJson_Ocs, DirectEditingCreateResponseApplicationJson_OcsBuilder> {
  factory DirectEditingCreateResponseApplicationJson_Ocs([
    final void Function(DirectEditingCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DirectEditingCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DirectEditingCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingCreateResponseApplicationJson_Ocs> get serializer =>
      _$directEditingCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DirectEditingCreateResponseApplicationJsonInterface {
  DirectEditingCreateResponseApplicationJson_Ocs get ocs;
}

abstract class DirectEditingCreateResponseApplicationJson
    implements
        $DirectEditingCreateResponseApplicationJsonInterface,
        Built<DirectEditingCreateResponseApplicationJson, DirectEditingCreateResponseApplicationJsonBuilder> {
  factory DirectEditingCreateResponseApplicationJson([
    final void Function(DirectEditingCreateResponseApplicationJsonBuilder)? b,
  ]) = _$DirectEditingCreateResponseApplicationJson;

  // coverage:ignore-start
  const DirectEditingCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DirectEditingCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DirectEditingCreateResponseApplicationJson> get serializer =>
      _$directEditingCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface {
  String? get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
}

abstract class OpenLocalEditorCreateResponseApplicationJson_Ocs_Data
    implements
        $OpenLocalEditorCreateResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorCreateResponseApplicationJson_Ocs_Data> get serializer =>
      _$openLocalEditorCreateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OpenLocalEditorCreateResponseApplicationJson_Ocs_Data get data;
}

abstract class OpenLocalEditorCreateResponseApplicationJson_Ocs
    implements
        $OpenLocalEditorCreateResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorCreateResponseApplicationJson_Ocs> get serializer =>
      _$openLocalEditorCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorCreateResponseApplicationJsonInterface {
  OpenLocalEditorCreateResponseApplicationJson_Ocs get ocs;
}

abstract class OpenLocalEditorCreateResponseApplicationJson
    implements
        $OpenLocalEditorCreateResponseApplicationJsonInterface,
        Built<OpenLocalEditorCreateResponseApplicationJson, OpenLocalEditorCreateResponseApplicationJsonBuilder> {
  factory OpenLocalEditorCreateResponseApplicationJson([
    final void Function(OpenLocalEditorCreateResponseApplicationJsonBuilder)? b,
  ]) = _$OpenLocalEditorCreateResponseApplicationJson;

  // coverage:ignore-start
  const OpenLocalEditorCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorCreateResponseApplicationJson> get serializer =>
      _$openLocalEditorCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface {
  String get userId;
  String get pathHash;
  int get expirationTime;
  String get token;
}

abstract class OpenLocalEditorValidateResponseApplicationJson_Ocs_Data
    implements
        $OpenLocalEditorValidateResponseApplicationJson_Ocs_DataInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorValidateResponseApplicationJson_Ocs_Data> get serializer =>
      _$openLocalEditorValidateResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorValidateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  OpenLocalEditorValidateResponseApplicationJson_Ocs_Data get data;
}

abstract class OpenLocalEditorValidateResponseApplicationJson_Ocs
    implements
        $OpenLocalEditorValidateResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorValidateResponseApplicationJson_Ocs> get serializer =>
      _$openLocalEditorValidateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $OpenLocalEditorValidateResponseApplicationJsonInterface {
  OpenLocalEditorValidateResponseApplicationJson_Ocs get ocs;
}

abstract class OpenLocalEditorValidateResponseApplicationJson
    implements
        $OpenLocalEditorValidateResponseApplicationJsonInterface,
        Built<OpenLocalEditorValidateResponseApplicationJson, OpenLocalEditorValidateResponseApplicationJsonBuilder> {
  factory OpenLocalEditorValidateResponseApplicationJson([
    final void Function(OpenLocalEditorValidateResponseApplicationJsonBuilder)? b,
  ]) = _$OpenLocalEditorValidateResponseApplicationJson;

  // coverage:ignore-start
  const OpenLocalEditorValidateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OpenLocalEditorValidateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OpenLocalEditorValidateResponseApplicationJson> get serializer =>
      _$openLocalEditorValidateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateFileCreatorInterface {
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
    implements $TemplateFileCreatorInterface, Built<TemplateFileCreator, TemplateFileCreatorBuilder> {
  factory TemplateFileCreator([final void Function(TemplateFileCreatorBuilder)? b]) = _$TemplateFileCreator;

  // coverage:ignore-start
  const TemplateFileCreator._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateFileCreator.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateFileCreator> get serializer => _$templateFileCreatorSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateListResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<TemplateFileCreator> get data;
}

abstract class TemplateListResponseApplicationJson_Ocs
    implements
        $TemplateListResponseApplicationJson_OcsInterface,
        Built<TemplateListResponseApplicationJson_Ocs, TemplateListResponseApplicationJson_OcsBuilder> {
  factory TemplateListResponseApplicationJson_Ocs([
    final void Function(TemplateListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplateListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplateListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateListResponseApplicationJson_Ocs> get serializer =>
      _$templateListResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateListResponseApplicationJsonInterface {
  TemplateListResponseApplicationJson_Ocs get ocs;
}

abstract class TemplateListResponseApplicationJson
    implements
        $TemplateListResponseApplicationJsonInterface,
        Built<TemplateListResponseApplicationJson, TemplateListResponseApplicationJsonBuilder> {
  factory TemplateListResponseApplicationJson([final void Function(TemplateListResponseApplicationJsonBuilder)? b]) =
      _$TemplateListResponseApplicationJson;

  // coverage:ignore-start
  const TemplateListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateListResponseApplicationJson> get serializer =>
      _$templateListResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateFileInterface {
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

abstract class TemplateFile implements $TemplateFileInterface, Built<TemplateFile, TemplateFileBuilder> {
  factory TemplateFile([final void Function(TemplateFileBuilder)? b]) = _$TemplateFile;

  // coverage:ignore-start
  const TemplateFile._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateFile.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateFile> get serializer => _$templateFileSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateCreateResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TemplateFile get data;
}

abstract class TemplateCreateResponseApplicationJson_Ocs
    implements
        $TemplateCreateResponseApplicationJson_OcsInterface,
        Built<TemplateCreateResponseApplicationJson_Ocs, TemplateCreateResponseApplicationJson_OcsBuilder> {
  factory TemplateCreateResponseApplicationJson_Ocs([
    final void Function(TemplateCreateResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplateCreateResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplateCreateResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateCreateResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateCreateResponseApplicationJson_Ocs> get serializer =>
      _$templateCreateResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateCreateResponseApplicationJsonInterface {
  TemplateCreateResponseApplicationJson_Ocs get ocs;
}

abstract class TemplateCreateResponseApplicationJson
    implements
        $TemplateCreateResponseApplicationJsonInterface,
        Built<TemplateCreateResponseApplicationJson, TemplateCreateResponseApplicationJsonBuilder> {
  factory TemplateCreateResponseApplicationJson([
    final void Function(TemplateCreateResponseApplicationJsonBuilder)? b,
  ]) = _$TemplateCreateResponseApplicationJson;

  // coverage:ignore-start
  const TemplateCreateResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplateCreateResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplateCreateResponseApplicationJson> get serializer =>
      _$templateCreateResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplatePathResponseApplicationJson_Ocs_DataInterface {
  @BuiltValueField(wireName: 'template_path')
  String get templatePath;
  BuiltList<TemplateFileCreator> get templates;
}

abstract class TemplatePathResponseApplicationJson_Ocs_Data
    implements
        $TemplatePathResponseApplicationJson_Ocs_DataInterface,
        Built<TemplatePathResponseApplicationJson_Ocs_Data, TemplatePathResponseApplicationJson_Ocs_DataBuilder> {
  factory TemplatePathResponseApplicationJson_Ocs_Data([
    final void Function(TemplatePathResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$TemplatePathResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplatePathResponseApplicationJson_Ocs_Data> get serializer =>
      _$templatePathResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplatePathResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  TemplatePathResponseApplicationJson_Ocs_Data get data;
}

abstract class TemplatePathResponseApplicationJson_Ocs
    implements
        $TemplatePathResponseApplicationJson_OcsInterface,
        Built<TemplatePathResponseApplicationJson_Ocs, TemplatePathResponseApplicationJson_OcsBuilder> {
  factory TemplatePathResponseApplicationJson_Ocs([
    final void Function(TemplatePathResponseApplicationJson_OcsBuilder)? b,
  ]) = _$TemplatePathResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplatePathResponseApplicationJson_Ocs> get serializer =>
      _$templatePathResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplatePathResponseApplicationJsonInterface {
  TemplatePathResponseApplicationJson_Ocs get ocs;
}

abstract class TemplatePathResponseApplicationJson
    implements
        $TemplatePathResponseApplicationJsonInterface,
        Built<TemplatePathResponseApplicationJson, TemplatePathResponseApplicationJsonBuilder> {
  factory TemplatePathResponseApplicationJson([final void Function(TemplatePathResponseApplicationJsonBuilder)? b]) =
      _$TemplatePathResponseApplicationJson;

  // coverage:ignore-start
  const TemplatePathResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TemplatePathResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TemplatePathResponseApplicationJson> get serializer =>
      _$templatePathResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipTransferResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipTransferResponseApplicationJson_Ocs
    implements
        $TransferOwnershipTransferResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipTransferResponseApplicationJson_Ocs> get serializer =>
      _$transferOwnershipTransferResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipTransferResponseApplicationJsonInterface {
  TransferOwnershipTransferResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipTransferResponseApplicationJson
    implements
        $TransferOwnershipTransferResponseApplicationJsonInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipTransferResponseApplicationJson> get serializer =>
      _$transferOwnershipTransferResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipAcceptResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipAcceptResponseApplicationJson_Ocs
    implements
        $TransferOwnershipAcceptResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipAcceptResponseApplicationJson_Ocs> get serializer =>
      _$transferOwnershipAcceptResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipAcceptResponseApplicationJsonInterface {
  TransferOwnershipAcceptResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipAcceptResponseApplicationJson
    implements
        $TransferOwnershipAcceptResponseApplicationJsonInterface,
        Built<TransferOwnershipAcceptResponseApplicationJson, TransferOwnershipAcceptResponseApplicationJsonBuilder> {
  factory TransferOwnershipAcceptResponseApplicationJson([
    final void Function(TransferOwnershipAcceptResponseApplicationJsonBuilder)? b,
  ]) = _$TransferOwnershipAcceptResponseApplicationJson;

  // coverage:ignore-start
  const TransferOwnershipAcceptResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipAcceptResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipAcceptResponseApplicationJson> get serializer =>
      _$transferOwnershipAcceptResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipRejectResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class TransferOwnershipRejectResponseApplicationJson_Ocs
    implements
        $TransferOwnershipRejectResponseApplicationJson_OcsInterface,
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
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipRejectResponseApplicationJson_Ocs> get serializer =>
      _$transferOwnershipRejectResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TransferOwnershipRejectResponseApplicationJsonInterface {
  TransferOwnershipRejectResponseApplicationJson_Ocs get ocs;
}

abstract class TransferOwnershipRejectResponseApplicationJson
    implements
        $TransferOwnershipRejectResponseApplicationJsonInterface,
        Built<TransferOwnershipRejectResponseApplicationJson, TransferOwnershipRejectResponseApplicationJsonBuilder> {
  factory TransferOwnershipRejectResponseApplicationJson([
    final void Function(TransferOwnershipRejectResponseApplicationJsonBuilder)? b,
  ]) = _$TransferOwnershipRejectResponseApplicationJson;

  // coverage:ignore-start
  const TransferOwnershipRejectResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory TransferOwnershipRejectResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<TransferOwnershipRejectResponseApplicationJson> get serializer =>
      _$transferOwnershipRejectResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_Files_DirectEditingInterface {
  String get url;
  String get etag;
  bool get supportsFileId;
}

abstract class Capabilities_Files_DirectEditing
    implements
        $Capabilities_Files_DirectEditingInterface,
        Built<Capabilities_Files_DirectEditing, Capabilities_Files_DirectEditingBuilder> {
  factory Capabilities_Files_DirectEditing([final void Function(Capabilities_Files_DirectEditingBuilder)? b]) =
      _$Capabilities_Files_DirectEditing;

  // coverage:ignore-start
  const Capabilities_Files_DirectEditing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Files_DirectEditing.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_Files_DirectEditing> get serializer => _$capabilitiesFilesDirectEditingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesInterface {
  bool get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<JsonObject> get blacklistedFiles;
  Capabilities_Files_DirectEditing get directEditing;
}

abstract class Capabilities_Files
    implements $Capabilities_FilesInterface, Built<Capabilities_Files, Capabilities_FilesBuilder> {
  factory Capabilities_Files([final void Function(Capabilities_FilesBuilder)? b]) = _$Capabilities_Files;

  // coverage:ignore-start
  const Capabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Files.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_Files> get serializer => _$capabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  Capabilities_Files get files;
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $TemplateInterface {
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

abstract class Template implements $TemplateInterface, Built<Template, TemplateBuilder> {
  factory Template([final void Function(TemplateBuilder)? b]) = _$Template;

  // coverage:ignore-start
  const Template._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Template.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Template> get serializer => _$templateSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson),
        DirectEditingInfoResponseApplicationJsonBuilder.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs),
        DirectEditingInfoResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data),
        DirectEditingInfoResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(DirectEditingInfoResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingInfoResponseApplicationJson_Ocs_Data_Editors),
        DirectEditingInfoResponseApplicationJson_Ocs_Data_EditorsBuilder.new,
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
        DirectEditingInfoResponseApplicationJson_Ocs_Data_CreatorsBuilder.new,
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
        DirectEditingTemplatesResponseApplicationJsonBuilder.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs),
        DirectEditingTemplatesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data),
        DirectEditingTemplatesResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(DirectEditingTemplatesResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingTemplatesResponseApplicationJson_Ocs_Data_Templates),
        DirectEditingTemplatesResponseApplicationJson_Ocs_Data_TemplatesBuilder.new,
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
        DirectEditingOpenResponseApplicationJsonBuilder.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingOpenResponseApplicationJson_Ocs),
        DirectEditingOpenResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingOpenResponseApplicationJson_Ocs_Data),
        DirectEditingOpenResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(DirectEditingOpenResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson),
        DirectEditingCreateResponseApplicationJsonBuilder.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson_Ocs),
        DirectEditingCreateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(DirectEditingCreateResponseApplicationJson_Ocs_Data),
        DirectEditingCreateResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(DirectEditingCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson),
        OpenLocalEditorCreateResponseApplicationJsonBuilder.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs),
        OpenLocalEditorCreateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data),
        OpenLocalEditorCreateResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(OpenLocalEditorCreateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson),
        OpenLocalEditorValidateResponseApplicationJsonBuilder.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs),
        OpenLocalEditorValidateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data),
        OpenLocalEditorValidateResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(OpenLocalEditorValidateResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TemplateListResponseApplicationJson),
        TemplateListResponseApplicationJsonBuilder.new,
      )
      ..add(TemplateListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplateListResponseApplicationJson_Ocs),
        TemplateListResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TemplateListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(TemplateFileCreator), TemplateFileCreatorBuilder.new)
      ..add(TemplateFileCreator.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TemplateFileCreator)]),
        ListBuilder<TemplateFileCreator>.new,
      )
      ..addBuilderFactory(
        const FullType(TemplateCreateResponseApplicationJson),
        TemplateCreateResponseApplicationJsonBuilder.new,
      )
      ..add(TemplateCreateResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplateCreateResponseApplicationJson_Ocs),
        TemplateCreateResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TemplateCreateResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(TemplateFile), TemplateFileBuilder.new)
      ..add(TemplateFile.serializer)
      ..addBuilderFactory(
        const FullType(TemplatePathResponseApplicationJson),
        TemplatePathResponseApplicationJsonBuilder.new,
      )
      ..add(TemplatePathResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TemplatePathResponseApplicationJson_Ocs),
        TemplatePathResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TemplatePathResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TemplatePathResponseApplicationJson_Ocs_Data),
        TemplatePathResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(TemplatePathResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipTransferResponseApplicationJson),
        TransferOwnershipTransferResponseApplicationJsonBuilder.new,
      )
      ..add(TransferOwnershipTransferResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipTransferResponseApplicationJson_Ocs),
        TransferOwnershipTransferResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TransferOwnershipTransferResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipAcceptResponseApplicationJson),
        TransferOwnershipAcceptResponseApplicationJsonBuilder.new,
      )
      ..add(TransferOwnershipAcceptResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipAcceptResponseApplicationJson_Ocs),
        TransferOwnershipAcceptResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TransferOwnershipAcceptResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipRejectResponseApplicationJson),
        TransferOwnershipRejectResponseApplicationJsonBuilder.new,
      )
      ..add(TransferOwnershipRejectResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(TransferOwnershipRejectResponseApplicationJson_Ocs),
        TransferOwnershipRejectResponseApplicationJson_OcsBuilder.new,
      )
      ..add(TransferOwnershipRejectResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Files), Capabilities_FilesBuilder.new)
      ..add(Capabilities_Files.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new)
      ..addBuilderFactory(const FullType(Capabilities_Files_DirectEditing), Capabilities_Files_DirectEditingBuilder.new)
      ..add(Capabilities_Files_DirectEditing.serializer)
      ..addBuilderFactory(const FullType(Template), TemplateBuilder.new)
      ..add(Template.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
