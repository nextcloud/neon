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
import 'package:dynamite_runtime/models.dart';
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
abstract interface class DeletedShareInterface {
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

abstract class DeletedShare implements DeletedShareInterface, Built<DeletedShare, DeletedShareBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletedShare> get serializer => const _$DeletedShareSerializer();
}

class _$DeletedShareSerializer implements StructuredSerializer<DeletedShare> {
  const _$DeletedShareSerializer();

  @override
  Iterable<Type> get types => const [DeletedShare, _$DeletedShare];

  @override
  String get wireName => 'DeletedShare';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeletedShare object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'share_type',
      serializers.serialize(object.shareType, specifiedType: const FullType(int)),
      'uid_owner',
      serializers.serialize(object.uidOwner, specifiedType: const FullType(String)),
      'displayname_owner',
      serializers.serialize(object.displaynameOwner, specifiedType: const FullType(String)),
      'permissions',
      serializers.serialize(object.permissions, specifiedType: const FullType(int)),
      'stime',
      serializers.serialize(object.stime, specifiedType: const FullType(int)),
      'uid_file_owner',
      serializers.serialize(object.uidFileOwner, specifiedType: const FullType(String)),
      'displayname_file_owner',
      serializers.serialize(object.displaynameFileOwner, specifiedType: const FullType(String)),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'item_type',
      serializers.serialize(object.itemType, specifiedType: const FullType(String)),
      'mimetype',
      serializers.serialize(object.mimetype, specifiedType: const FullType(String)),
      'storage',
      serializers.serialize(object.storage, specifiedType: const FullType(int)),
      'item_source',
      serializers.serialize(object.itemSource, specifiedType: const FullType(int)),
      'file_source',
      serializers.serialize(object.fileSource, specifiedType: const FullType(int)),
      'file_parent',
      serializers.serialize(object.fileParent, specifiedType: const FullType(int)),
      'file_target',
      serializers.serialize(object.fileTarget, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.expiration;
    if (value != null) {
      result
        ..add('expiration')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWith;
    if (value != null) {
      result
        ..add('share_with')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithDisplayname;
    if (value != null) {
      result
        ..add('share_with_displayname')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithLink;
    if (value != null) {
      result
        ..add('share_with_link')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  DeletedShare deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletedShareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_type':
          result.shareType = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'uid_owner':
          result.uidOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayname_owner':
          result.displaynameOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'stime':
          result.stime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'uid_file_owner':
          result.uidFileOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayname_file_owner':
          result.displaynameFileOwner =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'path':
          result.path = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'item_type':
          result.itemType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mimetype':
          result.mimetype = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'storage':
          result.storage = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'item_source':
          result.itemSource = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'file_source':
          result.fileSource = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'file_parent':
          result.fileParent = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'file_target':
          result.fileTarget = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'expiration':
          result.expiration = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with':
          result.shareWith = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_displayname':
          result.shareWithDisplayname =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_link':
          result.shareWithLink = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DeletedShareapiListResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<DeletedShare> get data;
}

abstract class DeletedShareapiListResponseApplicationJson_Ocs
    implements
        DeletedShareapiListResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletedShareapiListResponseApplicationJson_Ocs> get serializer =>
      const _$DeletedShareapiListResponseApplicationJson_OcsSerializer();
}

class _$DeletedShareapiListResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DeletedShareapiListResponseApplicationJson_Ocs> {
  const _$DeletedShareapiListResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DeletedShareapiListResponseApplicationJson_Ocs, _$DeletedShareapiListResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DeletedShareapiListResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeletedShareapiListResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(DeletedShare)])),
    ];
    return result;
  }

  @override
  DeletedShareapiListResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletedShareapiListResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(DeletedShare)]))!
                as BuiltList<DeletedShare>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DeletedShareapiListResponseApplicationJsonInterface {
  DeletedShareapiListResponseApplicationJson_Ocs get ocs;
}

abstract class DeletedShareapiListResponseApplicationJson
    implements
        DeletedShareapiListResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletedShareapiListResponseApplicationJson> get serializer =>
      const _$DeletedShareapiListResponseApplicationJsonSerializer();
}

class _$DeletedShareapiListResponseApplicationJsonSerializer
    implements StructuredSerializer<DeletedShareapiListResponseApplicationJson> {
  const _$DeletedShareapiListResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DeletedShareapiListResponseApplicationJson, _$DeletedShareapiListResponseApplicationJson];

  @override
  String get wireName => 'DeletedShareapiListResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeletedShareapiListResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(DeletedShareapiListResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  DeletedShareapiListResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletedShareapiListResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DeletedShareapiListResponseApplicationJson_Ocs),
            )! as DeletedShareapiListResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class DeletedShareapiUndeleteResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class DeletedShareapiUndeleteResponseApplicationJson_Ocs
    implements
        DeletedShareapiUndeleteResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletedShareapiUndeleteResponseApplicationJson_Ocs> get serializer =>
      const _$DeletedShareapiUndeleteResponseApplicationJson_OcsSerializer();
}

class _$DeletedShareapiUndeleteResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<DeletedShareapiUndeleteResponseApplicationJson_Ocs> {
  const _$DeletedShareapiUndeleteResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [DeletedShareapiUndeleteResponseApplicationJson_Ocs, _$DeletedShareapiUndeleteResponseApplicationJson_Ocs];

  @override
  String get wireName => 'DeletedShareapiUndeleteResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeletedShareapiUndeleteResponseApplicationJson_Ocs object, {
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
  DeletedShareapiUndeleteResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletedShareapiUndeleteResponseApplicationJson_OcsBuilder();

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
abstract interface class DeletedShareapiUndeleteResponseApplicationJsonInterface {
  DeletedShareapiUndeleteResponseApplicationJson_Ocs get ocs;
}

abstract class DeletedShareapiUndeleteResponseApplicationJson
    implements
        DeletedShareapiUndeleteResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletedShareapiUndeleteResponseApplicationJson> get serializer =>
      const _$DeletedShareapiUndeleteResponseApplicationJsonSerializer();
}

class _$DeletedShareapiUndeleteResponseApplicationJsonSerializer
    implements StructuredSerializer<DeletedShareapiUndeleteResponseApplicationJson> {
  const _$DeletedShareapiUndeleteResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [DeletedShareapiUndeleteResponseApplicationJson, _$DeletedShareapiUndeleteResponseApplicationJson];

  @override
  String get wireName => 'DeletedShareapiUndeleteResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final DeletedShareapiUndeleteResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(DeletedShareapiUndeleteResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  DeletedShareapiUndeleteResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeletedShareapiUndeleteResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(DeletedShareapiUndeleteResponseApplicationJson_Ocs),
            )! as DeletedShareapiUndeleteResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteShareInterface {
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

abstract class RemoteShare implements RemoteShareInterface, Built<RemoteShare, RemoteShareBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteShare> get serializer => const _$RemoteShareSerializer();
}

class _$RemoteShareSerializer implements StructuredSerializer<RemoteShare> {
  const _$RemoteShareSerializer();

  @override
  Iterable<Type> get types => const [RemoteShare, _$RemoteShare];

  @override
  String get wireName => 'RemoteShare';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteShare object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'accepted',
      serializers.serialize(object.accepted, specifiedType: const FullType(bool)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'mountpoint',
      serializers.serialize(object.mountpoint, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'owner',
      serializers.serialize(object.owner, specifiedType: const FullType(String)),
      'remote',
      serializers.serialize(object.remote, specifiedType: const FullType(String)),
      'remote_id',
      serializers.serialize(object.remoteId, specifiedType: const FullType(String)),
      'share_token',
      serializers.serialize(object.shareToken, specifiedType: const FullType(String)),
      'share_type',
      serializers.serialize(object.shareType, specifiedType: const FullType(int)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.fileId;
    if (value != null) {
      result
        ..add('file_id')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.mimetype;
    if (value != null) {
      result
        ..add('mimetype')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.mtime;
    if (value != null) {
      result
        ..add('mtime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.parent;
    if (value != null) {
      result
        ..add('parent')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.permissions;
    if (value != null) {
      result
        ..add('permissions')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  RemoteShare deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteShareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'accepted':
          result.accepted = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'file_id':
          result.fileId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mimetype':
          result.mimetype = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mountpoint':
          result.mountpoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mtime':
          result.mtime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'owner':
          result.owner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'parent':
          result.parent = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'remote':
          result.remote = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'remote_id':
          result.remoteId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_token':
          result.shareToken = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_type':
          result.shareType = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'user':
          result.user = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<RemoteShare> get data;
}

abstract class RemoteGetSharesResponseApplicationJson_Ocs
    implements
        RemoteGetSharesResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetSharesResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteGetSharesResponseApplicationJson_OcsSerializer();
}

class _$RemoteGetSharesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteGetSharesResponseApplicationJson_Ocs> {
  const _$RemoteGetSharesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteGetSharesResponseApplicationJson_Ocs, _$RemoteGetSharesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteGetSharesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetSharesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(RemoteShare)])),
    ];
    return result;
  }

  @override
  RemoteGetSharesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetSharesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(RemoteShare)]))!
                as BuiltList<RemoteShare>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetSharesResponseApplicationJsonInterface {
  RemoteGetSharesResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetSharesResponseApplicationJson
    implements
        RemoteGetSharesResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetSharesResponseApplicationJson> get serializer =>
      const _$RemoteGetSharesResponseApplicationJsonSerializer();
}

class _$RemoteGetSharesResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteGetSharesResponseApplicationJson> {
  const _$RemoteGetSharesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [RemoteGetSharesResponseApplicationJson, _$RemoteGetSharesResponseApplicationJson];

  @override
  String get wireName => 'RemoteGetSharesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetSharesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteGetSharesResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteGetSharesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetSharesResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(RemoteGetSharesResponseApplicationJson_Ocs))!
                as RemoteGetSharesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetOpenSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<RemoteShare> get data;
}

abstract class RemoteGetOpenSharesResponseApplicationJson_Ocs
    implements
        RemoteGetOpenSharesResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetOpenSharesResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteGetOpenSharesResponseApplicationJson_OcsSerializer();
}

class _$RemoteGetOpenSharesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteGetOpenSharesResponseApplicationJson_Ocs> {
  const _$RemoteGetOpenSharesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteGetOpenSharesResponseApplicationJson_Ocs, _$RemoteGetOpenSharesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteGetOpenSharesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetOpenSharesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(RemoteShare)])),
    ];
    return result;
  }

  @override
  RemoteGetOpenSharesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetOpenSharesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(RemoteShare)]))!
                as BuiltList<RemoteShare>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetOpenSharesResponseApplicationJsonInterface {
  RemoteGetOpenSharesResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetOpenSharesResponseApplicationJson
    implements
        RemoteGetOpenSharesResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetOpenSharesResponseApplicationJson> get serializer =>
      const _$RemoteGetOpenSharesResponseApplicationJsonSerializer();
}

class _$RemoteGetOpenSharesResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteGetOpenSharesResponseApplicationJson> {
  const _$RemoteGetOpenSharesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteGetOpenSharesResponseApplicationJson, _$RemoteGetOpenSharesResponseApplicationJson];

  @override
  String get wireName => 'RemoteGetOpenSharesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetOpenSharesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteGetOpenSharesResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteGetOpenSharesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetOpenSharesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(RemoteGetOpenSharesResponseApplicationJson_Ocs),
            )! as RemoteGetOpenSharesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteAcceptShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteAcceptShareResponseApplicationJson_Ocs
    implements
        RemoteAcceptShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteAcceptShareResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteAcceptShareResponseApplicationJson_OcsSerializer();
}

class _$RemoteAcceptShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteAcceptShareResponseApplicationJson_Ocs> {
  const _$RemoteAcceptShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteAcceptShareResponseApplicationJson_Ocs, _$RemoteAcceptShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteAcceptShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteAcceptShareResponseApplicationJson_Ocs object, {
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
  RemoteAcceptShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteAcceptShareResponseApplicationJson_OcsBuilder();

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
abstract interface class RemoteAcceptShareResponseApplicationJsonInterface {
  RemoteAcceptShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteAcceptShareResponseApplicationJson
    implements
        RemoteAcceptShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteAcceptShareResponseApplicationJson> get serializer =>
      const _$RemoteAcceptShareResponseApplicationJsonSerializer();
}

class _$RemoteAcceptShareResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteAcceptShareResponseApplicationJson> {
  const _$RemoteAcceptShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteAcceptShareResponseApplicationJson, _$RemoteAcceptShareResponseApplicationJson];

  @override
  String get wireName => 'RemoteAcceptShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteAcceptShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteAcceptShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteAcceptShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteAcceptShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(RemoteAcceptShareResponseApplicationJson_Ocs),
            )! as RemoteAcceptShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteDeclineShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteDeclineShareResponseApplicationJson_Ocs
    implements
        RemoteDeclineShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteDeclineShareResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteDeclineShareResponseApplicationJson_OcsSerializer();
}

class _$RemoteDeclineShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteDeclineShareResponseApplicationJson_Ocs> {
  const _$RemoteDeclineShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteDeclineShareResponseApplicationJson_Ocs, _$RemoteDeclineShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteDeclineShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteDeclineShareResponseApplicationJson_Ocs object, {
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
  RemoteDeclineShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteDeclineShareResponseApplicationJson_OcsBuilder();

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
abstract interface class RemoteDeclineShareResponseApplicationJsonInterface {
  RemoteDeclineShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteDeclineShareResponseApplicationJson
    implements
        RemoteDeclineShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteDeclineShareResponseApplicationJson> get serializer =>
      const _$RemoteDeclineShareResponseApplicationJsonSerializer();
}

class _$RemoteDeclineShareResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteDeclineShareResponseApplicationJson> {
  const _$RemoteDeclineShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteDeclineShareResponseApplicationJson, _$RemoteDeclineShareResponseApplicationJson];

  @override
  String get wireName => 'RemoteDeclineShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteDeclineShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteDeclineShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteDeclineShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteDeclineShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(RemoteDeclineShareResponseApplicationJson_Ocs),
            )! as RemoteDeclineShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  RemoteShare get data;
}

abstract class RemoteGetShareResponseApplicationJson_Ocs
    implements
        RemoteGetShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetShareResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteGetShareResponseApplicationJson_OcsSerializer();
}

class _$RemoteGetShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteGetShareResponseApplicationJson_Ocs> {
  const _$RemoteGetShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteGetShareResponseApplicationJson_Ocs, _$RemoteGetShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteGetShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetShareResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(RemoteShare)),
    ];
    return result;
  }

  @override
  RemoteGetShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetShareResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(RemoteShare))! as RemoteShare,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteGetShareResponseApplicationJsonInterface {
  RemoteGetShareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteGetShareResponseApplicationJson
    implements
        RemoteGetShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteGetShareResponseApplicationJson> get serializer =>
      const _$RemoteGetShareResponseApplicationJsonSerializer();
}

class _$RemoteGetShareResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteGetShareResponseApplicationJson> {
  const _$RemoteGetShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [RemoteGetShareResponseApplicationJson, _$RemoteGetShareResponseApplicationJson];

  @override
  String get wireName => 'RemoteGetShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteGetShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteGetShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteGetShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteGetShareResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(RemoteGetShareResponseApplicationJson_Ocs))!
                as RemoteGetShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class RemoteUnshareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class RemoteUnshareResponseApplicationJson_Ocs
    implements
        RemoteUnshareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteUnshareResponseApplicationJson_Ocs> get serializer =>
      const _$RemoteUnshareResponseApplicationJson_OcsSerializer();
}

class _$RemoteUnshareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<RemoteUnshareResponseApplicationJson_Ocs> {
  const _$RemoteUnshareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [RemoteUnshareResponseApplicationJson_Ocs, _$RemoteUnshareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'RemoteUnshareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteUnshareResponseApplicationJson_Ocs object, {
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
  RemoteUnshareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteUnshareResponseApplicationJson_OcsBuilder();

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
abstract interface class RemoteUnshareResponseApplicationJsonInterface {
  RemoteUnshareResponseApplicationJson_Ocs get ocs;
}

abstract class RemoteUnshareResponseApplicationJson
    implements
        RemoteUnshareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoteUnshareResponseApplicationJson> get serializer =>
      const _$RemoteUnshareResponseApplicationJsonSerializer();
}

class _$RemoteUnshareResponseApplicationJsonSerializer
    implements StructuredSerializer<RemoteUnshareResponseApplicationJson> {
  const _$RemoteUnshareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types => const [RemoteUnshareResponseApplicationJson, _$RemoteUnshareResponseApplicationJson];

  @override
  String get wireName => 'RemoteUnshareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final RemoteUnshareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(RemoteUnshareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  RemoteUnshareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoteUnshareResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(RemoteUnshareResponseApplicationJson_Ocs))!
                as RemoteUnshareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareInfo_SizeInterface {
  int? get $int;
  double? get $double;
}

abstract class ShareInfo_Size implements ShareInfo_SizeInterface, Built<ShareInfo_Size, ShareInfo_SizeBuilder> {
  factory ShareInfo_Size([final void Function(ShareInfo_SizeBuilder)? b]) = _$ShareInfo_Size;

  // coverage:ignore-start
  const ShareInfo_Size._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareInfo_Size.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareInfo_Size> get serializer => _$ShareInfo_SizeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ShareInfo_SizeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._$double].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', '$double' for ${b._data}");
    }
  }
}

class _$ShareInfo_SizeSerializer implements PrimitiveSerializer<ShareInfo_Size> {
  @override
  final Iterable<Type> types = const [ShareInfo_Size, _$ShareInfo_Size];

  @override
  final String wireName = 'ShareInfo_Size';

  @override
  Object serialize(
    final Serializers serializers,
    final ShareInfo_Size object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ShareInfo_Size deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareInfo_SizeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareInfoInterface {
  int get id;
  int get parentId;
  int get mtime;
  String get name;
  int get permissions;
  String get mimetype;
  ShareInfo_Size get size;
  String get type;
  String get etag;
  BuiltList<BuiltMap<String, JsonObject>>? get children;
}

abstract class ShareInfo implements ShareInfoInterface, Built<ShareInfo, ShareInfoBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareInfo> get serializer => const _$ShareInfoSerializer();
}

class _$ShareInfoSerializer implements StructuredSerializer<ShareInfo> {
  const _$ShareInfoSerializer();

  @override
  Iterable<Type> get types => const [ShareInfo, _$ShareInfo];

  @override
  String get wireName => 'ShareInfo';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareInfo object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'parentId',
      serializers.serialize(object.parentId, specifiedType: const FullType(int)),
      'mtime',
      serializers.serialize(object.mtime, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'permissions',
      serializers.serialize(object.permissions, specifiedType: const FullType(int)),
      'mimetype',
      serializers.serialize(object.mimetype, specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(ShareInfo_Size)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.children;
    if (value != null) {
      result
        ..add('children')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(BuiltList, [
              FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
            ]),
          ),
        );
    }

    return result;
  }

  @override
  ShareInfo deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'parentId':
          result.parentId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mtime':
          result.mtime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mimetype':
          result.mimetype = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'size':
          result.size.replace(
            serializers.deserialize(value, specifiedType: const FullType(ShareInfo_Size))! as ShareInfo_Size,
          );
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'children':
          result.children.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltList, [
                FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
              ]),
            )! as BuiltList<BuiltMap<String, JsonObject>>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Share_ItemSizeInterface {
  double? get $double;
  int? get $int;
}

abstract class Share_ItemSize implements Share_ItemSizeInterface, Built<Share_ItemSize, Share_ItemSizeBuilder> {
  factory Share_ItemSize([final void Function(Share_ItemSizeBuilder)? b]) = _$Share_ItemSize;

  // coverage:ignore-start
  const Share_ItemSize._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Share_ItemSize.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Share_ItemSize> get serializer => _$Share_ItemSizeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final Share_ItemSizeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$double, b._$int].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$double', '$int' for ${b._data}");
    }
  }
}

class _$Share_ItemSizeSerializer implements PrimitiveSerializer<Share_ItemSize> {
  @override
  final Iterable<Type> types = const [Share_ItemSize, _$Share_ItemSize];

  @override
  final String wireName = 'Share_ItemSize';

  @override
  Object serialize(
    final Serializers serializers,
    final Share_ItemSize object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  Share_ItemSize deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Share_ItemSizeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(double))! as double;
      result.$double = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    return result.build();
  }
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
abstract interface class Share_StatusInterface {
  int? get clearAt;
  String? get icon;
  String? get message;
  String? get status;
}

abstract class Share_Status implements Share_StatusInterface, Built<Share_Status, Share_StatusBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Share_Status> get serializer => const _$Share_StatusSerializer();
}

class _$Share_StatusSerializer implements StructuredSerializer<Share_Status> {
  const _$Share_StatusSerializer();

  @override
  Iterable<Type> get types => const [Share_Status, _$Share_Status];

  @override
  String get wireName => 'Share_Status';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Share_Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Share_Status deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Share_StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'clearAt':
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareInterface {
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
  Share_ItemSize get itemSize;
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

abstract class Share implements ShareInterface, Built<Share, ShareBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Share> get serializer => const _$ShareSerializer();
}

class _$ShareSerializer implements StructuredSerializer<Share> {
  const _$ShareSerializer();

  @override
  Iterable<Type> get types => const [Share, _$Share];

