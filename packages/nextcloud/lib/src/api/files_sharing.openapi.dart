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
import 'package:dynamite_runtime/models.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'files_sharing.openapi.g.dart';

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

  DeletedShareapiClient get deletedShareapi => DeletedShareapiClient(this);

  PublicPreviewClient get publicPreview => PublicPreviewClient(this);

  RemoteClient get remote => RemoteClient(this);

  ShareInfoClient get shareInfo => ShareInfoClient(this);

  ShareapiClient get shareapi => ShareapiClient(this);

  ShareesapiClient get shareesapi => ShareesapiClient(this);
}

class DeletedShareapiClient {
  DeletedShareapiClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of all deleted shares.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Deleted shares returned
  ///
  /// See:
  ///  * [listRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DeletedShareapiListResponseApplicationJson, void>> list({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = listRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of all deleted shares.
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
  ///   * 200: Deleted shares returned
  ///
  /// See:
  ///  * [list] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DeletedShareapiListResponseApplicationJson, void> listRaw({final bool oCSAPIRequest = true}) {
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/deletedshares').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DeletedShareapiListResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DeletedShareapiListResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Undelete a deleted share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share undeleted successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [undeleteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<DeletedShareapiUndeleteResponseApplicationJson, void>> undelete({
    required final String id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = undeleteRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Undelete a deleted share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share undeleted successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [undelete] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<DeletedShareapiUndeleteResponseApplicationJson, void> undeleteRaw({
    required final String id,
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
    pathParameters['id'] = id;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/deletedshares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<DeletedShareapiUndeleteResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(DeletedShareapiUndeleteResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class PublicPreviewClient {
  PublicPreviewClient(this._rootClient);

  final Client _rootClient;

  /// Get a direct link preview for a shared file.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Share or preview not found
  ///
  /// See:
  ///  * [directLinkRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> directLink({
    required final String token,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = directLinkRaw(
      token: token,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a direct link preview for a shared file.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [token] Token of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Share or preview not found
  ///
  /// See:
  ///  * [directLink] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> directLinkRaw({
    required final String token,
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
    pathParameters['token'] = token;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/index.php/s/{token}/preview').expand(pathParameters));
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

  /// Get a preview for a shared file.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [file] File in the share. Defaults to `''`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [token] Token of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Share or preview not found
  ///
  /// See:
  ///  * [getPreviewRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, void>> getPreview({
    required final String token,
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getPreviewRaw(
      token: token,
      file: file,
      x: x,
      y: y,
      a: a,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a preview for a shared file.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [file] File in the share. Defaults to `''`.
  ///   * [x] Width of the preview. Defaults to `32`.
  ///   * [y] Height of the preview. Defaults to `32`.
  ///   * [a] Whether to not crop the preview. Defaults to `0`.
  ///   * [token] Token of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Preview returned
  ///   * 400: Getting preview is not possible
  ///   * 403: Getting preview is not allowed
  ///   * 404: Share or preview not found
  ///
  /// See:
  ///  * [getPreview] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, void> getPreviewRaw({
    required final String token,
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
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
    pathParameters['token'] = token;
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/files_sharing/publicpreview/{token}').expand(pathParameters));
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

class RemoteClient {
  RemoteClient(this._rootClient);

  final Client _rootClient;

  /// Get a list of accepted remote shares.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Accepted remote shares returned
  ///
  /// See:
  ///  * [getSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteGetSharesResponseApplicationJson, void>> getShares({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getSharesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a list of accepted remote shares.
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
  ///   * 200: Accepted remote shares returned
  ///
  /// See:
  ///  * [getShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteGetSharesResponseApplicationJson, void> getSharesRaw({final bool oCSAPIRequest = true}) {
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteGetSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteGetSharesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get list of pending remote shares.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Pending remote shares returned
  ///
  /// See:
  ///  * [getOpenSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteGetOpenSharesResponseApplicationJson, void>> getOpenShares({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getOpenSharesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get list of pending remote shares.
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
  ///   * 200: Pending remote shares returned
  ///
  /// See:
  ///  * [getOpenShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteGetOpenSharesResponseApplicationJson, void> getOpenSharesRaw({
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
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteGetOpenSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteGetOpenSharesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Accept a remote share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share accepted successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [acceptShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteAcceptShareResponseApplicationJson, void>> acceptShare({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = acceptShareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Accept a remote share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share accepted successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [acceptShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteAcceptShareResponseApplicationJson, void> acceptShareRaw({
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
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/{id}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteAcceptShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteAcceptShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Decline a remote share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share declined successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [declineShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteDeclineShareResponseApplicationJson, void>> declineShare({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = declineShareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Decline a remote share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share declined successfully
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [declineShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteDeclineShareResponseApplicationJson, void> declineShareRaw({
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
    var uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/pending/{id}').expand(pathParameters),
    );
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteDeclineShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteDeclineShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get info of a remote share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share returned
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteGetShareResponseApplicationJson, void>> getShare({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getShareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get info of a remote share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share returned
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteGetShareResponseApplicationJson, void> getShareRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteGetShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteGetShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Unshare a remote share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share unshared successfully
  ///   * 404: Share not found
  ///   * 403: Unsharing is not possible
  ///
  /// See:
  ///  * [unshareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<RemoteUnshareResponseApplicationJson, void>> unshare({
    required final int id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = unshareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Unshare a remote share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share unshared successfully
  ///   * 404: Share not found
  ///   * 403: Unsharing is not possible
  ///
  /// See:
  ///  * [unshare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<RemoteUnshareResponseApplicationJson, void> unshareRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/remote_shares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<RemoteUnshareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(RemoteUnshareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ShareInfoClient {
  ShareInfoClient(this._rootClient);

  final Client _rootClient;

  /// Get the info about a share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [t] Token of the share.
  ///   * [password] Password of the share.
  ///   * [dir] Subdirectory to get info about.
  ///   * [depth] Maximum depth to get info about. Defaults to `-1`.
  ///
  /// Status codes:
  ///   * 200: Share info returned
  ///   * 403: Getting share info is not allowed
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [infoRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareInfo, void>> info({
    required final String t,
    final String? password,
    final String? dir,
    final int depth = -1,
  }) async {
    final rawResponse = infoRaw(
      t: t,
      password: password,
      dir: dir,
      depth: depth,
    );

    return rawResponse.future;
  }

  /// Get the info about a share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [t] Token of the share.
  ///   * [password] Password of the share.
  ///   * [dir] Subdirectory to get info about.
  ///   * [depth] Maximum depth to get info about. Defaults to `-1`.
  ///
  /// Status codes:
  ///   * 200: Share info returned
  ///   * 403: Getting share info is not allowed
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [info] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareInfo, void> infoRaw({
    required final String t,
    final String? password,
    final String? dir,
    final int depth = -1,
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
    var uri = Uri.parse(UriTemplate('/index.php/apps/files_sharing/shareinfo').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareInfo, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareInfo),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ShareapiClient {
  ShareapiClient(this._rootClient);

  final Client _rootClient;

  /// Get shares of the current user.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sharedWithMe] Only get shares with the current user. Defaults to `false`.
  ///   * [reshares] Only get shares by the current user and reshares. Defaults to `false`.
  ///   * [subfiles] Only get all shares in a folder. Defaults to `false`.
  ///   * [path] Get shares for a specific path. Defaults to `''`.
  ///   * [includeTags] Include tags in the share. Defaults to `false`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Shares returned
  ///   * 404: The folder was not found or is inaccessible
  ///
  /// See:
  ///  * [getSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiGetSharesResponseApplicationJson, void>> getShares({
    final String sharedWithMe = 'false',
    final String reshares = 'false',
    final String subfiles = 'false',
    final String path = '',
    final String includeTags = 'false',
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getSharesRaw(
      sharedWithMe: sharedWithMe,
      reshares: reshares,
      subfiles: subfiles,
      path: path,
      includeTags: includeTags,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get shares of the current user.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [sharedWithMe] Only get shares with the current user. Defaults to `false`.
  ///   * [reshares] Only get shares by the current user and reshares. Defaults to `false`.
  ///   * [subfiles] Only get all shares in a folder. Defaults to `false`.
  ///   * [path] Get shares for a specific path. Defaults to `''`.
  ///   * [includeTags] Include tags in the share. Defaults to `false`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Shares returned
  ///   * 404: The folder was not found or is inaccessible
  ///
  /// See:
  ///  * [getShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiGetSharesResponseApplicationJson, void> getSharesRaw({
    final String sharedWithMe = 'false',
    final String reshares = 'false',
    final String subfiles = 'false',
    final String path = '',
    final String includeTags = 'false',
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiGetSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiGetSharesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Create a share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the share.
  ///   * [permissions] Permissions for the share.
  ///   * [shareType] Type of the share. Defaults to `-1`.
  ///   * [shareWith] The entity this should be shared with.
  ///   * [publicUpload] If public uploading is allowed. Defaults to `false`.
  ///   * [password] Password for the share. Defaults to `''`.
  ///   * [sendPasswordByTalk] Send the password for the share over Talk.
  ///   * [expireDate] Expiry date of the share. Defaults to `''`.
  ///   * [note] Note for the share. Defaults to `''`.
  ///   * [label] Label for the share (only used in link and email). Defaults to `''`.
  ///   * [attributes] Additional attributes for the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share created
  ///   * 400: Unknown share type
  ///   * 403: Creating the share is not allowed
  ///   * 404: Creating the share failed
  ///
  /// See:
  ///  * [createShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiCreateShareResponseApplicationJson, void>> createShare({
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
    final rawResponse = createShareRaw(
      path: path,
      permissions: permissions,
      shareType: shareType,
      shareWith: shareWith,
      publicUpload: publicUpload,
      password: password,
      sendPasswordByTalk: sendPasswordByTalk,
      expireDate: expireDate,
      note: note,
      label: label,
      attributes: attributes,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Create a share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path of the share.
  ///   * [permissions] Permissions for the share.
  ///   * [shareType] Type of the share. Defaults to `-1`.
  ///   * [shareWith] The entity this should be shared with.
  ///   * [publicUpload] If public uploading is allowed. Defaults to `false`.
  ///   * [password] Password for the share. Defaults to `''`.
  ///   * [sendPasswordByTalk] Send the password for the share over Talk.
  ///   * [expireDate] Expiry date of the share. Defaults to `''`.
  ///   * [note] Note for the share. Defaults to `''`.
  ///   * [label] Label for the share (only used in link and email). Defaults to `''`.
  ///   * [attributes] Additional attributes for the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share created
  ///   * 400: Unknown share type
  ///   * 403: Creating the share is not allowed
  ///   * 404: Creating the share failed
  ///
  /// See:
  ///  * [createShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiCreateShareResponseApplicationJson, void> createShareRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiCreateShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiCreateShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get all shares relative to a file, including parent folders shares rights.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path all shares will be relative to.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Shares returned
  ///   * 500
  ///   * 404: The given path is invalid
  ///
  /// See:
  ///  * [getInheritedSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiGetInheritedSharesResponseApplicationJson, void>> getInheritedShares({
    required final String path,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getInheritedSharesRaw(
      path: path,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all shares relative to a file, including parent folders shares rights.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [path] Path all shares will be relative to.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Shares returned
  ///   * 500
  ///   * 404: The given path is invalid
  ///
  /// See:
  ///  * [getInheritedShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiGetInheritedSharesResponseApplicationJson, void> getInheritedSharesRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/inherited').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiGetInheritedSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiGetInheritedSharesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get all shares that are still pending.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Pending shares returned
  ///
  /// See:
  ///  * [pendingSharesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiPendingSharesResponseApplicationJson, void>> pendingShares({
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = pendingSharesRaw(
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get all shares that are still pending.
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
  ///   * 200: Pending shares returned
  ///
  /// See:
  ///  * [pendingShares] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiPendingSharesResponseApplicationJson, void> pendingSharesRaw({
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/pending').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiPendingSharesResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiPendingSharesResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Get a specific share by id.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeTags] Include tags in the share. Defaults to `0`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share returned
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiGetShareResponseApplicationJson, void>> getShare({
    required final String id,
    final int includeTags = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = getShareRaw(
      id: id,
      includeTags: includeTags,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a specific share by id.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [includeTags] Include tags in the share. Defaults to `0`.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share returned
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [getShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiGetShareResponseApplicationJson, void> getShareRaw({
    required final String id,
    final int includeTags = 0,
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
    pathParameters['id'] = id;
    if (includeTags != 0) {
      queryParameters['include_tags'] = includeTags.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiGetShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiGetShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Update a share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [permissions] New permissions.
  ///   * [password] New password.
  ///   * [sendPasswordByTalk] New condition if the password should be send over Talk.
  ///   * [publicUpload] New condition if public uploading is allowed.
  ///   * [expireDate] New expiry date.
  ///   * [note] New note.
  ///   * [label] New label.
  ///   * [hideDownload] New condition if the download should be hidden.
  ///   * [attributes] New additional attributes.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share updated successfully
  ///   * 400: Share could not be updated because the requested changes are invalid
  ///   * 403: Missing permissions to update the share
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [updateShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiUpdateShareResponseApplicationJson, void>> updateShare({
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
    final rawResponse = updateShareRaw(
      id: id,
      permissions: permissions,
      password: password,
      sendPasswordByTalk: sendPasswordByTalk,
      publicUpload: publicUpload,
      expireDate: expireDate,
      note: note,
      label: label,
      hideDownload: hideDownload,
      attributes: attributes,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Update a share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [permissions] New permissions.
  ///   * [password] New password.
  ///   * [sendPasswordByTalk] New condition if the password should be send over Talk.
  ///   * [publicUpload] New condition if public uploading is allowed.
  ///   * [expireDate] New expiry date.
  ///   * [note] New note.
  ///   * [label] New label.
  ///   * [hideDownload] New condition if the download should be hidden.
  ///   * [attributes] New additional attributes.
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share updated successfully
  ///   * 400: Share could not be updated because the requested changes are invalid
  ///   * 403: Missing permissions to update the share
  ///   * 404: Share not found
  ///
  /// See:
  ///  * [updateShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiUpdateShareResponseApplicationJson, void> updateShareRaw({
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
    pathParameters['id'] = id;
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
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiUpdateShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiUpdateShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Delete a share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share deleted successfully
  ///   * 404: Share not found
  ///   * 403: Missing permissions to delete the share
  ///
  /// See:
  ///  * [deleteShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiDeleteShareResponseApplicationJson, void>> deleteShare({
    required final String id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = deleteShareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Delete a share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share deleted successfully
  ///   * 404: Share not found
  ///   * 403: Missing permissions to delete the share
  ///
  /// See:
  ///  * [deleteShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiDeleteShareResponseApplicationJson, void> deleteShareRaw({
    required final String id,
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
    pathParameters['id'] = id;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiDeleteShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiDeleteShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Accept a share.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share accepted successfully
  ///   * 404: Share not found
  ///   * 400: Share could not be accepted
  ///
  /// See:
  ///  * [acceptShareRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareapiAcceptShareResponseApplicationJson, void>> acceptShare({
    required final String id,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = acceptShareRaw(
      id: id,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Accept a share.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [id] ID of the share.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Share accepted successfully
  ///   * 404: Share not found
  ///   * 400: Share could not be accepted
  ///
  /// See:
  ///  * [acceptShare] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareapiAcceptShareResponseApplicationJson, void> acceptShareRaw({
    required final String id,
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
    pathParameters['id'] = id;
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/shares/pending/{id}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareapiAcceptShareResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareapiAcceptShareResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

class ShareesapiClient {
  ShareesapiClient(this._rootClient);

  final Client _rootClient;

  /// Search for sharees.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [itemType] Limit to specific item types.
  ///   * [page] Page offset for searching. Defaults to `1`.
  ///   * [perPage] Limit amount of search results per page. Defaults to `200`.
  ///   * [shareType] Limit to specific share types.
  ///   * [lookup] If a global lookup should be performed too. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sharees search result returned
  ///   * 400: Invalid search parameters
  ///
  /// See:
  ///  * [searchRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareesapiSearchResponseApplicationJson, ShareesapiShareesapiSearchHeaders>> search({
    final String search = '',
    final String? itemType,
    final int page = 1,
    final int perPage = 200,
    final ContentString<ShareesapiSearchShareType>? shareType,
    final int lookup = 0,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = searchRaw(
      search: search,
      itemType: itemType,
      page: page,
      perPage: perPage,
      shareType: shareType,
      lookup: lookup,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Search for sharees.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [search] Text to search for. Defaults to `''`.
  ///   * [itemType] Limit to specific item types.
  ///   * [page] Page offset for searching. Defaults to `1`.
  ///   * [perPage] Limit amount of search results per page. Defaults to `200`.
  ///   * [shareType] Limit to specific share types.
  ///   * [lookup] If a global lookup should be performed too. Defaults to `0`.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Sharees search result returned
  ///   * 400: Invalid search parameters
  ///
  /// See:
  ///  * [search] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareesapiSearchResponseApplicationJson, ShareesapiShareesapiSearchHeaders> searchRaw({
    final String search = '',
    final String? itemType,
    final int page = 1,
    final int perPage = 200,
    final ContentString<ShareesapiSearchShareType>? shareType,
    final int lookup = 0,
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
        specifiedType: const FullType(ContentString, [FullType(ShareesapiSearchShareType)]),
      );
    }
    if (lookup != 0) {
      queryParameters['lookup'] = lookup.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/sharees').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareesapiSearchResponseApplicationJson, ShareesapiShareesapiSearchHeaders>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareesapiSearchResponseApplicationJson),
      headersType: const FullType(ShareesapiShareesapiSearchHeaders),
      serializers: _jsonSerializers,
    );
  }

  /// Find recommended sharees.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [itemType] Limit to specific item types.
  ///   * [shareType] Limit to specific share types.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recommended sharees returned
  ///
  /// See:
  ///  * [findRecommendedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ShareesapiFindRecommendedResponseApplicationJson, void>> findRecommended({
    required final String itemType,
    final ContentString<ShareesapiFindRecommendedShareType>? shareType,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = findRecommendedRaw(
      itemType: itemType,
      shareType: shareType,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Find recommended sharees.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [itemType] Limit to specific item types.
  ///   * [shareType] Limit to specific share types.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Recommended sharees returned
  ///
  /// See:
  ///  * [findRecommended] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ShareesapiFindRecommendedResponseApplicationJson, void> findRecommendedRaw({
    required final String itemType,
    final ContentString<ShareesapiFindRecommendedShareType>? shareType,
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
    queryParameters['itemType'] = itemType;
    if (shareType != null) {
      queryParameters['shareType'] = _jsonSerializers.serialize(
        shareType,
        specifiedType: const FullType(ContentString, [FullType(ShareesapiFindRecommendedShareType)]),
      );
    }
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    var uri =
        Uri.parse(UriTemplate('/ocs/v2.php/apps/files_sharing/api/v1/sharees_recommended').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ShareesapiFindRecommendedResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ShareesapiFindRecommendedResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
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
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeletedShareInterface {
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
}

abstract class DeletedShare implements $DeletedShareInterface, Built<DeletedShare, DeletedShareBuilder> {
  factory DeletedShare([final void Function(DeletedShareBuilder)? b]) = _$DeletedShare;

  // coverage:ignore-start
  const DeletedShare._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeletedShare.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeletedShare> get serializer => _$deletedShareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeletedShareapiListResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<DeletedShare> get data;
}

abstract class DeletedShareapiListResponseApplicationJson_Ocs
    implements
        $DeletedShareapiListResponseApplicationJson_OcsInterface,
        Built<DeletedShareapiListResponseApplicationJson_Ocs, DeletedShareapiListResponseApplicationJson_OcsBuilder> {
  factory DeletedShareapiListResponseApplicationJson_Ocs([
    final void Function(DeletedShareapiListResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DeletedShareapiListResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DeletedShareapiListResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeletedShareapiListResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeletedShareapiListResponseApplicationJson_Ocs> get serializer =>
      _$deletedShareapiListResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeletedShareapiListResponseApplicationJsonInterface {
  DeletedShareapiListResponseApplicationJson_Ocs get ocs;
}

abstract class DeletedShareapiListResponseApplicationJson
    implements
        $DeletedShareapiListResponseApplicationJsonInterface,
        Built<DeletedShareapiListResponseApplicationJson, DeletedShareapiListResponseApplicationJsonBuilder> {
  factory DeletedShareapiListResponseApplicationJson([
    final void Function(DeletedShareapiListResponseApplicationJsonBuilder)? b,
  ]) = _$DeletedShareapiListResponseApplicationJson;

  // coverage:ignore-start
  const DeletedShareapiListResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeletedShareapiListResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeletedShareapiListResponseApplicationJson> get serializer =>
      _$deletedShareapiListResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeletedShareapiUndeleteResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class DeletedShareapiUndeleteResponseApplicationJson_Ocs
    implements
        $DeletedShareapiUndeleteResponseApplicationJson_OcsInterface,
        Built<DeletedShareapiUndeleteResponseApplicationJson_Ocs,
            DeletedShareapiUndeleteResponseApplicationJson_OcsBuilder> {
  factory DeletedShareapiUndeleteResponseApplicationJson_Ocs([
    final void Function(DeletedShareapiUndeleteResponseApplicationJson_OcsBuilder)? b,
  ]) = _$DeletedShareapiUndeleteResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const DeletedShareapiUndeleteResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeletedShareapiUndeleteResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeletedShareapiUndeleteResponseApplicationJson_Ocs> get serializer =>
      _$deletedShareapiUndeleteResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $DeletedShareapiUndeleteResponseApplicationJsonInterface {
  DeletedShareapiUndeleteResponseApplicationJson_Ocs get ocs;
}

abstract class DeletedShareapiUndeleteResponseApplicationJson
    implements
        $DeletedShareapiUndeleteResponseApplicationJsonInterface,
        Built<DeletedShareapiUndeleteResponseApplicationJson, DeletedShareapiUndeleteResponseApplicationJsonBuilder> {
  factory DeletedShareapiUndeleteResponseApplicationJson([
    final void Function(DeletedShareapiUndeleteResponseApplicationJsonBuilder)? b,
  ]) = _$DeletedShareapiUndeleteResponseApplicationJson;

  // coverage:ignore-start
  const DeletedShareapiUndeleteResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory DeletedShareapiUndeleteResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<DeletedShareapiUndeleteResponseApplicationJson> get serializer =>
      _$deletedShareapiUndeleteResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteShareInterface {
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
}

abstract class RemoteShare implements $RemoteShareInterface, Built<RemoteShare, RemoteShareBuilder> {
  factory RemoteShare([final void Function(RemoteShareBuilder)? b]) = _$RemoteShare;

  // coverage:ignore-start
  const RemoteShare._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteShare.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteShare> get serializer => _$remoteShareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<RemoteShare> get data;
}

abstract class RemoteGetSharesResponseApplicationJson_Ocs
    implements
        $RemoteGetSharesResponseApplicationJson_OcsInterface,
        Built<RemoteGetSharesResponseApplicationJson_Ocs, RemoteGetSharesResponseApplicationJson_OcsBuilder> {
  factory RemoteGetSharesResponseApplicationJson_Ocs([
    final void Function(RemoteGetSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteGetSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteGetSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetSharesResponseApplicationJson_Ocs> get serializer =>
      _$remoteGetSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetSharesResponseApplicationJsonInterface {
  RemoteGetSharesResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetSharesResponseApplicationJson
    implements
        $RemoteGetSharesResponseApplicationJsonInterface,
        Built<RemoteGetSharesResponseApplicationJson, RemoteGetSharesResponseApplicationJsonBuilder> {
  factory RemoteGetSharesResponseApplicationJson([
    final void Function(RemoteGetSharesResponseApplicationJsonBuilder)? b,
  ]) = _$RemoteGetSharesResponseApplicationJson;

  // coverage:ignore-start
  const RemoteGetSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetSharesResponseApplicationJson> get serializer =>
      _$remoteGetSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetOpenSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<RemoteShare> get data;
}

abstract class RemoteGetOpenSharesResponseApplicationJson_Ocs
    implements
        $RemoteGetOpenSharesResponseApplicationJson_OcsInterface,
        Built<RemoteGetOpenSharesResponseApplicationJson_Ocs, RemoteGetOpenSharesResponseApplicationJson_OcsBuilder> {
  factory RemoteGetOpenSharesResponseApplicationJson_Ocs([
    final void Function(RemoteGetOpenSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteGetOpenSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteGetOpenSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetOpenSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetOpenSharesResponseApplicationJson_Ocs> get serializer =>
      _$remoteGetOpenSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetOpenSharesResponseApplicationJsonInterface {
  RemoteGetOpenSharesResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetOpenSharesResponseApplicationJson
    implements
        $RemoteGetOpenSharesResponseApplicationJsonInterface,
        Built<RemoteGetOpenSharesResponseApplicationJson, RemoteGetOpenSharesResponseApplicationJsonBuilder> {
  factory RemoteGetOpenSharesResponseApplicationJson([
    final void Function(RemoteGetOpenSharesResponseApplicationJsonBuilder)? b,
  ]) = _$RemoteGetOpenSharesResponseApplicationJson;

  // coverage:ignore-start
  const RemoteGetOpenSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetOpenSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetOpenSharesResponseApplicationJson> get serializer =>
      _$remoteGetOpenSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteAcceptShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteAcceptShareResponseApplicationJson_Ocs
    implements
        $RemoteAcceptShareResponseApplicationJson_OcsInterface,
        Built<RemoteAcceptShareResponseApplicationJson_Ocs, RemoteAcceptShareResponseApplicationJson_OcsBuilder> {
  factory RemoteAcceptShareResponseApplicationJson_Ocs([
    final void Function(RemoteAcceptShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteAcceptShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteAcceptShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteAcceptShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteAcceptShareResponseApplicationJson_Ocs> get serializer =>
      _$remoteAcceptShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteAcceptShareResponseApplicationJsonInterface {
  RemoteAcceptShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteAcceptShareResponseApplicationJson
    implements
        $RemoteAcceptShareResponseApplicationJsonInterface,
        Built<RemoteAcceptShareResponseApplicationJson, RemoteAcceptShareResponseApplicationJsonBuilder> {
  factory RemoteAcceptShareResponseApplicationJson([
    final void Function(RemoteAcceptShareResponseApplicationJsonBuilder)? b,
  ]) = _$RemoteAcceptShareResponseApplicationJson;

  // coverage:ignore-start
  const RemoteAcceptShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteAcceptShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteAcceptShareResponseApplicationJson> get serializer =>
      _$remoteAcceptShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteDeclineShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteDeclineShareResponseApplicationJson_Ocs
    implements
        $RemoteDeclineShareResponseApplicationJson_OcsInterface,
        Built<RemoteDeclineShareResponseApplicationJson_Ocs, RemoteDeclineShareResponseApplicationJson_OcsBuilder> {
  factory RemoteDeclineShareResponseApplicationJson_Ocs([
    final void Function(RemoteDeclineShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteDeclineShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteDeclineShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteDeclineShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteDeclineShareResponseApplicationJson_Ocs> get serializer =>
      _$remoteDeclineShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteDeclineShareResponseApplicationJsonInterface {
  RemoteDeclineShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteDeclineShareResponseApplicationJson
    implements
        $RemoteDeclineShareResponseApplicationJsonInterface,
        Built<RemoteDeclineShareResponseApplicationJson, RemoteDeclineShareResponseApplicationJsonBuilder> {
  factory RemoteDeclineShareResponseApplicationJson([
    final void Function(RemoteDeclineShareResponseApplicationJsonBuilder)? b,
  ]) = _$RemoteDeclineShareResponseApplicationJson;

  // coverage:ignore-start
  const RemoteDeclineShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteDeclineShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteDeclineShareResponseApplicationJson> get serializer =>
      _$remoteDeclineShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  RemoteShare get data;
}

abstract class RemoteGetShareResponseApplicationJson_Ocs
    implements
        $RemoteGetShareResponseApplicationJson_OcsInterface,
        Built<RemoteGetShareResponseApplicationJson_Ocs, RemoteGetShareResponseApplicationJson_OcsBuilder> {
  factory RemoteGetShareResponseApplicationJson_Ocs([
    final void Function(RemoteGetShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteGetShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteGetShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetShareResponseApplicationJson_Ocs> get serializer =>
      _$remoteGetShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteGetShareResponseApplicationJsonInterface {
  RemoteGetShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetShareResponseApplicationJson
    implements
        $RemoteGetShareResponseApplicationJsonInterface,
        Built<RemoteGetShareResponseApplicationJson, RemoteGetShareResponseApplicationJsonBuilder> {
  factory RemoteGetShareResponseApplicationJson([
    final void Function(RemoteGetShareResponseApplicationJsonBuilder)? b,
  ]) = _$RemoteGetShareResponseApplicationJson;

  // coverage:ignore-start
  const RemoteGetShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteGetShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteGetShareResponseApplicationJson> get serializer =>
      _$remoteGetShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteUnshareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteUnshareResponseApplicationJson_Ocs
    implements
        $RemoteUnshareResponseApplicationJson_OcsInterface,
        Built<RemoteUnshareResponseApplicationJson_Ocs, RemoteUnshareResponseApplicationJson_OcsBuilder> {
  factory RemoteUnshareResponseApplicationJson_Ocs([
    final void Function(RemoteUnshareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$RemoteUnshareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const RemoteUnshareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteUnshareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteUnshareResponseApplicationJson_Ocs> get serializer =>
      _$remoteUnshareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $RemoteUnshareResponseApplicationJsonInterface {
  RemoteUnshareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteUnshareResponseApplicationJson
    implements
        $RemoteUnshareResponseApplicationJsonInterface,
        Built<RemoteUnshareResponseApplicationJson, RemoteUnshareResponseApplicationJsonBuilder> {
  factory RemoteUnshareResponseApplicationJson([final void Function(RemoteUnshareResponseApplicationJsonBuilder)? b]) =
      _$RemoteUnshareResponseApplicationJson;

  // coverage:ignore-start
  const RemoteUnshareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory RemoteUnshareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<RemoteUnshareResponseApplicationJson> get serializer =>
      _$remoteUnshareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareInfoInterface {
  int get id;
  int get parentId;
  int get mtime;
  String get name;
  int get permissions;
  String get mimetype;
  num get size;
  String get type;
  String get etag;
  BuiltList<BuiltMap<String, JsonObject>>? get children;
}

abstract class ShareInfo implements $ShareInfoInterface, Built<ShareInfo, ShareInfoBuilder> {
  factory ShareInfo([final void Function(ShareInfoBuilder)? b]) = _$ShareInfo;

  // coverage:ignore-start
  const ShareInfo._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareInfo.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareInfo> get serializer => _$shareInfoSerializer;
}

class Share_ItemType extends EnumClass {
  const Share_ItemType._(super.name);

  static const Share_ItemType file = _$shareItemTypeFile;

  static const Share_ItemType folder = _$shareItemTypeFolder;

  // coverage:ignore-start
  static BuiltSet<Share_ItemType> get values => _$shareItemTypeValues;
  // coverage:ignore-end

  static Share_ItemType valueOf(final String name) => _$valueOfShare_ItemType(name);

  static Serializer<Share_ItemType> get serializer => _$shareItemTypeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Share_StatusInterface {
  int? get clearAt;
  String? get icon;
  String? get message;
  String? get status;
}

abstract class Share_Status implements $Share_StatusInterface, Built<Share_Status, Share_StatusBuilder> {
  factory Share_Status([final void Function(Share_StatusBuilder)? b]) = _$Share_Status;

  // coverage:ignore-start
  const Share_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Share_Status.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Share_Status> get serializer => _$shareStatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareInterface {
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
  num get itemSize;
  @BuiltValueField(wireName: 'item_source')
  int get itemSource;
  @BuiltValueField(wireName: 'item_type')
  Share_ItemType get itemType;
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
  Share_Status? get status;
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
}

abstract class Share implements $ShareInterface, Built<Share, ShareBuilder> {
  factory Share([final void Function(ShareBuilder)? b]) = _$Share;

  // coverage:ignore-start
  const Share._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Share.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Share> get serializer => _$shareSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiGetSharesResponseApplicationJson_Ocs
    implements
        $ShareapiGetSharesResponseApplicationJson_OcsInterface,
        Built<ShareapiGetSharesResponseApplicationJson_Ocs, ShareapiGetSharesResponseApplicationJson_OcsBuilder> {
  factory ShareapiGetSharesResponseApplicationJson_Ocs([
    final void Function(ShareapiGetSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiGetSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiGetSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetSharesResponseApplicationJson_Ocs> get serializer =>
      _$shareapiGetSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetSharesResponseApplicationJsonInterface {
  ShareapiGetSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetSharesResponseApplicationJson
    implements
        $ShareapiGetSharesResponseApplicationJsonInterface,
        Built<ShareapiGetSharesResponseApplicationJson, ShareapiGetSharesResponseApplicationJsonBuilder> {
  factory ShareapiGetSharesResponseApplicationJson([
    final void Function(ShareapiGetSharesResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiGetSharesResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiGetSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetSharesResponseApplicationJson> get serializer =>
      _$shareapiGetSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiCreateShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiCreateShareResponseApplicationJson_Ocs
    implements
        $ShareapiCreateShareResponseApplicationJson_OcsInterface,
        Built<ShareapiCreateShareResponseApplicationJson_Ocs, ShareapiCreateShareResponseApplicationJson_OcsBuilder> {
  factory ShareapiCreateShareResponseApplicationJson_Ocs([
    final void Function(ShareapiCreateShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiCreateShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiCreateShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiCreateShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiCreateShareResponseApplicationJson_Ocs> get serializer =>
      _$shareapiCreateShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiCreateShareResponseApplicationJsonInterface {
  ShareapiCreateShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiCreateShareResponseApplicationJson
    implements
        $ShareapiCreateShareResponseApplicationJsonInterface,
        Built<ShareapiCreateShareResponseApplicationJson, ShareapiCreateShareResponseApplicationJsonBuilder> {
  factory ShareapiCreateShareResponseApplicationJson([
    final void Function(ShareapiCreateShareResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiCreateShareResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiCreateShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiCreateShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiCreateShareResponseApplicationJson> get serializer =>
      _$shareapiCreateShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetInheritedSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiGetInheritedSharesResponseApplicationJson_Ocs
    implements
        $ShareapiGetInheritedSharesResponseApplicationJson_OcsInterface,
        Built<ShareapiGetInheritedSharesResponseApplicationJson_Ocs,
            ShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder> {
  factory ShareapiGetInheritedSharesResponseApplicationJson_Ocs([
    final void Function(ShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiGetInheritedSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiGetInheritedSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetInheritedSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetInheritedSharesResponseApplicationJson_Ocs> get serializer =>
      _$shareapiGetInheritedSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetInheritedSharesResponseApplicationJsonInterface {
  ShareapiGetInheritedSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetInheritedSharesResponseApplicationJson
    implements
        $ShareapiGetInheritedSharesResponseApplicationJsonInterface,
        Built<ShareapiGetInheritedSharesResponseApplicationJson,
            ShareapiGetInheritedSharesResponseApplicationJsonBuilder> {
  factory ShareapiGetInheritedSharesResponseApplicationJson([
    final void Function(ShareapiGetInheritedSharesResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiGetInheritedSharesResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiGetInheritedSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetInheritedSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetInheritedSharesResponseApplicationJson> get serializer =>
      _$shareapiGetInheritedSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiPendingSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiPendingSharesResponseApplicationJson_Ocs
    implements
        $ShareapiPendingSharesResponseApplicationJson_OcsInterface,
        Built<ShareapiPendingSharesResponseApplicationJson_Ocs,
            ShareapiPendingSharesResponseApplicationJson_OcsBuilder> {
  factory ShareapiPendingSharesResponseApplicationJson_Ocs([
    final void Function(ShareapiPendingSharesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiPendingSharesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiPendingSharesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiPendingSharesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiPendingSharesResponseApplicationJson_Ocs> get serializer =>
      _$shareapiPendingSharesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiPendingSharesResponseApplicationJsonInterface {
  ShareapiPendingSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiPendingSharesResponseApplicationJson
    implements
        $ShareapiPendingSharesResponseApplicationJsonInterface,
        Built<ShareapiPendingSharesResponseApplicationJson, ShareapiPendingSharesResponseApplicationJsonBuilder> {
  factory ShareapiPendingSharesResponseApplicationJson([
    final void Function(ShareapiPendingSharesResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiPendingSharesResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiPendingSharesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiPendingSharesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiPendingSharesResponseApplicationJson> get serializer =>
      _$shareapiPendingSharesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiGetShareResponseApplicationJson_Ocs
    implements
        $ShareapiGetShareResponseApplicationJson_OcsInterface,
        Built<ShareapiGetShareResponseApplicationJson_Ocs, ShareapiGetShareResponseApplicationJson_OcsBuilder> {
  factory ShareapiGetShareResponseApplicationJson_Ocs([
    final void Function(ShareapiGetShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiGetShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiGetShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetShareResponseApplicationJson_Ocs> get serializer =>
      _$shareapiGetShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiGetShareResponseApplicationJsonInterface {
  ShareapiGetShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetShareResponseApplicationJson
    implements
        $ShareapiGetShareResponseApplicationJsonInterface,
        Built<ShareapiGetShareResponseApplicationJson, ShareapiGetShareResponseApplicationJsonBuilder> {
  factory ShareapiGetShareResponseApplicationJson([
    final void Function(ShareapiGetShareResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiGetShareResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiGetShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiGetShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiGetShareResponseApplicationJson> get serializer =>
      _$shareapiGetShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiUpdateShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiUpdateShareResponseApplicationJson_Ocs
    implements
        $ShareapiUpdateShareResponseApplicationJson_OcsInterface,
        Built<ShareapiUpdateShareResponseApplicationJson_Ocs, ShareapiUpdateShareResponseApplicationJson_OcsBuilder> {
  factory ShareapiUpdateShareResponseApplicationJson_Ocs([
    final void Function(ShareapiUpdateShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiUpdateShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiUpdateShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiUpdateShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiUpdateShareResponseApplicationJson_Ocs> get serializer =>
      _$shareapiUpdateShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiUpdateShareResponseApplicationJsonInterface {
  ShareapiUpdateShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiUpdateShareResponseApplicationJson
    implements
        $ShareapiUpdateShareResponseApplicationJsonInterface,
        Built<ShareapiUpdateShareResponseApplicationJson, ShareapiUpdateShareResponseApplicationJsonBuilder> {
  factory ShareapiUpdateShareResponseApplicationJson([
    final void Function(ShareapiUpdateShareResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiUpdateShareResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiUpdateShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiUpdateShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiUpdateShareResponseApplicationJson> get serializer =>
      _$shareapiUpdateShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiDeleteShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ShareapiDeleteShareResponseApplicationJson_Ocs
    implements
        $ShareapiDeleteShareResponseApplicationJson_OcsInterface,
        Built<ShareapiDeleteShareResponseApplicationJson_Ocs, ShareapiDeleteShareResponseApplicationJson_OcsBuilder> {
  factory ShareapiDeleteShareResponseApplicationJson_Ocs([
    final void Function(ShareapiDeleteShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiDeleteShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiDeleteShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiDeleteShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiDeleteShareResponseApplicationJson_Ocs> get serializer =>
      _$shareapiDeleteShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiDeleteShareResponseApplicationJsonInterface {
  ShareapiDeleteShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiDeleteShareResponseApplicationJson
    implements
        $ShareapiDeleteShareResponseApplicationJsonInterface,
        Built<ShareapiDeleteShareResponseApplicationJson, ShareapiDeleteShareResponseApplicationJsonBuilder> {
  factory ShareapiDeleteShareResponseApplicationJson([
    final void Function(ShareapiDeleteShareResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiDeleteShareResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiDeleteShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiDeleteShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiDeleteShareResponseApplicationJson> get serializer =>
      _$shareapiDeleteShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiAcceptShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ShareapiAcceptShareResponseApplicationJson_Ocs
    implements
        $ShareapiAcceptShareResponseApplicationJson_OcsInterface,
        Built<ShareapiAcceptShareResponseApplicationJson_Ocs, ShareapiAcceptShareResponseApplicationJson_OcsBuilder> {
  factory ShareapiAcceptShareResponseApplicationJson_Ocs([
    final void Function(ShareapiAcceptShareResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareapiAcceptShareResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareapiAcceptShareResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiAcceptShareResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiAcceptShareResponseApplicationJson_Ocs> get serializer =>
      _$shareapiAcceptShareResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareapiAcceptShareResponseApplicationJsonInterface {
  ShareapiAcceptShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiAcceptShareResponseApplicationJson
    implements
        $ShareapiAcceptShareResponseApplicationJsonInterface,
        Built<ShareapiAcceptShareResponseApplicationJson, ShareapiAcceptShareResponseApplicationJsonBuilder> {
  factory ShareapiAcceptShareResponseApplicationJson([
    final void Function(ShareapiAcceptShareResponseApplicationJsonBuilder)? b,
  ]) = _$ShareapiAcceptShareResponseApplicationJson;

  // coverage:ignore-start
  const ShareapiAcceptShareResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareapiAcceptShareResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareapiAcceptShareResponseApplicationJson> get serializer =>
      _$shareapiAcceptShareResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesapiShareesapiSearchHeadersInterface {
  String? get link;
}

abstract class ShareesapiShareesapiSearchHeaders
    implements
        $ShareesapiShareesapiSearchHeadersInterface,
        Built<ShareesapiShareesapiSearchHeaders, ShareesapiShareesapiSearchHeadersBuilder> {
  factory ShareesapiShareesapiSearchHeaders([final void Function(ShareesapiShareesapiSearchHeadersBuilder)? b]) =
      _$ShareesapiShareesapiSearchHeaders;

  // coverage:ignore-start
  const ShareesapiShareesapiSearchHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiShareesapiSearchHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesapiShareesapiSearchHeaders> get serializer => _$shareesapiShareesapiSearchHeadersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeInterface {
  int? get count;
  String get label;
}

abstract class Sharee implements $ShareeInterface, Built<Sharee, ShareeBuilder> {
  factory Sharee([final void Function(ShareeBuilder)? b]) = _$Sharee;

  // coverage:ignore-start
  const Sharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Sharee.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Sharee> get serializer => _$shareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeValueInterface {
  int get shareType;
  String get shareWith;
}

abstract class ShareeValue implements $ShareeValueInterface, Built<ShareeValue, ShareeValueBuilder> {
  factory ShareeValue([final void Function(ShareeValueBuilder)? b]) = _$ShareeValue;

  // coverage:ignore-start
  const ShareeValue._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeValue.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeValue> get serializer => _$shareeValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeCircle_1_Value_1Interface {
  String get circle;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeCircle_1_ValueInterface
    implements $ShareeValueInterface, $ShareeCircle_1_Value_1Interface {}

abstract class ShareeCircle_1_Value
    implements $ShareeCircle_1_ValueInterface, Built<ShareeCircle_1_Value, ShareeCircle_1_ValueBuilder> {
  factory ShareeCircle_1_Value([final void Function(ShareeCircle_1_ValueBuilder)? b]) = _$ShareeCircle_1_Value;

  // coverage:ignore-start
  const ShareeCircle_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeCircle_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeCircle_1_Value> get serializer => _$shareeCircle1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeCircle_1Interface {
  String get shareWithDescription;
  ShareeCircle_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeCircleInterface implements $ShareeInterface, $ShareeCircle_1Interface {}

abstract class ShareeCircle implements $ShareeCircleInterface, Built<ShareeCircle, ShareeCircleBuilder> {
  factory ShareeCircle([final void Function(ShareeCircleBuilder)? b]) = _$ShareeCircle;

  // coverage:ignore-start
  const ShareeCircle._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeCircle.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeCircle> get serializer => _$shareeCircleSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeEmail_1Interface {
  String get uuid;
  String get name;
  String get type;
  String get shareWithDisplayNameUnique;
  ShareeValue get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeEmailInterface implements $ShareeInterface, $ShareeEmail_1Interface {}

abstract class ShareeEmail implements $ShareeEmailInterface, Built<ShareeEmail, ShareeEmailBuilder> {
  factory ShareeEmail([final void Function(ShareeEmailBuilder)? b]) = _$ShareeEmail;

  // coverage:ignore-start
  const ShareeEmail._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeEmail.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeEmail> get serializer => _$shareeEmailSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemoteGroup_1_Value_1Interface {
  String get server;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemoteGroup_1_ValueInterface
    implements $ShareeValueInterface, $ShareeRemoteGroup_1_Value_1Interface {}

abstract class ShareeRemoteGroup_1_Value
    implements $ShareeRemoteGroup_1_ValueInterface, Built<ShareeRemoteGroup_1_Value, ShareeRemoteGroup_1_ValueBuilder> {
  factory ShareeRemoteGroup_1_Value([final void Function(ShareeRemoteGroup_1_ValueBuilder)? b]) =
      _$ShareeRemoteGroup_1_Value;

  // coverage:ignore-start
  const ShareeRemoteGroup_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeRemoteGroup_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeRemoteGroup_1_Value> get serializer => _$shareeRemoteGroup1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemoteGroup_1Interface {
  String get guid;
  String get name;
  ShareeRemoteGroup_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemoteGroupInterface implements $ShareeInterface, $ShareeRemoteGroup_1Interface {}

abstract class ShareeRemoteGroup
    implements $ShareeRemoteGroupInterface, Built<ShareeRemoteGroup, ShareeRemoteGroupBuilder> {
  factory ShareeRemoteGroup([final void Function(ShareeRemoteGroupBuilder)? b]) = _$ShareeRemoteGroup;

  // coverage:ignore-start
  const ShareeRemoteGroup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeRemoteGroup.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeRemoteGroup> get serializer => _$shareeRemoteGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemote_1_Value_1Interface {
  String get server;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemote_1_ValueInterface
    implements $ShareeValueInterface, $ShareeRemote_1_Value_1Interface {}

abstract class ShareeRemote_1_Value
    implements $ShareeRemote_1_ValueInterface, Built<ShareeRemote_1_Value, ShareeRemote_1_ValueBuilder> {
  factory ShareeRemote_1_Value([final void Function(ShareeRemote_1_ValueBuilder)? b]) = _$ShareeRemote_1_Value;

  // coverage:ignore-start
  const ShareeRemote_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeRemote_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeRemote_1_Value> get serializer => _$shareeRemote1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemote_1Interface {
  String get uuid;
  String get name;
  String get type;
  ShareeRemote_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeRemoteInterface implements $ShareeInterface, $ShareeRemote_1Interface {}

abstract class ShareeRemote implements $ShareeRemoteInterface, Built<ShareeRemote, ShareeRemoteBuilder> {
  factory ShareeRemote([final void Function(ShareeRemoteBuilder)? b]) = _$ShareeRemote;

  // coverage:ignore-start
  const ShareeRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeRemote.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeRemote> get serializer => _$shareeRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeUser_1_StatusInterface {
  String get status;
  String get message;
  String get icon;
  int? get clearAt;
}

abstract class ShareeUser_1_Status
    implements $ShareeUser_1_StatusInterface, Built<ShareeUser_1_Status, ShareeUser_1_StatusBuilder> {
  factory ShareeUser_1_Status([final void Function(ShareeUser_1_StatusBuilder)? b]) = _$ShareeUser_1_Status;

  // coverage:ignore-start
  const ShareeUser_1_Status._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeUser_1_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeUser_1_Status> get serializer => _$shareeUser1StatusSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeUser_1Interface {
  String get subline;
  String get icon;
  String get shareWithDisplayNameUnique;
  ShareeUser_1_Status get status;
  ShareeValue get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeUserInterface implements $ShareeInterface, $ShareeUser_1Interface {}

abstract class ShareeUser implements $ShareeUserInterface, Built<ShareeUser, ShareeUserBuilder> {
  factory ShareeUser([final void Function(ShareeUserBuilder)? b]) = _$ShareeUser;

  // coverage:ignore-start
  const ShareeUser._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeUser.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeUser> get serializer => _$shareeUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesSearchResult_ExactInterface {
  BuiltList<ShareeCircle> get circles;
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<Sharee> get rooms;
  BuiltList<ShareeUser> get users;
}

abstract class ShareesSearchResult_Exact
    implements $ShareesSearchResult_ExactInterface, Built<ShareesSearchResult_Exact, ShareesSearchResult_ExactBuilder> {
  factory ShareesSearchResult_Exact([final void Function(ShareesSearchResult_ExactBuilder)? b]) =
      _$ShareesSearchResult_Exact;

  // coverage:ignore-start
  const ShareesSearchResult_Exact._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesSearchResult_Exact.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesSearchResult_Exact> get serializer => _$shareesSearchResultExactSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $LookupInterface {
  String get value;
  int get verified;
}

abstract class Lookup implements $LookupInterface, Built<Lookup, LookupBuilder> {
  factory Lookup([final void Function(LookupBuilder)? b]) = _$Lookup;

  // coverage:ignore-start
  const Lookup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Lookup.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Lookup> get serializer => _$lookupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeLookup_1_ExtraInterface {
  String get federationId;
  Lookup? get name;
  Lookup? get email;
  Lookup? get address;
  Lookup? get website;
  Lookup? get twitter;
  Lookup? get phone;
  @BuiltValueField(wireName: 'twitter_signature')
  Lookup? get twitterSignature;
  @BuiltValueField(wireName: 'website_signature')
  Lookup? get websiteSignature;
  Lookup? get userid;
}

abstract class ShareeLookup_1_Extra
    implements $ShareeLookup_1_ExtraInterface, Built<ShareeLookup_1_Extra, ShareeLookup_1_ExtraBuilder> {
  factory ShareeLookup_1_Extra([final void Function(ShareeLookup_1_ExtraBuilder)? b]) = _$ShareeLookup_1_Extra;

  // coverage:ignore-start
  const ShareeLookup_1_Extra._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeLookup_1_Extra.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeLookup_1_Extra> get serializer => _$shareeLookup1ExtraSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeLookup_1_Value_1Interface {
  bool get globalScale;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeLookup_1_ValueInterface
    implements $ShareeValueInterface, $ShareeLookup_1_Value_1Interface {}

abstract class ShareeLookup_1_Value
    implements $ShareeLookup_1_ValueInterface, Built<ShareeLookup_1_Value, ShareeLookup_1_ValueBuilder> {
  factory ShareeLookup_1_Value([final void Function(ShareeLookup_1_ValueBuilder)? b]) = _$ShareeLookup_1_Value;

  // coverage:ignore-start
  const ShareeLookup_1_Value._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeLookup_1_Value.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeLookup_1_Value> get serializer => _$shareeLookup1ValueSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeLookup_1Interface {
  ShareeLookup_1_Extra get extra;
  ShareeLookup_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareeLookupInterface implements $ShareeInterface, $ShareeLookup_1Interface {}

abstract class ShareeLookup implements $ShareeLookupInterface, Built<ShareeLookup, ShareeLookupBuilder> {
  factory ShareeLookup([final void Function(ShareeLookupBuilder)? b]) = _$ShareeLookup;

  // coverage:ignore-start
  const ShareeLookup._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareeLookup.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareeLookup> get serializer => _$shareeLookupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesSearchResultInterface {
  ShareesSearchResult_Exact get exact;
  BuiltList<ShareeCircle> get circles;
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  BuiltList<ShareeLookup> get lookup;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<Sharee> get rooms;
  BuiltList<ShareeUser> get users;
  bool get lookupEnabled;
}

abstract class ShareesSearchResult
    implements $ShareesSearchResultInterface, Built<ShareesSearchResult, ShareesSearchResultBuilder> {
  factory ShareesSearchResult([final void Function(ShareesSearchResultBuilder)? b]) = _$ShareesSearchResult;

  // coverage:ignore-start
  const ShareesSearchResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesSearchResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesSearchResult> get serializer => _$shareesSearchResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesapiSearchResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ShareesSearchResult get data;
}

abstract class ShareesapiSearchResponseApplicationJson_Ocs
    implements
        $ShareesapiSearchResponseApplicationJson_OcsInterface,
        Built<ShareesapiSearchResponseApplicationJson_Ocs, ShareesapiSearchResponseApplicationJson_OcsBuilder> {
  factory ShareesapiSearchResponseApplicationJson_Ocs([
    final void Function(ShareesapiSearchResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareesapiSearchResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareesapiSearchResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiSearchResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesapiSearchResponseApplicationJson_Ocs> get serializer =>
      _$shareesapiSearchResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesapiSearchResponseApplicationJsonInterface {
  ShareesapiSearchResponseApplicationJson_Ocs get ocs;
}

abstract class ShareesapiSearchResponseApplicationJson
    implements
        $ShareesapiSearchResponseApplicationJsonInterface,
        Built<ShareesapiSearchResponseApplicationJson, ShareesapiSearchResponseApplicationJsonBuilder> {
  factory ShareesapiSearchResponseApplicationJson([
    final void Function(ShareesapiSearchResponseApplicationJsonBuilder)? b,
  ]) = _$ShareesapiSearchResponseApplicationJson;

  // coverage:ignore-start
  const ShareesapiSearchResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiSearchResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesapiSearchResponseApplicationJson> get serializer =>
      _$shareesapiSearchResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesRecommendedResult_ExactInterface {
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<ShareeUser> get users;
}

abstract class ShareesRecommendedResult_Exact
    implements
        $ShareesRecommendedResult_ExactInterface,
        Built<ShareesRecommendedResult_Exact, ShareesRecommendedResult_ExactBuilder> {
  factory ShareesRecommendedResult_Exact([final void Function(ShareesRecommendedResult_ExactBuilder)? b]) =
      _$ShareesRecommendedResult_Exact;

  // coverage:ignore-start
  const ShareesRecommendedResult_Exact._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesRecommendedResult_Exact.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesRecommendedResult_Exact> get serializer => _$shareesRecommendedResultExactSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesRecommendedResultInterface {
  ShareesRecommendedResult_Exact get exact;
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<ShareeUser> get users;
}

abstract class ShareesRecommendedResult
    implements $ShareesRecommendedResultInterface, Built<ShareesRecommendedResult, ShareesRecommendedResultBuilder> {
  factory ShareesRecommendedResult([final void Function(ShareesRecommendedResultBuilder)? b]) =
      _$ShareesRecommendedResult;

  // coverage:ignore-start
  const ShareesRecommendedResult._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesRecommendedResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesRecommendedResult> get serializer => _$shareesRecommendedResultSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesapiFindRecommendedResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ShareesRecommendedResult get data;
}

abstract class ShareesapiFindRecommendedResponseApplicationJson_Ocs
    implements
        $ShareesapiFindRecommendedResponseApplicationJson_OcsInterface,
        Built<ShareesapiFindRecommendedResponseApplicationJson_Ocs,
            ShareesapiFindRecommendedResponseApplicationJson_OcsBuilder> {
  factory ShareesapiFindRecommendedResponseApplicationJson_Ocs([
    final void Function(ShareesapiFindRecommendedResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ShareesapiFindRecommendedResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ShareesapiFindRecommendedResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiFindRecommendedResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesapiFindRecommendedResponseApplicationJson_Ocs> get serializer =>
      _$shareesapiFindRecommendedResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ShareesapiFindRecommendedResponseApplicationJsonInterface {
  ShareesapiFindRecommendedResponseApplicationJson_Ocs get ocs;
}

abstract class ShareesapiFindRecommendedResponseApplicationJson
    implements
        $ShareesapiFindRecommendedResponseApplicationJsonInterface,
        Built<ShareesapiFindRecommendedResponseApplicationJson,
            ShareesapiFindRecommendedResponseApplicationJsonBuilder> {
  factory ShareesapiFindRecommendedResponseApplicationJson([
    final void Function(ShareesapiFindRecommendedResponseApplicationJsonBuilder)? b,
  ]) = _$ShareesapiFindRecommendedResponseApplicationJson;

  // coverage:ignore-start
  const ShareesapiFindRecommendedResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiFindRecommendedResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ShareesapiFindRecommendedResponseApplicationJson> get serializer =>
      _$shareesapiFindRecommendedResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
}

abstract class Capabilities_FilesSharing_Public_Password
    implements
        $Capabilities_FilesSharing_Public_PasswordInterface,
        Built<Capabilities_FilesSharing_Public_Password, Capabilities_FilesSharing_Public_PasswordBuilder> {
  factory Capabilities_FilesSharing_Public_Password([
    final void Function(Capabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Public_Password;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Public_Password._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Public_Password.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Public_Password> get serializer =>
      _$capabilitiesFilesSharingPublicPasswordSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Public_ExpireDateInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDate
    implements
        $Capabilities_FilesSharing_Public_ExpireDateInterface,
        Built<Capabilities_FilesSharing_Public_ExpireDate, Capabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory Capabilities_FilesSharing_Public_ExpireDate([
    final void Function(Capabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Public_ExpireDate;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Public_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Public_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$capabilitiesFilesSharingPublicExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Public_ExpireDateInternalInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDateInternal
    implements
        $Capabilities_FilesSharing_Public_ExpireDateInternalInterface,
        Built<Capabilities_FilesSharing_Public_ExpireDateInternal,
            Capabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory Capabilities_FilesSharing_Public_ExpireDateInternal([
    final void Function(Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Public_ExpireDateInternal;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Public_ExpireDateInternal._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      _$capabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Public_ExpireDateRemoteInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDateRemote
    implements
        $Capabilities_FilesSharing_Public_ExpireDateRemoteInterface,
        Built<Capabilities_FilesSharing_Public_ExpireDateRemote,
            Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory Capabilities_FilesSharing_Public_ExpireDateRemote([
    final void Function(Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Public_ExpireDateRemote;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Public_ExpireDateRemote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$capabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_PublicInterface {
  bool get enabled;
  Capabilities_FilesSharing_Public_Password? get password;
  @BuiltValueField(wireName: 'multiple_links')
  bool? get multipleLinks;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Public_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'expire_date_internal')
  Capabilities_FilesSharing_Public_ExpireDateInternal? get expireDateInternal;
  @BuiltValueField(wireName: 'expire_date_remote')
  Capabilities_FilesSharing_Public_ExpireDateRemote? get expireDateRemote;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  bool? get upload;
  @BuiltValueField(wireName: 'upload_files_drop')
  bool? get uploadFilesDrop;
}

abstract class Capabilities_FilesSharing_Public
    implements
        $Capabilities_FilesSharing_PublicInterface,
        Built<Capabilities_FilesSharing_Public, Capabilities_FilesSharing_PublicBuilder> {
  factory Capabilities_FilesSharing_Public([final void Function(Capabilities_FilesSharing_PublicBuilder)? b]) =
      _$Capabilities_FilesSharing_Public;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Public._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Public.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Public> get serializer => _$capabilitiesFilesSharingPublicSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_User_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_User_ExpireDate
    implements
        $Capabilities_FilesSharing_User_ExpireDateInterface,
        Built<Capabilities_FilesSharing_User_ExpireDate, Capabilities_FilesSharing_User_ExpireDateBuilder> {
  factory Capabilities_FilesSharing_User_ExpireDate([
    final void Function(Capabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$Capabilities_FilesSharing_User_ExpireDate;

  // coverage:ignore-start
  const Capabilities_FilesSharing_User_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_User_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$capabilitiesFilesSharingUserExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_UserInterface {
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_User_ExpireDate? get expireDate;
}

abstract class Capabilities_FilesSharing_User
    implements
        $Capabilities_FilesSharing_UserInterface,
        Built<Capabilities_FilesSharing_User, Capabilities_FilesSharing_UserBuilder> {
  factory Capabilities_FilesSharing_User([final void Function(Capabilities_FilesSharing_UserBuilder)? b]) =
      _$Capabilities_FilesSharing_User;

  // coverage:ignore-start
  const Capabilities_FilesSharing_User._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_User.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_User> get serializer => _$capabilitiesFilesSharingUserSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Group_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Group_ExpireDate
    implements
        $Capabilities_FilesSharing_Group_ExpireDateInterface,
        Built<Capabilities_FilesSharing_Group_ExpireDate, Capabilities_FilesSharing_Group_ExpireDateBuilder> {
  factory Capabilities_FilesSharing_Group_ExpireDate([
    final void Function(Capabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Group_ExpireDate;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Group_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Group_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$capabilitiesFilesSharingGroupExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_GroupInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Group_ExpireDate? get expireDate;
}

abstract class Capabilities_FilesSharing_Group
    implements
        $Capabilities_FilesSharing_GroupInterface,
        Built<Capabilities_FilesSharing_Group, Capabilities_FilesSharing_GroupBuilder> {
  factory Capabilities_FilesSharing_Group([final void Function(Capabilities_FilesSharing_GroupBuilder)? b]) =
      _$Capabilities_FilesSharing_Group;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Group._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Group.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Group> get serializer => _$capabilitiesFilesSharingGroupSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Federation_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Federation_ExpireDate
    implements
        $Capabilities_FilesSharing_Federation_ExpireDateInterface,
        Built<Capabilities_FilesSharing_Federation_ExpireDate, Capabilities_FilesSharing_Federation_ExpireDateBuilder> {
  factory Capabilities_FilesSharing_Federation_ExpireDate([
    final void Function(Capabilities_FilesSharing_Federation_ExpireDateBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Federation_ExpireDate;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Federation_ExpireDate._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Federation_ExpireDate.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$capabilitiesFilesSharingFederationExpireDateSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_Federation_ExpireDateSupportedInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        $Capabilities_FilesSharing_Federation_ExpireDateSupportedInterface,
        Built<Capabilities_FilesSharing_Federation_ExpireDateSupported,
            Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory Capabilities_FilesSharing_Federation_ExpireDateSupported([
    final void Function(Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)? b,
  ]) = _$Capabilities_FilesSharing_Federation_ExpireDateSupported;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Federation_ExpireDateSupported._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      _$capabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_FederationInterface {
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  Capabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
}

abstract class Capabilities_FilesSharing_Federation
    implements
        $Capabilities_FilesSharing_FederationInterface,
        Built<Capabilities_FilesSharing_Federation, Capabilities_FilesSharing_FederationBuilder> {
  factory Capabilities_FilesSharing_Federation([final void Function(Capabilities_FilesSharing_FederationBuilder)? b]) =
      _$Capabilities_FilesSharing_Federation;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Federation._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Federation.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Federation> get serializer =>
      _$capabilitiesFilesSharingFederationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharing_ShareeInterface {
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
}

abstract class Capabilities_FilesSharing_Sharee
    implements
        $Capabilities_FilesSharing_ShareeInterface,
        Built<Capabilities_FilesSharing_Sharee, Capabilities_FilesSharing_ShareeBuilder> {
  factory Capabilities_FilesSharing_Sharee([final void Function(Capabilities_FilesSharing_ShareeBuilder)? b]) =
      _$Capabilities_FilesSharing_Sharee;

  // coverage:ignore-start
  const Capabilities_FilesSharing_Sharee._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing_Sharee.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing_Sharee> get serializer => _$capabilitiesFilesSharingShareeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_FilesSharingInterface {
  @BuiltValueField(wireName: 'api_enabled')
  bool get apiEnabled;
  Capabilities_FilesSharing_Public get public;
  Capabilities_FilesSharing_User get user;
  bool get resharing;
  @BuiltValueField(wireName: 'group_sharing')
  bool? get groupSharing;
  Capabilities_FilesSharing_Group? get group;
  @BuiltValueField(wireName: 'default_permissions')
  int? get defaultPermissions;
  Capabilities_FilesSharing_Federation get federation;
  Capabilities_FilesSharing_Sharee get sharee;
}

abstract class Capabilities_FilesSharing
    implements $Capabilities_FilesSharingInterface, Built<Capabilities_FilesSharing, Capabilities_FilesSharingBuilder> {
  factory Capabilities_FilesSharing([final void Function(Capabilities_FilesSharingBuilder)? b]) =
      _$Capabilities_FilesSharing;

  // coverage:ignore-start
  const Capabilities_FilesSharing._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_FilesSharing> get serializer => _$capabilitiesFilesSharingSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities_FilesSharing get filesSharing;
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
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

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
}

typedef ShareesapiSearchShareType = ({BuiltList<int>? builtListInt, int? $int});

typedef ShareesapiFindRecommendedShareType = ({BuiltList<int>? builtListInt, int? $int});

typedef $BuiltListInt = ({BuiltList<int>? builtListInt, int? $int});

extension $BuiltListIntExtension on $BuiltListInt {
  List<dynamic> get _values => [builtListInt, $int];
  void validateOneOf() => dynamite_utils.validateOneOf(_values);
  void validateAnyOf() => dynamite_utils.validateAnyOf(_values);
  static Serializer<$BuiltListInt> get serializer => const _$BuiltListIntSerializer();
  static $BuiltListInt fromJson(final Object? json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Object? toJson() => _jsonSerializers.serializeWith(serializer, this);
}

class _$BuiltListIntSerializer implements PrimitiveSerializer<$BuiltListInt> {
  const _$BuiltListIntSerializer();

  @override
  Iterable<Type> get types => const [$BuiltListInt];

  @override
  String get wireName => r'$BuiltListInt';

  @override
  Object serialize(
    final Serializers serializers,
    final $BuiltListInt object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    dynamic value;
    value = object.builtListInt;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)]))!;
    }
    value = object.$int;
    if (value != null) {
      return _jsonSerializers.serialize(value, specifiedType: const FullType(int))!;
    }
// Should not be possible after validation.
    throw StateError('Tried to serialize without any value.');
  }

  @override
  $BuiltListInt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    BuiltList<int>? builtListInt;
    try {
      builtListInt = _jsonSerializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(int)]))!
          as BuiltList<int>;
    } catch (_) {}
    int? $int;
    try {
      $int = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
    } catch (_) {}
    return (builtListInt: builtListInt, $int: $int);
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DeletedShareapiListResponseApplicationJson),
        DeletedShareapiListResponseApplicationJsonBuilder.new,
      )
      ..add(DeletedShareapiListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DeletedShareapiListResponseApplicationJson_Ocs),
        DeletedShareapiListResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DeletedShareapiListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(DeletedShare), DeletedShareBuilder.new)
      ..add(DeletedShare.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(DeletedShare)]), ListBuilder<DeletedShare>.new)
      ..addBuilderFactory(
        const FullType(DeletedShareapiUndeleteResponseApplicationJson),
        DeletedShareapiUndeleteResponseApplicationJsonBuilder.new,
      )
      ..add(DeletedShareapiUndeleteResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DeletedShareapiUndeleteResponseApplicationJson_Ocs),
        DeletedShareapiUndeleteResponseApplicationJson_OcsBuilder.new,
      )
      ..add(DeletedShareapiUndeleteResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetSharesResponseApplicationJson),
        RemoteGetSharesResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetSharesResponseApplicationJson_Ocs),
        RemoteGetSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(RemoteShare), RemoteShareBuilder.new)
      ..add(RemoteShare.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(RemoteShare)]), ListBuilder<RemoteShare>.new)
      ..addBuilderFactory(
        const FullType(RemoteGetOpenSharesResponseApplicationJson),
        RemoteGetOpenSharesResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteGetOpenSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetOpenSharesResponseApplicationJson_Ocs),
        RemoteGetOpenSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteGetOpenSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteAcceptShareResponseApplicationJson),
        RemoteAcceptShareResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteAcceptShareResponseApplicationJson_Ocs),
        RemoteAcceptShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteAcceptShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteDeclineShareResponseApplicationJson),
        RemoteDeclineShareResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteDeclineShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteDeclineShareResponseApplicationJson_Ocs),
        RemoteDeclineShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteDeclineShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetShareResponseApplicationJson),
        RemoteGetShareResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetShareResponseApplicationJson_Ocs),
        RemoteGetShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteUnshareResponseApplicationJson),
        RemoteUnshareResponseApplicationJsonBuilder.new,
      )
      ..add(RemoteUnshareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteUnshareResponseApplicationJson_Ocs),
        RemoteUnshareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(RemoteUnshareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareInfo), ShareInfoBuilder.new)
      ..add(ShareInfo.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [
          FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        ]),
        ListBuilder<BuiltMap<String, JsonObject>>.new,
      )
      ..addBuilderFactory(
        const FullType(ShareapiGetSharesResponseApplicationJson),
        ShareapiGetSharesResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetSharesResponseApplicationJson_Ocs),
        ShareapiGetSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Share), ShareBuilder.new)
      ..add(Share.serializer)
      ..add(Share_ItemType.serializer)
      ..addBuilderFactory(const FullType(Share_Status), Share_StatusBuilder.new)
      ..add(Share_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Share)]), ListBuilder<Share>.new)
      ..addBuilderFactory(
        const FullType(ShareapiCreateShareResponseApplicationJson),
        ShareapiCreateShareResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiCreateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiCreateShareResponseApplicationJson_Ocs),
        ShareapiCreateShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiCreateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetInheritedSharesResponseApplicationJson),
        ShareapiGetInheritedSharesResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiGetInheritedSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetInheritedSharesResponseApplicationJson_Ocs),
        ShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiGetInheritedSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiPendingSharesResponseApplicationJson),
        ShareapiPendingSharesResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiPendingSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiPendingSharesResponseApplicationJson_Ocs),
        ShareapiPendingSharesResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiPendingSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetShareResponseApplicationJson),
        ShareapiGetShareResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetShareResponseApplicationJson_Ocs),
        ShareapiGetShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiUpdateShareResponseApplicationJson),
        ShareapiUpdateShareResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiUpdateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiUpdateShareResponseApplicationJson_Ocs),
        ShareapiUpdateShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiUpdateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiDeleteShareResponseApplicationJson),
        ShareapiDeleteShareResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiDeleteShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiDeleteShareResponseApplicationJson_Ocs),
        ShareapiDeleteShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiDeleteShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiAcceptShareResponseApplicationJson),
        ShareapiAcceptShareResponseApplicationJsonBuilder.new,
      )
      ..add(ShareapiAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiAcceptShareResponseApplicationJson_Ocs),
        ShareapiAcceptShareResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareapiAcceptShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..add($BuiltListIntExtension.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(ShareesapiSearchShareType)]),
        ContentStringBuilder<ShareesapiSearchShareType>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiShareesapiSearchHeaders),
        ShareesapiShareesapiSearchHeadersBuilder.new,
      )
      ..add(ShareesapiShareesapiSearchHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiSearchResponseApplicationJson),
        ShareesapiSearchResponseApplicationJsonBuilder.new,
      )
      ..add(ShareesapiSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiSearchResponseApplicationJson_Ocs),
        ShareesapiSearchResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareesapiSearchResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareesSearchResult), ShareesSearchResultBuilder.new)
      ..add(ShareesSearchResult.serializer)
      ..addBuilderFactory(const FullType(ShareesSearchResult_Exact), ShareesSearchResult_ExactBuilder.new)
      ..add(ShareesSearchResult_Exact.serializer)
      ..addBuilderFactory(const FullType(ShareeCircle), ShareeCircleBuilder.new)
      ..add(ShareeCircle.serializer)
      ..addBuilderFactory(const FullType(Sharee), ShareeBuilder.new)
      ..add(Sharee.serializer)
      ..addBuilderFactory(const FullType(ShareeCircle_1_Value), ShareeCircle_1_ValueBuilder.new)
      ..add(ShareeCircle_1_Value.serializer)
      ..addBuilderFactory(const FullType(ShareeValue), ShareeValueBuilder.new)
      ..add(ShareeValue.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeCircle)]), ListBuilder<ShareeCircle>.new)
      ..addBuilderFactory(const FullType(ShareeEmail), ShareeEmailBuilder.new)
      ..add(ShareeEmail.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeEmail)]), ListBuilder<ShareeEmail>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Sharee)]), ListBuilder<Sharee>.new)
      ..addBuilderFactory(const FullType(ShareeRemoteGroup), ShareeRemoteGroupBuilder.new)
      ..add(ShareeRemoteGroup.serializer)
      ..addBuilderFactory(const FullType(ShareeRemoteGroup_1_Value), ShareeRemoteGroup_1_ValueBuilder.new)
      ..add(ShareeRemoteGroup_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeRemoteGroup)]), ListBuilder<ShareeRemoteGroup>.new)
      ..addBuilderFactory(const FullType(ShareeRemote), ShareeRemoteBuilder.new)
      ..add(ShareeRemote.serializer)
      ..addBuilderFactory(const FullType(ShareeRemote_1_Value), ShareeRemote_1_ValueBuilder.new)
      ..add(ShareeRemote_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeRemote)]), ListBuilder<ShareeRemote>.new)
      ..addBuilderFactory(const FullType(ShareeUser), ShareeUserBuilder.new)
      ..add(ShareeUser.serializer)
      ..addBuilderFactory(const FullType(ShareeUser_1_Status), ShareeUser_1_StatusBuilder.new)
      ..add(ShareeUser_1_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeUser)]), ListBuilder<ShareeUser>.new)
      ..addBuilderFactory(const FullType(ShareeLookup), ShareeLookupBuilder.new)
      ..add(ShareeLookup.serializer)
      ..addBuilderFactory(const FullType(ShareeLookup_1_Extra), ShareeLookup_1_ExtraBuilder.new)
      ..add(ShareeLookup_1_Extra.serializer)
      ..addBuilderFactory(const FullType(Lookup), LookupBuilder.new)
      ..add(Lookup.serializer)
      ..addBuilderFactory(const FullType(ShareeLookup_1_Value), ShareeLookup_1_ValueBuilder.new)
      ..add(ShareeLookup_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeLookup)]), ListBuilder<ShareeLookup>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(ShareesapiFindRecommendedShareType)]),
        ContentStringBuilder<ShareesapiFindRecommendedShareType>.new,
      )
      ..addBuilderFactory(
        const FullType(ShareesapiFindRecommendedResponseApplicationJson),
        ShareesapiFindRecommendedResponseApplicationJsonBuilder.new,
      )
      ..add(ShareesapiFindRecommendedResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiFindRecommendedResponseApplicationJson_Ocs),
        ShareesapiFindRecommendedResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ShareesapiFindRecommendedResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareesRecommendedResult), ShareesRecommendedResultBuilder.new)
      ..add(ShareesRecommendedResult.serializer)
      ..addBuilderFactory(const FullType(ShareesRecommendedResult_Exact), ShareesRecommendedResult_ExactBuilder.new)
      ..add(ShareesRecommendedResult_Exact.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing), Capabilities_FilesSharingBuilder.new)
      ..add(Capabilities_FilesSharing.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Public), Capabilities_FilesSharing_PublicBuilder.new)
      ..add(Capabilities_FilesSharing_Public.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_Password),
        Capabilities_FilesSharing_Public_PasswordBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Public_Password.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDate),
        Capabilities_FilesSharing_Public_ExpireDateBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDateInternal),
        Capabilities_FilesSharing_Public_ExpireDateInternalBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDateRemote),
        Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_User), Capabilities_FilesSharing_UserBuilder.new)
      ..add(Capabilities_FilesSharing_User.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_User_ExpireDate),
        Capabilities_FilesSharing_User_ExpireDateBuilder.new,
      )
      ..add(Capabilities_FilesSharing_User_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Group), Capabilities_FilesSharing_GroupBuilder.new)
      ..add(Capabilities_FilesSharing_Group.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Group_ExpireDate),
        Capabilities_FilesSharing_Group_ExpireDateBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Group_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation),
        Capabilities_FilesSharing_FederationBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Federation.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation_ExpireDate),
        Capabilities_FilesSharing_Federation_ExpireDateBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation_ExpireDateSupported),
        Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder.new,
      )
      ..add(Capabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Sharee), Capabilities_FilesSharing_ShareeBuilder.new)
      ..add(Capabilities_FilesSharing_Sharee.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
