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

part 'news.openapi.g.dart';

class NewsResponse<T, U> extends DynamiteResponse<T, U> {
  NewsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'NewsResponse(data: $data, headers: $headers)';
}

class NewsApiException extends DynamiteApiException {
  NewsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<NewsApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return NewsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'NewsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

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

  Future<NewsSupportedAPIVersions> getSupportedApiVersions() async {
    const path = '/index.php/apps/news/api';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NewsSupportedAPIVersions),
      )! as NewsSupportedAPIVersions;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> listFolders() async {
    const path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListFolders))!
          as NewsListFolders;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> createFolder({required final String name}) async {
    const path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    queryParameters['name'] = name;
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListFolders))!
          as NewsListFolders;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFolder({
    required final int folderId,
    required final String name,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFolder({required final int folderId}) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFolderAsRead({
    required final int folderId,
    required final int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> listFeeds() async {
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListFeeds))!
          as NewsListFeeds;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> addFeed({
    required final String url,
    final int? folderId,
  }) async {
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    queryParameters['url'] = url;
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListFeeds))!
          as NewsListFeeds;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFeed({required final int feedId}) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future moveFeed({
    required final int feedId,
    final int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFeed({
    required final int feedId,
    required final String feedTitle,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle;
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFeedAsRead({
    required final int feedId,
    required final int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListArticles> listArticles({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) async {
    const path = '/index.php/apps/news/api/v1-3/items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
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
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListArticles))!
          as NewsListArticles;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListArticles> listUpdatedArticles({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) async {
    const path = '/index.php/apps/news/api/v1-3/items/updated';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
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
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NewsListArticles))!
          as NewsListArticles;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsRead({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsUnread({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future starArticle({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }

  Future unstarArticle({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw await NewsApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class NewsSupportedAPIVersions implements Built<NewsSupportedAPIVersions, NewsSupportedAPIVersionsBuilder> {
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
  BuiltList<String>? get apiLevels;
  static Serializer<NewsSupportedAPIVersions> get serializer => _$newsSupportedAPIVersionsSerializer;
}

abstract class NewsArticle implements Built<NewsArticle, NewsArticleBuilder> {
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
  static Serializer<NewsArticle> get serializer => _$newsArticleSerializer;
}

abstract class NewsFeed implements Built<NewsFeed, NewsFeedBuilder> {
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
  static Serializer<NewsFeed> get serializer => _$newsFeedSerializer;
}

abstract class NewsFolder implements Built<NewsFolder, NewsFolderBuilder> {
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
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty
  BuiltList<NewsFeed> get feeds;
  static Serializer<NewsFolder> get serializer => _$newsFolderSerializer;
}

abstract class NewsListFolders implements Built<NewsListFolders, NewsListFoldersBuilder> {
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
  BuiltList<NewsFolder> get folders;
  static Serializer<NewsListFolders> get serializer => _$newsListFoldersSerializer;
}

abstract class NewsListFeeds implements Built<NewsListFeeds, NewsListFeedsBuilder> {
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
  int? get starredCount;
  int? get newestItemId;
  BuiltList<NewsFeed> get feeds;
  static Serializer<NewsListFeeds> get serializer => _$newsListFeedsSerializer;
}

abstract class NewsListArticles implements Built<NewsListArticles, NewsListArticlesBuilder> {
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
  BuiltList<NewsArticle> get items;
  static Serializer<NewsListArticles> get serializer => _$newsListArticlesSerializer;
}

abstract class NewsOCSMeta implements Built<NewsOCSMeta, NewsOCSMetaBuilder> {
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
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<NewsOCSMeta> get serializer => _$newsOCSMetaSerializer;
}

abstract class NewsEmptyOCS_Ocs implements Built<NewsEmptyOCS_Ocs, NewsEmptyOCS_OcsBuilder> {
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
  NewsOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<NewsEmptyOCS_Ocs> get serializer => _$newsEmptyOCSOcsSerializer;
}

abstract class NewsEmptyOCS implements Built<NewsEmptyOCS, NewsEmptyOCSBuilder> {
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
  NewsEmptyOCS_Ocs get ocs;
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

Serializers get newsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeNews<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNews<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