  @override
  String get wireName => 'Share';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Share object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'can_delete',
      serializers.serialize(object.canDelete, specifiedType: const FullType(bool)),
      'can_edit',
      serializers.serialize(object.canEdit, specifiedType: const FullType(bool)),
      'displayname_file_owner',
      serializers.serialize(object.displaynameFileOwner, specifiedType: const FullType(String)),
      'displayname_owner',
      serializers.serialize(object.displaynameOwner, specifiedType: const FullType(String)),
      'file_parent',
      serializers.serialize(object.fileParent, specifiedType: const FullType(int)),
      'file_source',
      serializers.serialize(object.fileSource, specifiedType: const FullType(int)),
      'file_target',
      serializers.serialize(object.fileTarget, specifiedType: const FullType(String)),
      'has_preview',
      serializers.serialize(object.hasPreview, specifiedType: const FullType(bool)),
      'hide_download',
      serializers.serialize(object.hideDownload, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'item_mtime',
      serializers.serialize(object.itemMtime, specifiedType: const FullType(int)),
      'item_size',
      serializers.serialize(object.itemSize, specifiedType: const FullType(Share_ItemSize)),
      'item_source',
      serializers.serialize(object.itemSource, specifiedType: const FullType(int)),
      'item_type',
      serializers.serialize(object.itemType, specifiedType: const FullType(Share_ItemType)),
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'mail_send',
      serializers.serialize(object.mailSend, specifiedType: const FullType(int)),
      'mimetype',
      serializers.serialize(object.mimetype, specifiedType: const FullType(String)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
      'permissions',
      serializers.serialize(object.permissions, specifiedType: const FullType(int)),
      'share_type',
      serializers.serialize(object.shareType, specifiedType: const FullType(int)),
      'stime',
      serializers.serialize(object.stime, specifiedType: const FullType(int)),
      'storage',
      serializers.serialize(object.storage, specifiedType: const FullType(int)),
      'storage_id',
      serializers.serialize(object.storageId, specifiedType: const FullType(String)),
      'uid_file_owner',
      serializers.serialize(object.uidFileOwner, specifiedType: const FullType(String)),
      'uid_owner',
      serializers.serialize(object.uidOwner, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.attributes;
    if (value != null) {
      result
        ..add('attributes')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.expiration;
    if (value != null) {
      result
        ..add('expiration')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemPermissions;
    if (value != null) {
      result
        ..add('item_permissions')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.parent;
    if (value != null) {
      result
        ..add('parent')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(JsonObject)),
        );
    }

    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.passwordExpirationTime;
    if (value != null) {
      result
        ..add('password_expiration_time')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.path;
    if (value != null) {
      result
        ..add('path')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.sendPasswordByTalk;
    if (value != null) {
      result
        ..add('send_password_by_talk')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.shareWith;
    if (value != null) {
      result
        ..add('share_with')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithAvatar;
    if (value != null) {
      result
        ..add('share_with_avatar')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithDisplayname;
    if (value != null) {
      result
        ..add('share_with_displayname')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithDisplaynameUnique;
    if (value != null) {
      result
        ..add('share_with_displayname_unique')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.shareWithLink;
    if (value != null) {
      result
        ..add('share_with_link')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Share_Status)),
        );
    }

    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Share deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'attributes':
          result.attributes = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'can_delete':
          result.canDelete = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'can_edit':
          result.canEdit = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'displayname_file_owner':
          result.displaynameFileOwner =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'displayname_owner':
          result.displaynameOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'expiration':
          result.expiration = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'file_parent':
          result.fileParent = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'file_source':
          result.fileSource = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'file_target':
          result.fileTarget = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'has_preview':
          result.hasPreview = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'hide_download':
          result.hideDownload = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'item_mtime':
          result.itemMtime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'item_permissions':
          result.itemPermissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'item_size':
          result.itemSize.replace(
            serializers.deserialize(value, specifiedType: const FullType(Share_ItemSize))! as Share_ItemSize,
          );
        case 'item_source':
          result.itemSource = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'item_type':
          result.itemType =
              serializers.deserialize(value, specifiedType: const FullType(Share_ItemType))! as Share_ItemType;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mail_send':
          result.mailSend = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'mimetype':
          result.mimetype = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'note':
          result.note = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'parent':
          result.parent = serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
        case 'password':
          result.password = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'password_expiration_time':
          result.passwordExpirationTime =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'path':
          result.path = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'permissions':
          result.permissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'send_password_by_talk':
          result.sendPasswordByTalk = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'share_type':
          result.shareType = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'share_with':
          result.shareWith = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_avatar':
          result.shareWithAvatar = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_displayname':
          result.shareWithDisplayname =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_displayname_unique':
          result.shareWithDisplaynameUnique =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'share_with_link':
          result.shareWithLink = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'status':
          result.status.replace(
            serializers.deserialize(value, specifiedType: const FullType(Share_Status))! as Share_Status,
          );
        case 'stime':
          result.stime = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'storage':
          result.storage = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'storage_id':
          result.storageId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'uid_file_owner':
          result.uidFileOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'uid_owner':
          result.uidOwner = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiGetSharesResponseApplicationJson_Ocs
    implements
        ShareapiGetSharesResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetSharesResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiGetSharesResponseApplicationJson_OcsSerializer();
}

class _$ShareapiGetSharesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiGetSharesResponseApplicationJson_Ocs> {
  const _$ShareapiGetSharesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiGetSharesResponseApplicationJson_Ocs, _$ShareapiGetSharesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiGetSharesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetSharesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Share)])),
    ];
    return result;
  }

  @override
  ShareapiGetSharesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetSharesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Share)]))!
                as BuiltList<Share>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetSharesResponseApplicationJsonInterface {
  ShareapiGetSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetSharesResponseApplicationJson
    implements
        ShareapiGetSharesResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetSharesResponseApplicationJson> get serializer =>
      const _$ShareapiGetSharesResponseApplicationJsonSerializer();
}

class _$ShareapiGetSharesResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiGetSharesResponseApplicationJson> {
  const _$ShareapiGetSharesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiGetSharesResponseApplicationJson, _$ShareapiGetSharesResponseApplicationJson];

  @override
  String get wireName => 'ShareapiGetSharesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetSharesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiGetSharesResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiGetSharesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetSharesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiGetSharesResponseApplicationJson_Ocs),
            )! as ShareapiGetSharesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiCreateShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiCreateShareResponseApplicationJson_Ocs
    implements
        ShareapiCreateShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiCreateShareResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiCreateShareResponseApplicationJson_OcsSerializer();
}

class _$ShareapiCreateShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiCreateShareResponseApplicationJson_Ocs> {
  const _$ShareapiCreateShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiCreateShareResponseApplicationJson_Ocs, _$ShareapiCreateShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiCreateShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiCreateShareResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Share)),
    ];
    return result;
  }

  @override
  ShareapiCreateShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiCreateShareResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Share))! as Share,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiCreateShareResponseApplicationJsonInterface {
  ShareapiCreateShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiCreateShareResponseApplicationJson
    implements
        ShareapiCreateShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiCreateShareResponseApplicationJson> get serializer =>
      const _$ShareapiCreateShareResponseApplicationJsonSerializer();
}

class _$ShareapiCreateShareResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiCreateShareResponseApplicationJson> {
  const _$ShareapiCreateShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiCreateShareResponseApplicationJson, _$ShareapiCreateShareResponseApplicationJson];

  @override
  String get wireName => 'ShareapiCreateShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiCreateShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiCreateShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiCreateShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiCreateShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiCreateShareResponseApplicationJson_Ocs),
            )! as ShareapiCreateShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetInheritedSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiGetInheritedSharesResponseApplicationJson_Ocs
    implements
        ShareapiGetInheritedSharesResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetInheritedSharesResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiGetInheritedSharesResponseApplicationJson_OcsSerializer();
}

class _$ShareapiGetInheritedSharesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiGetInheritedSharesResponseApplicationJson_Ocs> {
  const _$ShareapiGetInheritedSharesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        ShareapiGetInheritedSharesResponseApplicationJson_Ocs,
        _$ShareapiGetInheritedSharesResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'ShareapiGetInheritedSharesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetInheritedSharesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Share)])),
    ];
    return result;
  }

  @override
  ShareapiGetInheritedSharesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetInheritedSharesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Share)]))!
                as BuiltList<Share>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetInheritedSharesResponseApplicationJsonInterface {
  ShareapiGetInheritedSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetInheritedSharesResponseApplicationJson
    implements
        ShareapiGetInheritedSharesResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetInheritedSharesResponseApplicationJson> get serializer =>
      const _$ShareapiGetInheritedSharesResponseApplicationJsonSerializer();
}

class _$ShareapiGetInheritedSharesResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiGetInheritedSharesResponseApplicationJson> {
  const _$ShareapiGetInheritedSharesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiGetInheritedSharesResponseApplicationJson, _$ShareapiGetInheritedSharesResponseApplicationJson];

  @override
  String get wireName => 'ShareapiGetInheritedSharesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetInheritedSharesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ShareapiGetInheritedSharesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ShareapiGetInheritedSharesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetInheritedSharesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiGetInheritedSharesResponseApplicationJson_Ocs),
            )! as ShareapiGetInheritedSharesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiPendingSharesResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  BuiltList<Share> get data;
}

abstract class ShareapiPendingSharesResponseApplicationJson_Ocs
    implements
        ShareapiPendingSharesResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiPendingSharesResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiPendingSharesResponseApplicationJson_OcsSerializer();
}

class _$ShareapiPendingSharesResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiPendingSharesResponseApplicationJson_Ocs> {
  const _$ShareapiPendingSharesResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiPendingSharesResponseApplicationJson_Ocs, _$ShareapiPendingSharesResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiPendingSharesResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiPendingSharesResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(Share)])),
    ];
    return result;
  }

  @override
  ShareapiPendingSharesResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiPendingSharesResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Share)]))!
                as BuiltList<Share>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiPendingSharesResponseApplicationJsonInterface {
  ShareapiPendingSharesResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiPendingSharesResponseApplicationJson
    implements
        ShareapiPendingSharesResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiPendingSharesResponseApplicationJson> get serializer =>
      const _$ShareapiPendingSharesResponseApplicationJsonSerializer();
}

class _$ShareapiPendingSharesResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiPendingSharesResponseApplicationJson> {
  const _$ShareapiPendingSharesResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiPendingSharesResponseApplicationJson, _$ShareapiPendingSharesResponseApplicationJson];

  @override
  String get wireName => 'ShareapiPendingSharesResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiPendingSharesResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ShareapiPendingSharesResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ShareapiPendingSharesResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiPendingSharesResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiPendingSharesResponseApplicationJson_Ocs),
            )! as ShareapiPendingSharesResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiGetShareResponseApplicationJson_Ocs
    implements
        ShareapiGetShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetShareResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiGetShareResponseApplicationJson_OcsSerializer();
}

class _$ShareapiGetShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiGetShareResponseApplicationJson_Ocs> {
  const _$ShareapiGetShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiGetShareResponseApplicationJson_Ocs, _$ShareapiGetShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiGetShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetShareResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Share)),
    ];
    return result;
  }

  @override
  ShareapiGetShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetShareResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Share))! as Share,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiGetShareResponseApplicationJsonInterface {
  ShareapiGetShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiGetShareResponseApplicationJson
    implements
        ShareapiGetShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiGetShareResponseApplicationJson> get serializer =>
      const _$ShareapiGetShareResponseApplicationJsonSerializer();
}

class _$ShareapiGetShareResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiGetShareResponseApplicationJson> {
  const _$ShareapiGetShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiGetShareResponseApplicationJson, _$ShareapiGetShareResponseApplicationJson];

  @override
  String get wireName => 'ShareapiGetShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiGetShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiGetShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiGetShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiGetShareResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ShareapiGetShareResponseApplicationJson_Ocs))!
                as ShareapiGetShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiUpdateShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  Share get data;
}

