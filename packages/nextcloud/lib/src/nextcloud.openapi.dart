import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cookie_jar/cookie_jar.dart';

export 'package:cookie_jar/cookie_jar.dart';

part 'nextcloud.openapi.g.dart';

extension NextcloudHttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async {
    final chunks = await toList();
    if (chunks.isEmpty) {
      return Uint8List(0);
    }
    return Uint8List.fromList(chunks.reduce((final value, final element) => [...value, ...element]));
  }

  Future<String> get body async => utf8.decode(await bodyBytes);
}

class NextcloudResponse<T, U> {
  NextcloudResponse(
    this.data,
    this.headers,
  );

  final T data;

  final U headers;

  @override
  String toString() => 'NextcloudResponse(data: $data, headers: $headers)';
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

class NextcloudApiException extends _Response implements Exception {
  NextcloudApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  factory NextcloudApiException.fromResponse(_Response response) => NextcloudApiException(
        response.statusCode,
        response.headers,
        response.body,
      );

  @override
  String toString() =>
      'NextcloudApiException(statusCode: ${super.statusCode}, headers: ${super.headers}, body: ${utf8.decode(super.body)})';
}

abstract class NextcloudAuthentication {
  String get id;
  Map<String, String> get headers;
}

class NextcloudHttpBasicAuthentication extends NextcloudAuthentication {
  NextcloudHttpBasicAuthentication({
    required this.username,
    required this.password,
  });

  final String username;

  final String password;

  @override
  String get id => 'basic_auth';
  @override
  Map<String, String> get headers => {
        'Authorization': 'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      };
}

class NextcloudClient {
  NextcloudClient(
    this.baseURL, {
    Map<String, String>? baseHeaders,
    String? userAgent,
    HttpClient? httpClient,
    this.cookieJar,
    this.authentications = const [],
  }) {
    this.baseHeaders = {
      if (baseHeaders != null) ...{
        ...baseHeaders,
      },
    };
    this.httpClient = (httpClient ?? HttpClient())..userAgent = userAgent;
  }

  final String baseURL;

  late final Map<String, String> baseHeaders;

  late final HttpClient httpClient;

  final CookieJar? cookieJar;

  final List<NextcloudAuthentication> authentications;

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

