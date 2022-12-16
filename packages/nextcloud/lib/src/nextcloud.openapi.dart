import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:json_annotation/json_annotation.dart';

export 'package:cookie_jar/cookie_jar.dart';

part 'nextcloud.openapi.g.dart';

extension HttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async {
    final chunks = await toList();
    if (chunks.isEmpty) {
      return Uint8List(0);
    }
    return Uint8List.fromList(chunks.reduce((final value, final element) => [...value, ...element]));
  }

  Future<String> get body async => utf8.decode(await bodyBytes);
}

class Response<T, U> {
  Response(
    this.data,
    this.headers,
  );

  final T data;

  final U headers;

  @override
  String toString() => 'Response(data: $data, headers: $headers)';
}

class _Response {
  _Response(
    this.statusCode,
    this.headers,
    this.body,
  );

  final int statusCode;

  final Map<String, String> headers;

  final Uint8List body;

  @override
  String toString() => '_Response(statusCode: $statusCode, headers: $headers, body: ${utf8.decode(body)})';
}

class ApiException extends _Response implements Exception {
  ApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  factory ApiException.fromResponse(_Response response) => ApiException(
        response.statusCode,
        response.headers,
        response.body,
      );

  @override
  String toString() =>
      'ApiException(statusCode: ${super.statusCode}, headers: ${super.headers}, body: ${utf8.decode(super.body)})';
}

abstract class Authentication {
  Map<String, String> get headers;
}

class HttpBasicAuthentication extends Authentication {
  HttpBasicAuthentication({
    required this.username,
    required this.password,
  });

  final String username;

  final String password;

  Map<String, String> get headers => {
        'Authorization': 'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      };
}

class Client {
  Client(
    this.baseURL, {
    Map<String, String>? baseHeaders,
    String? userAgent,
    HttpClient? httpClient,
    this.cookieJar,
    this.authentication,
  }) {
    this.baseHeaders = {
      if (baseHeaders != null) ...{
        ...baseHeaders,
      },
      if (authentication != null) ...{
        ...authentication!.headers,
      },
    };
    this.httpClient = (httpClient ?? HttpClient())..userAgent = userAgent;
  }

  final String baseURL;

  late final Map<String, String> baseHeaders;

  late final HttpClient httpClient;

  final CookieJar? cookieJar;

  final Authentication? authentication;

  CoreClient get core => CoreClient(this);
  NewsClient get news => NewsClient(this);
  NotesClient get notes => NotesClient(this);
  NotificationsClient get notifications => NotificationsClient(this);
  ProvisioningApiClient get provisioningApi => ProvisioningApiClient(this);
  UserStatusClient get userStatus => UserStatusClient(this);
  Future<_Response> doRequest(
    String method,
    String path,
    Map<String, String> headers,
    Uint8List? body,
  ) async {
    final uri = Uri.parse('$baseURL$path');
    final request = await httpClient.openUrl(method, uri);
    for (final header in {...baseHeaders, ...headers}.entries) {
      request.headers.add(header.key, header.value);
    }
    if (body != null) {
      request.add(body.toList());
    }
    if (cookieJar != null) {
      request.cookies.addAll(await cookieJar!.loadForRequest(uri));
    }

    final response = await request.close();
    if (cookieJar != null) {
      await cookieJar!.saveFromResponse(uri, response.cookies);
    }
    final responseHeaders = <String, String>{};
    response.headers.forEach((final name, final values) {
      responseHeaders[name] = values.last;
    });
    return _Response(
      response.statusCode,
      responseHeaders,
      await response.bodyBytes,
    );
  }
}

class CoreClient {
  CoreClient(this.rootClient);

  final Client rootClient;