abstract class ShareapiUpdateShareResponseApplicationJson_Ocs
    implements
        ShareapiUpdateShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiUpdateShareResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiUpdateShareResponseApplicationJson_OcsSerializer();
}

class _$ShareapiUpdateShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiUpdateShareResponseApplicationJson_Ocs> {
  const _$ShareapiUpdateShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiUpdateShareResponseApplicationJson_Ocs, _$ShareapiUpdateShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiUpdateShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiUpdateShareResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(Share)),
    ];
    return result;
  }

  @override
  ShareapiUpdateShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiUpdateShareResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(Share))! as Share,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiUpdateShareResponseApplicationJsonInterface {
  ShareapiUpdateShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiUpdateShareResponseApplicationJson
    implements
        ShareapiUpdateShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiUpdateShareResponseApplicationJson> get serializer =>
      const _$ShareapiUpdateShareResponseApplicationJsonSerializer();
}

class _$ShareapiUpdateShareResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiUpdateShareResponseApplicationJson> {
  const _$ShareapiUpdateShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiUpdateShareResponseApplicationJson, _$ShareapiUpdateShareResponseApplicationJson];

  @override
  String get wireName => 'ShareapiUpdateShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiUpdateShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiUpdateShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiUpdateShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiUpdateShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiUpdateShareResponseApplicationJson_Ocs),
            )! as ShareapiUpdateShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiDeleteShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ShareapiDeleteShareResponseApplicationJson_Ocs
    implements
        ShareapiDeleteShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiDeleteShareResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiDeleteShareResponseApplicationJson_OcsSerializer();
}

class _$ShareapiDeleteShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiDeleteShareResponseApplicationJson_Ocs> {
  const _$ShareapiDeleteShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiDeleteShareResponseApplicationJson_Ocs, _$ShareapiDeleteShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiDeleteShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiDeleteShareResponseApplicationJson_Ocs object, {
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
  ShareapiDeleteShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiDeleteShareResponseApplicationJson_OcsBuilder();

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
abstract interface class ShareapiDeleteShareResponseApplicationJsonInterface {
  ShareapiDeleteShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiDeleteShareResponseApplicationJson
    implements
        ShareapiDeleteShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiDeleteShareResponseApplicationJson> get serializer =>
      const _$ShareapiDeleteShareResponseApplicationJsonSerializer();
}

class _$ShareapiDeleteShareResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiDeleteShareResponseApplicationJson> {
  const _$ShareapiDeleteShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiDeleteShareResponseApplicationJson, _$ShareapiDeleteShareResponseApplicationJson];

  @override
  String get wireName => 'ShareapiDeleteShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiDeleteShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiDeleteShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiDeleteShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiDeleteShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiDeleteShareResponseApplicationJson_Ocs),
            )! as ShareapiDeleteShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareapiAcceptShareResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ShareapiAcceptShareResponseApplicationJson_Ocs
    implements
        ShareapiAcceptShareResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiAcceptShareResponseApplicationJson_Ocs> get serializer =>
      const _$ShareapiAcceptShareResponseApplicationJson_OcsSerializer();
}

class _$ShareapiAcceptShareResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareapiAcceptShareResponseApplicationJson_Ocs> {
  const _$ShareapiAcceptShareResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiAcceptShareResponseApplicationJson_Ocs, _$ShareapiAcceptShareResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareapiAcceptShareResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiAcceptShareResponseApplicationJson_Ocs object, {
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
  ShareapiAcceptShareResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiAcceptShareResponseApplicationJson_OcsBuilder();

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
abstract interface class ShareapiAcceptShareResponseApplicationJsonInterface {
  ShareapiAcceptShareResponseApplicationJson_Ocs get ocs;
}

abstract class ShareapiAcceptShareResponseApplicationJson
    implements
        ShareapiAcceptShareResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareapiAcceptShareResponseApplicationJson> get serializer =>
      const _$ShareapiAcceptShareResponseApplicationJsonSerializer();
}

class _$ShareapiAcceptShareResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareapiAcceptShareResponseApplicationJson> {
  const _$ShareapiAcceptShareResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareapiAcceptShareResponseApplicationJson, _$ShareapiAcceptShareResponseApplicationJson];

  @override
  String get wireName => 'ShareapiAcceptShareResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareapiAcceptShareResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareapiAcceptShareResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareapiAcceptShareResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareapiAcceptShareResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareapiAcceptShareResponseApplicationJson_Ocs),
            )! as ShareapiAcceptShareResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiSearchShareTypeInterface {
  int? get $int;
  BuiltList<int>? get builtListInt;
}

abstract class ShareesapiSearchShareType
    implements ShareesapiSearchShareTypeInterface, Built<ShareesapiSearchShareType, ShareesapiSearchShareTypeBuilder> {
  factory ShareesapiSearchShareType([final void Function(ShareesapiSearchShareTypeBuilder)? b]) =
      _$ShareesapiSearchShareType;

  // coverage:ignore-start
  const ShareesapiSearchShareType._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiSearchShareType.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiSearchShareType> get serializer => _$ShareesapiSearchShareTypeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ShareesapiSearchShareTypeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._builtListInt].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'builtListInt' for ${b._data}");
    }
  }
}

class _$ShareesapiSearchShareTypeSerializer implements PrimitiveSerializer<ShareesapiSearchShareType> {
  @override
  final Iterable<Type> types = const [ShareesapiSearchShareType, _$ShareesapiSearchShareType];

  @override
  final String wireName = 'ShareesapiSearchShareType';

  @override
  Object serialize(
    final Serializers serializers,
    final ShareesapiSearchShareType object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ShareesapiSearchShareType deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiSearchShareTypeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(int)]))!
          as BuiltList<int>;
      result.builtListInt.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiShareesapiSearchHeadersInterface {
  String? get link;
}

abstract class ShareesapiShareesapiSearchHeaders
    implements
        ShareesapiShareesapiSearchHeadersInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiShareesapiSearchHeaders> get serializer =>
      _$ShareesapiShareesapiSearchHeadersSerializer();
}

class _$ShareesapiShareesapiSearchHeadersSerializer implements StructuredSerializer<ShareesapiShareesapiSearchHeaders> {
  @override
  final Iterable<Type> types = const [ShareesapiShareesapiSearchHeaders, _$ShareesapiShareesapiSearchHeaders];

  @override
  final String wireName = 'ShareesapiShareesapiSearchHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesapiShareesapiSearchHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  ShareesapiShareesapiSearchHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiShareesapiSearchHeadersBuilder();

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
abstract interface class ShareeInterface {
  int? get count;
  String get label;
}

abstract class Sharee implements ShareeInterface, Built<Sharee, ShareeBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Sharee> get serializer => const _$ShareeSerializer();
}

class _$ShareeSerializer implements StructuredSerializer<Sharee> {
  const _$ShareeSerializer();

  @override
  Iterable<Type> get types => const [Sharee, _$Sharee];

  @override
  String get wireName => 'Sharee';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Sharee object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  Sharee deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareeValueInterface {
  int get shareType;
  String get shareWith;
}

abstract class ShareeValue implements ShareeValueInterface, Built<ShareeValue, ShareeValueBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareeValue> get serializer => const _$ShareeValueSerializer();
}

class _$ShareeValueSerializer implements StructuredSerializer<ShareeValue> {
  const _$ShareeValueSerializer();

  @override
  Iterable<Type> get types => const [ShareeValue, _$ShareeValue];

  @override
  String get wireName => 'ShareeValue';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareeValue object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'shareType',
      serializers.serialize(object.shareType, specifiedType: const FullType(int)),
      'shareWith',
      serializers.serialize(object.shareWith, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  ShareeValue deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareeValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'shareType':
          result.shareType = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'shareWith':
          result.shareWith = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareeCircle_1_Value_1Interface {
  String get circle;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeCircle_1_ValueInterface
    implements ShareeValueInterface, ShareeCircle_1_Value_1Interface {}

abstract class ShareeCircle_1_Value
    implements ShareeCircle_1_ValueInterface, Built<ShareeCircle_1_Value, ShareeCircle_1_ValueBuilder> {
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
abstract interface class ShareeCircle_1Interface {
  String get shareWithDescription;
  ShareeCircle_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeCircleInterface implements ShareeInterface, ShareeCircle_1Interface {}

abstract class ShareeCircle implements ShareeCircleInterface, Built<ShareeCircle, ShareeCircleBuilder> {
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
abstract interface class ShareeEmail_1Interface {
  String get uuid;
  String get name;
  String get type;
  String get shareWithDisplayNameUnique;
  ShareeValue get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeEmailInterface implements ShareeInterface, ShareeEmail_1Interface {}

abstract class ShareeEmail implements ShareeEmailInterface, Built<ShareeEmail, ShareeEmailBuilder> {
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
abstract interface class ShareeRemoteGroup_1_Value_1Interface {
  String get server;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeRemoteGroup_1_ValueInterface
    implements ShareeValueInterface, ShareeRemoteGroup_1_Value_1Interface {}

abstract class ShareeRemoteGroup_1_Value
    implements ShareeRemoteGroup_1_ValueInterface, Built<ShareeRemoteGroup_1_Value, ShareeRemoteGroup_1_ValueBuilder> {
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
abstract interface class ShareeRemoteGroup_1Interface {
  String get guid;
  String get name;
  ShareeRemoteGroup_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeRemoteGroupInterface implements ShareeInterface, ShareeRemoteGroup_1Interface {}

abstract class ShareeRemoteGroup
    implements ShareeRemoteGroupInterface, Built<ShareeRemoteGroup, ShareeRemoteGroupBuilder> {
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
abstract interface class ShareeRemote_1_Value_1Interface {
  String get server;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeRemote_1_ValueInterface
    implements ShareeValueInterface, ShareeRemote_1_Value_1Interface {}

abstract class ShareeRemote_1_Value
    implements ShareeRemote_1_ValueInterface, Built<ShareeRemote_1_Value, ShareeRemote_1_ValueBuilder> {
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
abstract interface class ShareeRemote_1Interface {
  String get uuid;
  String get name;
  String get type;
  ShareeRemote_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeRemoteInterface implements ShareeInterface, ShareeRemote_1Interface {}

abstract class ShareeRemote implements ShareeRemoteInterface, Built<ShareeRemote, ShareeRemoteBuilder> {
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
abstract interface class ShareeUser_1_StatusInterface {
  String get status;
  String get message;
  String get icon;
  int? get clearAt;
}

abstract class ShareeUser_1_Status
    implements ShareeUser_1_StatusInterface, Built<ShareeUser_1_Status, ShareeUser_1_StatusBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareeUser_1_Status> get serializer => const _$ShareeUser_1_StatusSerializer();
}

class _$ShareeUser_1_StatusSerializer implements StructuredSerializer<ShareeUser_1_Status> {
  const _$ShareeUser_1_StatusSerializer();

  @override
  Iterable<Type> get types => const [ShareeUser_1_Status, _$ShareeUser_1_Status];

  @override
  String get wireName => 'ShareeUser_1_Status';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareeUser_1_Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  ShareeUser_1_Status deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareeUser_1_StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'clearAt':
          result.clearAt = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareeUser_1Interface {
  String get subline;
  String get icon;
  String get shareWithDisplayNameUnique;
  ShareeUser_1_Status get status;
  ShareeValue get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeUserInterface implements ShareeInterface, ShareeUser_1Interface {}

abstract class ShareeUser implements ShareeUserInterface, Built<ShareeUser, ShareeUserBuilder> {
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
abstract interface class ShareesSearchResult_ExactInterface {
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
    implements ShareesSearchResult_ExactInterface, Built<ShareesSearchResult_Exact, ShareesSearchResult_ExactBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesSearchResult_Exact> get serializer => const _$ShareesSearchResult_ExactSerializer();
}

class _$ShareesSearchResult_ExactSerializer implements StructuredSerializer<ShareesSearchResult_Exact> {
  const _$ShareesSearchResult_ExactSerializer();

  @override
  Iterable<Type> get types => const [ShareesSearchResult_Exact, _$ShareesSearchResult_Exact];

  @override
  String get wireName => 'ShareesSearchResult_Exact';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesSearchResult_Exact object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'circles',
      serializers.serialize(object.circles, specifiedType: const FullType(BuiltList, [FullType(ShareeCircle)])),
      'emails',
      serializers.serialize(object.emails, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)])),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'remote_groups',
      serializers.serialize(
        object.remoteGroups,
        specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]),
      ),
      'remotes',
      serializers.serialize(object.remotes, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)])),
      'rooms',
      serializers.serialize(object.rooms, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)])),
    ];
    return result;
  }

  @override
  ShareesSearchResult_Exact deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesSearchResult_ExactBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'circles':
          result.circles.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeCircle)]))!
                as BuiltList<ShareeCircle>,
          );
        case 'emails':
          result.emails.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)]))!
                as BuiltList<ShareeEmail>,
          );
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'remote_groups':
          result.remoteGroups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]))!
                as BuiltList<ShareeRemoteGroup>,
          );
        case 'remotes':
          result.remotes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)]))!
                as BuiltList<ShareeRemote>,
          );
        case 'rooms':
          result.rooms.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)]))!
                as BuiltList<ShareeUser>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class LookupInterface {
  String get value;
  int get verified;
}