  NextcloudCoreClient get core => NextcloudCoreClient(this);
  NextcloudNewsClient get news => NextcloudNewsClient(this);
  NextcloudNotesClient get notes => NextcloudNotesClient(this);
  NextcloudNotificationsClient get notifications => NextcloudNotificationsClient(this);
  NextcloudProvisioningApiClient get provisioningApi => NextcloudProvisioningApiClient(this);
  NextcloudUnifiedPushProviderClient get unifiedPushProvider => NextcloudUnifiedPushProviderClient(this);
  NextcloudUserStatusClient get userStatus => NextcloudUserStatusClient(this);
}

class NextcloudCoreClient {
  NextcloudCoreClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudCoreServerStatus> getStatus() async {
    var path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreServerStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreServerCapabilities> getCapabilities() async {
    var path = '/ocs/v2.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreServerCapabilities.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreNavigationApps> getNavigationApps() async {
    var path = '/ocs/v2.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreNavigationApps.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreLoginFlowInit> initLoginFlow() async {
    var path = '/index.php/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreLoginFlowInit.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreLoginFlowResult> getLoginFlowResult({required String token}) async {
    var path = '/index.php/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    queryParameters['token'] = token;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreLoginFlowResult.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
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
    final headers = <String, String>{
      'Accept': 'image/png',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    if (forceIcon != 1) {
      queryParameters['forceIcon'] = forceIcon.toString();
    }
    if (mode != 'fill') {
      queryParameters['mode'] = mode;
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getDarkAvatar({
    required String userId,
    required int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}/dark';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/png',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getAvatar({
    required String userId,
    required int size,
  }) async {
    var path = '/index.php/avatar/{userId}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/png',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreAutocompleteResult> autocomplete({
    required String search,
    required String itemType,
    required String itemId,
    String? sorter,
    required BuiltList<int> shareTypes,
    int limit = 10,
  }) async {
    var path = '/ocs/v2.php/core/autocomplete/get';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['search'] = search;
    queryParameters['itemType'] = itemType;
    queryParameters['itemId'] = itemId;
    if (sorter != null) {
      queryParameters['sorter'] = sorter;
    }
    queryParameters['shareTypes[]'] = shareTypes.map((final e) => e).map((final e) => e.toString());
    if (limit != 10) {
      queryParameters['limit'] = limit.toString();
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudCoreAutocompleteResult.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudNewsClient {
  NextcloudNewsClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudNewsSupportedAPIVersions> getSupportedApiVersions() async {
    var path = '/index.php/apps/news/api';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsSupportedAPIVersions.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFolders> listFolders() async {
    var path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsListFolders.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFolders> createFolder({required String name}) async {
    var path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['name'] = name;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsListFolders.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFolder({
    required int folderId,
    required String name,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFolder({required int folderId}) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFolderAsRead({
    required int folderId,
    required int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFeeds> listFeeds() async {
    var path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsListFeeds.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFeeds> addFeed({
    required String url,
    int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['url'] = url;
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
      return NextcloudNewsListFeeds.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFeed({required int feedId}) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future moveFeed({
    required int feedId,
    int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFeed({
    required int feedId,
    required String feedTitle,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markFeedAsRead({
    required int feedId,
    required int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListArticles> listArticles({
    int type = 3,
    int id = 0,
    int getRead = 1,
    int batchSize = -1,
    int offset = 0,
    int oldestFirst = 0,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsListArticles.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListArticles> listUpdatedArticles({
    int type = 3,
    int id = 0,
    int lastModified = 0,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/items/updated';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    if (type != 3) {
      queryParameters['type'] = type.toString();
    }
    if (id != 0) {
      queryParameters['id'] = id.toString();
    }
    if (lastModified != 0) {
      queryParameters['lastModified'] = lastModified.toString();
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNewsListArticles.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsRead({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsUnread({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future starArticle({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future unstarArticle({required int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudNotesClient {
  NextcloudNotesClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<BuiltList<NextcloudNotesNote>> getNotes({
    String? category,
    String exclude = '',
    int pruneBefore = 0,
    int chunkSize = 0,
    String? chunkCursor,
    String? ifNoneMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    if (category != null) {
      queryParameters['category'] = category;
    }
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (pruneBefore != 0) {
      queryParameters['pruneBefore'] = pruneBefore.toString();
    }
    if (chunkSize != 0) {
      queryParameters['chunkSize'] = chunkSize.toString();
    }
    if (chunkCursor != null) {
      queryParameters['chunkCursor'] = chunkCursor;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return BuiltList<NextcloudNotesNote>((json.decode(utf8.decode(response.body) as String) as List)
          .map((final e) => NextcloudNotesNote.fromJson(e as Map<String, dynamic>)));
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> createNote({
    String category = '',
    String title = '',
    String content = '',
    int modified = 0,
    int favorite = 0,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    if (category != '') {
      queryParameters['category'] = category;
    }
    if (title != '') {
      queryParameters['title'] = title;
    }
    if (content != '') {
      queryParameters['content'] = content;
    }
    if (modified != 0) {
      queryParameters['modified'] = modified.toString();
    }
    if (favorite != 0) {
      queryParameters['favorite'] = favorite.toString();
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> getNote({
    required int id,
    String exclude = '',
    String? ifNoneMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> updateNote({
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
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (content != null) {
      queryParameters['content'] = content;
    }
    if (modified != null) {
      queryParameters['modified'] = modified.toString();
    }
    if (title != null) {
      queryParameters['title'] = title;
    }
    if (category != null) {
      queryParameters['category'] = category;
    }
    if (favorite != 0) {
      queryParameters['favorite'] = favorite.toString();
    }
    if (ifMatch != null) {
      headers['If-Match'] = ifMatch;
    }
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotesNote.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteNote({required int id}) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
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
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesSettings> getSettings() async {
    var path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotesSettings.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesSettings> updateSettings({required NextcloudNotesSettings notesSettings}) async {
    var path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    headers['Content-Type'] = 'application/json';
    body = Uint8List.fromList(utf8.encode(json.encode(notesSettings.toJson())));
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotesSettings.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudNotificationsClient {
  NextcloudNotificationsClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudNotificationsListNotifications> listNotifications() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotificationsListNotifications.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteAllNotifications() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ((utf8.decode(response.body) as String) as String);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotificationsGetNotification> getNotification({required int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudNotificationsGetNotification.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudEmptyOCS> deleteNotification({required int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudEmptyOCS.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotificationsPushServerRegistration> registerDevice({
    required String pushTokenHash,
    required String devicePublicKey,
    required String proxyServer,
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['pushTokenHash'] = pushTokenHash;
    queryParameters['devicePublicKey'] = devicePublicKey;
    queryParameters['proxyServer'] = proxyServer;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return NextcloudNotificationsPushServerRegistration.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> removeDevice() async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 202) {
      return ((utf8.decode(response.body) as String) as String);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudEmptyOCS> sendAdminNotification({
    required String userId,
    required String shortMessage,
    String longMessage = '',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/admin_notifications/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    queryParameters['shortMessage'] = shortMessage;
    if (longMessage != '') {
      queryParameters['longMessage'] = longMessage;
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudEmptyOCS.fromJson(json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudProvisioningApiClient {
  NextcloudProvisioningApiClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudProvisioningApiUser> getCurrentUser() async {
    var path = '/ocs/v2.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudProvisioningApiUser.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudProvisioningApiUser> getUser({required String userId}) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudProvisioningApiUser.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudUnifiedPushProviderClient {
  NextcloudUnifiedPushProviderClient(this.rootClient);

  final NextcloudClient rootClient;

  /// Check if the UnifiedPush provider is present
  Future<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson> check() async {
    var path = '/index.php/apps/uppush';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderCheckResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set keepalive interval
  ///
  /// This endpoint requires admin access
  Future<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson> setKeepalive(
      {required int keepalive}) async {
    var path = '/index.php/apps/uppush/keepalive';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['keepalive'] = keepalive.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to create a new deviceId
  Future<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson> createDevice(
      {required String deviceName}) async {
    var path = '/index.php/apps/uppush/device';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['deviceName'] = deviceName;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to get push messages
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app)
  Future<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson> syncDevice(
      {required String deviceId}) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 401) {
      return NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a device
  Future<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson> deleteDevice(
      {required String deviceId}) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create an authorization token for a new 3rd party service
  Future<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson> createApp({
    required String deviceId,
    required String appName,
  }) async {
    var path = '/index.php/apps/uppush/app';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['deviceId'] = deviceId;
    queryParameters['appName'] = appName;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete an authorization token
  Future<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson> deleteApp({required String token}) async {
    var path = '/index.php/apps/uppush/app/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unifiedpush discovery Following specifications
  Future<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson> unifiedpushDiscovery(
      {required String token}) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Receive notifications from 3rd parties
  Future<NextcloudUnifiedPushProviderPushResponse201ApplicationJson> push({required String token}) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return NextcloudUnifiedPushProviderPushResponse201ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway discovery
  Future<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson> gatewayMatrixDiscovery() async {
    var path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway
  Future<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson> gatewayMatrix() async {
    var path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudUserStatusClient {
  NextcloudUserStatusClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudUserStatusGetPublicStatuses> getPublicStatuses() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusGetPublicStatuses.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetPublicStatus> getPublicStatus({required String userId}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusGetPublicStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> getStatus() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusGetStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setStatus({required NextcloudUserStatusType statusType}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['statusType'] = statusType.name;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusGetStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setPredefinedMessage({
    required String messageId,
    int? clearAt,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['messageId'] = messageId;
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
      return NextcloudUserStatusGetStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setCustomMessage({
    String? statusIcon,
    String? message,
    int? clearAt,
  }) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    if (statusIcon != null) {
      queryParameters['statusIcon'] = statusIcon;
    }
    if (message != null) {
      queryParameters['message'] = message;
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
      return NextcloudUserStatusGetStatus.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future clearMessage() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusPredefinedStatuses> getPredefinedStatuses() async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusPredefinedStatuses.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusHeartbeat> heartbeat({required NextcloudUserStatusType status}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    queryParameters['status'] = status.name;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NextcloudUserStatusHeartbeat.fromJson(
          json.decode(utf8.decode(response.body) as String) as Map<String, dynamic>);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class NextcloudCoreServerStatus implements Built<NextcloudCoreServerStatus, NextcloudCoreServerStatusBuilder> {
  const NextcloudCoreServerStatus._();

  factory NextcloudCoreServerStatus([void Function(NextcloudCoreServerStatusBuilder)? b]) = _$NextcloudCoreServerStatus;

  static NextcloudCoreServerStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
  static Serializer<NextcloudCoreServerStatus> get serializer => _$nextcloudCoreServerStatusSerializer;
}

abstract class NextcloudOCSMeta implements Built<NextcloudOCSMeta, NextcloudOCSMetaBuilder> {
  const NextcloudOCSMeta._();

  factory NextcloudOCSMeta([void Function(NextcloudOCSMetaBuilder)? b]) = _$NextcloudOCSMeta;

  static NextcloudOCSMeta fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudOCSMeta fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudOCSMeta? data) => data == null ? null : serializers.toJson(serializer, data);
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<NextcloudOCSMeta> get serializer => _$nextcloudOCSMetaSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Version
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Version,
            NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Version._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Version(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Version;

  static NextcloudCoreServerCapabilities_Ocs_Data_Version fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Version fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Version? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get major;
  int? get minor;
  int? get micro;
  String? get string;
  String? get edition;
  bool? get extendedSupport;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Version> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataVersionSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get pollinterval;
  @BuiltValueField(wireName: 'webdav-root')
  String? get webdavRoot;
  @BuiltValueField(wireName: 'reference-api')
  bool? get referenceApi;
  @BuiltValueField(wireName: 'reference-regex')
  String? get referenceRegex;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCoreSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get delay;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesBruteforceSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<String>? get size;
  BuiltList<String>? get gps;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get url;
  String? get etag;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<String>? get blacklistedFiles;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? get directEditing;
  bool? get comments;
  bool? get undelete;
  bool? get versioning;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<String>? get apiv2;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesActivitySerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get globalScale;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get frontendEnabled;
  int? get allowedCircles;
  int? get allowedUserTypes;
  int? get membersLimit;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  JsonObject? get core;
  JsonObject? get extra;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  JsonObject? get flags;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? get source;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<int>? get coreFlags;
  BuiltList<int>? get systemFlags;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? get constants;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? get config;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  JsonObject? get level;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? get constants;
  JsonObject? get type;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get version;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? get status;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? get settings;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? get circle;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? get member;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get webdav;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get name;
  BuiltList<String>? get shareTypes;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? get protocols;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  String? get apiVersion;
  String? get endPoint;
  BuiltList<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? get resourceTypes;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get bulkupload;
  String? get chunking;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesDavSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enforced;
  bool? get askForOptionalPassword;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal(
      [void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? get password;
  @BuiltValueField(wireName: 'expire_date')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'multiple_links')
  bool? get multipleLinks;
  @BuiltValueField(wireName: 'expire_date_internal')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal? get expireDateInternal;
  @BuiltValueField(wireName: 'expire_date_remote')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? get expireDateRemote;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  bool? get upload;
  @BuiltValueField(wireName: 'upload_files_drop')
  bool? get uploadFilesDrop;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? get expireDate;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  @BuiltValueField(wireName: 'expire_date')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? get expireDate;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported(
      [void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
      fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get outgoing;
  bool? get incoming;
  @BuiltValueField(wireName: 'expire_date')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported?
      get expireDateSupported;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'query_lookup_default')
  bool? get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool? get alwaysShowUnique;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop(
      [void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  bool? get enforced;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate(
      [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)?
          b]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  bool? get enforced;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool? get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? get uploadFilesDrop;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? get password;
  @BuiltValueField(wireName: 'expire_date')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? get expireDate;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'api_enabled')
  bool? get apiEnabled;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? get public;
  bool? get resharing;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? get user;
  @BuiltValueField(wireName: 'group_sharing')
  bool? get groupSharing;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? get group;
  @BuiltValueField(wireName: 'default_permissions')
  int? get defaultPermissions;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? get federation;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? get sharee;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? get sharebymail;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesNotesSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String>? get ocsEndpoints;
  BuiltList<String>? get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String>? get adminNotifications;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesNotificationsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get generate;
  String? get validate;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get minLength;
  bool? get enforceNonCommonPassword;
  bool? get enforceNumericCharacters;
  bool? get enforceSpecialCharacters;
  bool? get enforceUpperLowerCase;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? get api;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicySerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int? get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool? get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool? get accountPropertyScopesPublishedEnabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String? get name;
  String? get url;
  String? get slogan;
  String? get color;
  @BuiltValueField(wireName: 'color-text')
  String? get colorText;
  @BuiltValueField(wireName: 'color-element')
  String? get colorElement;
  @BuiltValueField(wireName: 'color-element-bright')
  String? get colorElementBright;
  @BuiltValueField(wireName: 'color-element-dark')
  String? get colorElementDark;
  String? get logo;
  String? get background;
  @BuiltValueField(wireName: 'background-plain')
  bool? get backgroundPlain;
  @BuiltValueField(wireName: 'background-default')
  bool? get backgroundDefault;
  String? get logoheader;
  String? get favicon;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesThemingSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  @BuiltValueField(wireName: 'supports_emoji')
  bool? get supportsEmoji;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesUserStatusSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities,
            NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities;

  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data_Capabilities fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core? get core;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? get bruteforce;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? get metadataAvailable;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files? get files;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity? get activity;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles? get circles;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm? get ocm;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav? get dav;
  @BuiltValueField(wireName: 'files_sharing')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? get filesSharing;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes? get notes;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications? get notifications;
  @BuiltValueField(wireName: 'password_policy')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? get passwordPolicy;
  @BuiltValueField(wireName: 'provisioning_api')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? get provisioningApi;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? get theming;
  @BuiltValueField(wireName: 'user_status')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? get userStatus;
  @BuiltValueField(wireName: 'weather_status')
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? get weatherStatus;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data
    implements Built<NextcloudCoreServerCapabilities_Ocs_Data, NextcloudCoreServerCapabilities_Ocs_DataBuilder> {
  const NextcloudCoreServerCapabilities_Ocs_Data._();

  factory NextcloudCoreServerCapabilities_Ocs_Data(
      [void Function(NextcloudCoreServerCapabilities_Ocs_DataBuilder)? b]) = _$NextcloudCoreServerCapabilities_Ocs_Data;

  static NextcloudCoreServerCapabilities_Ocs_Data fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs_Data fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs_Data? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreServerCapabilities_Ocs_Data_Version get version;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities get capabilities;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs
    implements Built<NextcloudCoreServerCapabilities_Ocs, NextcloudCoreServerCapabilities_OcsBuilder> {
  const NextcloudCoreServerCapabilities_Ocs._();

  factory NextcloudCoreServerCapabilities_Ocs([void Function(NextcloudCoreServerCapabilities_OcsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs;

  static NextcloudCoreServerCapabilities_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudCoreServerCapabilities_Ocs_Data get data;
  static Serializer<NextcloudCoreServerCapabilities_Ocs> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsSerializer;
}

abstract class NextcloudCoreServerCapabilities
    implements Built<NextcloudCoreServerCapabilities, NextcloudCoreServerCapabilitiesBuilder> {
  const NextcloudCoreServerCapabilities._();

  factory NextcloudCoreServerCapabilities([void Function(NextcloudCoreServerCapabilitiesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities;

  static NextcloudCoreServerCapabilities fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreServerCapabilities fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreServerCapabilities? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreServerCapabilities_Ocs get ocs;
  static Serializer<NextcloudCoreServerCapabilities> get serializer => _$nextcloudCoreServerCapabilitiesSerializer;
}

class NextcloudCoreNavigationApps_Ocs_Data_Order {
  NextcloudCoreNavigationApps_Ocs_Data_Order(
    this._data, {
    this.$int,
    this.string,
  });

  factory NextcloudCoreNavigationApps_Ocs_Data_Order.fromJson(dynamic data) {
    int? $int;
    String? string;
    try {
      $int = (data as int);
    } catch (_) {}
    try {
      string = (data as String);
    } catch (_) {}
    assert([$int, string].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudCoreNavigationApps_Ocs_Data_Order(
      data,
      $int: $int,
      string: string,
    );
  }

  // coverage:ignore-start
  factory NextcloudCoreNavigationApps_Ocs_Data_Order.fromJsonString(String data) =>
      NextcloudCoreNavigationApps_Ocs_Data_Order.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final int? $int;

  final String? string;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudCoreNavigationApps_Ocs_Data
    implements Built<NextcloudCoreNavigationApps_Ocs_Data, NextcloudCoreNavigationApps_Ocs_DataBuilder> {
  const NextcloudCoreNavigationApps_Ocs_Data._();

  factory NextcloudCoreNavigationApps_Ocs_Data([void Function(NextcloudCoreNavigationApps_Ocs_DataBuilder)? b]) =
      _$NextcloudCoreNavigationApps_Ocs_Data;

  static NextcloudCoreNavigationApps_Ocs_Data fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreNavigationApps_Ocs_Data fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreNavigationApps_Ocs_Data? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get id;

  /// Should always be an integer, but there is a bug. See https://github.com/nextcloud/server/issues/32828
  NextcloudCoreNavigationApps_Ocs_Data_Order get order;
  String get href;
  String get icon;
  String get type;
  String get name;
  bool get active;
  String get classes;
  int get unread;
  static Serializer<NextcloudCoreNavigationApps_Ocs_Data> get serializer =>
      _$nextcloudCoreNavigationAppsOcsDataSerializer;
}

abstract class NextcloudCoreNavigationApps_Ocs
    implements Built<NextcloudCoreNavigationApps_Ocs, NextcloudCoreNavigationApps_OcsBuilder> {
  const NextcloudCoreNavigationApps_Ocs._();

  factory NextcloudCoreNavigationApps_Ocs([void Function(NextcloudCoreNavigationApps_OcsBuilder)? b]) =
      _$NextcloudCoreNavigationApps_Ocs;

  static NextcloudCoreNavigationApps_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreNavigationApps_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreNavigationApps_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudCoreNavigationApps_Ocs_Data> get data;
  static Serializer<NextcloudCoreNavigationApps_Ocs> get serializer => _$nextcloudCoreNavigationAppsOcsSerializer;
}

abstract class NextcloudCoreNavigationApps
    implements Built<NextcloudCoreNavigationApps, NextcloudCoreNavigationAppsBuilder> {
  const NextcloudCoreNavigationApps._();

  factory NextcloudCoreNavigationApps([void Function(NextcloudCoreNavigationAppsBuilder)? b]) =
      _$NextcloudCoreNavigationApps;

  static NextcloudCoreNavigationApps fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreNavigationApps fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreNavigationApps? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreNavigationApps_Ocs get ocs;
  static Serializer<NextcloudCoreNavigationApps> get serializer => _$nextcloudCoreNavigationAppsSerializer;
}

abstract class NextcloudCoreLoginFlowInit_Poll
    implements Built<NextcloudCoreLoginFlowInit_Poll, NextcloudCoreLoginFlowInit_PollBuilder> {
  const NextcloudCoreLoginFlowInit_Poll._();

  factory NextcloudCoreLoginFlowInit_Poll([void Function(NextcloudCoreLoginFlowInit_PollBuilder)? b]) =
      _$NextcloudCoreLoginFlowInit_Poll;

  static NextcloudCoreLoginFlowInit_Poll fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreLoginFlowInit_Poll fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreLoginFlowInit_Poll? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get token;
  String get endpoint;
  static Serializer<NextcloudCoreLoginFlowInit_Poll> get serializer => _$nextcloudCoreLoginFlowInitPollSerializer;
}

abstract class NextcloudCoreLoginFlowInit
    implements Built<NextcloudCoreLoginFlowInit, NextcloudCoreLoginFlowInitBuilder> {
  const NextcloudCoreLoginFlowInit._();

  factory NextcloudCoreLoginFlowInit([void Function(NextcloudCoreLoginFlowInitBuilder)? b]) =
      _$NextcloudCoreLoginFlowInit;

  static NextcloudCoreLoginFlowInit fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreLoginFlowInit fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreLoginFlowInit? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreLoginFlowInit_Poll get poll;
  String get login;
  static Serializer<NextcloudCoreLoginFlowInit> get serializer => _$nextcloudCoreLoginFlowInitSerializer;
}

abstract class NextcloudCoreLoginFlowResult
    implements Built<NextcloudCoreLoginFlowResult, NextcloudCoreLoginFlowResultBuilder> {
  const NextcloudCoreLoginFlowResult._();

  factory NextcloudCoreLoginFlowResult([void Function(NextcloudCoreLoginFlowResultBuilder)? b]) =
      _$NextcloudCoreLoginFlowResult;

  static NextcloudCoreLoginFlowResult fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreLoginFlowResult fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreLoginFlowResult? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get server;
  String get loginName;
  String get appPassword;
  static Serializer<NextcloudCoreLoginFlowResult> get serializer => _$nextcloudCoreLoginFlowResultSerializer;
}

class NextcloudCoreAutocompleteResult_Ocs_Data_Status {
  NextcloudCoreAutocompleteResult_Ocs_Data_Status(
    this._data, {
    this.builtListJsonObject,
    this.string,
  });

  factory NextcloudCoreAutocompleteResult_Ocs_Data_Status.fromJson(dynamic data) {
    BuiltList<JsonObject>? builtListJsonObject;
    String? string;
    try {
      builtListJsonObject = BuiltList<JsonObject>((data as List).map((final e) => JsonObject(e)));
    } catch (_) {}
    try {
      string = (data as String);
    } catch (_) {}
    assert([builtListJsonObject, string].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudCoreAutocompleteResult_Ocs_Data_Status(
      data,
      builtListJsonObject: builtListJsonObject,
      string: string,
    );
  }

  // coverage:ignore-start
  factory NextcloudCoreAutocompleteResult_Ocs_Data_Status.fromJsonString(String data) =>
      NextcloudCoreAutocompleteResult_Ocs_Data_Status.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final BuiltList<JsonObject>? builtListJsonObject;

  final String? string;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudCoreAutocompleteResult_Ocs_Data
    implements Built<NextcloudCoreAutocompleteResult_Ocs_Data, NextcloudCoreAutocompleteResult_Ocs_DataBuilder> {
  const NextcloudCoreAutocompleteResult_Ocs_Data._();

  factory NextcloudCoreAutocompleteResult_Ocs_Data(
      [void Function(NextcloudCoreAutocompleteResult_Ocs_DataBuilder)? b]) = _$NextcloudCoreAutocompleteResult_Ocs_Data;

  static NextcloudCoreAutocompleteResult_Ocs_Data fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreAutocompleteResult_Ocs_Data fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreAutocompleteResult_Ocs_Data? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get id;
  String get label;
  String get icon;
  String get source;
  NextcloudCoreAutocompleteResult_Ocs_Data_Status get status;
  String get subline;
  String get shareWithDisplayNameUnique;
  static Serializer<NextcloudCoreAutocompleteResult_Ocs_Data> get serializer =>
      _$nextcloudCoreAutocompleteResultOcsDataSerializer;
}

abstract class NextcloudCoreAutocompleteResult_Ocs
    implements Built<NextcloudCoreAutocompleteResult_Ocs, NextcloudCoreAutocompleteResult_OcsBuilder> {
  const NextcloudCoreAutocompleteResult_Ocs._();

  factory NextcloudCoreAutocompleteResult_Ocs([void Function(NextcloudCoreAutocompleteResult_OcsBuilder)? b]) =
      _$NextcloudCoreAutocompleteResult_Ocs;

  static NextcloudCoreAutocompleteResult_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreAutocompleteResult_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreAutocompleteResult_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudCoreAutocompleteResult_Ocs_Data> get data;
  static Serializer<NextcloudCoreAutocompleteResult_Ocs> get serializer =>
      _$nextcloudCoreAutocompleteResultOcsSerializer;
}

abstract class NextcloudCoreAutocompleteResult
    implements Built<NextcloudCoreAutocompleteResult, NextcloudCoreAutocompleteResultBuilder> {
  const NextcloudCoreAutocompleteResult._();

  factory NextcloudCoreAutocompleteResult([void Function(NextcloudCoreAutocompleteResultBuilder)? b]) =
      _$NextcloudCoreAutocompleteResult;

  static NextcloudCoreAutocompleteResult fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudCoreAutocompleteResult fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudCoreAutocompleteResult? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudCoreAutocompleteResult_Ocs get ocs;
  static Serializer<NextcloudCoreAutocompleteResult> get serializer => _$nextcloudCoreAutocompleteResultSerializer;
}

abstract class NextcloudNewsSupportedAPIVersions
    implements Built<NextcloudNewsSupportedAPIVersions, NextcloudNewsSupportedAPIVersionsBuilder> {
  const NextcloudNewsSupportedAPIVersions._();

  factory NextcloudNewsSupportedAPIVersions([void Function(NextcloudNewsSupportedAPIVersionsBuilder)? b]) =
      _$NextcloudNewsSupportedAPIVersions;

  static NextcloudNewsSupportedAPIVersions fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsSupportedAPIVersions fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsSupportedAPIVersions? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<String>? get apiLevels;
  static Serializer<NextcloudNewsSupportedAPIVersions> get serializer => _$nextcloudNewsSupportedAPIVersionsSerializer;
}

abstract class NextcloudNewsArticle implements Built<NextcloudNewsArticle, NextcloudNewsArticleBuilder> {
  const NextcloudNewsArticle._();

  factory NextcloudNewsArticle([void Function(NextcloudNewsArticleBuilder)? b]) = _$NextcloudNewsArticle;

  static NextcloudNewsArticle fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsArticle fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsArticle? data) => data == null ? null : serializers.toJson(serializer, data);
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
  static Serializer<NextcloudNewsArticle> get serializer => _$nextcloudNewsArticleSerializer;
}

abstract class NextcloudNewsFeed implements Built<NextcloudNewsFeed, NextcloudNewsFeedBuilder> {
  const NextcloudNewsFeed._();

  factory NextcloudNewsFeed([void Function(NextcloudNewsFeedBuilder)? b]) = _$NextcloudNewsFeed;

  static NextcloudNewsFeed fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsFeed fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsFeed? data) => data == null ? null : serializers.toJson(serializer, data);
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
  BuiltList<NextcloudNewsArticle> get items;
  static Serializer<NextcloudNewsFeed> get serializer => _$nextcloudNewsFeedSerializer;
}

abstract class NextcloudNewsFolder implements Built<NextcloudNewsFolder, NextcloudNewsFolderBuilder> {
  const NextcloudNewsFolder._();

  factory NextcloudNewsFolder([void Function(NextcloudNewsFolderBuilder)? b]) = _$NextcloudNewsFolder;

  static NextcloudNewsFolder fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsFolder fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsFolder? data) => data == null ? null : serializers.toJson(serializer, data);
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty
  BuiltList<NextcloudNewsFeed> get feeds;
  static Serializer<NextcloudNewsFolder> get serializer => _$nextcloudNewsFolderSerializer;
}

abstract class NextcloudNewsListFolders implements Built<NextcloudNewsListFolders, NextcloudNewsListFoldersBuilder> {
  const NextcloudNewsListFolders._();

  factory NextcloudNewsListFolders([void Function(NextcloudNewsListFoldersBuilder)? b]) = _$NextcloudNewsListFolders;

  static NextcloudNewsListFolders fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsListFolders fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsListFolders? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<NextcloudNewsFolder> get folders;
  static Serializer<NextcloudNewsListFolders> get serializer => _$nextcloudNewsListFoldersSerializer;
}

abstract class NextcloudNewsListFeeds implements Built<NextcloudNewsListFeeds, NextcloudNewsListFeedsBuilder> {
  const NextcloudNewsListFeeds._();

  factory NextcloudNewsListFeeds([void Function(NextcloudNewsListFeedsBuilder)? b]) = _$NextcloudNewsListFeeds;

  static NextcloudNewsListFeeds fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsListFeeds fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsListFeeds? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get starredCount;
  int? get newestItemId;
  BuiltList<NextcloudNewsFeed> get feeds;
  static Serializer<NextcloudNewsListFeeds> get serializer => _$nextcloudNewsListFeedsSerializer;
}

abstract class NextcloudNewsListArticles implements Built<NextcloudNewsListArticles, NextcloudNewsListArticlesBuilder> {
  const NextcloudNewsListArticles._();

  factory NextcloudNewsListArticles([void Function(NextcloudNewsListArticlesBuilder)? b]) = _$NextcloudNewsListArticles;

  static NextcloudNewsListArticles fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNewsListArticles fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNewsListArticles? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<NextcloudNewsArticle> get items;
  static Serializer<NextcloudNewsListArticles> get serializer => _$nextcloudNewsListArticlesSerializer;
}

abstract class NextcloudNotesNote implements Built<NextcloudNotesNote, NextcloudNotesNoteBuilder> {
  const NextcloudNotesNote._();

  factory NextcloudNotesNote([void Function(NextcloudNotesNoteBuilder)? b]) = _$NextcloudNotesNote;

  static NextcloudNotesNote fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNotesNote fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotesNote? data) => data == null ? null : serializers.toJson(serializer, data);
  int get id;
  String get etag;
  bool get readonly;
  String get content;
  String get title;
  String get category;
  bool get favorite;
  int get modified;
  bool get error;
  String get errorType;
  static Serializer<NextcloudNotesNote> get serializer => _$nextcloudNotesNoteSerializer;
}

class NextcloudNotesSettings_NoteMode extends EnumClass {
  const NextcloudNotesSettings_NoteMode._(super.name);

  static const NextcloudNotesSettings_NoteMode edit = _$nextcloudNotesSettingsNoteModeEdit;

  static const NextcloudNotesSettings_NoteMode preview = _$nextcloudNotesSettingsNoteModePreview;

  static const NextcloudNotesSettings_NoteMode rich = _$nextcloudNotesSettingsNoteModeRich;

  static BuiltSet<NextcloudNotesSettings_NoteMode> get values => _$nextcloudNotesSettingsNoteModeValues;
  static NextcloudNotesSettings_NoteMode valueOf(String name) => _$valueOfNextcloudNotesSettings_NoteMode(name);
  static Serializer<NextcloudNotesSettings_NoteMode> get serializer => _$nextcloudNotesSettingsNoteModeSerializer;
}

abstract class NextcloudNotesSettings implements Built<NextcloudNotesSettings, NextcloudNotesSettingsBuilder> {
  const NextcloudNotesSettings._();

  factory NextcloudNotesSettings([void Function(NextcloudNotesSettingsBuilder)? b]) = _$NextcloudNotesSettings;

  static NextcloudNotesSettings fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudNotesSettings fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotesSettings? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get notesPath;
  String get fileSuffix;
  NextcloudNotesSettings_NoteMode get noteMode;
  static Serializer<NextcloudNotesSettings> get serializer => _$nextcloudNotesSettingsSerializer;
}

abstract class NextcloudNotificationsNotificationAction
    implements Built<NextcloudNotificationsNotificationAction, NextcloudNotificationsNotificationActionBuilder> {
  const NextcloudNotificationsNotificationAction._();

  factory NextcloudNotificationsNotificationAction(
      [void Function(NextcloudNotificationsNotificationActionBuilder)? b]) = _$NextcloudNotificationsNotificationAction;

  static NextcloudNotificationsNotificationAction fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsNotificationAction fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsNotificationAction? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get label;
  String get link;
  String get type;
  bool? get primary;
  static Serializer<NextcloudNotificationsNotificationAction> get serializer =>
      _$nextcloudNotificationsNotificationActionSerializer;
}

abstract class NextcloudNotificationsNotification
    implements Built<NextcloudNotificationsNotification, NextcloudNotificationsNotificationBuilder> {
  const NextcloudNotificationsNotification._();

  factory NextcloudNotificationsNotification([void Function(NextcloudNotificationsNotificationBuilder)? b]) =
      _$NextcloudNotificationsNotification;

  static NextcloudNotificationsNotification fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsNotification fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsNotification? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  @BuiltValueField(wireName: 'notification_id')
  int get notificationId;
  String get app;
  String get user;
  String get datetime;
  @BuiltValueField(wireName: 'object_type')
  String get objectType;
  @BuiltValueField(wireName: 'object_id')
  String get objectId;
  String get subject;
  String get message;
  String get link;
  String get subjectRich;
  JsonObject get subjectRichParameters;
  String get messageRich;
  JsonObject get messageRichParameters;
  String get icon;
  BuiltList<NextcloudNotificationsNotificationAction> get actions;
  static Serializer<NextcloudNotificationsNotification> get serializer =>
      _$nextcloudNotificationsNotificationSerializer;
}

abstract class NextcloudNotificationsListNotifications_Ocs
    implements Built<NextcloudNotificationsListNotifications_Ocs, NextcloudNotificationsListNotifications_OcsBuilder> {
  const NextcloudNotificationsListNotifications_Ocs._();

  factory NextcloudNotificationsListNotifications_Ocs(
          [void Function(NextcloudNotificationsListNotifications_OcsBuilder)? b]) =
      _$NextcloudNotificationsListNotifications_Ocs;

  static NextcloudNotificationsListNotifications_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsListNotifications_Ocs fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsListNotifications_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudNotificationsNotification> get data;
  static Serializer<NextcloudNotificationsListNotifications_Ocs> get serializer =>
      _$nextcloudNotificationsListNotificationsOcsSerializer;
}

abstract class NextcloudNotificationsListNotifications
    implements Built<NextcloudNotificationsListNotifications, NextcloudNotificationsListNotificationsBuilder> {
  const NextcloudNotificationsListNotifications._();

  factory NextcloudNotificationsListNotifications([void Function(NextcloudNotificationsListNotificationsBuilder)? b]) =
      _$NextcloudNotificationsListNotifications;

  static NextcloudNotificationsListNotifications fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsListNotifications fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsListNotifications? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudNotificationsListNotifications_Ocs get ocs;
  static Serializer<NextcloudNotificationsListNotifications> get serializer =>
      _$nextcloudNotificationsListNotificationsSerializer;
}

abstract class NextcloudNotificationsGetNotification_Ocs
    implements Built<NextcloudNotificationsGetNotification_Ocs, NextcloudNotificationsGetNotification_OcsBuilder> {
  const NextcloudNotificationsGetNotification_Ocs._();

  factory NextcloudNotificationsGetNotification_Ocs(
          [void Function(NextcloudNotificationsGetNotification_OcsBuilder)? b]) =
      _$NextcloudNotificationsGetNotification_Ocs;

  static NextcloudNotificationsGetNotification_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsGetNotification_Ocs fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsGetNotification_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudNotificationsNotification get data;
  static Serializer<NextcloudNotificationsGetNotification_Ocs> get serializer =>
      _$nextcloudNotificationsGetNotificationOcsSerializer;
}

abstract class NextcloudNotificationsGetNotification
    implements Built<NextcloudNotificationsGetNotification, NextcloudNotificationsGetNotificationBuilder> {
  const NextcloudNotificationsGetNotification._();

  factory NextcloudNotificationsGetNotification([void Function(NextcloudNotificationsGetNotificationBuilder)? b]) =
      _$NextcloudNotificationsGetNotification;

  static NextcloudNotificationsGetNotification fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsGetNotification fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsGetNotification? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudNotificationsGetNotification_Ocs get ocs;
  static Serializer<NextcloudNotificationsGetNotification> get serializer =>
      _$nextcloudNotificationsGetNotificationSerializer;
}

abstract class NextcloudEmptyOCS_Ocs implements Built<NextcloudEmptyOCS_Ocs, NextcloudEmptyOCS_OcsBuilder> {
  const NextcloudEmptyOCS_Ocs._();

  factory NextcloudEmptyOCS_Ocs([void Function(NextcloudEmptyOCS_OcsBuilder)? b]) = _$NextcloudEmptyOCS_Ocs;

  static NextcloudEmptyOCS_Ocs fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudEmptyOCS_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudEmptyOCS_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<NextcloudEmptyOCS_Ocs> get serializer => _$nextcloudEmptyOCSOcsSerializer;
}

abstract class NextcloudEmptyOCS implements Built<NextcloudEmptyOCS, NextcloudEmptyOCSBuilder> {
  const NextcloudEmptyOCS._();

  factory NextcloudEmptyOCS([void Function(NextcloudEmptyOCSBuilder)? b]) = _$NextcloudEmptyOCS;

  static NextcloudEmptyOCS fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;
  static NextcloudEmptyOCS fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudEmptyOCS? data) => data == null ? null : serializers.toJson(serializer, data);
  NextcloudEmptyOCS_Ocs get ocs;
  static Serializer<NextcloudEmptyOCS> get serializer => _$nextcloudEmptyOCSSerializer;
}

abstract class NextcloudNotificationsPushServerSubscription
    implements
        Built<NextcloudNotificationsPushServerSubscription, NextcloudNotificationsPushServerSubscriptionBuilder> {
  const NextcloudNotificationsPushServerSubscription._();

  factory NextcloudNotificationsPushServerSubscription(
          [void Function(NextcloudNotificationsPushServerSubscriptionBuilder)? b]) =
      _$NextcloudNotificationsPushServerSubscription;

  static NextcloudNotificationsPushServerSubscription fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsPushServerSubscription fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsPushServerSubscription? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get publicKey;
  String get deviceIdentifier;
  String get signature;
  String? get message;
  static Serializer<NextcloudNotificationsPushServerSubscription> get serializer =>
      _$nextcloudNotificationsPushServerSubscriptionSerializer;
}

abstract class NextcloudNotificationsPushServerRegistration_Ocs
    implements
        Built<NextcloudNotificationsPushServerRegistration_Ocs,
            NextcloudNotificationsPushServerRegistration_OcsBuilder> {
  const NextcloudNotificationsPushServerRegistration_Ocs._();

  factory NextcloudNotificationsPushServerRegistration_Ocs(
          [void Function(NextcloudNotificationsPushServerRegistration_OcsBuilder)? b]) =
      _$NextcloudNotificationsPushServerRegistration_Ocs;

  static NextcloudNotificationsPushServerRegistration_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsPushServerRegistration_Ocs fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsPushServerRegistration_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudNotificationsPushServerSubscription get data;
  static Serializer<NextcloudNotificationsPushServerRegistration_Ocs> get serializer =>
      _$nextcloudNotificationsPushServerRegistrationOcsSerializer;
}

abstract class NextcloudNotificationsPushServerRegistration
    implements
        Built<NextcloudNotificationsPushServerRegistration, NextcloudNotificationsPushServerRegistrationBuilder> {
  const NextcloudNotificationsPushServerRegistration._();

  factory NextcloudNotificationsPushServerRegistration(
          [void Function(NextcloudNotificationsPushServerRegistrationBuilder)? b]) =
      _$NextcloudNotificationsPushServerRegistration;

  static NextcloudNotificationsPushServerRegistration fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsPushServerRegistration fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsPushServerRegistration? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudNotificationsPushServerRegistration_Ocs get ocs;
  static Serializer<NextcloudNotificationsPushServerRegistration> get serializer =>
      _$nextcloudNotificationsPushServerRegistrationSerializer;
}

abstract class NextcloudProvisioningApiUserDetails_Quota
    implements Built<NextcloudProvisioningApiUserDetails_Quota, NextcloudProvisioningApiUserDetails_QuotaBuilder> {
  const NextcloudProvisioningApiUserDetails_Quota._();

  factory NextcloudProvisioningApiUserDetails_Quota(
          [void Function(NextcloudProvisioningApiUserDetails_QuotaBuilder)? b]) =
      _$NextcloudProvisioningApiUserDetails_Quota;

  static NextcloudProvisioningApiUserDetails_Quota fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudProvisioningApiUserDetails_Quota fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudProvisioningApiUserDetails_Quota? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int get free;
  int get used;
  int get total;
  num get relative;
  int get quota;
  static Serializer<NextcloudProvisioningApiUserDetails_Quota> get serializer =>
      _$nextcloudProvisioningApiUserDetailsQuotaSerializer;
}

abstract class NextcloudProvisioningApiUserDetails_BackendCapabilities
    implements
        Built<NextcloudProvisioningApiUserDetails_BackendCapabilities,
            NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder> {
  const NextcloudProvisioningApiUserDetails_BackendCapabilities._();

  factory NextcloudProvisioningApiUserDetails_BackendCapabilities(
          [void Function(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder)? b]) =
      _$NextcloudProvisioningApiUserDetails_BackendCapabilities;

  static NextcloudProvisioningApiUserDetails_BackendCapabilities fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudProvisioningApiUserDetails_BackendCapabilities fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudProvisioningApiUserDetails_BackendCapabilities? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get setDisplayName;
  bool get setPassword;
  static Serializer<NextcloudProvisioningApiUserDetails_BackendCapabilities> get serializer =>
      _$nextcloudProvisioningApiUserDetailsBackendCapabilitiesSerializer;
}

abstract class NextcloudProvisioningApiUserDetails
    implements Built<NextcloudProvisioningApiUserDetails, NextcloudProvisioningApiUserDetailsBuilder> {
  const NextcloudProvisioningApiUserDetails._();

  factory NextcloudProvisioningApiUserDetails([void Function(NextcloudProvisioningApiUserDetailsBuilder)? b]) =
      _$NextcloudProvisioningApiUserDetails;

  static NextcloudProvisioningApiUserDetails fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudProvisioningApiUserDetails fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudProvisioningApiUserDetails? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool? get enabled;
  String? get storageLocation;
  String get id;
  int get lastLogin;
  String get backend;
  BuiltList<String> get subadmin;
  NextcloudProvisioningApiUserDetails_Quota get quota;
  String get avatarScope;
  String? get email;
  String get emailScope;
  @BuiltValueField(wireName: 'additional_mail')
  BuiltList<String> get additionalMail;
  @BuiltValueField(wireName: 'additional_mailScope')
  BuiltList<String> get additionalMailScope;
  String? get displayname;
  String get displaynameScope;
  String get phone;
  String get phoneScope;
  String get address;
  String get addressScope;
  String get website;
  String get websiteScope;
  String get twitter;
  String get twitterScope;
  String get organisation;
  String get organisationScope;
  String get role;
  String get roleScope;
  String get headline;
  String get headlineScope;
  String get biography;
  String get biographyScope;
  @BuiltValueField(wireName: 'profile_enabled')
  String get profileEnabled;
  @BuiltValueField(wireName: 'profile_enabledScope')
  String get profileEnabledScope;
  String get fediverse;
  String get fediverseScope;
  BuiltList<String> get groups;
  String get language;
  String get locale;
  @BuiltValueField(wireName: 'notify_email')
  String? get notifyEmail;
  NextcloudProvisioningApiUserDetails_BackendCapabilities get backendCapabilities;
  @BuiltValueField(wireName: 'display-name')
  String? get displayName;
  static Serializer<NextcloudProvisioningApiUserDetails> get serializer =>
      _$nextcloudProvisioningApiUserDetailsSerializer;
}

abstract class NextcloudProvisioningApiUser_Ocs
    implements Built<NextcloudProvisioningApiUser_Ocs, NextcloudProvisioningApiUser_OcsBuilder> {
  const NextcloudProvisioningApiUser_Ocs._();

  factory NextcloudProvisioningApiUser_Ocs([void Function(NextcloudProvisioningApiUser_OcsBuilder)? b]) =
      _$NextcloudProvisioningApiUser_Ocs;

  static NextcloudProvisioningApiUser_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudProvisioningApiUser_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudProvisioningApiUser_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudProvisioningApiUserDetails get data;
  static Serializer<NextcloudProvisioningApiUser_Ocs> get serializer => _$nextcloudProvisioningApiUserOcsSerializer;
}

abstract class NextcloudProvisioningApiUser
    implements Built<NextcloudProvisioningApiUser, NextcloudProvisioningApiUserBuilder> {
  const NextcloudProvisioningApiUser._();

  factory NextcloudProvisioningApiUser([void Function(NextcloudProvisioningApiUserBuilder)? b]) =
      _$NextcloudProvisioningApiUser;

  static NextcloudProvisioningApiUser fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudProvisioningApiUser fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudProvisioningApiUser? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudProvisioningApiUser_Ocs get ocs;
  static Serializer<NextcloudProvisioningApiUser> get serializer => _$nextcloudProvisioningApiUserSerializer;
}

abstract class NextcloudUnifiedPushProviderCheckResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderCheckResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCheckResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderCheckResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderCheckResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderCheckResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCheckResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson,
            NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  String get deviceId;
  static Serializer<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson,
            NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson._();

  factory NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson;

  static NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  String get token;
  static Serializer<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  const NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._();

  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush(
      [void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
          b]) = _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush;

  static NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int get version;
  static Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush>
      get serializer =>
          _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderPushResponse201ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderPushResponse201ApplicationJson,
            NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderPushResponse201ApplicationJson._();

  factory NextcloudUnifiedPushProviderPushResponse201ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson;

  static NextcloudUnifiedPushProviderPushResponse201ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderPushResponse201ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderPushResponse201ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderPushResponse201ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderPushResponse201ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  const NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._();

  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush(
      [void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
          b]) = _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush;

  static NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush fromJsonString(
          String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(
          NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get gateway;
  static Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush>
      get serializer =>
          _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson fromJson(
          Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder> {
  const NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder)? b]) =
      _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson;

  static NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  BuiltList<String> get rejected;
  static Serializer<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonSerializer;
}

class NextcloudUserStatusClearAt_Type extends EnumClass {
  const NextcloudUserStatusClearAt_Type._(super.name);

  static const NextcloudUserStatusClearAt_Type period = _$nextcloudUserStatusClearAtTypePeriod;

  @BuiltValueEnumConst(wireName: 'end-of')
  static const NextcloudUserStatusClearAt_Type endOf = _$nextcloudUserStatusClearAtTypeEndOf;

  static BuiltSet<NextcloudUserStatusClearAt_Type> get values => _$nextcloudUserStatusClearAtTypeValues;
  static NextcloudUserStatusClearAt_Type valueOf(String name) => _$valueOfNextcloudUserStatusClearAt_Type(name);
  static Serializer<NextcloudUserStatusClearAt_Type> get serializer => _$nextcloudUserStatusClearAtTypeSerializer;
}

class NextcloudUserStatusClearAt_Time0 extends EnumClass {
  const NextcloudUserStatusClearAt_Time0._(super.name);

  static const NextcloudUserStatusClearAt_Time0 day = _$nextcloudUserStatusClearAtTime0Day;

  static const NextcloudUserStatusClearAt_Time0 week = _$nextcloudUserStatusClearAtTime0Week;

  static BuiltSet<NextcloudUserStatusClearAt_Time0> get values => _$nextcloudUserStatusClearAtTime0Values;
  static NextcloudUserStatusClearAt_Time0 valueOf(String name) => _$valueOfNextcloudUserStatusClearAt_Time0(name);
  static Serializer<NextcloudUserStatusClearAt_Time0> get serializer => _$nextcloudUserStatusClearAtTime0Serializer;
}

class NextcloudUserStatusClearAt_Time {
  NextcloudUserStatusClearAt_Time(
    this._data, {
    this.userStatusClearAtTime0,
    this.$int,
  });

  factory NextcloudUserStatusClearAt_Time.fromJson(dynamic data) {
    NextcloudUserStatusClearAt_Time0? userStatusClearAtTime0;
    int? $int;
    try {
      userStatusClearAtTime0 = NextcloudUserStatusClearAt_Time0.valueOf(data as String);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    assert([userStatusClearAtTime0, $int].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudUserStatusClearAt_Time(
      data,
      userStatusClearAtTime0: userStatusClearAtTime0,
      $int: $int,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusClearAt_Time.fromJsonString(String data) =>
      NextcloudUserStatusClearAt_Time.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final NextcloudUserStatusClearAt_Time0? userStatusClearAtTime0;

  /// Time offset in seconds
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudUserStatusClearAt
    implements Built<NextcloudUserStatusClearAt, NextcloudUserStatusClearAtBuilder> {
  const NextcloudUserStatusClearAt._();

  factory NextcloudUserStatusClearAt([void Function(NextcloudUserStatusClearAtBuilder)? b]) =
      _$NextcloudUserStatusClearAt;

  static NextcloudUserStatusClearAt fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusClearAt fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusClearAt? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusClearAt_Type get type;
  NextcloudUserStatusClearAt_Time get time;
  static Serializer<NextcloudUserStatusClearAt> get serializer => _$nextcloudUserStatusClearAtSerializer;
}

class NextcloudUserStatusPublicStatus_ClearAt {
  NextcloudUserStatusPublicStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory NextcloudUserStatusPublicStatus_ClearAt.fromJson(dynamic data) {
    NextcloudUserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = NextcloudUserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    assert([userStatusClearAt, $int].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudUserStatusPublicStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusPublicStatus_ClearAt.fromJsonString(String data) =>
      NextcloudUserStatusPublicStatus_ClearAt.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final NextcloudUserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

class NextcloudUserStatusType extends EnumClass {
  const NextcloudUserStatusType._(super.name);

  static const NextcloudUserStatusType online = _$nextcloudUserStatusTypeOnline;

  static const NextcloudUserStatusType offline = _$nextcloudUserStatusTypeOffline;

  static const NextcloudUserStatusType dnd = _$nextcloudUserStatusTypeDnd;

  static const NextcloudUserStatusType away = _$nextcloudUserStatusTypeAway;

  static const NextcloudUserStatusType invisible = _$nextcloudUserStatusTypeInvisible;

  static BuiltSet<NextcloudUserStatusType> get values => _$nextcloudUserStatusTypeValues;
  static NextcloudUserStatusType valueOf(String name) => _$valueOfNextcloudUserStatusType(name);
  static Serializer<NextcloudUserStatusType> get serializer => _$nextcloudUserStatusTypeSerializer;
}

abstract class NextcloudUserStatusPublicStatus
    implements Built<NextcloudUserStatusPublicStatus, NextcloudUserStatusPublicStatusBuilder> {
  const NextcloudUserStatusPublicStatus._();

  factory NextcloudUserStatusPublicStatus([void Function(NextcloudUserStatusPublicStatusBuilder)? b]) =
      _$NextcloudUserStatusPublicStatus;

  static NextcloudUserStatusPublicStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusPublicStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusPublicStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get userId;
  String? get message;
  String? get icon;
  NextcloudUserStatusPublicStatus_ClearAt? get clearAt;
  NextcloudUserStatusType get status;
  static Serializer<NextcloudUserStatusPublicStatus> get serializer => _$nextcloudUserStatusPublicStatusSerializer;
}

abstract class NextcloudUserStatusGetPublicStatuses_Ocs
    implements Built<NextcloudUserStatusGetPublicStatuses_Ocs, NextcloudUserStatusGetPublicStatuses_OcsBuilder> {
  const NextcloudUserStatusGetPublicStatuses_Ocs._();

  factory NextcloudUserStatusGetPublicStatuses_Ocs(
      [void Function(NextcloudUserStatusGetPublicStatuses_OcsBuilder)? b]) = _$NextcloudUserStatusGetPublicStatuses_Ocs;

  static NextcloudUserStatusGetPublicStatuses_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetPublicStatuses_Ocs fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetPublicStatuses_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudUserStatusPublicStatus> get data;
  static Serializer<NextcloudUserStatusGetPublicStatuses_Ocs> get serializer =>
      _$nextcloudUserStatusGetPublicStatusesOcsSerializer;
}

abstract class NextcloudUserStatusGetPublicStatuses
    implements Built<NextcloudUserStatusGetPublicStatuses, NextcloudUserStatusGetPublicStatusesBuilder> {
  const NextcloudUserStatusGetPublicStatuses._();

  factory NextcloudUserStatusGetPublicStatuses([void Function(NextcloudUserStatusGetPublicStatusesBuilder)? b]) =
      _$NextcloudUserStatusGetPublicStatuses;

  static NextcloudUserStatusGetPublicStatuses fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetPublicStatuses fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetPublicStatuses? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusGetPublicStatuses_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetPublicStatuses> get serializer =>
      _$nextcloudUserStatusGetPublicStatusesSerializer;
}

class NextcloudUserStatusGetPublicStatus_Ocs_Data {
  NextcloudUserStatusGetPublicStatus_Ocs_Data(
    this._data, {
    this.builtListJsonObject,
    this.userStatusPublicStatus,
  });

  factory NextcloudUserStatusGetPublicStatus_Ocs_Data.fromJson(dynamic data) {
    BuiltList<JsonObject>? builtListJsonObject;
    NextcloudUserStatusPublicStatus? userStatusPublicStatus;
    try {
      builtListJsonObject = BuiltList<JsonObject>((data as List).map((final e) => JsonObject(e)));
    } catch (_) {}
    try {
      userStatusPublicStatus = NextcloudUserStatusPublicStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    assert([builtListJsonObject, userStatusPublicStatus].where((final x) => x != null).length >= 1,
        'Need oneOf for $data');
    return NextcloudUserStatusGetPublicStatus_Ocs_Data(
      data,
      builtListJsonObject: builtListJsonObject,
      userStatusPublicStatus: userStatusPublicStatus,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusGetPublicStatus_Ocs_Data.fromJsonString(String data) =>
      NextcloudUserStatusGetPublicStatus_Ocs_Data.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final BuiltList<JsonObject>? builtListJsonObject;

  final NextcloudUserStatusPublicStatus? userStatusPublicStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudUserStatusGetPublicStatus_Ocs
    implements Built<NextcloudUserStatusGetPublicStatus_Ocs, NextcloudUserStatusGetPublicStatus_OcsBuilder> {
  const NextcloudUserStatusGetPublicStatus_Ocs._();

  factory NextcloudUserStatusGetPublicStatus_Ocs([void Function(NextcloudUserStatusGetPublicStatus_OcsBuilder)? b]) =
      _$NextcloudUserStatusGetPublicStatus_Ocs;

  static NextcloudUserStatusGetPublicStatus_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetPublicStatus_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetPublicStatus_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudUserStatusGetPublicStatus_Ocs_Data get data;
  static Serializer<NextcloudUserStatusGetPublicStatus_Ocs> get serializer =>
      _$nextcloudUserStatusGetPublicStatusOcsSerializer;
}

abstract class NextcloudUserStatusGetPublicStatus
    implements Built<NextcloudUserStatusGetPublicStatus, NextcloudUserStatusGetPublicStatusBuilder> {
  const NextcloudUserStatusGetPublicStatus._();

  factory NextcloudUserStatusGetPublicStatus([void Function(NextcloudUserStatusGetPublicStatusBuilder)? b]) =
      _$NextcloudUserStatusGetPublicStatus;

  static NextcloudUserStatusGetPublicStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetPublicStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetPublicStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusGetPublicStatus_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetPublicStatus> get serializer =>
      _$nextcloudUserStatusGetPublicStatusSerializer;
}

class NextcloudUserStatusStatus_ClearAt {
  NextcloudUserStatusStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory NextcloudUserStatusStatus_ClearAt.fromJson(dynamic data) {
    NextcloudUserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = NextcloudUserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    assert([userStatusClearAt, $int].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudUserStatusStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusStatus_ClearAt.fromJsonString(String data) =>
      NextcloudUserStatusStatus_ClearAt.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final NextcloudUserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudUserStatusStatus implements Built<NextcloudUserStatusStatus, NextcloudUserStatusStatusBuilder> {
  const NextcloudUserStatusStatus._();

  factory NextcloudUserStatusStatus([void Function(NextcloudUserStatusStatusBuilder)? b]) = _$NextcloudUserStatusStatus;

  static NextcloudUserStatusStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get userId;
  String? get message;
  String? get messageId;
  bool get messageIsPredefined;
  String? get icon;
  NextcloudUserStatusStatus_ClearAt? get clearAt;
  NextcloudUserStatusType get status;
  bool get statusIsUserDefined;
  static Serializer<NextcloudUserStatusStatus> get serializer => _$nextcloudUserStatusStatusSerializer;
}

class NextcloudUserStatusGetStatus_Ocs_Data {
  NextcloudUserStatusGetStatus_Ocs_Data(
    this._data, {
    this.builtListJsonObject,
    this.userStatusStatus,
  });

  factory NextcloudUserStatusGetStatus_Ocs_Data.fromJson(dynamic data) {
    BuiltList<JsonObject>? builtListJsonObject;
    NextcloudUserStatusStatus? userStatusStatus;
    try {
      builtListJsonObject = BuiltList<JsonObject>((data as List).map((final e) => JsonObject(e)));
    } catch (_) {}
    try {
      userStatusStatus = NextcloudUserStatusStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    assert([builtListJsonObject, userStatusStatus].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudUserStatusGetStatus_Ocs_Data(
      data,
      builtListJsonObject: builtListJsonObject,
      userStatusStatus: userStatusStatus,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusGetStatus_Ocs_Data.fromJsonString(String data) =>
      NextcloudUserStatusGetStatus_Ocs_Data.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final BuiltList<JsonObject>? builtListJsonObject;

  final NextcloudUserStatusStatus? userStatusStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudUserStatusGetStatus_Ocs
    implements Built<NextcloudUserStatusGetStatus_Ocs, NextcloudUserStatusGetStatus_OcsBuilder> {
  const NextcloudUserStatusGetStatus_Ocs._();

  factory NextcloudUserStatusGetStatus_Ocs([void Function(NextcloudUserStatusGetStatus_OcsBuilder)? b]) =
      _$NextcloudUserStatusGetStatus_Ocs;

  static NextcloudUserStatusGetStatus_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetStatus_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetStatus_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudUserStatusGetStatus_Ocs_Data get data;
  static Serializer<NextcloudUserStatusGetStatus_Ocs> get serializer => _$nextcloudUserStatusGetStatusOcsSerializer;
}

abstract class NextcloudUserStatusGetStatus
    implements Built<NextcloudUserStatusGetStatus, NextcloudUserStatusGetStatusBuilder> {
  const NextcloudUserStatusGetStatus._();

  factory NextcloudUserStatusGetStatus([void Function(NextcloudUserStatusGetStatusBuilder)? b]) =
      _$NextcloudUserStatusGetStatus;

  static NextcloudUserStatusGetStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusGetStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusGetStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusGetStatus_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetStatus> get serializer => _$nextcloudUserStatusGetStatusSerializer;
}

class NextcloudUserStatusPredefinedStatus_ClearAt {
  NextcloudUserStatusPredefinedStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.$int,
  });

  factory NextcloudUserStatusPredefinedStatus_ClearAt.fromJson(dynamic data) {
    NextcloudUserStatusClearAt? userStatusClearAt;
    int? $int;
    try {
      userStatusClearAt = NextcloudUserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    try {
      $int = (data as int);
    } catch (_) {}
    assert([userStatusClearAt, $int].where((final x) => x != null).length >= 1, 'Need oneOf for $data');
    return NextcloudUserStatusPredefinedStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      $int: $int,
    );
  }

  // coverage:ignore-start
  factory NextcloudUserStatusPredefinedStatus_ClearAt.fromJsonString(String data) =>
      NextcloudUserStatusPredefinedStatus_ClearAt.fromJson(json.decode(data));
  // coverage:ignore-end

  final dynamic _data;

  final NextcloudUserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? $int;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
  // coverage:ignore-start
  static String toJsonString(dynamic data) => json.encode(data);
  // coverage:ignore-end
}

abstract class NextcloudUserStatusPredefinedStatus
    implements Built<NextcloudUserStatusPredefinedStatus, NextcloudUserStatusPredefinedStatusBuilder> {
  const NextcloudUserStatusPredefinedStatus._();

  factory NextcloudUserStatusPredefinedStatus([void Function(NextcloudUserStatusPredefinedStatusBuilder)? b]) =
      _$NextcloudUserStatusPredefinedStatus;

  static NextcloudUserStatusPredefinedStatus fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusPredefinedStatus fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusPredefinedStatus? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  String get id;
  String get icon;
  String get message;
  NextcloudUserStatusPredefinedStatus_ClearAt? get clearAt;
  static Serializer<NextcloudUserStatusPredefinedStatus> get serializer =>
      _$nextcloudUserStatusPredefinedStatusSerializer;
}

abstract class NextcloudUserStatusPredefinedStatuses_Ocs
    implements Built<NextcloudUserStatusPredefinedStatuses_Ocs, NextcloudUserStatusPredefinedStatuses_OcsBuilder> {
  const NextcloudUserStatusPredefinedStatuses_Ocs._();

  factory NextcloudUserStatusPredefinedStatuses_Ocs(
          [void Function(NextcloudUserStatusPredefinedStatuses_OcsBuilder)? b]) =
      _$NextcloudUserStatusPredefinedStatuses_Ocs;

  static NextcloudUserStatusPredefinedStatuses_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusPredefinedStatuses_Ocs fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusPredefinedStatuses_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudUserStatusPredefinedStatus> get data;
  static Serializer<NextcloudUserStatusPredefinedStatuses_Ocs> get serializer =>
      _$nextcloudUserStatusPredefinedStatusesOcsSerializer;
}

abstract class NextcloudUserStatusPredefinedStatuses
    implements Built<NextcloudUserStatusPredefinedStatuses, NextcloudUserStatusPredefinedStatusesBuilder> {
  const NextcloudUserStatusPredefinedStatuses._();

  factory NextcloudUserStatusPredefinedStatuses([void Function(NextcloudUserStatusPredefinedStatusesBuilder)? b]) =
      _$NextcloudUserStatusPredefinedStatuses;

  static NextcloudUserStatusPredefinedStatuses fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusPredefinedStatuses fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusPredefinedStatuses? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusPredefinedStatuses_Ocs get ocs;
  static Serializer<NextcloudUserStatusPredefinedStatuses> get serializer =>
      _$nextcloudUserStatusPredefinedStatusesSerializer;
}

abstract class NextcloudUserStatusHeartbeat_Ocs
    implements Built<NextcloudUserStatusHeartbeat_Ocs, NextcloudUserStatusHeartbeat_OcsBuilder> {
  const NextcloudUserStatusHeartbeat_Ocs._();

  factory NextcloudUserStatusHeartbeat_Ocs([void Function(NextcloudUserStatusHeartbeat_OcsBuilder)? b]) =
      _$NextcloudUserStatusHeartbeat_Ocs;

  static NextcloudUserStatusHeartbeat_Ocs fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusHeartbeat_Ocs fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusHeartbeat_Ocs? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudOCSMeta get meta;
  NextcloudUserStatusStatus get data;
  static Serializer<NextcloudUserStatusHeartbeat_Ocs> get serializer => _$nextcloudUserStatusHeartbeatOcsSerializer;
}

abstract class NextcloudUserStatusHeartbeat
    implements Built<NextcloudUserStatusHeartbeat, NextcloudUserStatusHeartbeatBuilder> {
  const NextcloudUserStatusHeartbeat._();

  factory NextcloudUserStatusHeartbeat([void Function(NextcloudUserStatusHeartbeatBuilder)? b]) =
      _$NextcloudUserStatusHeartbeat;

  static NextcloudUserStatusHeartbeat fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudUserStatusHeartbeat fromJsonString(String data) => serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudUserStatusHeartbeat? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  NextcloudUserStatusHeartbeat_Ocs get ocs;
  static Serializer<NextcloudUserStatusHeartbeat> get serializer => _$nextcloudUserStatusHeartbeatSerializer;
}

abstract class NextcloudNotificationsNotificationDecryptedSubject
    implements
        Built<NextcloudNotificationsNotificationDecryptedSubject,
            NextcloudNotificationsNotificationDecryptedSubjectBuilder> {
  const NextcloudNotificationsNotificationDecryptedSubject._();

  factory NextcloudNotificationsNotificationDecryptedSubject(
          [void Function(NextcloudNotificationsNotificationDecryptedSubjectBuilder)? b]) =
      _$NextcloudNotificationsNotificationDecryptedSubject;

  static NextcloudNotificationsNotificationDecryptedSubject fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith(serializer, json)!;
  static NextcloudNotificationsNotificationDecryptedSubject fromJsonString(String data) =>
      serializers.fromJson(serializer, data)!;
  Map<String, dynamic> toJson() => serializers.serializeWith(serializer, this) as Map<String, dynamic>;
  static String? toJsonString(NextcloudNotificationsNotificationDecryptedSubject? data) =>
      data == null ? null : serializers.toJson(serializer, data);
  int? get nid;
  String? get app;
  String? get subject;
  String? get type;
  String? get id;
  bool? get delete;
  @BuiltValueField(wireName: 'delete-all')
  bool? get deleteAll;
  static Serializer<NextcloudNotificationsNotificationDecryptedSubject> get serializer =>
      _$nextcloudNotificationsNotificationDecryptedSubjectSerializer;
}

@SerializersFor([
  NextcloudCoreServerStatus,
  NextcloudCoreServerCapabilities,
  NextcloudCoreServerCapabilities_Ocs,
  NextcloudOCSMeta,
  NextcloudCoreServerCapabilities_Ocs_Data,
  NextcloudCoreServerCapabilities_Ocs_Data_Version,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
  NextcloudCoreNavigationApps,
  NextcloudCoreNavigationApps_Ocs,
  NextcloudCoreNavigationApps_Ocs_Data,
  NextcloudCoreLoginFlowInit,
  NextcloudCoreLoginFlowInit_Poll,
  NextcloudCoreLoginFlowResult,
  NextcloudCoreAutocompleteResult,
  NextcloudCoreAutocompleteResult_Ocs,
  NextcloudCoreAutocompleteResult_Ocs_Data,
  NextcloudNewsSupportedAPIVersions,
  NextcloudNewsListFolders,
  NextcloudNewsFolder,
  NextcloudNewsFeed,
  NextcloudNewsArticle,
  NextcloudNewsListFeeds,
  NextcloudNewsListArticles,
  NextcloudNotesNote,
  NextcloudNotesSettings,
  NextcloudNotificationsListNotifications,
  NextcloudNotificationsListNotifications_Ocs,
  NextcloudNotificationsNotification,
  NextcloudNotificationsNotificationAction,
  NextcloudNotificationsGetNotification,
  NextcloudNotificationsGetNotification_Ocs,
  NextcloudEmptyOCS,
  NextcloudEmptyOCS_Ocs,
  NextcloudNotificationsPushServerRegistration,
  NextcloudNotificationsPushServerRegistration_Ocs,
  NextcloudNotificationsPushServerSubscription,
  NextcloudProvisioningApiUser,
  NextcloudProvisioningApiUser_Ocs,
  NextcloudProvisioningApiUserDetails,
  NextcloudProvisioningApiUserDetails_Quota,
  NextcloudProvisioningApiUserDetails_BackendCapabilities,
  NextcloudUnifiedPushProviderCheckResponse200ApplicationJson,
  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson,
  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson,
  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson,
  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson,
  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson,
  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson,
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson,
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
  NextcloudUnifiedPushProviderPushResponse201ApplicationJson,
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson,
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson,
  NextcloudUserStatusGetPublicStatuses,
  NextcloudUserStatusGetPublicStatuses_Ocs,
  NextcloudUserStatusPublicStatus,
  NextcloudUserStatusClearAt,
  NextcloudUserStatusGetPublicStatus,
  NextcloudUserStatusGetPublicStatus_Ocs,
  NextcloudUserStatusGetStatus,
  NextcloudUserStatusGetStatus_Ocs,
  NextcloudUserStatusStatus,
  NextcloudUserStatusPredefinedStatuses,
  NextcloudUserStatusPredefinedStatuses_Ocs,
  NextcloudUserStatusPredefinedStatus,
  NextcloudUserStatusHeartbeat,
  NextcloudUserStatusHeartbeat_Ocs,
  NextcloudNotificationsNotificationDecryptedSubject,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

// coverage:ignore-start
T deserializeNextcloud<T>(final Object data) => serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNextcloud<T>(final T data) => serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
