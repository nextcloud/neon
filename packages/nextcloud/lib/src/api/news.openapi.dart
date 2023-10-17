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
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'news.openapi.g.dart';

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

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SupportedAPIVersions, void>> getSupportedApiVersions() async {
    final rawResponse = getSupportedApiVersionsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SupportedAPIVersions, void> getSupportedApiVersionsRaw() {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const path = '/index.php/apps/news/api';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<SupportedAPIVersions, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(SupportedAPIVersions),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFoldersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> listFolders() async {
    final rawResponse = listFoldersRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFolders] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> listFoldersRaw() {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const path = '/index.php/apps/news/api/v1-3/folders';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListFolders, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> createFolder({required final String name}) async {
    final rawResponse = createFolderRaw(
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> createFolderRaw({required final String name}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['name'] = name;
    const path = '/index.php/apps/news/api/v1-3/folders';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListFolders, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFolder({
    required final int folderId,
    required final String name,
  }) async {
    final rawResponse = renameFolderRaw(
      folderId: folderId,
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFolderRaw({
    required final int folderId,
    required final String name,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final folderId0 = Uri.encodeQueryComponent(folderId.toString());
    queryParameters['name'] = name;
    final path = '/index.php/apps/news/api/v1-3/folders/$folderId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFolder({required final int folderId}) async {
    final rawResponse = deleteFolderRaw(
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFolderRaw({required final int folderId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final folderId0 = Uri.encodeQueryComponent(folderId.toString());
    final path = '/index.php/apps/news/api/v1-3/folders/$folderId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFolderAsRead({
    required final int folderId,
    required final int newestItemId,
  }) async {
    final rawResponse = markFolderAsReadRaw(
      folderId: folderId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFolderAsReadRaw({
    required final int folderId,
    required final int newestItemId,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final folderId0 = Uri.encodeQueryComponent(folderId.toString());
    queryParameters['newestItemId'] = newestItemId.toString();
    final path = '/index.php/apps/news/api/v1-3/folders/$folderId0/read';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeedsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> listFeeds() async {
    final rawResponse = listFeedsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeeds] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> listFeedsRaw() {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListFeeds, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> addFeed({
    required final String url,
    final int? folderId,
  }) async {
    final rawResponse = addFeedRaw(
      url: url,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> addFeedRaw({
    required final String url,
    final int? folderId,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['url'] = url;
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListFeeds, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFeed({required final int feedId}) async {
    final rawResponse = deleteFeedRaw(
      feedId: feedId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFeedRaw({required final int feedId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final feedId0 = Uri.encodeQueryComponent(feedId.toString());
    final path = '/index.php/apps/news/api/v1-3/feeds/$feedId0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> moveFeed({
    required final int feedId,
    final int? folderId,
  }) async {
    final rawResponse = moveFeedRaw(
      feedId: feedId,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> moveFeedRaw({
    required final int feedId,
    final int? folderId,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final feedId0 = Uri.encodeQueryComponent(feedId.toString());
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final path = '/index.php/apps/news/api/v1-3/feeds/$feedId0/move';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFeed({
    required final int feedId,
    required final String feedTitle,
  }) async {
    final rawResponse = renameFeedRaw(
      feedId: feedId,
      feedTitle: feedTitle,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFeedRaw({
    required final int feedId,
    required final String feedTitle,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final feedId0 = Uri.encodeQueryComponent(feedId.toString());
    queryParameters['feedTitle'] = feedTitle;
    final path = '/index.php/apps/news/api/v1-3/feeds/$feedId0/rename';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFeedAsRead({
    required final int feedId,
    required final int newestItemId,
  }) async {
    final rawResponse = markFeedAsReadRaw(
      feedId: feedId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFeedAsReadRaw({
    required final int feedId,
    required final int newestItemId,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final feedId0 = Uri.encodeQueryComponent(feedId.toString());
    queryParameters['newestItemId'] = newestItemId.toString();
    final path = '/index.php/apps/news/api/v1-3/feeds/$feedId0/read';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listArticles({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) async {
    final rawResponse = listArticlesRaw(
      type: type,
      id: id,
      getRead: getRead,
      batchSize: batchSize,
      offset: offset,
      oldestFirst: oldestFirst,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    if (type != 3) {
      queryParameters['type'] = type.toString();
    }
    if (id != 0) {
      queryParameters['id'] = id.toString();
    }
    if (getRead != 1) {
      queryParameters['getRead'] = getRead.toString();
    }
    if (batchSize != -1) {
      queryParameters['batchSize'] = batchSize.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    if (oldestFirst != 0) {
      queryParameters['oldestFirst'] = oldestFirst.toString();
    }
    const path = '/index.php/apps/news/api/v1-3/items';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListArticles, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listUpdatedArticles({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) async {
    final rawResponse = listUpdatedArticlesRaw(
      type: type,
      id: id,
      lastModified: lastModified,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listUpdatedArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    if (type != 3) {
      queryParameters['type'] = type.toString();
    }
    if (id != 0) {
      queryParameters['id'] = id.toString();
    }
    if (lastModified != 0) {
      queryParameters['lastModified'] = lastModified.toString();
    }
    const path = '/index.php/apps/news/api/v1-3/items/updated';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<ListArticles, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsRead({required final int itemId}) async {
    final rawResponse = markArticleAsReadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsReadRaw({required final int itemId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final itemId0 = Uri.encodeQueryComponent(itemId.toString());
    final path = '/index.php/apps/news/api/v1-3/items/$itemId0/read';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnreadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsUnread({required final int itemId}) async {
    final rawResponse = markArticleAsUnreadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnread] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsUnreadRaw({required final int itemId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final itemId0 = Uri.encodeQueryComponent(itemId.toString());
    final path = '/index.php/apps/news/api/v1-3/items/$itemId0/unread';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> starArticle({required final int itemId}) async {
    final rawResponse = starArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> starArticleRaw({required final int itemId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final itemId0 = Uri.encodeQueryComponent(itemId.toString());
    final path = '/index.php/apps/news/api/v1-3/items/$itemId0/star';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> unstarArticle({required final int itemId}) async {
    final rawResponse = unstarArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> unstarArticleRaw({required final int itemId}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final itemId0 = Uri.encodeQueryComponent(itemId.toString());
    final path = '/index.php/apps/news/api/v1-3/items/$itemId0/unstar';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<void, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class SupportedAPIVersionsInterface {
  BuiltList<String>? get apiLevels;
}

abstract class SupportedAPIVersions
    implements SupportedAPIVersionsInterface, Built<SupportedAPIVersions, SupportedAPIVersionsBuilder> {
  factory SupportedAPIVersions([final void Function(SupportedAPIVersionsBuilder)? b]) = _$SupportedAPIVersions;

  // coverage:ignore-start
  const SupportedAPIVersions._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SupportedAPIVersions.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<SupportedAPIVersions> get serializer => _$supportedAPIVersionsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ArticleInterface {
  int get id;
  String get guid;
  String get guidHash;
  String? get url;
  String get title;
  String? get author;
  int get pubDate;
  int? get updatedDate;
  String get body;
  String? get enclosureMime;
  String? get enclosureLink;
  String? get mediaThumbnail;
  String? get mediaDescription;
  int get feedId;
  bool get unread;
  bool get starred;
  int get lastModified;
  bool get rtl;
  String get fingerprint;
  String get contentHash;
}

abstract class Article implements ArticleInterface, Built<Article, ArticleBuilder> {
  factory Article([final void Function(ArticleBuilder)? b]) = _$Article;

  // coverage:ignore-start
  const Article._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Article.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Article> get serializer => _$articleSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FeedInterface {
  int get id;
  String get url;
  String get title;
  String? get faviconLink;
  int get added;
  int? get folderId;
  int? get unreadCount;
  int get ordering;
  String? get link;
  bool get pinned;
  int get updateErrorCount;
  String? get lastUpdateError;
  BuiltList<Article> get items;
}

abstract class Feed implements FeedInterface, Built<Feed, FeedBuilder> {
  factory Feed([final void Function(FeedBuilder)? b]) = _$Feed;

  // coverage:ignore-start
  const Feed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Feed.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Feed> get serializer => _$feedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FolderInterface {
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty.
  BuiltList<Feed> get feeds;
}

abstract class Folder implements FolderInterface, Built<Folder, FolderBuilder> {
  factory Folder([final void Function(FolderBuilder)? b]) = _$Folder;

  // coverage:ignore-start
  const Folder._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Folder.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Folder> get serializer => _$folderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ListFoldersInterface {
  BuiltList<Folder> get folders;
}

abstract class ListFolders implements ListFoldersInterface, Built<ListFolders, ListFoldersBuilder> {
  factory ListFolders([final void Function(ListFoldersBuilder)? b]) = _$ListFolders;

  // coverage:ignore-start
  const ListFolders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFolders.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListFolders> get serializer => _$listFoldersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ListFeedsInterface {
  int? get starredCount;
  int? get newestItemId;
  BuiltList<Feed> get feeds;
}

abstract class ListFeeds implements ListFeedsInterface, Built<ListFeeds, ListFeedsBuilder> {
  factory ListFeeds([final void Function(ListFeedsBuilder)? b]) = _$ListFeeds;

  // coverage:ignore-start
  const ListFeeds._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFeeds.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListFeeds> get serializer => _$listFeedsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ListArticlesInterface {
  BuiltList<Article> get items;
}

abstract class ListArticles implements ListArticlesInterface, Built<ListArticles, ListArticlesBuilder> {
  factory ListArticles([final void Function(ListArticlesBuilder)? b]) = _$ListArticles;

  // coverage:ignore-start
  const ListArticles._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListArticles.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ListArticles> get serializer => _$listArticlesSerializer;
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

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCS_OcsInterface {
  OCSMeta get meta;
  BuiltList<JsonObject> get data;
}

abstract class EmptyOCS_Ocs implements EmptyOCS_OcsInterface, Built<EmptyOCS_Ocs, EmptyOCS_OcsBuilder> {
  factory EmptyOCS_Ocs([final void Function(EmptyOCS_OcsBuilder)? b]) = _$EmptyOCS_Ocs;

  // coverage:ignore-start
  const EmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS_Ocs> get serializer => _$emptyOCSOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCSInterface {
  EmptyOCS_Ocs get ocs;
}

abstract class EmptyOCS implements EmptyOCSInterface, Built<EmptyOCS, EmptyOCSBuilder> {
  factory EmptyOCS([final void Function(EmptyOCSBuilder)? b]) = _$EmptyOCS;

  // coverage:ignore-start
  const EmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS> get serializer => _$emptyOCSSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(SupportedAPIVersions), SupportedAPIVersions.new)
      ..add(SupportedAPIVersions.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(ListFolders), ListFolders.new)
      ..add(ListFolders.serializer)
      ..addBuilderFactory(const FullType(Folder), Folder.new)
      ..add(Folder.serializer)
      ..addBuilderFactory(const FullType(Feed), Feed.new)
      ..add(Feed.serializer)
      ..addBuilderFactory(const FullType(Article), Article.new)
      ..add(Article.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Article)]), ListBuilder<Article>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Feed)]), ListBuilder<Feed>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Folder)]), ListBuilder<Folder>.new)
      ..addBuilderFactory(const FullType(ListFeeds), ListFeeds.new)
      ..add(ListFeeds.serializer)
      ..addBuilderFactory(const FullType(ListArticles), ListArticles.new)
      ..add(ListArticles.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS), EmptyOCS.new)
      ..add(EmptyOCS.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS_Ocs), EmptyOCS_Ocs.new)
      ..add(EmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