abstract class Lookup implements LookupInterface, Built<Lookup, LookupBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Lookup> get serializer => const _$LookupSerializer();
}

class _$LookupSerializer implements StructuredSerializer<Lookup> {
  const _$LookupSerializer();

  @override
  Iterable<Type> get types => const [Lookup, _$Lookup];

  @override
  String get wireName => 'Lookup';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Lookup object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(String)),
      'verified',
      serializers.serialize(object.verified, specifiedType: const FullType(int)),
    ];
    return result;
  }

  @override
  Lookup deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = LookupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'verified':
          result.verified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareeLookup_1_ExtraInterface {
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
    implements ShareeLookup_1_ExtraInterface, Built<ShareeLookup_1_Extra, ShareeLookup_1_ExtraBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareeLookup_1_Extra> get serializer => const _$ShareeLookup_1_ExtraSerializer();
}

class _$ShareeLookup_1_ExtraSerializer implements StructuredSerializer<ShareeLookup_1_Extra> {
  const _$ShareeLookup_1_ExtraSerializer();

  @override
  Iterable<Type> get types => const [ShareeLookup_1_Extra, _$ShareeLookup_1_Extra];

  @override
  String get wireName => 'ShareeLookup_1_Extra';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareeLookup_1_Extra object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'federationId',
      serializers.serialize(object.federationId, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.twitter;
    if (value != null) {
      result
        ..add('twitter')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.twitterSignature;
    if (value != null) {
      result
        ..add('twitter_signature')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.websiteSignature;
    if (value != null) {
      result
        ..add('website_signature')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    value = object.userid;
    if (value != null) {
      result
        ..add('userid')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Lookup)),
        );
    }

    return result;
  }

  @override
  ShareeLookup_1_Extra deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareeLookup_1_ExtraBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'federationId':
          result.federationId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'name':
          result.name.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'email':
          result.email.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'address':
          result.address.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'website':
          result.website.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'twitter':
          result.twitter.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'phone':
          result.phone.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'twitter_signature':
          result.twitterSignature.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'website_signature':
          result.websiteSignature.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
        case 'userid':
          result.userid.replace(
            serializers.deserialize(value, specifiedType: const FullType(Lookup))! as Lookup,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareeLookup_1_Value_1Interface {
  bool get globalScale;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeLookup_1_ValueInterface
    implements ShareeValueInterface, ShareeLookup_1_Value_1Interface {}

abstract class ShareeLookup_1_Value
    implements ShareeLookup_1_ValueInterface, Built<ShareeLookup_1_Value, ShareeLookup_1_ValueBuilder> {
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
abstract interface class ShareeLookup_1Interface {
  ShareeLookup_1_Extra get extra;
  ShareeLookup_1_Value get value;
}

@BuiltValue(instantiable: false)
abstract interface class ShareeLookupInterface implements ShareeInterface, ShareeLookup_1Interface {}

abstract class ShareeLookup implements ShareeLookupInterface, Built<ShareeLookup, ShareeLookupBuilder> {
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
abstract interface class ShareesSearchResultInterface {
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
    implements ShareesSearchResultInterface, Built<ShareesSearchResult, ShareesSearchResultBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesSearchResult> get serializer => const _$ShareesSearchResultSerializer();
}

class _$ShareesSearchResultSerializer implements StructuredSerializer<ShareesSearchResult> {
  const _$ShareesSearchResultSerializer();

  @override
  Iterable<Type> get types => const [ShareesSearchResult, _$ShareesSearchResult];

  @override
  String get wireName => 'ShareesSearchResult';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesSearchResult object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'exact',
      serializers.serialize(object.exact, specifiedType: const FullType(ShareesSearchResult_Exact)),
      'circles',
      serializers.serialize(object.circles, specifiedType: const FullType(BuiltList, [FullType(ShareeCircle)])),
      'emails',
      serializers.serialize(object.emails, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)])),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'lookup',
      serializers.serialize(object.lookup, specifiedType: const FullType(BuiltList, [FullType(ShareeLookup)])),
      'remote_groups',
      serializers.serialize(
        object.remoteGroups,
        specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]),
      ),
      'remotes',
      serializers.serialize(object.remotes, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)])),
      'rooms',
      serializers.serialize(object.rooms, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)])),
      'lookupEnabled',
      serializers.serialize(object.lookupEnabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  ShareesSearchResult deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesSearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'exact':
          result.exact.replace(
            serializers.deserialize(value, specifiedType: const FullType(ShareesSearchResult_Exact))!
                as ShareesSearchResult_Exact,
          );
        case 'circles':
          result.circles.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeCircle)]))!
                as BuiltList<ShareeCircle>,
          );
        case 'emails':
          result.emails.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)]))!
                as BuiltList<ShareeEmail>,
          );
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'lookup':
          result.lookup.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeLookup)]))!
                as BuiltList<ShareeLookup>,
          );
        case 'remote_groups':
          result.remoteGroups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]))!
                as BuiltList<ShareeRemoteGroup>,
          );
        case 'remotes':
          result.remotes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)]))!
                as BuiltList<ShareeRemote>,
          );
        case 'rooms':
          result.rooms.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)]))!
                as BuiltList<ShareeUser>,
          );
        case 'lookupEnabled':
          result.lookupEnabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiSearchResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ShareesSearchResult get data;
}

abstract class ShareesapiSearchResponseApplicationJson_Ocs
    implements
        ShareesapiSearchResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiSearchResponseApplicationJson_Ocs> get serializer =>
      const _$ShareesapiSearchResponseApplicationJson_OcsSerializer();
}

class _$ShareesapiSearchResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareesapiSearchResponseApplicationJson_Ocs> {
  const _$ShareesapiSearchResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareesapiSearchResponseApplicationJson_Ocs, _$ShareesapiSearchResponseApplicationJson_Ocs];

  @override
  String get wireName => 'ShareesapiSearchResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesapiSearchResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ShareesSearchResult)),
    ];
    return result;
  }

  @override
  ShareesapiSearchResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiSearchResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(ShareesSearchResult))! as ShareesSearchResult,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiSearchResponseApplicationJsonInterface {
  ShareesapiSearchResponseApplicationJson_Ocs get ocs;
}

abstract class ShareesapiSearchResponseApplicationJson
    implements
        ShareesapiSearchResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiSearchResponseApplicationJson> get serializer =>
      const _$ShareesapiSearchResponseApplicationJsonSerializer();
}

class _$ShareesapiSearchResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareesapiSearchResponseApplicationJson> {
  const _$ShareesapiSearchResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareesapiSearchResponseApplicationJson, _$ShareesapiSearchResponseApplicationJson];

  @override
  String get wireName => 'ShareesapiSearchResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesapiSearchResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(ShareesapiSearchResponseApplicationJson_Ocs)),
    ];
    return result;
  }

  @override
  ShareesapiSearchResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiSearchResponseApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(ShareesapiSearchResponseApplicationJson_Ocs))!
                as ShareesapiSearchResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiFindRecommendedShareTypeInterface {
  int? get $int;
  BuiltList<int>? get builtListInt;
}

abstract class ShareesapiFindRecommendedShareType
    implements
        ShareesapiFindRecommendedShareTypeInterface,
        Built<ShareesapiFindRecommendedShareType, ShareesapiFindRecommendedShareTypeBuilder> {
  factory ShareesapiFindRecommendedShareType([final void Function(ShareesapiFindRecommendedShareTypeBuilder)? b]) =
      _$ShareesapiFindRecommendedShareType;

  // coverage:ignore-start
  const ShareesapiFindRecommendedShareType._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ShareesapiFindRecommendedShareType.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiFindRecommendedShareType> get serializer =>
      _$ShareesapiFindRecommendedShareTypeSerializer();

  JsonObject get data;
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final ShareesapiFindRecommendedShareTypeBuilder b) {
    // When this is rebuild from another builder
    if (b._data == null) {
      return;
    }

    final match = [b._$int, b._builtListInt].singleWhereOrNull((final x) => x != null);
    if (match == null) {
      throw StateError("Need exactly one of '$int', 'builtListInt' for ${b._data}");
    }
  }
}

class _$ShareesapiFindRecommendedShareTypeSerializer
    implements PrimitiveSerializer<ShareesapiFindRecommendedShareType> {
  @override
  final Iterable<Type> types = const [ShareesapiFindRecommendedShareType, _$ShareesapiFindRecommendedShareType];

  @override
  final String wireName = 'ShareesapiFindRecommendedShareType';

  @override
  Object serialize(
    final Serializers serializers,
    final ShareesapiFindRecommendedShareType object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ShareesapiFindRecommendedShareType deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiFindRecommendedShareTypeBuilder()..data = JsonObject(data);
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(int))! as int;
      result.$int = value;
    } catch (_) {}
    try {
      final value = _jsonSerializers.deserialize(data, specifiedType: const FullType(BuiltList, [FullType(int)]))!
          as BuiltList<int>;
      result.builtListInt.replace(value);
    } catch (_) {}
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesRecommendedResult_ExactInterface {
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<ShareeUser> get users;
}