  Future<CoreServerStatus> getStatus() async {
    var path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerStatus.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreServerCapabilities> getCapabilities() async {
    var path = '/ocs/v2.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerCapabilities.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreNavigationApps> getNavigationApps() async {
    var path = '/ocs/v2.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreNavigationApps.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowInit> initLoginFlow() async {
    var path = '/index.php/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowInit.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowResult> getLoginFlowResult({required String token}) async {
    var path = '/index.php/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['token'] = token.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowResult.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getPreview({
    String file = '',
    int x = 32,
    int y = 32,
    int a = 0,
    int forceIcon = 1,
    String mode = 'fill',
  }) async {
    var path = '/index.php/core/preview.png';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['file'] = file.toString();
    queryParameters['x'] = x.toString();
    queryParameters['y'] = y.toString();
    queryParameters['a'] = a.toString();
    queryParameters['forceIcon'] = forceIcon.toString();
    queryParameters['mode'] = mode.toString();
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getDarkAvatar({
    required String userId,
    required int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}/dark';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getAvatar({
    required String userId,
    required int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NewsClient {
  NewsClient(this.rootClient);

  final Client rootClient;

  Future<GetSupportedApiVersions> getSupportedApiVersions() async {
    var path = '/index.php/apps/news/api';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return GetSupportedApiVersions.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> listFolders() async {
    var path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> createFolder({required String name}) async {
    var path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['name'] = name.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFolder({
    required int folderId,
    required String name,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFolder({required int folderId}) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFolderAsRead({
    required int folderId,
    required int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> listFeeds() async {
    var path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> addFeed({
    required String url,
    int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['url'] = url.toString();
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFeed({required int feedId}) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future moveFeed({
    required int feedId,
    int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFeed({
    required int feedId,
    required String feedTitle,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFeedAsRead({
    required int feedId,
    required int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListArticles> listArticles({
    int type = 3,
    int id = 0,
    int getRead = 1,
    int batchSize = -1,
    int offset = 0,
    int oldestFirst = 0,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['type'] = type.toString();
    queryParameters['id'] = id.toString();
    queryParameters['getRead'] = getRead.toString();
    queryParameters['batchSize'] = batchSize.toString();
    queryParameters['offset'] = offset.toString();
    queryParameters['oldestFirst'] = oldestFirst.toString();
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListArticles> listUpdatedArticles({
    int type = 3,
    int id = 0,
    int lastModified = 0,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/items/updated';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['type'] = type.toString();
    queryParameters['id'] = id.toString();
    queryParameters['lastModified'] = lastModified.toString();
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsRead({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsUnread({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future starArticle({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future unstarArticle({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotesClient {
  NotesClient(this.rootClient);

  final Client rootClient;

  Future<List<NotesNote>> getNotes({
    String? category,
    String exclude = '',
    int pruneBefore = 0,
    int chunkSize = 0,
    String? chunkCursor,
    String? ifNoneMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (category != null) {
      queryParameters['category'] = category.toString();
    }
    queryParameters['exclude'] = exclude.toString();
    queryParameters['pruneBefore'] = pruneBefore.toString();
    queryParameters['chunkSize'] = chunkSize.toString();
    if (chunkCursor != null) {
      queryParameters['chunkCursor'] = chunkCursor.toString();
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch.toString();
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return (json.decode(utf8.decode(response.body) as String) as List)
          .map((final e) => NotesNote.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> createNote({
    String category = '',
    String title = '',
    String content = '',
    int modified = 0,
    int favorite = 0,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['category'] = category.toString();
    queryParameters['title'] = title.toString();
    queryParameters['content'] = content.toString();
    queryParameters['modified'] = modified.toString();
    queryParameters['favorite'] = favorite.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> getNote({
    required int id,
    String exclude = '',
    String? ifNoneMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    queryParameters['exclude'] = exclude.toString();
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch.toString();
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> updateNote({
    required int id,
    String? content,
    int? modified,
    String? title,
    String? category,
    int favorite = 0,
    String? ifMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (content != null) {
      queryParameters['content'] = content.toString();
    }
    if (modified != null) {
      queryParameters['modified'] = modified.toString();
    }
    if (title != null) {
      queryParameters['title'] = title.toString();
    }
    if (category != null) {
      queryParameters['category'] = category.toString();
    }
    queryParameters['favorite'] = favorite.toString();
    if (ifMatch != null) {
      headers['If-Match'] = ifMatch.toString();
    }
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteNote({required int id}) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ((utf8.decode(response.body) as String) as String);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> getSettings() async {
    var path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> updateSettings({required NotesSettings notesSettings}) async {
    var path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    headers['Content-Type'] = 'application/json';
    body = Uint8List.fromList(utf8.encode(json.encode(notesSettings.toJson())));
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsClient {
  NotificationsClient(this.rootClient);

  final Client rootClient;

  Future<NotificationsListNotifications> listNotifications() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsListNotifications.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteAllNotifications() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ((utf8.decode(response.body) as String) as String);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsGetNotification> getNotification({required int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsGetNotification.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<EmptyOCS> deleteNotification({required int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return EmptyOCS.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsPushServerRegistration> registerDevice({
    required String pushTokenHash,
    required String devicePublicKey,
    required String proxyServer,
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['pushTokenHash'] = pushTokenHash.toString();
    queryParameters['devicePublicKey'] = devicePublicKey.toString();
    queryParameters['proxyServer'] = proxyServer.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return NotificationsPushServerRegistration.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> removeDevice() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 202) {
      return ((utf8.decode(response.body) as String) as String);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<EmptyOCS> sendAdminNotification({
    required String userId,
    required String shortMessage,
    String longMessage = '',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/admin_notifications/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    queryParameters['shortMessage'] = shortMessage.toString();
    queryParameters['longMessage'] = longMessage.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return EmptyOCS.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiClient {
  ProvisioningApiClient(this.rootClient);

  final Client rootClient;

  Future<ProvisioningApiUser> getCurrentUser() async {
    var path = '/ocs/v2.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<ProvisioningApiUser> getUser({required String userId}) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class UserStatusClient {
  UserStatusClient(this.rootClient);

  final Client rootClient;

  Future<UserStatusFindAllStatuses> findAllStatuses() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindAllStatuses.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusFindStatus> findStatus({required String userId}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindStatus.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> getStatus() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> setStatus({required UserStatusType statusType}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['statusType'] = statusType.value.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> setPredefinedMessage({
    required String messageId,
    int? clearAt,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['messageId'] = messageId.toString();
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> setCustomMessage({
    String? statusIcon,
    String? message,
    int? clearAt,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon.toString();
    }
    if (message != null) {
      queryParameters['message'] = message.toString();
    }
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future clearMessage() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusPredefinedStatuses> findAllPredefinedStatuses() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusPredefinedStatuses.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatus> heartbeat({required UserStatusType status}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['status'] = status.value.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatus.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

@JsonSerializable()
class CoreServerStatus {
  CoreServerStatus({
    required this.installed,
    required this.maintenance,
    required this.needsDbUpgrade,
    required this.version,
    required this.versionstring,
    required this.edition,
    required this.productname,
    required this.extendedSupport,
  });

  factory CoreServerStatus.fromJson(Map<String, dynamic> json) => _$CoreServerStatusFromJson(json);

  factory CoreServerStatus.fromJsonString(String data) =>
      CoreServerStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool installed;

  final bool maintenance;

  final bool needsDbUpgrade;

  final String version;

  final String versionstring;

  final String edition;

  final String productname;

  final bool extendedSupport;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerStatus data) => json.encode(data.toJson());
}

@JsonSerializable()
class OCSMeta {
  OCSMeta({
    required this.status,
    required this.statuscode,
    this.message,
    this.totalitems,
    this.itemsperpage,
  });

  factory OCSMeta.fromJson(Map<String, dynamic> json) => _$OCSMetaFromJson(json);

  factory OCSMeta.fromJsonString(String data) => OCSMeta.fromJson(json.decode(data) as Map<String, dynamic>);

  final String status;

  final int statuscode;

  final String? message;

  final String? totalitems;

  final String? itemsperpage;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$OCSMetaToJson(this);
  // coverage:ignore-end

  static String toJsonString(OCSMeta data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Version {
  CoreServerCapabilities_Ocs_Data_Version({
    this.major,
    this.minor,
    this.micro,
    this.string,
    this.edition,
    this.extendedSupport,
  });

  factory CoreServerCapabilities_Ocs_Data_Version.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_VersionFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Version.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Version.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? major;

  final int? minor;

  final int? micro;

  final String? string;

  final String? edition;

  final bool? extendedSupport;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_VersionToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Version data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Core {
  CoreServerCapabilities_Ocs_Data_Capabilities_Core({
    this.pollinterval,
    this.webdavRoot,
    this.referenceApi,
    this.referenceRegex,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? pollinterval;

  @JsonKey(name: 'webdav-root')
  final String? webdavRoot;

  @JsonKey(name: 'reference-api')
  final bool? referenceApi;

  @JsonKey(name: 'reference-regex')
  final String? referenceRegex;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Core data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce {
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce({this.delay});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? delay;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable {
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable({
    this.size,
    this.gps,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final List<String>? size;

  final List<String>? gps;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing {
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing({
    this.url,
    this.etag,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final String? url;

  final String? etag;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Files {
  CoreServerCapabilities_Ocs_Data_Capabilities_Files({
    this.bigfilechunking,
    this.blacklistedFiles,
    this.directEditing,
    this.comments,
    this.undelete,
    this.versioning,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? bigfilechunking;

  @JsonKey(name: 'blacklisted_files')
  final List<String>? blacklistedFiles;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? directEditing;

  final bool? comments;

  final bool? undelete;

  final bool? versioning;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Files data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Activity {
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity({this.apiv2});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(json.decode(data) as Map<String, dynamic>);

  final List<String>? apiv2;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Activity data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status({this.globalScale});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? globalScale;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings({
    this.frontendEnabled,
    this.allowedCircles,
    this.allowedUserTypes,
    this.membersLimit,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? frontendEnabled;

  final int? allowedCircles;

  final int? allowedUserTypes;

  final int? membersLimit;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source({
    this.core,
    this.extra,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final dynamic core;

  final dynamic extra;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants({
    this.flags,
    this.source,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final dynamic flags;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? source;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config({
    this.coreFlags,
    this.systemFlags,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final List<int>? coreFlags;

  final List<int>? systemFlags;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle({
    this.constants,
    this.config,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? constants;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? config;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants({this.level});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final dynamic level;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member({
    this.constants,
    this.type,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? constants;

  final dynamic type;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles({
    this.version,
    this.status,
    this.settings,
    this.circle,
    this.member,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(json.decode(data) as Map<String, dynamic>);

  final String? version;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? status;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? settings;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? circle;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? member;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Circles data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols({this.webdav});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final String? webdav;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes({
    this.name,
    this.shareTypes,
    this.protocols,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final String? name;

  final List<String>? shareTypes;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? protocols;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm({
    this.enabled,
    this.apiVersion,
    this.endPoint,
    this.resourceTypes,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  final String? apiVersion;

  final String? endPoint;

  final List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? resourceTypes;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Ocm data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Dav {
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav({
    this.bulkupload,
    this.chunking,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_DavFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(json.decode(data) as Map<String, dynamic>);

  final String? bulkupload;

  final String? chunking;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_DavToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Dav data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password({
    this.enforced,
    this.askForOptionalPassword,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enforced;

  final bool? askForOptionalPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJsonString(
          String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalToJson(this);
  // coverage:ignore-end

  static String toJsonString(
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJsonString(
          String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public({
    this.enabled,
    this.password,
    this.expireDate,
    this.multipleLinks,
    this.expireDateInternal,
    this.expireDateRemote,
    this.sendMail,
    this.upload,
    this.uploadFilesDrop,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? expireDate;

  @JsonKey(name: 'multiple_links')
  final bool? multipleLinks;

  @JsonKey(name: 'expire_date_internal')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal? expireDateInternal;

  @JsonKey(name: 'expire_date_remote')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? expireDateRemote;

  @JsonKey(name: 'send_mail')
  final bool? sendMail;

  final bool? upload;

  @JsonKey(name: 'upload_files_drop')
  final bool? uploadFilesDrop;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User({
    this.sendMail,
    this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(
          json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'send_mail')
  final bool? sendMail;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group({
    this.enabled,
    this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJsonString(
          String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedToJson(this);
  // coverage:ignore-end

  static String toJsonString(
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation({
    this.outgoing,
    this.incoming,
    this.expireDate,
    this.expireDateSupported,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? outgoing;

  final bool? incoming;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? expireDate;

  @JsonKey(name: 'expire_date_supported')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported? expireDateSupported;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee({
    this.queryLookupDefault,
    this.alwaysShowUnique,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(
          json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'query_lookup_default')
  final bool? queryLookupDefault;

  @JsonKey(name: 'always_show_unique')
  final bool? alwaysShowUnique;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJsonString(
          String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropToJson(this);
  // coverage:ignore-end

  static String toJsonString(
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password({
    this.enabled,
    this.enforced,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  final bool? enforced;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate({
    this.enabled,
    this.enforced,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJsonString(
          String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  final bool? enforced;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail({
    this.enabled,
    this.sendPasswordByMail,
    this.uploadFilesDrop,
    this.password,
    this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  @JsonKey(name: 'send_password_by_mail')
  final bool? sendPasswordByMail;

  @JsonKey(name: 'upload_files_drop')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? uploadFilesDrop;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing({
    this.apiEnabled,
    this.public,
    this.resharing,
    this.user,
    this.groupSharing,
    this.group,
    this.defaultPermissions,
    this.federation,
    this.sharee,
    this.sharebymail,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'api_enabled')
  final bool? apiEnabled;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? public;

  final bool? resharing;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? user;

  @JsonKey(name: 'group_sharing')
  final bool? groupSharing;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? group;

  @JsonKey(name: 'default_permissions')
  final int? defaultPermissions;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? federation;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? sharee;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? sharebymail;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Notes {
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes({
    this.apiVersion,
    this.version,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'api_version')
  final List<String>? apiVersion;

  final String? version;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Notes data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Notifications {
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications({
    this.ocsEndpoints,
    this.push,
    this.adminNotifications,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'ocs-endpoints')
  final List<String>? ocsEndpoints;

  final List<String>? push;

  @JsonKey(name: 'admin-notifications')
  final List<String>? adminNotifications;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Notifications data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api {
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api({
    this.generate,
    this.validate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(
          json.decode(data) as Map<String, dynamic>);

  final String? generate;

  final String? validate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy {
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy({
    this.minLength,
    this.enforceNonCommonPassword,
    this.enforceNumericCharacters,
    this.enforceSpecialCharacters,
    this.enforceUpperLowerCase,
    this.api,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? minLength;

  final bool? enforceNonCommonPassword;

  final bool? enforceNumericCharacters;

  final bool? enforceSpecialCharacters;

  final bool? enforceUpperLowerCase;

  final CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? api;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi {
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi({
    this.version,
    this.accountPropertyScopesVersion,
    this.accountPropertyScopesFederatedEnabled,
    this.accountPropertyScopesPublishedEnabled,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(json.decode(data) as Map<String, dynamic>);

  final String? version;

  @JsonKey(name: 'AccountPropertyScopesVersion')
  final int? accountPropertyScopesVersion;

  @JsonKey(name: 'AccountPropertyScopesFederatedEnabled')
  final bool? accountPropertyScopesFederatedEnabled;

  @JsonKey(name: 'AccountPropertyScopesPublishedEnabled')
  final bool? accountPropertyScopesPublishedEnabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_Theming {
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming({
    this.name,
    this.url,
    this.slogan,
    this.color,
    this.colorText,
    this.colorElement,
    this.colorElementBright,
    this.colorElementDark,
    this.logo,
    this.background,
    this.backgroundPlain,
    this.backgroundDefault,
    this.logoheader,
    this.favicon,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(json.decode(data) as Map<String, dynamic>);

  final String? name;

  final String? url;

  final String? slogan;

  final String? color;

  @JsonKey(name: 'color-text')
  final String? colorText;

  @JsonKey(name: 'color-element')
  final String? colorElement;

  @JsonKey(name: 'color-element-bright')
  final String? colorElementBright;

  @JsonKey(name: 'color-element-dark')
  final String? colorElementDark;

  final String? logo;

  final String? background;

  @JsonKey(name: 'background-plain')
  final bool? backgroundPlain;

  @JsonKey(name: 'background-default')
  final bool? backgroundDefault;

  final String? logoheader;

  final String? favicon;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_Theming data) => json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus {
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus({
    this.enabled,
    this.supportsEmoji,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  @JsonKey(name: 'supports_emoji')
  final bool? supportsEmoji;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus data) =>
      json.encode(data.toJson());
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus {
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus({this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus data) =>
      json.encode(data.toJson());
}

@JsonSerializable(disallowUnrecognizedKeys: false)
class CoreServerCapabilities_Ocs_Data_Capabilities {
  CoreServerCapabilities_Ocs_Data_Capabilities({
    this.core,
    this.bruteforce,
    this.metadataAvailable,
    this.files,
    this.activity,
    this.circles,
    this.ocm,
    this.dav,
    this.filesSharing,
    this.notes,
    this.notifications,
    this.passwordPolicy,
    this.provisioningApi,
    this.theming,
    this.userStatus,
    this.weatherStatus,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_CapabilitiesFromJson(json);

  factory CoreServerCapabilities_Ocs_Data_Capabilities.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreServerCapabilities_Ocs_Data_Capabilities_Core? core;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? bruteforce;

  final CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? metadataAvailable;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Files? files;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Activity? activity;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles? circles;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Ocm? ocm;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Dav? dav;

  @JsonKey(name: 'files_sharing')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? filesSharing;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Notes? notes;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Notifications? notifications;

  @JsonKey(name: 'password_policy')
  final CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? passwordPolicy;

  @JsonKey(name: 'provisioning_api')
  final CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? provisioningApi;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Theming? theming;

  @JsonKey(name: 'user_status')
  final CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? userStatus;

  @JsonKey(name: 'weather_status')
  final CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? weatherStatus;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_CapabilitiesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data_Capabilities data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data {
  CoreServerCapabilities_Ocs_Data({
    required this.version,
    required this.capabilities,
  });

  factory CoreServerCapabilities_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_DataFromJson(json);

  factory CoreServerCapabilities_Ocs_Data.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs_Data.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreServerCapabilities_Ocs_Data_Version version;

  final CoreServerCapabilities_Ocs_Data_Capabilities capabilities;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_DataToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs_Data data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreServerCapabilities_Ocs {
  CoreServerCapabilities_Ocs({
    required this.meta,
    required this.data,
  });

  factory CoreServerCapabilities_Ocs.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilities_OcsFromJson(json);

  factory CoreServerCapabilities_Ocs.fromJsonString(String data) =>
      CoreServerCapabilities_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final CoreServerCapabilities_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreServerCapabilities {
  CoreServerCapabilities({required this.ocs});

  factory CoreServerCapabilities.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilitiesFromJson(json);

  factory CoreServerCapabilities.fromJsonString(String data) =>
      CoreServerCapabilities.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreServerCapabilities_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreServerCapabilities data) => json.encode(data.toJson());
}

class CoreNavigationApps_Ocs_Data_Order {
  CoreNavigationApps_Ocs_Data_Order(
    this._data, {
    this.$int,
    this.string,
  });

  factory CoreNavigationApps_Ocs_Data_Order.fromJson(dynamic data) {
    int? $int;
    String? string;
    try {
      $int = (data as int);
    } catch (_) {}
    try {
      string = (data as String);
    } catch (_) {}
    assert([$int, string].where((final x) => x != null).length == 1, 'Need oneOf for $data');
    return CoreNavigationApps_Ocs_Data_Order(
      data,
      $int: $int,
      string: string,
    );
  }

  factory CoreNavigationApps_Ocs_Data_Order.fromJsonString(String data) =>
      CoreNavigationApps_Ocs_Data_Order.fromJson(json.decode(data));

  final dynamic _data;

  final int? $int;

  final String? string;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class CoreNavigationApps_Ocs_Data {
  CoreNavigationApps_Ocs_Data({
    required this.id,
    required this.order,
    required this.href,
    required this.icon,
    required this.type,
    required this.name,
    required this.active,
    required this.classes,
    required this.unread,
  });

  factory CoreNavigationApps_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      _$CoreNavigationApps_Ocs_DataFromJson(json);

  factory CoreNavigationApps_Ocs_Data.fromJsonString(String data) =>
      CoreNavigationApps_Ocs_Data.fromJson(json.decode(data) as Map<String, dynamic>);

  final String id;

  /// Should always be an integer, but there is a bug. See https://github.com/nextcloud/server/issues/32828
  final CoreNavigationApps_Ocs_Data_Order order;

  final String href;

  final String icon;

  final String type;

  final String name;

  final bool active;

  final String classes;

  final int unread;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreNavigationApps_Ocs_DataToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreNavigationApps_Ocs_Data data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreNavigationApps_Ocs {
  CoreNavigationApps_Ocs({
    required this.meta,
    required this.data,
  });

  factory CoreNavigationApps_Ocs.fromJson(Map<String, dynamic> json) => _$CoreNavigationApps_OcsFromJson(json);

  factory CoreNavigationApps_Ocs.fromJsonString(String data) =>
      CoreNavigationApps_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final List<CoreNavigationApps_Ocs_Data> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreNavigationApps_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreNavigationApps_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreNavigationApps {
  CoreNavigationApps({required this.ocs});

  factory CoreNavigationApps.fromJson(Map<String, dynamic> json) => _$CoreNavigationAppsFromJson(json);

  factory CoreNavigationApps.fromJsonString(String data) =>
      CoreNavigationApps.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreNavigationApps_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreNavigationAppsToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreNavigationApps data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreLoginFlowInit_Poll {
  CoreLoginFlowInit_Poll({
    required this.token,
    required this.endpoint,
  });

  factory CoreLoginFlowInit_Poll.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInit_PollFromJson(json);

  factory CoreLoginFlowInit_Poll.fromJsonString(String data) =>
      CoreLoginFlowInit_Poll.fromJson(json.decode(data) as Map<String, dynamic>);

  final String token;

  final String endpoint;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowInit_PollToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreLoginFlowInit_Poll data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreLoginFlowInit {
  CoreLoginFlowInit({
    required this.poll,
    required this.login,
  });

  factory CoreLoginFlowInit.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInitFromJson(json);

  factory CoreLoginFlowInit.fromJsonString(String data) =>
      CoreLoginFlowInit.fromJson(json.decode(data) as Map<String, dynamic>);

  final CoreLoginFlowInit_Poll poll;

  final String login;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowInitToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreLoginFlowInit data) => json.encode(data.toJson());
}

@JsonSerializable()
class CoreLoginFlowResult {
  CoreLoginFlowResult({
    required this.server,
    required this.loginName,
    required this.appPassword,
  });

  factory CoreLoginFlowResult.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowResultFromJson(json);

  factory CoreLoginFlowResult.fromJsonString(String data) =>
      CoreLoginFlowResult.fromJson(json.decode(data) as Map<String, dynamic>);

  final String server;

  final String loginName;

  final String appPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowResultToJson(this);
  // coverage:ignore-end

  static String toJsonString(CoreLoginFlowResult data) => json.encode(data.toJson());
}

@JsonSerializable()
class GetSupportedApiVersions {
  GetSupportedApiVersions({this.apiLevels});

  factory GetSupportedApiVersions.fromJson(Map<String, dynamic> json) => _$GetSupportedApiVersionsFromJson(json);

  factory GetSupportedApiVersions.fromJsonString(String data) =>
      GetSupportedApiVersions.fromJson(json.decode(data) as Map<String, dynamic>);

  final List<String>? apiLevels;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$GetSupportedApiVersionsToJson(this);
  // coverage:ignore-end

  static String toJsonString(GetSupportedApiVersions data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsArticle {
  NewsArticle({
    required this.id,
    required this.guid,
    required this.guidHash,
    this.url,
    required this.title,
    this.author,
    required this.pubDate,
    this.updatedDate,
    required this.body,
    this.enclosureMime,
    this.enclosureLink,
    this.mediaThumbnail,
    this.mediaDescription,
    required this.feedId,
    required this.unread,
    required this.starred,
    required this.lastModified,
    required this.rtl,
    required this.fingerprint,
    required this.contentHash,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);

  factory NewsArticle.fromJsonString(String data) => NewsArticle.fromJson(json.decode(data) as Map<String, dynamic>);

  final int id;

  final String guid;

  final String guidHash;

  final String? url;

  final String title;

  final String? author;

  final int pubDate;

  final int? updatedDate;

  final String body;

  final String? enclosureMime;

  final String? enclosureLink;

  final String? mediaThumbnail;

  final String? mediaDescription;

  final int feedId;

  final bool unread;

  final bool starred;

  final int lastModified;

  final bool rtl;

  final String fingerprint;

  final String contentHash;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsArticle data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsFeed {
  NewsFeed({
    required this.id,
    required this.url,
    required this.title,
    required this.faviconLink,
    required this.added,
    this.folderId,
    this.unreadCount,
    required this.ordering,
    this.link,
    required this.pinned,
    required this.updateErrorCount,
    this.lastUpdateError,
    required this.items,
  });

  factory NewsFeed.fromJson(Map<String, dynamic> json) => _$NewsFeedFromJson(json);

  factory NewsFeed.fromJsonString(String data) => NewsFeed.fromJson(json.decode(data) as Map<String, dynamic>);

  final int id;

  final String url;

  final String title;

  final String faviconLink;

  final int added;

  final int? folderId;

  final int? unreadCount;

  final int ordering;

  final String? link;

  final bool pinned;

  final int updateErrorCount;

  final String? lastUpdateError;

  final List<NewsArticle> items;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsFeedToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsFeed data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsFolder {
  NewsFolder({
    required this.id,
    required this.name,
    required this.opened,
    required this.feeds,
  });

  factory NewsFolder.fromJson(Map<String, dynamic> json) => _$NewsFolderFromJson(json);

  factory NewsFolder.fromJsonString(String data) => NewsFolder.fromJson(json.decode(data) as Map<String, dynamic>);

  final int id;

  final String name;

  final bool opened;

  /// This seems to be broken. In testing it is always empty
  final List<NewsFeed> feeds;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsFolderToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsFolder data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsListFolders {
  NewsListFolders({required this.folders});

  factory NewsListFolders.fromJson(Map<String, dynamic> json) => _$NewsListFoldersFromJson(json);

  factory NewsListFolders.fromJsonString(String data) =>
      NewsListFolders.fromJson(json.decode(data) as Map<String, dynamic>);

  final List<NewsFolder> folders;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListFoldersToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsListFolders data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsListFeeds {
  NewsListFeeds({
    this.starredCount,
    this.newestItemId,
    required this.feeds,
  });

  factory NewsListFeeds.fromJson(Map<String, dynamic> json) => _$NewsListFeedsFromJson(json);

  factory NewsListFeeds.fromJsonString(String data) =>
      NewsListFeeds.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? starredCount;

  final int? newestItemId;

  final List<NewsFeed> feeds;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListFeedsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsListFeeds data) => json.encode(data.toJson());
}

@JsonSerializable()
class NewsListArticles {
  NewsListArticles({required this.items});

  factory NewsListArticles.fromJson(Map<String, dynamic> json) => _$NewsListArticlesFromJson(json);

  factory NewsListArticles.fromJsonString(String data) =>
      NewsListArticles.fromJson(json.decode(data) as Map<String, dynamic>);

  final List<NewsArticle> items;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListArticlesToJson(this);
  // coverage:ignore-end

  static String toJsonString(NewsListArticles data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotesNote {
  NotesNote({
    required this.id,
    required this.etag,
    required this.readonly,
    required this.content,
    required this.title,
    required this.category,
    required this.favorite,
    required this.modified,
    required this.error,
    required this.errorType,
  });

  factory NotesNote.fromJson(Map<String, dynamic> json) => _$NotesNoteFromJson(json);

  factory NotesNote.fromJsonString(String data) => NotesNote.fromJson(json.decode(data) as Map<String, dynamic>);

  final int id;

  final String etag;

  final bool readonly;

  final String content;

  final String title;

  final String category;

  final bool favorite;

  final int modified;

  final bool error;

  final String errorType;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotesNoteToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotesNote data) => json.encode(data.toJson());
}

enum NotesSettings_NoteMode {
  edit('edit'),
  preview('preview');

  const NotesSettings_NoteMode(this.value);

  final String value;

  static NotesSettings_NoteMode fromValue(String value) {
    switch (value) {
      case 'edit':
        return NotesSettings_NoteMode.edit;
      case 'preview':
        return NotesSettings_NoteMode.preview;
      default:
        throw Exception('Can not parse NotesSettings_NoteMode from "$value"');
    }
  }
}

@JsonSerializable()
class NotesSettings {
  NotesSettings({
    required this.notesPath,
    required this.fileSuffix,
    required this.noteMode,
  });

  factory NotesSettings.fromJson(Map<String, dynamic> json) => _$NotesSettingsFromJson(json);

  factory NotesSettings.fromJsonString(String data) =>
      NotesSettings.fromJson(json.decode(data) as Map<String, dynamic>);

  final String notesPath;

  final String fileSuffix;

  final NotesSettings_NoteMode noteMode;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotesSettingsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotesSettings data) => json.encode(data.toJson());
}

class NotificationsNotification_SubjectRichParameters {
  NotificationsNotification_SubjectRichParameters(
    this._data, {
    this.mapStringDynamic,
  });

  factory NotificationsNotification_SubjectRichParameters.fromJson(dynamic data) {
    Map<String, dynamic>? mapStringDynamic;
    try {
      mapStringDynamic = (data as Map<String, dynamic>);
    } catch (_) {}
    return NotificationsNotification_SubjectRichParameters(
      data,
      mapStringDynamic: mapStringDynamic,
    );
  }

  factory NotificationsNotification_SubjectRichParameters.fromJsonString(String data) =>
      NotificationsNotification_SubjectRichParameters.fromJson(json.decode(data));

  final dynamic _data;

  final Map<String, dynamic>? mapStringDynamic;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

class NotificationsNotification_MessageRichParameters {
  NotificationsNotification_MessageRichParameters(
    this._data, {
    this.mapStringDynamic,
  });

  factory NotificationsNotification_MessageRichParameters.fromJson(dynamic data) {
    Map<String, dynamic>? mapStringDynamic;
    try {
      mapStringDynamic = (data as Map<String, dynamic>);
    } catch (_) {}
    return NotificationsNotification_MessageRichParameters(
      data,
      mapStringDynamic: mapStringDynamic,
    );
  }

  factory NotificationsNotification_MessageRichParameters.fromJsonString(String data) =>
      NotificationsNotification_MessageRichParameters.fromJson(json.decode(data));

  final dynamic _data;

  final Map<String, dynamic>? mapStringDynamic;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class NotificationsNotificationAction {
  NotificationsNotificationAction({
    required this.label,
    required this.link,
    required this.type,
    this.primary,
  });

  factory NotificationsNotificationAction.fromJson(Map<String, dynamic> json) =>
      _$NotificationsNotificationActionFromJson(json);

  factory NotificationsNotificationAction.fromJsonString(String data) =>
      NotificationsNotificationAction.fromJson(json.decode(data) as Map<String, dynamic>);

  final String label;

  final String link;

  final String type;

  final bool? primary;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsNotificationActionToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsNotificationAction data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsNotification {
  NotificationsNotification({
    required this.notificationId,
    required this.app,
    required this.user,
    required this.datetime,
    required this.objectType,
    required this.objectId,
    required this.subject,
    required this.message,
    required this.link,
    required this.subjectRich,
    required this.subjectRichParameters,
    required this.messageRich,
    required this.messageRichParameters,
    required this.icon,
    required this.actions,
  });

  factory NotificationsNotification.fromJson(Map<String, dynamic> json) => _$NotificationsNotificationFromJson(json);

  factory NotificationsNotification.fromJsonString(String data) =>
      NotificationsNotification.fromJson(json.decode(data) as Map<String, dynamic>);

  @JsonKey(name: 'notification_id')
  final int notificationId;

  final String app;

  final String user;

  final String datetime;

  @JsonKey(name: 'object_type')
  final String objectType;

  @JsonKey(name: 'object_id')
  final String objectId;

  final String subject;

  final String message;

  final String link;

  final String subjectRich;

  final NotificationsNotification_SubjectRichParameters subjectRichParameters;

  final String messageRich;

  final NotificationsNotification_MessageRichParameters messageRichParameters;

  final String icon;

  final List<NotificationsNotificationAction> actions;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsNotificationToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsNotification data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsListNotifications_Ocs {
  NotificationsListNotifications_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsListNotifications_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotifications_OcsFromJson(json);

  factory NotificationsListNotifications_Ocs.fromJsonString(String data) =>
      NotificationsListNotifications_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final List<NotificationsNotification> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsListNotifications_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsListNotifications_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsListNotifications {
  NotificationsListNotifications({required this.ocs});

  factory NotificationsListNotifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotificationsFromJson(json);

  factory NotificationsListNotifications.fromJsonString(String data) =>
      NotificationsListNotifications.fromJson(json.decode(data) as Map<String, dynamic>);

  final NotificationsListNotifications_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsListNotificationsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsListNotifications data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsGetNotification_Ocs {
  NotificationsGetNotification_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsGetNotification_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotification_OcsFromJson(json);

  factory NotificationsGetNotification_Ocs.fromJsonString(String data) =>
      NotificationsGetNotification_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final NotificationsNotification data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsGetNotification_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsGetNotification_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsGetNotification {
  NotificationsGetNotification({required this.ocs});

  factory NotificationsGetNotification.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotificationFromJson(json);

  factory NotificationsGetNotification.fromJsonString(String data) =>
      NotificationsGetNotification.fromJson(json.decode(data) as Map<String, dynamic>);

  final NotificationsGetNotification_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsGetNotificationToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsGetNotification data) => json.encode(data.toJson());
}

@JsonSerializable()
class EmptyOCS_Ocs {
  EmptyOCS_Ocs({
    required this.meta,
    required this.data,
  });

  factory EmptyOCS_Ocs.fromJson(Map<String, dynamic> json) => _$EmptyOCS_OcsFromJson(json);

  factory EmptyOCS_Ocs.fromJsonString(String data) => EmptyOCS_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final List data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$EmptyOCS_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(EmptyOCS_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class EmptyOCS {
  EmptyOCS({required this.ocs});

  factory EmptyOCS.fromJson(Map<String, dynamic> json) => _$EmptyOCSFromJson(json);

  factory EmptyOCS.fromJsonString(String data) => EmptyOCS.fromJson(json.decode(data) as Map<String, dynamic>);

  final EmptyOCS_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$EmptyOCSToJson(this);
  // coverage:ignore-end

  static String toJsonString(EmptyOCS data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsPushServerSubscription {
  NotificationsPushServerSubscription({
    required this.publicKey,
    required this.deviceIdentifier,
    required this.signature,
    this.message,
  });

  factory NotificationsPushServerSubscription.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerSubscriptionFromJson(json);

  factory NotificationsPushServerSubscription.fromJsonString(String data) =>
      NotificationsPushServerSubscription.fromJson(json.decode(data) as Map<String, dynamic>);

  final String publicKey;

  final String deviceIdentifier;

  final String signature;

  final String? message;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerSubscriptionToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsPushServerSubscription data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsPushServerRegistration_Ocs {
  NotificationsPushServerRegistration_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsPushServerRegistration_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistration_OcsFromJson(json);

  factory NotificationsPushServerRegistration_Ocs.fromJsonString(String data) =>
      NotificationsPushServerRegistration_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final NotificationsPushServerSubscription data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistration_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsPushServerRegistration_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsPushServerRegistration {
  NotificationsPushServerRegistration({required this.ocs});

  factory NotificationsPushServerRegistration.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistrationFromJson(json);

  factory NotificationsPushServerRegistration.fromJsonString(String data) =>
      NotificationsPushServerRegistration.fromJson(json.decode(data) as Map<String, dynamic>);

  final NotificationsPushServerRegistration_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistrationToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsPushServerRegistration data) => json.encode(data.toJson());
}

@JsonSerializable()
class ProvisioningApiUserDetails_Quota {
  ProvisioningApiUserDetails_Quota({
    required this.free,
    required this.used,
    required this.total,
    required this.relative,
    required this.quota,
  });

  factory ProvisioningApiUserDetails_Quota.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningApiUserDetails_QuotaFromJson(json);

  factory ProvisioningApiUserDetails_Quota.fromJsonString(String data) =>
      ProvisioningApiUserDetails_Quota.fromJson(json.decode(data) as Map<String, dynamic>);

  final int free;

  final int used;

  final int total;

  final num relative;

  final int quota;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetails_QuotaToJson(this);
  // coverage:ignore-end

  static String toJsonString(ProvisioningApiUserDetails_Quota data) => json.encode(data.toJson());
}

@JsonSerializable()
class ProvisioningApiUserDetails_BackendCapabilities {
  ProvisioningApiUserDetails_BackendCapabilities({
    required this.setDisplayName,
    required this.setPassword,
  });

  factory ProvisioningApiUserDetails_BackendCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningApiUserDetails_BackendCapabilitiesFromJson(json);

  factory ProvisioningApiUserDetails_BackendCapabilities.fromJsonString(String data) =>
      ProvisioningApiUserDetails_BackendCapabilities.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool setDisplayName;

  final bool setPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetails_BackendCapabilitiesToJson(this);
  // coverage:ignore-end

  static String toJsonString(ProvisioningApiUserDetails_BackendCapabilities data) => json.encode(data.toJson());
}

@JsonSerializable()
class ProvisioningApiUserDetails {
  ProvisioningApiUserDetails({
    this.enabled,
    required this.storageLocation,
    required this.id,
    required this.lastLogin,
    required this.backend,
    required this.subadmin,
    required this.quota,
    required this.avatarScope,
    this.email,
    required this.emailScope,
    required this.additionalMail,
    required this.additionalMailScope,
    this.displayname,
    required this.displaynameScope,
    required this.phone,
    required this.phoneScope,
    required this.address,
    required this.addressScope,
    required this.website,
    required this.websiteScope,
    required this.twitter,
    required this.twitterScope,
    required this.organisation,
    required this.organisationScope,
    required this.role,
    required this.roleScope,
    required this.headline,
    required this.headlineScope,
    required this.biography,
    required this.biographyScope,
    required this.profileEnabled,
    required this.profileEnabledScope,
    required this.groups,
    required this.language,
    required this.locale,
    this.notifyEmail,
    required this.backendCapabilities,
    this.displayName,
  });

  factory ProvisioningApiUserDetails.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserDetailsFromJson(json);

  factory ProvisioningApiUserDetails.fromJsonString(String data) =>
      ProvisioningApiUserDetails.fromJson(json.decode(data) as Map<String, dynamic>);

  final bool? enabled;

  final String storageLocation;

  final String id;

  final int lastLogin;

  final String backend;

  final List<String> subadmin;

  final ProvisioningApiUserDetails_Quota quota;

  final String avatarScope;

  final String? email;

  final String emailScope;

  @JsonKey(name: 'additional_mail')
  final List<String> additionalMail;

  @JsonKey(name: 'additional_mailScope')
  final List<String> additionalMailScope;

  final String? displayname;

  final String displaynameScope;

  final String phone;

  final String phoneScope;

  final String address;

  final String addressScope;

  final String website;

  final String websiteScope;

  final String twitter;

  final String twitterScope;

  final String organisation;

  final String organisationScope;

  final String role;

  final String roleScope;

  final String headline;

  final String headlineScope;

  final String biography;

  final String biographyScope;

  @JsonKey(name: 'profile_enabled')
  final String profileEnabled;

  @JsonKey(name: 'profile_enabledScope')
  final String profileEnabledScope;

  final List<String> groups;

  final String language;

  final String locale;

  @JsonKey(name: 'notify_email')
  final String? notifyEmail;

  final ProvisioningApiUserDetails_BackendCapabilities backendCapabilities;

  @JsonKey(name: 'display-name')
  final String? displayName;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetailsToJson(this);
  // coverage:ignore-end

  static String toJsonString(ProvisioningApiUserDetails data) => json.encode(data.toJson());
}

@JsonSerializable()
class ProvisioningApiUser_Ocs {
  ProvisioningApiUser_Ocs({
    required this.meta,
    required this.data,
  });

  factory ProvisioningApiUser_Ocs.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUser_OcsFromJson(json);

  factory ProvisioningApiUser_Ocs.fromJsonString(String data) =>
      ProvisioningApiUser_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final ProvisioningApiUserDetails data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUser_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(ProvisioningApiUser_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class ProvisioningApiUser {
  ProvisioningApiUser({required this.ocs});

  factory ProvisioningApiUser.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserFromJson(json);

  factory ProvisioningApiUser.fromJsonString(String data) =>
      ProvisioningApiUser.fromJson(json.decode(data) as Map<String, dynamic>);

  final ProvisioningApiUser_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserToJson(this);
  // coverage:ignore-end

  static String toJsonString(ProvisioningApiUser data) => json.encode(data.toJson());
}

enum UserStatusClearAt_Type {
  period('period'),
  @JsonValue('end-of')
  endOf('end-of');

  const UserStatusClearAt_Type(this.value);

  final String value;

  static UserStatusClearAt_Type fromValue(String value) {
    switch (value) {
      case 'period':
        return UserStatusClearAt_Type.period;
      case 'end-of':
        return UserStatusClearAt_Type.endOf;
      default:
        throw Exception('Can not parse UserStatusClearAt_Type from "$value"');
    }
  }
}

enum UserStatusClearAt_Time0 {
  day('day'),
  week('week');

  const UserStatusClearAt_Time0(this.value);

  final String value;

  static UserStatusClearAt_Time0 fromValue(String value) {
    switch (value) {
      case 'day':
        return UserStatusClearAt_Time0.day;
      case 'week':
        return UserStatusClearAt_Time0.week;
      default:
        throw Exception('Can not parse UserStatusClearAt_Time0 from "$value"');
    }
  }
}

class UserStatusClearAt_Time {
  UserStatusClearAt_Time(
    this._data, {
    this.userStatusClearAtTime0,
    this.$int,
  });

  factory UserStatusClearAt_Time.fromJson(dynamic data) {
    UserStatusClearAt_Time0? userStatusClearAtTime0;
    int? $int;
    try {
      userStatusClearAtTime0 = UserStatusClearAt_Time0.fromValue(data as String);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    assert([userStatusClearAtTime0, $int].where((final x) => x != null).length == 1, 'Need oneOf for $data');
    return UserStatusClearAt_Time(
      data,
      userStatusClearAtTime0: userStatusClearAtTime0,
      $int: $int,
    );
  }

  factory UserStatusClearAt_Time.fromJsonString(String data) => UserStatusClearAt_Time.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatusClearAt_Time0? userStatusClearAtTime0;

  /// Time offset in seconds
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class UserStatusClearAt {
  UserStatusClearAt({
    required this.type,
    required this.time,
  });

  factory UserStatusClearAt.fromJson(Map<String, dynamic> json) => _$UserStatusClearAtFromJson(json);

  factory UserStatusClearAt.fromJsonString(String data) =>
      UserStatusClearAt.fromJson(json.decode(data) as Map<String, dynamic>);

  final UserStatusClearAt_Type type;

  final UserStatusClearAt_Time time;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusClearAtToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusClearAt data) => json.encode(data.toJson());
}

class UserStatusPublicUserStatus_ClearAt {
  UserStatusPublicUserStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory UserStatusPublicUserStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    return UserStatusPublicUserStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  factory UserStatusPublicUserStatus_ClearAt.fromJsonString(String data) =>
      UserStatusPublicUserStatus_ClearAt.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

enum UserStatusType {
  online('online'),
  offline('offline'),
  dnd('dnd'),
  away('away'),
  invisible('invisible');

  const UserStatusType(this.value);

  final String value;

  static UserStatusType fromValue(String value) {
    switch (value) {
      case 'online':
        return UserStatusType.online;
      case 'offline':
        return UserStatusType.offline;
      case 'dnd':
        return UserStatusType.dnd;
      case 'away':
        return UserStatusType.away;
      case 'invisible':
        return UserStatusType.invisible;
      default:
        throw Exception('Can not parse UserStatusType from "$value"');
    }
  }
}

@JsonSerializable()
class UserStatusPublicUserStatus {
  UserStatusPublicUserStatus({
    required this.userId,
    this.message,
    this.icon,
    required this.clearAt,
    required this.status,
  });

  factory UserStatusPublicUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusPublicUserStatusFromJson(json);

  factory UserStatusPublicUserStatus.fromJsonString(String data) =>
      UserStatusPublicUserStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final String userId;

  final String? message;

  final String? icon;

  final UserStatusPublicUserStatus_ClearAt clearAt;

  final UserStatusType status;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPublicUserStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusPublicUserStatus data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusFindAllStatuses_Ocs {
  UserStatusFindAllStatuses_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusFindAllStatuses_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFindAllStatuses_OcsFromJson(json);

  factory UserStatusFindAllStatuses_Ocs.fromJsonString(String data) =>
      UserStatusFindAllStatuses_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final List<UserStatusPublicUserStatus> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindAllStatuses_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusFindAllStatuses_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusFindAllStatuses {
  UserStatusFindAllStatuses({required this.ocs});

  factory UserStatusFindAllStatuses.fromJson(Map<String, dynamic> json) => _$UserStatusFindAllStatusesFromJson(json);

  factory UserStatusFindAllStatuses.fromJsonString(String data) =>
      UserStatusFindAllStatuses.fromJson(json.decode(data) as Map<String, dynamic>);

  final UserStatusFindAllStatuses_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindAllStatusesToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusFindAllStatuses data) => json.encode(data.toJson());
}

class UserStatusFindStatus_Ocs_Data {
  UserStatusFindStatus_Ocs_Data(
    this._data, {
    this.userStatusPublicUserStatus,
  });

  factory UserStatusFindStatus_Ocs_Data.fromJson(dynamic data) {
    UserStatusPublicUserStatus? userStatusPublicUserStatus;
    try {
      userStatusPublicUserStatus = UserStatusPublicUserStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    return UserStatusFindStatus_Ocs_Data(
      data,
      userStatusPublicUserStatus: userStatusPublicUserStatus,
    );
  }

  factory UserStatusFindStatus_Ocs_Data.fromJsonString(String data) =>
      UserStatusFindStatus_Ocs_Data.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatusPublicUserStatus? userStatusPublicUserStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class UserStatusFindStatus_Ocs {
  UserStatusFindStatus_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusFindStatus_Ocs.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatus_OcsFromJson(json);

  factory UserStatusFindStatus_Ocs.fromJsonString(String data) =>
      UserStatusFindStatus_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final UserStatusFindStatus_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindStatus_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusFindStatus_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusFindStatus {
  UserStatusFindStatus({required this.ocs});

  factory UserStatusFindStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatusFromJson(json);

  factory UserStatusFindStatus.fromJsonString(String data) =>
      UserStatusFindStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final UserStatusFindStatus_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusFindStatus data) => json.encode(data.toJson());
}

class UserStatus_ClearAt {
  UserStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory UserStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    return UserStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  factory UserStatus_ClearAt.fromJsonString(String data) => UserStatus_ClearAt.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class UserStatus {
  UserStatus({
    required this.userId,
    this.message,
    this.messageId,
    required this.messageIsPredefined,
    this.icon,
    required this.clearAt,
    required this.status,
    required this.statusIsUserDefined,
  });

  factory UserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFromJson(json);

  factory UserStatus.fromJsonString(String data) => UserStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final String userId;

  final String? message;

  final String? messageId;

  final bool messageIsPredefined;

  final String? icon;

  final UserStatus_ClearAt clearAt;

  final UserStatusType status;

  final bool statusIsUserDefined;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatus data) => json.encode(data.toJson());
}

class UserStatusGetUserStatus_Ocs_Data {
  UserStatusGetUserStatus_Ocs_Data(
    this._data, {
    this.userStatus,
  });

  factory UserStatusGetUserStatus_Ocs_Data.fromJson(dynamic data) {
    UserStatus? userStatus;
    try {
      userStatus = UserStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    return UserStatusGetUserStatus_Ocs_Data(
      data,
      userStatus: userStatus,
    );
  }

  factory UserStatusGetUserStatus_Ocs_Data.fromJsonString(String data) =>
      UserStatusGetUserStatus_Ocs_Data.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatus? userStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class UserStatusGetUserStatus_Ocs {
  UserStatusGetUserStatus_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusGetUserStatus_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusGetUserStatus_OcsFromJson(json);

  factory UserStatusGetUserStatus_Ocs.fromJsonString(String data) =>
      UserStatusGetUserStatus_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final UserStatusGetUserStatus_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusGetUserStatus_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusGetUserStatus_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusGetUserStatus {
  UserStatusGetUserStatus({required this.ocs});

  factory UserStatusGetUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusGetUserStatusFromJson(json);

  factory UserStatusGetUserStatus.fromJsonString(String data) =>
      UserStatusGetUserStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final UserStatusGetUserStatus_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusGetUserStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusGetUserStatus data) => json.encode(data.toJson());
}

class UserStatusPredefinedStatus_ClearAt {
  UserStatusPredefinedStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory UserStatusPredefinedStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    return UserStatusPredefinedStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  factory UserStatusPredefinedStatus_ClearAt.fromJsonString(String data) =>
      UserStatusPredefinedStatus_ClearAt.fromJson(json.decode(data));

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end

  static String toJsonString(dynamic data) => json.encode(data);
}

@JsonSerializable()
class UserStatusPredefinedStatus {
  UserStatusPredefinedStatus({
    required this.id,
    required this.icon,
    required this.message,
    required this.clearAt,
  });

  factory UserStatusPredefinedStatus.fromJson(Map<String, dynamic> json) => _$UserStatusPredefinedStatusFromJson(json);

  factory UserStatusPredefinedStatus.fromJsonString(String data) =>
      UserStatusPredefinedStatus.fromJson(json.decode(data) as Map<String, dynamic>);

  final String id;

  final String icon;

  final String message;

  final UserStatusPredefinedStatus_ClearAt clearAt;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusPredefinedStatus data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusPredefinedStatuses_Ocs {
  UserStatusPredefinedStatuses_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusPredefinedStatuses_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatuses_OcsFromJson(json);

  factory UserStatusPredefinedStatuses_Ocs.fromJsonString(String data) =>
      UserStatusPredefinedStatuses_Ocs.fromJson(json.decode(data) as Map<String, dynamic>);

  final OCSMeta meta;

  final List<UserStatusPredefinedStatus> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatuses_OcsToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusPredefinedStatuses_Ocs data) => json.encode(data.toJson());
}

@JsonSerializable()
class UserStatusPredefinedStatuses {
  UserStatusPredefinedStatuses({required this.ocs});

  factory UserStatusPredefinedStatuses.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatusesFromJson(json);

  factory UserStatusPredefinedStatuses.fromJsonString(String data) =>
      UserStatusPredefinedStatuses.fromJson(json.decode(data) as Map<String, dynamic>);

  final UserStatusPredefinedStatuses_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusesToJson(this);
  // coverage:ignore-end

  static String toJsonString(UserStatusPredefinedStatuses data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsPushNotificationDecryptedSubject {
  NotificationsPushNotificationDecryptedSubject({
    this.nid,
    this.app,
    this.subject,
    this.type,
    this.id,
    this.delete,
    this.deleteAll,
  });

  factory NotificationsPushNotificationDecryptedSubject.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushNotificationDecryptedSubjectFromJson(json);

  factory NotificationsPushNotificationDecryptedSubject.fromJsonString(String data) =>
      NotificationsPushNotificationDecryptedSubject.fromJson(json.decode(data) as Map<String, dynamic>);

  final int? nid;

  final String? app;

  final String? subject;

  final String? type;

  final String? id;

  final bool? delete;

  @JsonKey(name: 'delete-all')
  final bool? deleteAll;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushNotificationDecryptedSubjectToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsPushNotificationDecryptedSubject data) => json.encode(data.toJson());
}

@JsonSerializable()
class NotificationsPushNotification {
  NotificationsPushNotification({
    required this.accountID,
    required this.priority,
    required this.type,
    required this.subject,
  });

  factory NotificationsPushNotification.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushNotificationFromJson(json);

  factory NotificationsPushNotification.fromJsonString(String data) =>
      NotificationsPushNotification.fromJson(json.decode(data) as Map<String, dynamic>);

  final String accountID;

  final String priority;

  final String type;

  final NotificationsPushNotificationDecryptedSubject subject;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushNotificationToJson(this);
  // coverage:ignore-end

  static String toJsonString(NotificationsPushNotification data) => json.encode(data.toJson());
}

// coverage:ignore-start
final _deserializers = <Type, dynamic Function(dynamic)>{
  CoreServerStatus: (final data) => CoreServerStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerStatus>: (final data) =>
      (data as List).map((final e) => CoreServerStatus.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities: (final data) => CoreServerCapabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities>: (final data) =>
      (data as List).map((final e) => CoreServerCapabilities.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities_Ocs: (final data) => CoreServerCapabilities_Ocs.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs>: (final data) =>
      (data as List).map((final e) => CoreServerCapabilities_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  OCSMeta: (final data) => OCSMeta.fromJson(data as Map<String, dynamic>),
  List<OCSMeta>: (final data) => (data as List).map((final e) => OCSMeta.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities_Ocs_Data: (final data) =>
      CoreServerCapabilities_Ocs_Data.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data>: (final data) =>
      (data as List).map((final e) => CoreServerCapabilities_Ocs_Data.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities_Ocs_Data_Version: (final data) =>
      CoreServerCapabilities_Ocs_Data_Version.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Version>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Version.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Core: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Core>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>: (final data) => (data
          as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>: (final data) =>
      (data as List)
          .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
              e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>: (final data) =>
      (data as List)
          .map((final e) =>
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>: (final data) => (data
          as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>: (final data) => (data as List)
      .map((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>: (final data) => (data as List)
      .map(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>: (final data) => (data as List)
      .map((final e) => CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationApps: (final data) => CoreNavigationApps.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps>: (final data) =>
      (data as List).map((final e) => CoreNavigationApps.fromJson(e as Map<String, dynamic>)).toList(),
  CoreNavigationApps_Ocs: (final data) => CoreNavigationApps_Ocs.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps_Ocs>: (final data) =>
      (data as List).map((final e) => CoreNavigationApps_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  CoreNavigationApps_Ocs_Data: (final data) => CoreNavigationApps_Ocs_Data.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps_Ocs_Data>: (final data) =>
      (data as List).map((final e) => CoreNavigationApps_Ocs_Data.fromJson(e as Map<String, dynamic>)).toList(),
  CoreLoginFlowInit: (final data) => CoreLoginFlowInit.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInit>: (final data) =>
      (data as List).map((final e) => CoreLoginFlowInit.fromJson(e as Map<String, dynamic>)).toList(),
  CoreLoginFlowInit_Poll: (final data) => CoreLoginFlowInit_Poll.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInit_Poll>: (final data) =>
      (data as List).map((final e) => CoreLoginFlowInit_Poll.fromJson(e as Map<String, dynamic>)).toList(),
  CoreLoginFlowResult: (final data) => CoreLoginFlowResult.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowResult>: (final data) =>
      (data as List).map((final e) => CoreLoginFlowResult.fromJson(e as Map<String, dynamic>)).toList(),
  GetSupportedApiVersions: (final data) => GetSupportedApiVersions.fromJson(data as Map<String, dynamic>),
  List<GetSupportedApiVersions>: (final data) =>
      (data as List).map((final e) => GetSupportedApiVersions.fromJson(e as Map<String, dynamic>)).toList(),
  NewsListFolders: (final data) => NewsListFolders.fromJson(data as Map<String, dynamic>),
  List<NewsListFolders>: (final data) =>
      (data as List).map((final e) => NewsListFolders.fromJson(e as Map<String, dynamic>)).toList(),
  NewsFolder: (final data) => NewsFolder.fromJson(data as Map<String, dynamic>),
  List<NewsFolder>: (final data) =>
      (data as List).map((final e) => NewsFolder.fromJson(e as Map<String, dynamic>)).toList(),
  NewsFeed: (final data) => NewsFeed.fromJson(data as Map<String, dynamic>),
  List<NewsFeed>: (final data) =>
      (data as List).map((final e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
  NewsArticle: (final data) => NewsArticle.fromJson(data as Map<String, dynamic>),
  List<NewsArticle>: (final data) =>
      (data as List).map((final e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
  NewsListFeeds: (final data) => NewsListFeeds.fromJson(data as Map<String, dynamic>),
  List<NewsListFeeds>: (final data) =>
      (data as List).map((final e) => NewsListFeeds.fromJson(e as Map<String, dynamic>)).toList(),
  NewsListArticles: (final data) => NewsListArticles.fromJson(data as Map<String, dynamic>),
  List<NewsListArticles>: (final data) =>
      (data as List).map((final e) => NewsListArticles.fromJson(e as Map<String, dynamic>)).toList(),
  NotesNote: (final data) => NotesNote.fromJson(data as Map<String, dynamic>),
  List<NotesNote>: (final data) =>
      (data as List).map((final e) => NotesNote.fromJson(e as Map<String, dynamic>)).toList(),
  NotesSettings: (final data) => NotesSettings.fromJson(data as Map<String, dynamic>),
  List<NotesSettings>: (final data) =>
      (data as List).map((final e) => NotesSettings.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsListNotifications: (final data) => NotificationsListNotifications.fromJson(data as Map<String, dynamic>),
  List<NotificationsListNotifications>: (final data) =>
      (data as List).map((final e) => NotificationsListNotifications.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsListNotifications_Ocs: (final data) =>
      NotificationsListNotifications_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsListNotifications_Ocs>: (final data) =>
      (data as List).map((final e) => NotificationsListNotifications_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsNotification: (final data) => NotificationsNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsNotification>: (final data) =>
      (data as List).map((final e) => NotificationsNotification.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsNotificationAction: (final data) =>
      NotificationsNotificationAction.fromJson(data as Map<String, dynamic>),
  List<NotificationsNotificationAction>: (final data) =>
      (data as List).map((final e) => NotificationsNotificationAction.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsGetNotification: (final data) => NotificationsGetNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsGetNotification>: (final data) =>
      (data as List).map((final e) => NotificationsGetNotification.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsGetNotification_Ocs: (final data) =>
      NotificationsGetNotification_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsGetNotification_Ocs>: (final data) =>
      (data as List).map((final e) => NotificationsGetNotification_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  EmptyOCS: (final data) => EmptyOCS.fromJson(data as Map<String, dynamic>),
  List<EmptyOCS>: (final data) =>
      (data as List).map((final e) => EmptyOCS.fromJson(e as Map<String, dynamic>)).toList(),
  EmptyOCS_Ocs: (final data) => EmptyOCS_Ocs.fromJson(data as Map<String, dynamic>),
  List<EmptyOCS_Ocs>: (final data) =>
      (data as List).map((final e) => EmptyOCS_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsPushServerRegistration: (final data) =>
      NotificationsPushServerRegistration.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistration>: (final data) =>
      (data as List).map((final e) => NotificationsPushServerRegistration.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsPushServerRegistration_Ocs: (final data) =>
      NotificationsPushServerRegistration_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistration_Ocs>: (final data) => (data as List)
      .map((final e) => NotificationsPushServerRegistration_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerSubscription: (final data) =>
      NotificationsPushServerSubscription.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerSubscription>: (final data) =>
      (data as List).map((final e) => NotificationsPushServerSubscription.fromJson(e as Map<String, dynamic>)).toList(),
  ProvisioningApiUser: (final data) => ProvisioningApiUser.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUser>: (final data) =>
      (data as List).map((final e) => ProvisioningApiUser.fromJson(e as Map<String, dynamic>)).toList(),
  ProvisioningApiUser_Ocs: (final data) => ProvisioningApiUser_Ocs.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUser_Ocs>: (final data) =>
      (data as List).map((final e) => ProvisioningApiUser_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  ProvisioningApiUserDetails: (final data) => ProvisioningApiUserDetails.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails>: (final data) =>
      (data as List).map((final e) => ProvisioningApiUserDetails.fromJson(e as Map<String, dynamic>)).toList(),
  ProvisioningApiUserDetails_Quota: (final data) =>
      ProvisioningApiUserDetails_Quota.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails_Quota>: (final data) =>
      (data as List).map((final e) => ProvisioningApiUserDetails_Quota.fromJson(e as Map<String, dynamic>)).toList(),
  ProvisioningApiUserDetails_BackendCapabilities: (final data) =>
      ProvisioningApiUserDetails_BackendCapabilities.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails_BackendCapabilities>: (final data) => (data as List)
      .map((final e) => ProvisioningApiUserDetails_BackendCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindAllStatuses: (final data) => UserStatusFindAllStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatuses>: (final data) =>
      (data as List).map((final e) => UserStatusFindAllStatuses.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusFindAllStatuses_Ocs: (final data) => UserStatusFindAllStatuses_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatuses_Ocs>: (final data) =>
      (data as List).map((final e) => UserStatusFindAllStatuses_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPublicUserStatus: (final data) => UserStatusPublicUserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusPublicUserStatus>: (final data) =>
      (data as List).map((final e) => UserStatusPublicUserStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusClearAt: (final data) => UserStatusClearAt.fromJson(data as Map<String, dynamic>),
  List<UserStatusClearAt>: (final data) =>
      (data as List).map((final e) => UserStatusClearAt.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusFindStatus: (final data) => UserStatusFindStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindStatus>: (final data) =>
      (data as List).map((final e) => UserStatusFindStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusFindStatus_Ocs: (final data) => UserStatusFindStatus_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindStatus_Ocs>: (final data) =>
      (data as List).map((final e) => UserStatusFindStatus_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusGetUserStatus: (final data) => UserStatusGetUserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatus>: (final data) =>
      (data as List).map((final e) => UserStatusGetUserStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusGetUserStatus_Ocs: (final data) => UserStatusGetUserStatus_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatus_Ocs>: (final data) =>
      (data as List).map((final e) => UserStatusGetUserStatus_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatus: (final data) => UserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatus>: (final data) =>
      (data as List).map((final e) => UserStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPredefinedStatuses: (final data) => UserStatusPredefinedStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatuses>: (final data) =>
      (data as List).map((final e) => UserStatusPredefinedStatuses.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPredefinedStatuses_Ocs: (final data) =>
      UserStatusPredefinedStatuses_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatuses_Ocs>: (final data) =>
      (data as List).map((final e) => UserStatusPredefinedStatuses_Ocs.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPredefinedStatus: (final data) => UserStatusPredefinedStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatus>: (final data) =>
      (data as List).map((final e) => UserStatusPredefinedStatus.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsPushNotification: (final data) => NotificationsPushNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushNotification>: (final data) =>
      (data as List).map((final e) => NotificationsPushNotification.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsPushNotificationDecryptedSubject: (final data) =>
      NotificationsPushNotificationDecryptedSubject.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushNotificationDecryptedSubject>: (final data) => (data as List)
      .map((final e) => NotificationsPushNotificationDecryptedSubject.fromJson(e as Map<String, dynamic>))
      .toList(),
};

final _serializers = <Type, dynamic Function(dynamic)>{
  CoreServerStatus: (final data) => data.toJson(),
  List<CoreServerStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities: (final data) => data.toJson(),
  List<CoreServerCapabilities>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  OCSMeta: (final data) => data.toJson(),
  List<OCSMeta>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Version: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Version>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Core: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Core>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported: (final data) =>
      data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus: (final data) => data.toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>: (final data) =>
      data.map((final e) => e.toJson()).toList(),
  CoreNavigationApps: (final data) => data.toJson(),
  List<CoreNavigationApps>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreNavigationApps_Ocs: (final data) => data.toJson(),
  List<CoreNavigationApps_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreNavigationApps_Ocs_Data: (final data) => data.toJson(),
  List<CoreNavigationApps_Ocs_Data>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreLoginFlowInit: (final data) => data.toJson(),
  List<CoreLoginFlowInit>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreLoginFlowInit_Poll: (final data) => data.toJson(),
  List<CoreLoginFlowInit_Poll>: (final data) => data.map((final e) => e.toJson()).toList(),
  CoreLoginFlowResult: (final data) => data.toJson(),
  List<CoreLoginFlowResult>: (final data) => data.map((final e) => e.toJson()).toList(),
  GetSupportedApiVersions: (final data) => data.toJson(),
  List<GetSupportedApiVersions>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsListFolders: (final data) => data.toJson(),
  List<NewsListFolders>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsFolder: (final data) => data.toJson(),
  List<NewsFolder>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsFeed: (final data) => data.toJson(),
  List<NewsFeed>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsArticle: (final data) => data.toJson(),
  List<NewsArticle>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsListFeeds: (final data) => data.toJson(),
  List<NewsListFeeds>: (final data) => data.map((final e) => e.toJson()).toList(),
  NewsListArticles: (final data) => data.toJson(),
  List<NewsListArticles>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotesNote: (final data) => data.toJson(),
  List<NotesNote>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotesSettings: (final data) => data.toJson(),
  List<NotesSettings>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsListNotifications: (final data) => data.toJson(),
  List<NotificationsListNotifications>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsListNotifications_Ocs: (final data) => data.toJson(),
  List<NotificationsListNotifications_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsNotification: (final data) => data.toJson(),
  List<NotificationsNotification>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsNotificationAction: (final data) => data.toJson(),
  List<NotificationsNotificationAction>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsGetNotification: (final data) => data.toJson(),
  List<NotificationsGetNotification>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsGetNotification_Ocs: (final data) => data.toJson(),
  List<NotificationsGetNotification_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  EmptyOCS: (final data) => data.toJson(),
  List<EmptyOCS>: (final data) => data.map((final e) => e.toJson()).toList(),
  EmptyOCS_Ocs: (final data) => data.toJson(),
  List<EmptyOCS_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsPushServerRegistration: (final data) => data.toJson(),
  List<NotificationsPushServerRegistration>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsPushServerRegistration_Ocs: (final data) => data.toJson(),
  List<NotificationsPushServerRegistration_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsPushServerSubscription: (final data) => data.toJson(),
  List<NotificationsPushServerSubscription>: (final data) => data.map((final e) => e.toJson()).toList(),
  ProvisioningApiUser: (final data) => data.toJson(),
  List<ProvisioningApiUser>: (final data) => data.map((final e) => e.toJson()).toList(),
  ProvisioningApiUser_Ocs: (final data) => data.toJson(),
  List<ProvisioningApiUser_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  ProvisioningApiUserDetails: (final data) => data.toJson(),
  List<ProvisioningApiUserDetails>: (final data) => data.map((final e) => e.toJson()).toList(),
  ProvisioningApiUserDetails_Quota: (final data) => data.toJson(),
  List<ProvisioningApiUserDetails_Quota>: (final data) => data.map((final e) => e.toJson()).toList(),
  ProvisioningApiUserDetails_BackendCapabilities: (final data) => data.toJson(),
  List<ProvisioningApiUserDetails_BackendCapabilities>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusFindAllStatuses: (final data) => data.toJson(),
  List<UserStatusFindAllStatuses>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusFindAllStatuses_Ocs: (final data) => data.toJson(),
  List<UserStatusFindAllStatuses_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusPublicUserStatus: (final data) => data.toJson(),
  List<UserStatusPublicUserStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusClearAt: (final data) => data.toJson(),
  List<UserStatusClearAt>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusFindStatus: (final data) => data.toJson(),
  List<UserStatusFindStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusFindStatus_Ocs: (final data) => data.toJson(),
  List<UserStatusFindStatus_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusGetUserStatus: (final data) => data.toJson(),
  List<UserStatusGetUserStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusGetUserStatus_Ocs: (final data) => data.toJson(),
  List<UserStatusGetUserStatus_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatus: (final data) => data.toJson(),
  List<UserStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusPredefinedStatuses: (final data) => data.toJson(),
  List<UserStatusPredefinedStatuses>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusPredefinedStatuses_Ocs: (final data) => data.toJson(),
  List<UserStatusPredefinedStatuses_Ocs>: (final data) => data.map((final e) => e.toJson()).toList(),
  UserStatusPredefinedStatus: (final data) => data.toJson(),
  List<UserStatusPredefinedStatus>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsPushNotification: (final data) => data.toJson(),
  List<NotificationsPushNotification>: (final data) => data.map((final e) => e.toJson()).toList(),
  NotificationsPushNotificationDecryptedSubject: (final data) => data.toJson(),
  List<NotificationsPushNotificationDecryptedSubject>: (final data) => data.map((final e) => e.toJson()).toList(),
};

T deserialize<T>(final dynamic data) => _deserializers[T]!(data) as T;

dynamic serialize<T>(final T data) => _serializers[T]!(data);
// coverage:ignore-end
