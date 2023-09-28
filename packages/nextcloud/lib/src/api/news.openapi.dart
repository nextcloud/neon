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

export 'package:dynamite_runtime/http_client.dart';

part 'news.openapi.g.dart';

class NewsClient extends DynamiteClient {
  NewsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  NewsClient.fromClient(final DynamiteClient client)
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
  Future<DynamiteResponse<NewsSupportedAPIVersions, void>> getSupportedApiVersions() async {
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
  DynamiteRawResponse<NewsSupportedAPIVersions, void> getSupportedApiVersionsRaw() {
    const path = '/index.php/apps/news/api';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsSupportedAPIVersions, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsSupportedAPIVersions),
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
  Future<DynamiteResponse<NewsListFolders, void>> listFolders() async {
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
  DynamiteRawResponse<NewsListFolders, void> listFoldersRaw() {
    const path = '/index.php/apps/news/api/v1-3/folders';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListFolders, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListFolders),
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
  Future<DynamiteResponse<NewsListFolders, void>> createFolder({required final String name}) async {
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
  DynamiteRawResponse<NewsListFolders, void> createFolderRaw({required final String name}) {
    const path = '/index.php/apps/news/api/v1-3/folders';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListFolders, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListFolders),
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
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
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
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name;
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
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
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
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
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
  ///   * [newestItemId] The newest read item
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
  ///   * [newestItemId] The newest read item
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
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}/read';
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
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
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
  Future<DynamiteResponse<NewsListFeeds, void>> listFeeds() async {
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
  DynamiteRawResponse<NewsListFeeds, void> listFeedsRaw() {
    const path = '/index.php/apps/news/api/v1-3/feeds';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListFeeds, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListFeeds),
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
  Future<DynamiteResponse<NewsListFeeds, void>> addFeed({
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
  DynamiteRawResponse<NewsListFeeds, void> addFeedRaw({
    required final String url,
    final int? folderId,
  }) {
    const path = '/index.php/apps/news/api/v1-3/feeds';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListFeeds, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListFeeds),
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
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}';
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
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
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
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/move';
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
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
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
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/rename';
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
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle;
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
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/read';
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
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
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
  ///   * [type]
  ///   * [id]
  ///   * [getRead]
  ///   * [batchSize]
  ///   * [offset]
  ///   * [oldestFirst]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NewsListArticles, void>> listArticles({
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
  ///   * [type]
  ///   * [id]
  ///   * [getRead]
  ///   * [batchSize]
  ///   * [offset]
  ///   * [oldestFirst]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NewsListArticles, void> listArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) {
    const path = '/index.php/apps/news/api/v1-3/items';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListArticles, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListArticles),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type]
  ///   * [id]
  ///   * [lastModified]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NewsListArticles, void>> listUpdatedArticles({
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
  ///   * [type]
  ///   * [id]
  ///   * [lastModified]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NewsListArticles, void> listUpdatedArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) {
    const path = '/index.php/apps/news/api/v1-3/items/updated';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NewsListArticles, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NewsListArticles),
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
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/read';
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
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
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
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unread';
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
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
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
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/star';
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
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
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
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unstar';
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
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
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
abstract interface class NewsSupportedAPIVersionsInterface {
  BuiltList<String>? get apiLevels;
  NewsSupportedAPIVersionsInterface rebuild(final void Function(NewsSupportedAPIVersionsInterfaceBuilder) updates);
  NewsSupportedAPIVersionsInterfaceBuilder toBuilder();
}

abstract class NewsSupportedAPIVersions
    implements NewsSupportedAPIVersionsInterface, Built<NewsSupportedAPIVersions, NewsSupportedAPIVersionsBuilder> {
  factory NewsSupportedAPIVersions([final void Function(NewsSupportedAPIVersionsBuilder)? b]) =
      _$NewsSupportedAPIVersions;

  // coverage:ignore-start
  const NewsSupportedAPIVersions._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsSupportedAPIVersions.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsSupportedAPIVersions> get serializer => _$newsSupportedAPIVersionsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsArticleInterface {
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
  NewsArticleInterface rebuild(final void Function(NewsArticleInterfaceBuilder) updates);
  NewsArticleInterfaceBuilder toBuilder();
}

abstract class NewsArticle implements NewsArticleInterface, Built<NewsArticle, NewsArticleBuilder> {
  factory NewsArticle([final void Function(NewsArticleBuilder)? b]) = _$NewsArticle;

  // coverage:ignore-start
  const NewsArticle._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsArticle.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsArticle> get serializer => _$newsArticleSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsFeedInterface {
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
  BuiltList<NewsArticle> get items;
  NewsFeedInterface rebuild(final void Function(NewsFeedInterfaceBuilder) updates);
  NewsFeedInterfaceBuilder toBuilder();
}

abstract class NewsFeed implements NewsFeedInterface, Built<NewsFeed, NewsFeedBuilder> {
  factory NewsFeed([final void Function(NewsFeedBuilder)? b]) = _$NewsFeed;

  // coverage:ignore-start
  const NewsFeed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsFeed.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsFeed> get serializer => _$newsFeedSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsFolderInterface {
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty.
  BuiltList<NewsFeed> get feeds;
  NewsFolderInterface rebuild(final void Function(NewsFolderInterfaceBuilder) updates);
  NewsFolderInterfaceBuilder toBuilder();
}

abstract class NewsFolder implements NewsFolderInterface, Built<NewsFolder, NewsFolderBuilder> {
  factory NewsFolder([final void Function(NewsFolderBuilder)? b]) = _$NewsFolder;

  // coverage:ignore-start
  const NewsFolder._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsFolder.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsFolder> get serializer => _$newsFolderSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsListFoldersInterface {
  BuiltList<NewsFolder> get folders;
  NewsListFoldersInterface rebuild(final void Function(NewsListFoldersInterfaceBuilder) updates);
  NewsListFoldersInterfaceBuilder toBuilder();
}

abstract class NewsListFolders implements NewsListFoldersInterface, Built<NewsListFolders, NewsListFoldersBuilder> {
  factory NewsListFolders([final void Function(NewsListFoldersBuilder)? b]) = _$NewsListFolders;

  // coverage:ignore-start
  const NewsListFolders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsListFolders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsListFolders> get serializer => _$newsListFoldersSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsListFeedsInterface {
  int? get starredCount;
  int? get newestItemId;
  BuiltList<NewsFeed> get feeds;
  NewsListFeedsInterface rebuild(final void Function(NewsListFeedsInterfaceBuilder) updates);
  NewsListFeedsInterfaceBuilder toBuilder();
}

abstract class NewsListFeeds implements NewsListFeedsInterface, Built<NewsListFeeds, NewsListFeedsBuilder> {
  factory NewsListFeeds([final void Function(NewsListFeedsBuilder)? b]) = _$NewsListFeeds;

  // coverage:ignore-start
  const NewsListFeeds._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsListFeeds.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsListFeeds> get serializer => _$newsListFeedsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsListArticlesInterface {
  BuiltList<NewsArticle> get items;
  NewsListArticlesInterface rebuild(final void Function(NewsListArticlesInterfaceBuilder) updates);
  NewsListArticlesInterfaceBuilder toBuilder();
}

abstract class NewsListArticles implements NewsListArticlesInterface, Built<NewsListArticles, NewsListArticlesBuilder> {
  factory NewsListArticles([final void Function(NewsListArticlesBuilder)? b]) = _$NewsListArticles;

  // coverage:ignore-start
  const NewsListArticles._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsListArticles.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsListArticles> get serializer => _$newsListArticlesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  NewsOCSMetaInterface rebuild(final void Function(NewsOCSMetaInterfaceBuilder) updates);
  NewsOCSMetaInterfaceBuilder toBuilder();
}

abstract class NewsOCSMeta implements NewsOCSMetaInterface, Built<NewsOCSMeta, NewsOCSMetaBuilder> {
  factory NewsOCSMeta([final void Function(NewsOCSMetaBuilder)? b]) = _$NewsOCSMeta;

  // coverage:ignore-start
  const NewsOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsOCSMeta> get serializer => _$newsOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsEmptyOCS_OcsInterface {
  NewsOCSMeta get meta;
  BuiltList<JsonObject> get data;
  NewsEmptyOCS_OcsInterface rebuild(final void Function(NewsEmptyOCS_OcsInterfaceBuilder) updates);
  NewsEmptyOCS_OcsInterfaceBuilder toBuilder();
}

abstract class NewsEmptyOCS_Ocs implements NewsEmptyOCS_OcsInterface, Built<NewsEmptyOCS_Ocs, NewsEmptyOCS_OcsBuilder> {
  factory NewsEmptyOCS_Ocs([final void Function(NewsEmptyOCS_OcsBuilder)? b]) = _$NewsEmptyOCS_Ocs;

  // coverage:ignore-start
  const NewsEmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsEmptyOCS_Ocs> get serializer => _$newsEmptyOCSOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NewsEmptyOCSInterface {
  NewsEmptyOCS_Ocs get ocs;
  NewsEmptyOCSInterface rebuild(final void Function(NewsEmptyOCSInterfaceBuilder) updates);
  NewsEmptyOCSInterfaceBuilder toBuilder();
}

abstract class NewsEmptyOCS implements NewsEmptyOCSInterface, Built<NewsEmptyOCS, NewsEmptyOCSBuilder> {
  factory NewsEmptyOCS([final void Function(NewsEmptyOCSBuilder)? b]) = _$NewsEmptyOCS;

  // coverage:ignore-start
  const NewsEmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NewsEmptyOCS.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<NewsEmptyOCS> get serializer => _$newsEmptyOCSSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(NewsSupportedAPIVersions), NewsSupportedAPIVersions.new)
      ..add(NewsSupportedAPIVersions.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(NewsListFolders), NewsListFolders.new)
      ..add(NewsListFolders.serializer)
      ..addBuilderFactory(const FullType(NewsFolder), NewsFolder.new)
      ..add(NewsFolder.serializer)
      ..addBuilderFactory(const FullType(NewsFeed), NewsFeed.new)
      ..add(NewsFeed.serializer)
      ..addBuilderFactory(const FullType(NewsArticle), NewsArticle.new)
      ..add(NewsArticle.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NewsArticle)]), ListBuilder<NewsArticle>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NewsFeed)]), ListBuilder<NewsFeed>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NewsFolder)]), ListBuilder<NewsFolder>.new)
      ..addBuilderFactory(const FullType(NewsListFeeds), NewsListFeeds.new)
      ..add(NewsListFeeds.serializer)
      ..addBuilderFactory(const FullType(NewsListArticles), NewsListArticles.new)
      ..add(NewsListArticles.serializer)
      ..addBuilderFactory(const FullType(NewsOCSMeta), NewsOCSMeta.new)
      ..add(NewsOCSMeta.serializer)
      ..addBuilderFactory(const FullType(NewsEmptyOCS), NewsEmptyOCS.new)
      ..add(NewsEmptyOCS.serializer)
      ..addBuilderFactory(const FullType(NewsEmptyOCS_Ocs), NewsEmptyOCS_Ocs.new)
      ..add(NewsEmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