abstract class ShareesRecommendedResult_Exact
    implements
        ShareesRecommendedResult_ExactInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesRecommendedResult_Exact> get serializer =>
      const _$ShareesRecommendedResult_ExactSerializer();
}

class _$ShareesRecommendedResult_ExactSerializer implements StructuredSerializer<ShareesRecommendedResult_Exact> {
  const _$ShareesRecommendedResult_ExactSerializer();

  @override
  Iterable<Type> get types => const [ShareesRecommendedResult_Exact, _$ShareesRecommendedResult_Exact];

  @override
  String get wireName => 'ShareesRecommendedResult_Exact';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesRecommendedResult_Exact object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'emails',
      serializers.serialize(object.emails, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)])),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'remote_groups',
      serializers.serialize(
        object.remoteGroups,
        specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]),
      ),
      'remotes',
      serializers.serialize(object.remotes, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)])),
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)])),
    ];
    return result;
  }

  @override
  ShareesRecommendedResult_Exact deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesRecommendedResult_ExactBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'emails':
          result.emails.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)]))!
                as BuiltList<ShareeEmail>,
          );
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'remote_groups':
          result.remoteGroups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]))!
                as BuiltList<ShareeRemoteGroup>,
          );
        case 'remotes':
          result.remotes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)]))!
                as BuiltList<ShareeRemote>,
          );
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)]))!
                as BuiltList<ShareeUser>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesRecommendedResultInterface {
  ShareesRecommendedResult_Exact get exact;
  BuiltList<ShareeEmail> get emails;
  BuiltList<Sharee> get groups;
  @BuiltValueField(wireName: 'remote_groups')
  BuiltList<ShareeRemoteGroup> get remoteGroups;
  BuiltList<ShareeRemote> get remotes;
  BuiltList<ShareeUser> get users;
}

abstract class ShareesRecommendedResult
    implements ShareesRecommendedResultInterface, Built<ShareesRecommendedResult, ShareesRecommendedResultBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesRecommendedResult> get serializer => const _$ShareesRecommendedResultSerializer();
}

class _$ShareesRecommendedResultSerializer implements StructuredSerializer<ShareesRecommendedResult> {
  const _$ShareesRecommendedResultSerializer();

  @override
  Iterable<Type> get types => const [ShareesRecommendedResult, _$ShareesRecommendedResult];

  @override
  String get wireName => 'ShareesRecommendedResult';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesRecommendedResult object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'exact',
      serializers.serialize(object.exact, specifiedType: const FullType(ShareesRecommendedResult_Exact)),
      'emails',
      serializers.serialize(object.emails, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)])),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(Sharee)])),
      'remote_groups',
      serializers.serialize(
        object.remoteGroups,
        specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]),
      ),
      'remotes',
      serializers.serialize(object.remotes, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)])),
      'users',
      serializers.serialize(object.users, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)])),
    ];
    return result;
  }

  @override
  ShareesRecommendedResult deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesRecommendedResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'exact':
          result.exact.replace(
            serializers.deserialize(value, specifiedType: const FullType(ShareesRecommendedResult_Exact))!
                as ShareesRecommendedResult_Exact,
          );
        case 'emails':
          result.emails.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeEmail)]))!
                as BuiltList<ShareeEmail>,
          );
        case 'groups':
          result.groups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Sharee)]))!
                as BuiltList<Sharee>,
          );
        case 'remote_groups':
          result.remoteGroups.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemoteGroup)]))!
                as BuiltList<ShareeRemoteGroup>,
          );
        case 'remotes':
          result.remotes.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeRemote)]))!
                as BuiltList<ShareeRemote>,
          );
        case 'users':
          result.users.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(ShareeUser)]))!
                as BuiltList<ShareeUser>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiFindRecommendedResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ShareesRecommendedResult get data;
}

abstract class ShareesapiFindRecommendedResponseApplicationJson_Ocs
    implements
        ShareesapiFindRecommendedResponseApplicationJson_OcsInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiFindRecommendedResponseApplicationJson_Ocs> get serializer =>
      const _$ShareesapiFindRecommendedResponseApplicationJson_OcsSerializer();
}

class _$ShareesapiFindRecommendedResponseApplicationJson_OcsSerializer
    implements StructuredSerializer<ShareesapiFindRecommendedResponseApplicationJson_Ocs> {
  const _$ShareesapiFindRecommendedResponseApplicationJson_OcsSerializer();

  @override
  Iterable<Type> get types => const [
        ShareesapiFindRecommendedResponseApplicationJson_Ocs,
        _$ShareesapiFindRecommendedResponseApplicationJson_Ocs,
      ];

  @override
  String get wireName => 'ShareesapiFindRecommendedResponseApplicationJson_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesapiFindRecommendedResponseApplicationJson_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(ShareesRecommendedResult)),
    ];
    return result;
  }

  @override
  ShareesapiFindRecommendedResponseApplicationJson_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiFindRecommendedResponseApplicationJson_OcsBuilder();

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
            serializers.deserialize(value, specifiedType: const FullType(ShareesRecommendedResult))!
                as ShareesRecommendedResult,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ShareesapiFindRecommendedResponseApplicationJsonInterface {
  ShareesapiFindRecommendedResponseApplicationJson_Ocs get ocs;
}

abstract class ShareesapiFindRecommendedResponseApplicationJson
    implements
        ShareesapiFindRecommendedResponseApplicationJsonInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareesapiFindRecommendedResponseApplicationJson> get serializer =>
      const _$ShareesapiFindRecommendedResponseApplicationJsonSerializer();
}

class _$ShareesapiFindRecommendedResponseApplicationJsonSerializer
    implements StructuredSerializer<ShareesapiFindRecommendedResponseApplicationJson> {
  const _$ShareesapiFindRecommendedResponseApplicationJsonSerializer();

  @override
  Iterable<Type> get types =>
      const [ShareesapiFindRecommendedResponseApplicationJson, _$ShareesapiFindRecommendedResponseApplicationJson];

  @override
  String get wireName => 'ShareesapiFindRecommendedResponseApplicationJson';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ShareesapiFindRecommendedResponseApplicationJson object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(
        object.ocs,
        specifiedType: const FullType(ShareesapiFindRecommendedResponseApplicationJson_Ocs),
      ),
    ];
    return result;
  }

  @override
  ShareesapiFindRecommendedResponseApplicationJson deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ShareesapiFindRecommendedResponseApplicationJsonBuilder();

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
              specifiedType: const FullType(ShareesapiFindRecommendedResponseApplicationJson_Ocs),
            )! as ShareesapiFindRecommendedResponseApplicationJson_Ocs,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Public_PasswordInterface {
  bool get enforced;
  bool get askForOptionalPassword;
}

abstract class Capabilities_FilesSharing_Public_Password
    implements
        Capabilities_FilesSharing_Public_PasswordInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Public_Password> get serializer =>
      const _$Capabilities_FilesSharing_Public_PasswordSerializer();
}

class _$Capabilities_FilesSharing_Public_PasswordSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Public_Password> {
  const _$Capabilities_FilesSharing_Public_PasswordSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_Public_Password, _$Capabilities_FilesSharing_Public_Password];

  @override
  String get wireName => 'Capabilities_FilesSharing_Public_Password';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Public_Password object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enforced',
      serializers.serialize(object.enforced, specifiedType: const FullType(bool)),
      'askForOptionalPassword',
      serializers.serialize(object.askForOptionalPassword, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Public_Password deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Public_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'askForOptionalPassword':
          result.askForOptionalPassword = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Public_ExpireDateInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDate
    implements
        Capabilities_FilesSharing_Public_ExpireDateInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Public_ExpireDate> get serializer =>
      const _$Capabilities_FilesSharing_Public_ExpireDateSerializer();
}

class _$Capabilities_FilesSharing_Public_ExpireDateSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Public_ExpireDate> {
  const _$Capabilities_FilesSharing_Public_ExpireDateSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_Public_ExpireDate, _$Capabilities_FilesSharing_Public_ExpireDate];

  @override
  String get wireName => 'Capabilities_FilesSharing_Public_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Public_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_Public_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Public_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Public_ExpireDateInternalInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDateInternal
    implements
        Capabilities_FilesSharing_Public_ExpireDateInternalInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Public_ExpireDateInternal> get serializer =>
      const _$Capabilities_FilesSharing_Public_ExpireDateInternalSerializer();
}

class _$Capabilities_FilesSharing_Public_ExpireDateInternalSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Public_ExpireDateInternal> {
  const _$Capabilities_FilesSharing_Public_ExpireDateInternalSerializer();

  @override
  Iterable<Type> get types => const [
        Capabilities_FilesSharing_Public_ExpireDateInternal,
        _$Capabilities_FilesSharing_Public_ExpireDateInternal,
      ];

  @override
  String get wireName => 'Capabilities_FilesSharing_Public_ExpireDateInternal';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Public_ExpireDateInternal object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_Public_ExpireDateInternal deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Public_ExpireDateInternalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Public_ExpireDateRemoteInterface {
  bool get enabled;
  int? get days;
  bool? get enforced;
}

abstract class Capabilities_FilesSharing_Public_ExpireDateRemote
    implements
        Capabilities_FilesSharing_Public_ExpireDateRemoteInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      const _$Capabilities_FilesSharing_Public_ExpireDateRemoteSerializer();
}

class _$Capabilities_FilesSharing_Public_ExpireDateRemoteSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Public_ExpireDateRemote> {
  const _$Capabilities_FilesSharing_Public_ExpireDateRemoteSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_Public_ExpireDateRemote, _$Capabilities_FilesSharing_Public_ExpireDateRemote];

  @override
  String get wireName => 'Capabilities_FilesSharing_Public_ExpireDateRemote';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Public_ExpireDateRemote object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_Public_ExpireDateRemote deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'days':
          result.days = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_PublicInterface {
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
        Capabilities_FilesSharing_PublicInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Public> get serializer =>
      const _$Capabilities_FilesSharing_PublicSerializer();
}

class _$Capabilities_FilesSharing_PublicSerializer implements StructuredSerializer<Capabilities_FilesSharing_Public> {
  const _$Capabilities_FilesSharing_PublicSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing_Public, _$Capabilities_FilesSharing_Public];

  @override
  String get wireName => 'Capabilities_FilesSharing_Public';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Public object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Public_Password)),
        );
    }

    value = object.multipleLinks;
    if (value != null) {
      result
        ..add('multiple_links')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDate)),
        );
    }

    value = object.expireDateInternal;
    if (value != null) {
      result
        ..add('expire_date_internal')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDateInternal),
          ),
        );
    }

    value = object.expireDateRemote;
    if (value != null) {
      result
        ..add('expire_date_remote')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDateRemote),
          ),
        );
    }

    value = object.sendMail;
    if (value != null) {
      result
        ..add('send_mail')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.upload;
    if (value != null) {
      result
        ..add('upload')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.uploadFilesDrop;
    if (value != null) {
      result
        ..add('upload_files_drop')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_Public deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_PublicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'password':
          result.password.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Public_Password))!
                as Capabilities_FilesSharing_Public_Password,
          );
        case 'multiple_links':
          result.multipleLinks = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDate))!
                as Capabilities_FilesSharing_Public_ExpireDate,
          );
        case 'expire_date_internal':
          result.expireDateInternal.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDateInternal),
            )! as Capabilities_FilesSharing_Public_ExpireDateInternal,
          );
        case 'expire_date_remote':
          result.expireDateRemote.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities_FilesSharing_Public_ExpireDateRemote),
            )! as Capabilities_FilesSharing_Public_ExpireDateRemote,
          );
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload':
          result.upload = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'upload_files_drop':
          result.uploadFilesDrop = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_User_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_User_ExpireDate
    implements
        Capabilities_FilesSharing_User_ExpireDateInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_User_ExpireDate> get serializer =>
      const _$Capabilities_FilesSharing_User_ExpireDateSerializer();
}

