//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi extends ApiInstance<ApiClient> {
  DefaultApi(ApiClient apiClient) : super(apiClient);

  /// Performs an HTTP 'POST /api/v1-2/feeds' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [NewsAddFeed] newsAddFeed (required):
  Future<Response> addFeedWithHttpInfo(
    NewsAddFeed newsAddFeed,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds';

    // ignore: prefer_final_locals
    Object? postBody = newsAddFeed;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [NewsAddFeed] newsAddFeed (required):
  Future<NewsListFeeds?> addFeed(
    NewsAddFeed newsAddFeed,
  ) async {
    final response = await addFeedWithHttpInfo(
      newsAddFeed,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListFeeds',
      ) as NewsListFeeds;
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/v1-2/folders' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [NewsCreateFolder] newsCreateFolder (required):
  Future<Response> createFolderWithHttpInfo(
    NewsCreateFolder newsCreateFolder,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/folders';

    // ignore: prefer_final_locals
    Object? postBody = newsCreateFolder;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [NewsCreateFolder] newsCreateFolder (required):
  Future<NewsListFolders?> createFolder(
    NewsCreateFolder newsCreateFolder,
  ) async {
    final response = await createFolderWithHttpInfo(
      newsCreateFolder,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListFolders',
      ) as NewsListFolders;
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/v1-2/feeds/{feedId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  Future<Response> deleteFeedWithHttpInfo(
    int feedId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds/{feedId}'.replaceAll('{feedId}', feedId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  Future<void> deleteFeed(
    int feedId,
  ) async {
    final response = await deleteFeedWithHttpInfo(
      feedId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'DELETE /api/v1-2/folders/{folderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] folderId (required):
  Future<Response> deleteFolderWithHttpInfo(
    int folderId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/folders/{folderId}'.replaceAll('{folderId}', folderId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] folderId (required):
  Future<void> deleteFolder(
    int folderId,
  ) async {
    final response = await deleteFolderWithHttpInfo(
      folderId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/v1-2/items' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] type:
  ///
  /// * [int] id:
  ///
  /// * [bool] getRead:
  ///
  /// * [int] batchSize:
  ///
  /// * [int] offset:
  ///
  /// * [bool] oldestFirst:
  Future<Response> listArticlesWithHttpInfo({
    int? type,
    int? id,
    bool? getRead,
    int? batchSize,
    int? offset,
    bool? oldestFirst,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (type != null) {
      queryParams.addAll(buildQueryParams('', 'type', type));
    }
    if (id != null) {
      queryParams.addAll(buildQueryParams('', 'id', id));
    }
    if (getRead != null) {
      queryParams.addAll(buildQueryParams('', 'getRead', getRead));
    }
    if (batchSize != null) {
      queryParams.addAll(buildQueryParams('', 'batchSize', batchSize));
    }
    if (offset != null) {
      queryParams.addAll(buildQueryParams('', 'offset', offset));
    }
    if (oldestFirst != null) {
      queryParams.addAll(buildQueryParams('', 'oldestFirst', oldestFirst));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] type:
  ///
  /// * [int] id:
  ///
  /// * [bool] getRead:
  ///
  /// * [int] batchSize:
  ///
  /// * [int] offset:
  ///
  /// * [bool] oldestFirst:
  Future<NewsListArticles?> listArticles({
    int? type,
    int? id,
    bool? getRead,
    int? batchSize,
    int? offset,
    bool? oldestFirst,
  }) async {
    final response = await listArticlesWithHttpInfo(
      type: type,
      id: id,
      getRead: getRead,
      batchSize: batchSize,
      offset: offset,
      oldestFirst: oldestFirst,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListArticles',
      ) as NewsListArticles;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1-2/feeds' operation and returns the [Response].
  Future<Response> listFeedsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<NewsListFeeds?> listFeeds() async {
    final response = await listFeedsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListFeeds',
      ) as NewsListFeeds;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1-2/folders' operation and returns the [Response].
  Future<Response> listFoldersWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/folders';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<NewsListFolders?> listFolders() async {
    final response = await listFoldersWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListFolders',
      ) as NewsListFolders;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1-2/items/updated' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] lastModified:
  ///
  /// * [int] type:
  ///
  /// * [int] id:
  Future<Response> listUpdatedArticlesWithHttpInfo({
    int? lastModified,
    int? type,
    int? id,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items/updated';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (lastModified != null) {
      queryParams.addAll(buildQueryParams('', 'lastModified', lastModified));
    }
    if (type != null) {
      queryParams.addAll(buildQueryParams('', 'type', type));
    }
    if (id != null) {
      queryParams.addAll(buildQueryParams('', 'id', id));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] lastModified:
  ///
  /// * [int] type:
  ///
  /// * [int] id:
  Future<NewsListArticles?> listUpdatedArticles({
    int? lastModified,
    int? type,
    int? id,
  }) async {
    final response = await listUpdatedArticlesWithHttpInfo(
      lastModified: lastModified,
      type: type,
      id: id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NewsListArticles',
      ) as NewsListArticles;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1-2/items/{itemId}/read' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] itemId (required):
  Future<Response> markArticleAsReadWithHttpInfo(
    int itemId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items/{itemId}/read'.replaceAll('{itemId}', itemId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] itemId (required):
  Future<void> markArticleAsRead(
    int itemId,
  ) async {
    final response = await markArticleAsReadWithHttpInfo(
      itemId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/items/{itemId}/unread' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] itemId (required):
  Future<Response> markArticleAsUnreadWithHttpInfo(
    int itemId,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items/{itemId}/unread'.replaceAll('{itemId}', itemId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] itemId (required):
  Future<void> markArticleAsUnread(
    int itemId,
  ) async {
    final response = await markArticleAsUnreadWithHttpInfo(
      itemId,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/feeds/{feedId}/read' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsMarkAsRead] newsMarkAsRead (required):
  Future<Response> markFeedAsReadWithHttpInfo(
    int feedId,
    NewsMarkAsRead newsMarkAsRead,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds/{feedId}/read'.replaceAll('{feedId}', feedId.toString());

    // ignore: prefer_final_locals
    Object? postBody = newsMarkAsRead;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsMarkAsRead] newsMarkAsRead (required):
  Future<void> markFeedAsRead(
    int feedId,
    NewsMarkAsRead newsMarkAsRead,
  ) async {
    final response = await markFeedAsReadWithHttpInfo(
      feedId,
      newsMarkAsRead,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/folders/{folderId}/read' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///
  /// * [NewsMarkAsRead] newsMarkAsRead (required):
  Future<Response> markFolderAsReadWithHttpInfo(
    int folderId,
    NewsMarkAsRead newsMarkAsRead,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/folders/{folderId}/read'.replaceAll('{folderId}', folderId.toString());

    // ignore: prefer_final_locals
    Object? postBody = newsMarkAsRead;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///
  /// * [NewsMarkAsRead] newsMarkAsRead (required):
  Future<void> markFolderAsRead(
    int folderId,
    NewsMarkAsRead newsMarkAsRead,
  ) async {
    final response = await markFolderAsReadWithHttpInfo(
      folderId,
      newsMarkAsRead,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/feeds/{feedId}/move' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsMoveFeed] newsMoveFeed (required):
  Future<Response> moveFeedWithHttpInfo(
    int feedId,
    NewsMoveFeed newsMoveFeed,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds/{feedId}/move'.replaceAll('{feedId}', feedId.toString());

    // ignore: prefer_final_locals
    Object? postBody = newsMoveFeed;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsMoveFeed] newsMoveFeed (required):
  Future<void> moveFeed(
    int feedId,
    NewsMoveFeed newsMoveFeed,
  ) async {
    final response = await moveFeedWithHttpInfo(
      feedId,
      newsMoveFeed,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/feeds/{feedId}/rename' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsRenameFeed] newsRenameFeed (required):
  Future<Response> renameFeedWithHttpInfo(
    int feedId,
    NewsRenameFeed newsRenameFeed,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/feeds/{feedId}/rename'.replaceAll('{feedId}', feedId.toString());

    // ignore: prefer_final_locals
    Object? postBody = newsRenameFeed;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [NewsRenameFeed] newsRenameFeed (required):
  Future<void> renameFeed(
    int feedId,
    NewsRenameFeed newsRenameFeed,
  ) async {
    final response = await renameFeedWithHttpInfo(
      feedId,
      newsRenameFeed,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/folders/{folderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///
  /// * [NewsRenameFolder] newsRenameFolder (required):
  Future<Response> renameFolderWithHttpInfo(
    int folderId,
    NewsRenameFolder newsRenameFolder,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/folders/{folderId}'.replaceAll('{folderId}', folderId.toString());

    // ignore: prefer_final_locals
    Object? postBody = newsRenameFolder;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] folderId (required):
  ///
  /// * [NewsRenameFolder] newsRenameFolder (required):
  Future<void> renameFolder(
    int folderId,
    NewsRenameFolder newsRenameFolder,
  ) async {
    final response = await renameFolderWithHttpInfo(
      folderId,
      newsRenameFolder,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/items/{feedId}/{guidHash}/star' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [String] guidHash (required):
  Future<Response> starArticleWithHttpInfo(
    int feedId,
    String guidHash,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items/{feedId}/{guidHash}/star'
        .replaceAll('{feedId}', feedId.toString())
        .replaceAll('{guidHash}', guidHash);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [String] guidHash (required):
  Future<void> starArticle(
    int feedId,
    String guidHash,
  ) async {
    final response = await starArticleWithHttpInfo(
      feedId,
      guidHash,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PUT /api/v1-2/items/{feedId}/{guidHash}/unstar' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [String] guidHash (required):
  Future<Response> unstarArticleWithHttpInfo(
    int feedId,
    String guidHash,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1-2/items/{feedId}/{guidHash}/unstar'
        .replaceAll('{feedId}', feedId.toString())
        .replaceAll('{guidHash}', guidHash);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] feedId (required):
  ///
  /// * [String] guidHash (required):
  Future<void> unstarArticle(
    int feedId,
    String guidHash,
  ) async {
    final response = await unstarArticleWithHttpInfo(
      feedId,
      guidHash,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
  }
}