class _$Capabilities_FilesSharing_User_ExpireDateSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_User_ExpireDate> {
  const _$Capabilities_FilesSharing_User_ExpireDateSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_User_ExpireDate, _$Capabilities_FilesSharing_User_ExpireDate];

  @override
  String get wireName => 'Capabilities_FilesSharing_User_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_User_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_User_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_User_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_UserInterface {
  @BuiltValueField(wireName: 'send_mail')
  bool get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_User_ExpireDate? get expireDate;
}

abstract class Capabilities_FilesSharing_User
    implements
        Capabilities_FilesSharing_UserInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_User> get serializer =>
      const _$Capabilities_FilesSharing_UserSerializer();
}

class _$Capabilities_FilesSharing_UserSerializer implements StructuredSerializer<Capabilities_FilesSharing_User> {
  const _$Capabilities_FilesSharing_UserSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing_User, _$Capabilities_FilesSharing_User];

  @override
  String get wireName => 'Capabilities_FilesSharing_User';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_User object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'send_mail',
      serializers.serialize(object.sendMail, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Capabilities_FilesSharing_User_ExpireDate)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_User deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_User_ExpireDate))!
                as Capabilities_FilesSharing_User_ExpireDate,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Group_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Group_ExpireDate
    implements
        Capabilities_FilesSharing_Group_ExpireDateInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Group_ExpireDate> get serializer =>
      const _$Capabilities_FilesSharing_Group_ExpireDateSerializer();
}

class _$Capabilities_FilesSharing_Group_ExpireDateSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Group_ExpireDate> {
  const _$Capabilities_FilesSharing_Group_ExpireDateSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_Group_ExpireDate, _$Capabilities_FilesSharing_Group_ExpireDate];

  @override
  String get wireName => 'Capabilities_FilesSharing_Group_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Group_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Group_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Group_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_GroupInterface {
  bool get enabled;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Group_ExpireDate? get expireDate;
}

abstract class Capabilities_FilesSharing_Group
    implements
        Capabilities_FilesSharing_GroupInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Group> get serializer =>
      const _$Capabilities_FilesSharing_GroupSerializer();
}

class _$Capabilities_FilesSharing_GroupSerializer implements StructuredSerializer<Capabilities_FilesSharing_Group> {
  const _$Capabilities_FilesSharing_GroupSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing_Group, _$Capabilities_FilesSharing_Group];

  @override
  String get wireName => 'Capabilities_FilesSharing_Group';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Group object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Group_ExpireDate)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing_Group deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Group_ExpireDate))!
                as Capabilities_FilesSharing_Group_ExpireDate,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Federation_ExpireDateInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Federation_ExpireDate
    implements
        Capabilities_FilesSharing_Federation_ExpireDateInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      const _$Capabilities_FilesSharing_Federation_ExpireDateSerializer();
}

class _$Capabilities_FilesSharing_Federation_ExpireDateSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Federation_ExpireDate> {
  const _$Capabilities_FilesSharing_Federation_ExpireDateSerializer();

  @override
  Iterable<Type> get types =>
      const [Capabilities_FilesSharing_Federation_ExpireDate, _$Capabilities_FilesSharing_Federation_ExpireDate];

  @override
  String get wireName => 'Capabilities_FilesSharing_Federation_ExpireDate';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Federation_ExpireDate object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Federation_ExpireDate deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Federation_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_Federation_ExpireDateSupportedInterface {
  bool get enabled;
}

abstract class Capabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        Capabilities_FilesSharing_Federation_ExpireDateSupportedInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Federation_ExpireDateSupported> get serializer =>
      const _$Capabilities_FilesSharing_Federation_ExpireDateSupportedSerializer();
}

class _$Capabilities_FilesSharing_Federation_ExpireDateSupportedSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Federation_ExpireDateSupported> {
  const _$Capabilities_FilesSharing_Federation_ExpireDateSupportedSerializer();

  @override
  Iterable<Type> get types => const [
        Capabilities_FilesSharing_Federation_ExpireDateSupported,
        _$Capabilities_FilesSharing_Federation_ExpireDateSupported,
      ];

  @override
  String get wireName => 'Capabilities_FilesSharing_Federation_ExpireDateSupported';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Federation_ExpireDateSupported object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'enabled',
      serializers.serialize(object.enabled, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Federation_ExpireDateSupported deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_FederationInterface {
  bool get outgoing;
  bool get incoming;
  @BuiltValueField(wireName: 'expire_date')
  Capabilities_FilesSharing_Federation_ExpireDate get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  Capabilities_FilesSharing_Federation_ExpireDateSupported get expireDateSupported;
}

abstract class Capabilities_FilesSharing_Federation
    implements
        Capabilities_FilesSharing_FederationInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Federation> get serializer =>
      const _$Capabilities_FilesSharing_FederationSerializer();
}

class _$Capabilities_FilesSharing_FederationSerializer
    implements StructuredSerializer<Capabilities_FilesSharing_Federation> {
  const _$Capabilities_FilesSharing_FederationSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing_Federation, _$Capabilities_FilesSharing_Federation];

  @override
  String get wireName => 'Capabilities_FilesSharing_Federation';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Federation object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'outgoing',
      serializers.serialize(object.outgoing, specifiedType: const FullType(bool)),
      'incoming',
      serializers.serialize(object.incoming, specifiedType: const FullType(bool)),
      'expire_date',
      serializers.serialize(
        object.expireDate,
        specifiedType: const FullType(Capabilities_FilesSharing_Federation_ExpireDate),
      ),
      'expire_date_supported',
      serializers.serialize(
        object.expireDateSupported,
        specifiedType: const FullType(Capabilities_FilesSharing_Federation_ExpireDateSupported),
      ),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Federation deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_FederationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'outgoing':
          result.outgoing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'incoming':
          result.incoming = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'expire_date':
          result.expireDate.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities_FilesSharing_Federation_ExpireDate),
            )! as Capabilities_FilesSharing_Federation_ExpireDate,
          );
        case 'expire_date_supported':
          result.expireDateSupported.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(Capabilities_FilesSharing_Federation_ExpireDateSupported),
            )! as Capabilities_FilesSharing_Federation_ExpireDateSupported,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharing_ShareeInterface {
  @BuiltValueField(wireName: 'query_lookup_default')
  bool get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool get alwaysShowUnique;
}

abstract class Capabilities_FilesSharing_Sharee
    implements
        Capabilities_FilesSharing_ShareeInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing_Sharee> get serializer =>
      const _$Capabilities_FilesSharing_ShareeSerializer();
}

class _$Capabilities_FilesSharing_ShareeSerializer implements StructuredSerializer<Capabilities_FilesSharing_Sharee> {
  const _$Capabilities_FilesSharing_ShareeSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing_Sharee, _$Capabilities_FilesSharing_Sharee];

  @override
  String get wireName => 'Capabilities_FilesSharing_Sharee';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing_Sharee object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'query_lookup_default',
      serializers.serialize(object.queryLookupDefault, specifiedType: const FullType(bool)),
      'always_show_unique',
      serializers.serialize(object.alwaysShowUnique, specifiedType: const FullType(bool)),
    ];
    return result;
  }

  @override
  Capabilities_FilesSharing_Sharee deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharing_ShareeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'query_lookup_default':
          result.queryLookupDefault = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'always_show_unique':
          result.alwaysShowUnique = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_FilesSharingInterface {
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
    implements Capabilities_FilesSharingInterface, Built<Capabilities_FilesSharing, Capabilities_FilesSharingBuilder> {
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

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_FilesSharing> get serializer => const _$Capabilities_FilesSharingSerializer();
}

class _$Capabilities_FilesSharingSerializer implements StructuredSerializer<Capabilities_FilesSharing> {
  const _$Capabilities_FilesSharingSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_FilesSharing, _$Capabilities_FilesSharing];

  @override
  String get wireName => 'Capabilities_FilesSharing';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_FilesSharing object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'api_enabled',
      serializers.serialize(object.apiEnabled, specifiedType: const FullType(bool)),
      'public',
      serializers.serialize(object.public, specifiedType: const FullType(Capabilities_FilesSharing_Public)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(Capabilities_FilesSharing_User)),
      'resharing',
      serializers.serialize(object.resharing, specifiedType: const FullType(bool)),
      'federation',
      serializers.serialize(object.federation, specifiedType: const FullType(Capabilities_FilesSharing_Federation)),
      'sharee',
      serializers.serialize(object.sharee, specifiedType: const FullType(Capabilities_FilesSharing_Sharee)),
    ];
    Object? value;
    value = object.groupSharing;
    if (value != null) {
      result
        ..add('group_sharing')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(bool)),
        );
    }

    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Group)),
        );
    }

    value = object.defaultPermissions;
    if (value != null) {
      result
        ..add('default_permissions')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  Capabilities_FilesSharing deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'api_enabled':
          result.apiEnabled = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'public':
          result.public.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Public))!
                as Capabilities_FilesSharing_Public,
          );
        case 'user':
          result.user.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_User))!
                as Capabilities_FilesSharing_User,
          );
        case 'resharing':
          result.resharing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'group_sharing':
          result.groupSharing = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'group':
          result.group.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Group))!
                as Capabilities_FilesSharing_Group,
          );
        case 'default_permissions':
          result.defaultPermissions = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'federation':
          result.federation.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Federation))!
                as Capabilities_FilesSharing_Federation,
          );
        case 'sharee':
          result.sharee.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing_Sharee))!
                as Capabilities_FilesSharing_Sharee,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  @BuiltValueField(wireName: 'files_sharing')
  Capabilities_FilesSharing get filesSharing;
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
      'files_sharing',
      serializers.serialize(object.filesSharing, specifiedType: const FullType(Capabilities_FilesSharing)),
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
        case 'files_sharing':
          result.filesSharing.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_FilesSharing))!
                as Capabilities_FilesSharing,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(DeletedShareapiListResponseApplicationJson),
        DeletedShareapiListResponseApplicationJson.new,
      )
      ..add(DeletedShareapiListResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DeletedShareapiListResponseApplicationJson_Ocs),
        DeletedShareapiListResponseApplicationJson_Ocs.new,
      )
      ..add(DeletedShareapiListResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(DeletedShare), DeletedShare.new)
      ..add(DeletedShare.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(DeletedShare)]), ListBuilder<DeletedShare>.new)
      ..addBuilderFactory(
        const FullType(DeletedShareapiUndeleteResponseApplicationJson),
        DeletedShareapiUndeleteResponseApplicationJson.new,
      )
      ..add(DeletedShareapiUndeleteResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(DeletedShareapiUndeleteResponseApplicationJson_Ocs),
        DeletedShareapiUndeleteResponseApplicationJson_Ocs.new,
      )
      ..add(DeletedShareapiUndeleteResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetSharesResponseApplicationJson),
        RemoteGetSharesResponseApplicationJson.new,
      )
      ..add(RemoteGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetSharesResponseApplicationJson_Ocs),
        RemoteGetSharesResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(RemoteShare), RemoteShare.new)
      ..add(RemoteShare.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(RemoteShare)]), ListBuilder<RemoteShare>.new)
      ..addBuilderFactory(
        const FullType(RemoteGetOpenSharesResponseApplicationJson),
        RemoteGetOpenSharesResponseApplicationJson.new,
      )
      ..add(RemoteGetOpenSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetOpenSharesResponseApplicationJson_Ocs),
        RemoteGetOpenSharesResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteGetOpenSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteAcceptShareResponseApplicationJson),
        RemoteAcceptShareResponseApplicationJson.new,
      )
      ..add(RemoteAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteAcceptShareResponseApplicationJson_Ocs),
        RemoteAcceptShareResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteAcceptShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteDeclineShareResponseApplicationJson),
        RemoteDeclineShareResponseApplicationJson.new,
      )
      ..add(RemoteDeclineShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteDeclineShareResponseApplicationJson_Ocs),
        RemoteDeclineShareResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteDeclineShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetShareResponseApplicationJson),
        RemoteGetShareResponseApplicationJson.new,
      )
      ..add(RemoteGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteGetShareResponseApplicationJson_Ocs),
        RemoteGetShareResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(RemoteUnshareResponseApplicationJson),
        RemoteUnshareResponseApplicationJson.new,
      )
      ..add(RemoteUnshareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(RemoteUnshareResponseApplicationJson_Ocs),
        RemoteUnshareResponseApplicationJson_Ocs.new,
      )
      ..add(RemoteUnshareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareInfo), ShareInfo.new)
      ..add(ShareInfo.serializer)
      ..addBuilderFactory(const FullType(ShareInfo_Size), ShareInfo_Size.new)
      ..add(ShareInfo_Size.serializer)
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
        ShareapiGetSharesResponseApplicationJson.new,
      )
      ..add(ShareapiGetSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetSharesResponseApplicationJson_Ocs),
        ShareapiGetSharesResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiGetSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(Share), Share.new)
      ..add(Share.serializer)
      ..addBuilderFactory(const FullType(Share_ItemSize), Share_ItemSize.new)
      ..add(Share_ItemSize.serializer)
      ..add(Share_ItemType.serializer)
      ..addBuilderFactory(const FullType(Share_Status), Share_Status.new)
      ..add(Share_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Share)]), ListBuilder<Share>.new)
      ..addBuilderFactory(
        const FullType(ShareapiCreateShareResponseApplicationJson),
        ShareapiCreateShareResponseApplicationJson.new,
      )
      ..add(ShareapiCreateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiCreateShareResponseApplicationJson_Ocs),
        ShareapiCreateShareResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiCreateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetInheritedSharesResponseApplicationJson),
        ShareapiGetInheritedSharesResponseApplicationJson.new,
      )
      ..add(ShareapiGetInheritedSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetInheritedSharesResponseApplicationJson_Ocs),
        ShareapiGetInheritedSharesResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiGetInheritedSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiPendingSharesResponseApplicationJson),
        ShareapiPendingSharesResponseApplicationJson.new,
      )
      ..add(ShareapiPendingSharesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiPendingSharesResponseApplicationJson_Ocs),
        ShareapiPendingSharesResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiPendingSharesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetShareResponseApplicationJson),
        ShareapiGetShareResponseApplicationJson.new,
      )
      ..add(ShareapiGetShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiGetShareResponseApplicationJson_Ocs),
        ShareapiGetShareResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiGetShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiUpdateShareResponseApplicationJson),
        ShareapiUpdateShareResponseApplicationJson.new,
      )
      ..add(ShareapiUpdateShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiUpdateShareResponseApplicationJson_Ocs),
        ShareapiUpdateShareResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiUpdateShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiDeleteShareResponseApplicationJson),
        ShareapiDeleteShareResponseApplicationJson.new,
      )
      ..add(ShareapiDeleteShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiDeleteShareResponseApplicationJson_Ocs),
        ShareapiDeleteShareResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiDeleteShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiAcceptShareResponseApplicationJson),
        ShareapiAcceptShareResponseApplicationJson.new,
      )
      ..add(ShareapiAcceptShareResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareapiAcceptShareResponseApplicationJson_Ocs),
        ShareapiAcceptShareResponseApplicationJson_Ocs.new,
      )
      ..add(ShareapiAcceptShareResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareesapiSearchShareType), ShareesapiSearchShareType.new)
      ..add(ShareesapiSearchShareType.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(ShareesapiSearchShareType)]),
        ContentString<ShareesapiSearchShareType>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(const FullType(ShareesapiShareesapiSearchHeaders), ShareesapiShareesapiSearchHeaders.new)
      ..add(ShareesapiShareesapiSearchHeaders.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiSearchResponseApplicationJson),
        ShareesapiSearchResponseApplicationJson.new,
      )
      ..add(ShareesapiSearchResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiSearchResponseApplicationJson_Ocs),
        ShareesapiSearchResponseApplicationJson_Ocs.new,
      )
      ..add(ShareesapiSearchResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareesSearchResult), ShareesSearchResult.new)
      ..add(ShareesSearchResult.serializer)
      ..addBuilderFactory(const FullType(ShareesSearchResult_Exact), ShareesSearchResult_Exact.new)
      ..add(ShareesSearchResult_Exact.serializer)
      ..addBuilderFactory(const FullType(ShareeCircle), ShareeCircle.new)
      ..add(ShareeCircle.serializer)
      ..addBuilderFactory(const FullType(Sharee), Sharee.new)
      ..add(Sharee.serializer)
      ..addBuilderFactory(const FullType(ShareeCircle_1_Value), ShareeCircle_1_Value.new)
      ..add(ShareeCircle_1_Value.serializer)
      ..addBuilderFactory(const FullType(ShareeValue), ShareeValue.new)
      ..add(ShareeValue.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeCircle)]), ListBuilder<ShareeCircle>.new)
      ..addBuilderFactory(const FullType(ShareeEmail), ShareeEmail.new)
      ..add(ShareeEmail.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeEmail)]), ListBuilder<ShareeEmail>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Sharee)]), ListBuilder<Sharee>.new)
      ..addBuilderFactory(const FullType(ShareeRemoteGroup), ShareeRemoteGroup.new)
      ..add(ShareeRemoteGroup.serializer)
      ..addBuilderFactory(const FullType(ShareeRemoteGroup_1_Value), ShareeRemoteGroup_1_Value.new)
      ..add(ShareeRemoteGroup_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeRemoteGroup)]), ListBuilder<ShareeRemoteGroup>.new)
      ..addBuilderFactory(const FullType(ShareeRemote), ShareeRemote.new)
      ..add(ShareeRemote.serializer)
      ..addBuilderFactory(const FullType(ShareeRemote_1_Value), ShareeRemote_1_Value.new)
      ..add(ShareeRemote_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeRemote)]), ListBuilder<ShareeRemote>.new)
      ..addBuilderFactory(const FullType(ShareeUser), ShareeUser.new)
      ..add(ShareeUser.serializer)
      ..addBuilderFactory(const FullType(ShareeUser_1_Status), ShareeUser_1_Status.new)
      ..add(ShareeUser_1_Status.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeUser)]), ListBuilder<ShareeUser>.new)
      ..addBuilderFactory(const FullType(ShareeLookup), ShareeLookup.new)
      ..add(ShareeLookup.serializer)
      ..addBuilderFactory(const FullType(ShareeLookup_1_Extra), ShareeLookup_1_Extra.new)
      ..add(ShareeLookup_1_Extra.serializer)
      ..addBuilderFactory(const FullType(Lookup), Lookup.new)
      ..add(Lookup.serializer)
      ..addBuilderFactory(const FullType(ShareeLookup_1_Value), ShareeLookup_1_Value.new)
      ..add(ShareeLookup_1_Value.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ShareeLookup)]), ListBuilder<ShareeLookup>.new)
      ..addBuilderFactory(const FullType(ShareesapiFindRecommendedShareType), ShareesapiFindRecommendedShareType.new)
      ..add(ShareesapiFindRecommendedShareType.serializer)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(ShareesapiFindRecommendedShareType)]),
        ContentString<ShareesapiFindRecommendedShareType>.new,
      )
      ..addBuilderFactory(
        const FullType(ShareesapiFindRecommendedResponseApplicationJson),
        ShareesapiFindRecommendedResponseApplicationJson.new,
      )
      ..add(ShareesapiFindRecommendedResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ShareesapiFindRecommendedResponseApplicationJson_Ocs),
        ShareesapiFindRecommendedResponseApplicationJson_Ocs.new,
      )
      ..add(ShareesapiFindRecommendedResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ShareesRecommendedResult), ShareesRecommendedResult.new)
      ..add(ShareesRecommendedResult.serializer)
      ..addBuilderFactory(const FullType(ShareesRecommendedResult_Exact), ShareesRecommendedResult_Exact.new)
      ..add(ShareesRecommendedResult_Exact.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing), Capabilities_FilesSharing.new)
      ..add(Capabilities_FilesSharing.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Public), Capabilities_FilesSharing_Public.new)
      ..add(Capabilities_FilesSharing_Public.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_Password),
        Capabilities_FilesSharing_Public_Password.new,
      )
      ..add(Capabilities_FilesSharing_Public_Password.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDate),
        Capabilities_FilesSharing_Public_ExpireDate.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDateInternal),
        Capabilities_FilesSharing_Public_ExpireDateInternal.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Public_ExpireDateRemote),
        Capabilities_FilesSharing_Public_ExpireDateRemote.new,
      )
      ..add(Capabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_User), Capabilities_FilesSharing_User.new)
      ..add(Capabilities_FilesSharing_User.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_User_ExpireDate),
        Capabilities_FilesSharing_User_ExpireDate.new,
      )
      ..add(Capabilities_FilesSharing_User_ExpireDate.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Group), Capabilities_FilesSharing_Group.new)
      ..add(Capabilities_FilesSharing_Group.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Group_ExpireDate),
        Capabilities_FilesSharing_Group_ExpireDate.new,
      )
      ..add(Capabilities_FilesSharing_Group_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation),
        Capabilities_FilesSharing_Federation.new,
      )
      ..add(Capabilities_FilesSharing_Federation.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation_ExpireDate),
        Capabilities_FilesSharing_Federation_ExpireDate.new,
      )
      ..add(Capabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..addBuilderFactory(
        const FullType(Capabilities_FilesSharing_Federation_ExpireDateSupported),
        Capabilities_FilesSharing_Federation_ExpireDateSupported.new,
      )
      ..add(Capabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..addBuilderFactory(const FullType(Capabilities_FilesSharing_Sharee), Capabilities_FilesSharing_Sharee.new)
      ..add(Capabilities_FilesSharing_Sharee.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
