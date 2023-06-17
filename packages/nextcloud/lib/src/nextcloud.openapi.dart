// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:universal_io/io.dart';

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

class RawResponse {
  RawResponse(
    this.statusCode,
    this.headers,
    this.body,
  );

  final int statusCode;

  final Map<String, String> headers;

  final Uint8List body;

  @override
  String toString() => 'RawResponse(statusCode: $statusCode, headers: $headers, body: ${utf8.decode(body)})';
}

class NextcloudApiException extends RawResponse implements Exception {
  NextcloudApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  factory NextcloudApiException.fromResponse(final RawResponse response) => NextcloudApiException(
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
    final Map<String, String>? baseHeaders,
    final String? userAgent,
    final HttpClient? httpClient,
    this.cookieJar,
    this.authentications = const [],
  }) {
    this.baseHeaders = {
      ...?baseHeaders,
    };
    this.httpClient = (httpClient ?? HttpClient())..userAgent = userAgent;
  }

  final String baseURL;

  late final Map<String, String> baseHeaders;

  late final HttpClient httpClient;

  final CookieJar? cookieJar;

  final List<NextcloudAuthentication> authentications;

  Future<RawResponse> doRequest(
    final String method,
    final String path,
    final Map<String, String> headers,
    final Uint8List? body,
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
    return RawResponse(
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
    const path = '/status.php';
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreServerStatus),
      )! as NextcloudCoreServerStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreServerCapabilities> getCapabilities() async {
    const path = '/ocs/v2.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreServerCapabilities),
      )! as NextcloudCoreServerCapabilities;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreNavigationApps> getNavigationApps() async {
    const path = '/ocs/v2.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreNavigationApps),
      )! as NextcloudCoreNavigationApps;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreLoginFlowInit> initLoginFlow() async {
    const path = '/index.php/login/v2';
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreLoginFlowInit),
      )! as NextcloudCoreLoginFlowInit;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudCoreLoginFlowResult> getLoginFlowResult({required final String token}) async {
    const path = '/index.php/login/v2/poll';
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreLoginFlowResult),
      )! as NextcloudCoreLoginFlowResult;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<Uint8List> getPreview({
    final String file = '',
    final int x = 32,
    final int y = 32,
    final int a = 0,
    final int forceIcon = 1,
    final String mode = 'fill',
  }) async {
    const path = '/index.php/core/preview.png';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'image/png',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final String userId,
    required final int size,
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
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final String userId,
    required final int size,
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
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final String search,
    required final String itemType,
    required final String itemId,
    required final List<int> shareTypes,
    final String? sorter,
    final int limit = 10,
  }) async {
    const path = '/ocs/v2.php/core/autocomplete/get';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['search'] = search;
    queryParameters['itemType'] = itemType;
    queryParameters['itemId'] = itemId;
    queryParameters['shareTypes[]'] = shareTypes.map((final e) => e.toString());
    if (sorter != null) {
      queryParameters['sorter'] = sorter;
    }
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudCoreAutocompleteResult),
      )! as NextcloudCoreAutocompleteResult;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<JsonObject> deleteAppPassword() async {
    const path = '/ocs/v2.php/core/apppassword';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return JsonObject(utf8.decode(response.body));
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudNewsClient {
  NextcloudNewsClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudNewsSupportedAPIVersions> getSupportedApiVersions() async {
    const path = '/index.php/apps/news/api';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsSupportedAPIVersions),
      )! as NextcloudNewsSupportedAPIVersions;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFolders> listFolders() async {
    const path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListFolders),
      )! as NextcloudNewsListFolders;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFolders> createFolder({required final String name}) async {
    const path = '/index.php/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['name'] = name;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListFolders),
      )! as NextcloudNewsListFolders;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFolder({
    required final int folderId,
    required final String name,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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

  Future deleteFolder({required final int folderId}) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final int folderId,
    required final int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListFeeds),
      )! as NextcloudNewsListFeeds;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListFeeds> addFeed({
    required final String url,
    final int? folderId,
  }) async {
    const path = '/index.php/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListFeeds),
      )! as NextcloudNewsListFeeds;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFeed({required final int feedId}) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final int feedId,
    final int? folderId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final int feedId,
    required final String feedTitle,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    required final int feedId,
    required final int newestItemId,
  }) async {
    var path = '/index.php/apps/news/api/v1-3/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListArticles),
      )! as NextcloudNewsListArticles;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNewsListArticles> listUpdatedArticles({
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
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNewsListArticles),
      )! as NextcloudNewsListArticles;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsRead({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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

  Future markArticleAsUnread({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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

  Future starArticle({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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

  Future unstarArticle({required final int itemId}) async {
    var path = '/index.php/apps/news/api/v1-3/items/{itemId}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    final String? category,
    final String exclude = '',
    final int pruneBefore = 0,
    final int chunkSize = 0,
    final String? chunkCursor,
    final String? ifNoneMatch,
  }) async {
    const path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(BuiltList, [FullType(NextcloudNotesNote)]),
      )! as BuiltList<NextcloudNotesNote>;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> createNote({
    final String category = '',
    final String title = '',
    final String content = '',
    final int modified = 0,
    final int favorite = 0,
  }) async {
    const path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotesNote),
      )! as NextcloudNotesNote;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> getNote({
    required final int id,
    final String exclude = '',
    final String? ifNoneMatch,
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
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotesNote),
      )! as NextcloudNotesNote;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesNote> updateNote({
    required final int id,
    final String? content,
    final int? modified,
    final String? title,
    final String? category,
    final int favorite = 0,
    final String? ifMatch,
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
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotesNote),
      )! as NextcloudNotesNote;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteNote({required final int id}) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesSettings> getSettings() async {
    const path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotesSettings),
      )! as NextcloudNotesSettings;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotesSettings> updateSettings({required final NextcloudNotesSettings notesSettings}) async {
    const path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    headers['Content-Type'] = 'application/json';
    body = Uint8List.fromList(
      utf8.encode(
        json.encode(jsonSerializers.serialize(notesSettings, specifiedType: const FullType(NextcloudNotesSettings))),
      ),
    );
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotesSettings),
      )! as NextcloudNotesSettings;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudNotificationsClient {
  NextcloudNotificationsClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudNotificationsListNotifications> listNotifications() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotificationsListNotifications),
      )! as NextcloudNotificationsListNotifications;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteAllNotifications() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotificationsGetNotification> getNotification({required final int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotificationsGetNotification),
      )! as NextcloudNotificationsGetNotification;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudEmptyOCS> deleteNotification({required final int id}) async {
    var path = '/ocs/v2.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudEmptyOCS),
      )! as NextcloudEmptyOCS;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudNotificationsPushServerRegistration> registerDevice({
    required final String pushTokenHash,
    required final String devicePublicKey,
    required final String proxyServer,
  }) async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudNotificationsPushServerRegistration),
      )! as NextcloudNotificationsPushServerRegistration;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> removeDevice() async {
    const path = '/ocs/v2.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 202) {
      return utf8.decode(response.body);
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudEmptyOCS> sendAdminNotification({
    required final String userId,
    required final String shortMessage,
    final String longMessage = '',
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
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudEmptyOCS),
      )! as NextcloudEmptyOCS;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudProvisioningApiClient {
  NextcloudProvisioningApiClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudProvisioningApiUser> getCurrentUser() async {
    const path = '/ocs/v2.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudProvisioningApiUser),
      )! as NextcloudProvisioningApiUser;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudProvisioningApiUser> getUser({required final String userId}) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudProvisioningApiUser),
      )! as NextcloudProvisioningApiUser;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudUnifiedPushProviderClient {
  NextcloudUnifiedPushProviderClient(this.rootClient);

  final NextcloudClient rootClient;

  /// Check if the UnifiedPush provider is present
  Future<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson> check() async {
    const path = '/index.php/apps/uppush';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderCheckResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderCheckResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set keepalive interval
  ///
  /// This endpoint requires admin access
  Future<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson> setKeepalive({
    required final int keepalive,
  }) async {
    const path = '/index.php/apps/uppush/keepalive';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['keepalive'] = keepalive.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to create a new deviceId
  Future<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson> createDevice({
    required final String deviceName,
  }) async {
    const path = '/index.php/apps/uppush/device';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['deviceName'] = deviceName;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Request to get push messages
  ///
  /// This is a public page since it has to be handle by the non-connected app (NextPush app and not Nextcloud-app)
  Future<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson> syncDevice({
    required final String deviceId,
  }) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 401) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson),
      )! as NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a device
  Future<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson> deleteDevice({
    required final String deviceId,
  }) async {
    var path = '/index.php/apps/uppush/device/{deviceId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{deviceId}', Uri.encodeQueryComponent(deviceId));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create an authorization token for a new 3rd party service
  Future<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson> createApp({
    required final String deviceId,
    required final String appName,
  }) async {
    const path = '/index.php/apps/uppush/app';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete an authorization token
  Future<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson> deleteApp({
    required final String token,
  }) async {
    var path = '/index.php/apps/uppush/app/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Unifiedpush discovery Following specifications
  Future<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson> unifiedpushDiscovery({
    required final String token,
  }) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Receive notifications from 3rd parties
  Future<NextcloudUnifiedPushProviderPushResponse201ApplicationJson> push({required final String token}) async {
    var path = '/index.php/apps/uppush/push/{token}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{token}', Uri.encodeQueryComponent(token));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 201) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderPushResponse201ApplicationJson),
      )! as NextcloudUnifiedPushProviderPushResponse201ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway discovery
  Future<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson> gatewayMatrixDiscovery() async {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Matrix Gateway
  Future<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson> gatewayMatrix() async {
    const path = '/index.php/apps/uppush/gateway/matrix';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson),
      )! as NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NextcloudUserStatusClient {
  NextcloudUserStatusClient(this.rootClient);

  final NextcloudClient rootClient;

  Future<NextcloudUserStatusGetPublicStatuses> getPublicStatuses() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetPublicStatuses),
      )! as NextcloudUserStatusGetPublicStatuses;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetPublicStatus> getPublicStatus({required final String userId}) async {
    var path = '/ocs/v2.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetPublicStatus),
      )! as NextcloudUserStatusGetPublicStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> getStatus() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetStatus),
      )! as NextcloudUserStatusGetStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setStatus({required final NextcloudUserStatusType statusType}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['statusType'] = statusType.name;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetStatus),
      )! as NextcloudUserStatusGetStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setPredefinedMessage({
    required final String messageId,
    final int? clearAt,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetStatus),
      )! as NextcloudUserStatusGetStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusGetStatus> setCustomMessage({
    final String? statusIcon,
    final String? message,
    final int? clearAt,
  }) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message/custom';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusGetStatus),
      )! as NextcloudUserStatusGetStatus;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future clearMessage() async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
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
    const path = '/ocs/v2.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusPredefinedStatuses),
      )! as NextcloudUserStatusPredefinedStatuses;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NextcloudUserStatusHeartbeat> heartbeat({required final NextcloudUserStatusType status}) async {
    const path = '/ocs/v2.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (rootClient.authentications.map((final a) => a.id).contains('basic_auth')) {
      headers.addAll(rootClient.authentications.singleWhere((final a) => a.id == 'basic_auth').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    queryParameters['status'] = status.name;
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return jsonSerializers.deserialize(
        json.decode(utf8.decode(response.body)),
        specifiedType: const FullType(NextcloudUserStatusHeartbeat),
      )! as NextcloudUserStatusHeartbeat;
    }
    throw NextcloudApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class NextcloudCoreServerStatus implements Built<NextcloudCoreServerStatus, NextcloudCoreServerStatusBuilder> {
  factory NextcloudCoreServerStatus([final void Function(NextcloudCoreServerStatusBuilder)? b]) =
      _$NextcloudCoreServerStatus;
  const NextcloudCoreServerStatus._();

  factory NextcloudCoreServerStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudOCSMeta([final void Function(NextcloudOCSMetaBuilder)? b]) = _$NextcloudOCSMeta;
  const NextcloudOCSMeta._();

  factory NextcloudOCSMeta.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Version([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Version;
  const NextcloudCoreServerCapabilities_Ocs_Data_Version._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Version.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get delay;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesBruteforceSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<String>? get size;
  BuiltList<String>? get gps;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get url;
  String? get etag;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<String>? get apiv2;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesActivitySerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get globalScale;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)?
        b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get core;
  JsonObject? get extra;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get flags;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? get source;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<int>? get coreFlags;
  BuiltList<int>? get systemFlags;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? get constants;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? get config;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get level;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? get constants;
  JsonObject? get type;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get webdav;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get bulkupload;
  String? get chunking;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesDavSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enforced;
  bool? get askForOptionalPassword;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>
      get serializer =>
          _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)?
        b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  bool? get enforced;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder,
    )? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  bool? get enforced;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>
      get serializer => _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get generate;
  String? get validate;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities
    implements
        Built<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities,
            NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities([
    final void Function(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities;
  const NextcloudCoreServerCapabilities_Ocs_Data_Capabilities._();

  factory NextcloudCoreServerCapabilities_Ocs_Data_Capabilities.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreServerCapabilities_Ocs_Data([
    final void Function(NextcloudCoreServerCapabilities_Ocs_DataBuilder)? b,
  ]) = _$NextcloudCoreServerCapabilities_Ocs_Data;
  const NextcloudCoreServerCapabilities_Ocs_Data._();

  factory NextcloudCoreServerCapabilities_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreServerCapabilities_Ocs_Data_Version get version;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities get capabilities;
  static Serializer<NextcloudCoreServerCapabilities_Ocs_Data> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsDataSerializer;
}

abstract class NextcloudCoreServerCapabilities_Ocs
    implements Built<NextcloudCoreServerCapabilities_Ocs, NextcloudCoreServerCapabilities_OcsBuilder> {
  factory NextcloudCoreServerCapabilities_Ocs([final void Function(NextcloudCoreServerCapabilities_OcsBuilder)? b]) =
      _$NextcloudCoreServerCapabilities_Ocs;
  const NextcloudCoreServerCapabilities_Ocs._();

  factory NextcloudCoreServerCapabilities_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudCoreServerCapabilities_Ocs_Data get data;
  static Serializer<NextcloudCoreServerCapabilities_Ocs> get serializer =>
      _$nextcloudCoreServerCapabilitiesOcsSerializer;
}

abstract class NextcloudCoreServerCapabilities
    implements Built<NextcloudCoreServerCapabilities, NextcloudCoreServerCapabilitiesBuilder> {
  factory NextcloudCoreServerCapabilities([final void Function(NextcloudCoreServerCapabilitiesBuilder)? b]) =
      _$NextcloudCoreServerCapabilities;
  const NextcloudCoreServerCapabilities._();

  factory NextcloudCoreServerCapabilities.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreServerCapabilities_Ocs get ocs;
  static Serializer<NextcloudCoreServerCapabilities> get serializer => _$nextcloudCoreServerCapabilitiesSerializer;
}

abstract class NextcloudCoreNavigationApps_Ocs_Data_Order
    implements Built<NextcloudCoreNavigationApps_Ocs_Data_Order, NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder> {
  factory NextcloudCoreNavigationApps_Ocs_Data_Order([
    final void Function(NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder)? b,
  ]) = _$NextcloudCoreNavigationApps_Ocs_Data_Order;
  const NextcloudCoreNavigationApps_Ocs_Data_Order._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static NextcloudCoreNavigationApps_Ocs_Data_Order fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudCoreNavigationApps_Ocs_Data_Order> get serializer =>
      _$NextcloudCoreNavigationApps_Ocs_Data_OrderSerializer();
}

class _$NextcloudCoreNavigationApps_Ocs_Data_OrderSerializer
    implements PrimitiveSerializer<NextcloudCoreNavigationApps_Ocs_Data_Order> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreNavigationApps_Ocs_Data_Order,
    _$NextcloudCoreNavigationApps_Ocs_Data_Order
  ];

  @override
  final String wireName = 'NextcloudCoreNavigationApps_Ocs_Data_Order';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudCoreNavigationApps_Ocs_Data_Order object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudCoreNavigationApps_Ocs_Data_Order deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder()..data = JsonObject(data);
    try {
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert([result._$int, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class NextcloudCoreNavigationApps_Ocs_Data
    implements Built<NextcloudCoreNavigationApps_Ocs_Data, NextcloudCoreNavigationApps_Ocs_DataBuilder> {
  factory NextcloudCoreNavigationApps_Ocs_Data([final void Function(NextcloudCoreNavigationApps_Ocs_DataBuilder)? b]) =
      _$NextcloudCoreNavigationApps_Ocs_Data;
  const NextcloudCoreNavigationApps_Ocs_Data._();

  factory NextcloudCoreNavigationApps_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreNavigationApps_Ocs([final void Function(NextcloudCoreNavigationApps_OcsBuilder)? b]) =
      _$NextcloudCoreNavigationApps_Ocs;
  const NextcloudCoreNavigationApps_Ocs._();

  factory NextcloudCoreNavigationApps_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudCoreNavigationApps_Ocs_Data> get data;
  static Serializer<NextcloudCoreNavigationApps_Ocs> get serializer => _$nextcloudCoreNavigationAppsOcsSerializer;
}

abstract class NextcloudCoreNavigationApps
    implements Built<NextcloudCoreNavigationApps, NextcloudCoreNavigationAppsBuilder> {
  factory NextcloudCoreNavigationApps([final void Function(NextcloudCoreNavigationAppsBuilder)? b]) =
      _$NextcloudCoreNavigationApps;
  const NextcloudCoreNavigationApps._();

  factory NextcloudCoreNavigationApps.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreNavigationApps_Ocs get ocs;
  static Serializer<NextcloudCoreNavigationApps> get serializer => _$nextcloudCoreNavigationAppsSerializer;
}

abstract class NextcloudCoreLoginFlowInit_Poll
    implements Built<NextcloudCoreLoginFlowInit_Poll, NextcloudCoreLoginFlowInit_PollBuilder> {
  factory NextcloudCoreLoginFlowInit_Poll([final void Function(NextcloudCoreLoginFlowInit_PollBuilder)? b]) =
      _$NextcloudCoreLoginFlowInit_Poll;
  const NextcloudCoreLoginFlowInit_Poll._();

  factory NextcloudCoreLoginFlowInit_Poll.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get token;
  String get endpoint;
  static Serializer<NextcloudCoreLoginFlowInit_Poll> get serializer => _$nextcloudCoreLoginFlowInitPollSerializer;
}

abstract class NextcloudCoreLoginFlowInit
    implements Built<NextcloudCoreLoginFlowInit, NextcloudCoreLoginFlowInitBuilder> {
  factory NextcloudCoreLoginFlowInit([final void Function(NextcloudCoreLoginFlowInitBuilder)? b]) =
      _$NextcloudCoreLoginFlowInit;
  const NextcloudCoreLoginFlowInit._();

  factory NextcloudCoreLoginFlowInit.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreLoginFlowInit_Poll get poll;
  String get login;
  static Serializer<NextcloudCoreLoginFlowInit> get serializer => _$nextcloudCoreLoginFlowInitSerializer;
}

abstract class NextcloudCoreLoginFlowResult
    implements Built<NextcloudCoreLoginFlowResult, NextcloudCoreLoginFlowResultBuilder> {
  factory NextcloudCoreLoginFlowResult([final void Function(NextcloudCoreLoginFlowResultBuilder)? b]) =
      _$NextcloudCoreLoginFlowResult;
  const NextcloudCoreLoginFlowResult._();

  factory NextcloudCoreLoginFlowResult.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get server;
  String get loginName;
  String get appPassword;
  static Serializer<NextcloudCoreLoginFlowResult> get serializer => _$nextcloudCoreLoginFlowResultSerializer;
}

abstract class NextcloudCoreAutocompleteResult_Ocs_Data_Status
    implements
        Built<NextcloudCoreAutocompleteResult_Ocs_Data_Status, NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder> {
  factory NextcloudCoreAutocompleteResult_Ocs_Data_Status([
    final void Function(NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder)? b,
  ]) = _$NextcloudCoreAutocompleteResult_Ocs_Data_Status;
  const NextcloudCoreAutocompleteResult_Ocs_Data_Status._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  String? get string;
  static NextcloudCoreAutocompleteResult_Ocs_Data_Status fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudCoreAutocompleteResult_Ocs_Data_Status> get serializer =>
      _$NextcloudCoreAutocompleteResult_Ocs_Data_StatusSerializer();
}

class _$NextcloudCoreAutocompleteResult_Ocs_Data_StatusSerializer
    implements PrimitiveSerializer<NextcloudCoreAutocompleteResult_Ocs_Data_Status> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreAutocompleteResult_Ocs_Data_Status,
    _$NextcloudCoreAutocompleteResult_Ocs_Data_Status
  ];

  @override
  final String wireName = 'NextcloudCoreAutocompleteResult_Ocs_Data_Status';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudCoreAutocompleteResult_Ocs_Data_Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data_Status deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._string].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudCoreAutocompleteResult_Ocs_Data
    implements Built<NextcloudCoreAutocompleteResult_Ocs_Data, NextcloudCoreAutocompleteResult_Ocs_DataBuilder> {
  factory NextcloudCoreAutocompleteResult_Ocs_Data([
    final void Function(NextcloudCoreAutocompleteResult_Ocs_DataBuilder)? b,
  ]) = _$NextcloudCoreAutocompleteResult_Ocs_Data;
  const NextcloudCoreAutocompleteResult_Ocs_Data._();

  factory NextcloudCoreAutocompleteResult_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudCoreAutocompleteResult_Ocs([final void Function(NextcloudCoreAutocompleteResult_OcsBuilder)? b]) =
      _$NextcloudCoreAutocompleteResult_Ocs;
  const NextcloudCoreAutocompleteResult_Ocs._();

  factory NextcloudCoreAutocompleteResult_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudCoreAutocompleteResult_Ocs_Data> get data;
  static Serializer<NextcloudCoreAutocompleteResult_Ocs> get serializer =>
      _$nextcloudCoreAutocompleteResultOcsSerializer;
}

abstract class NextcloudCoreAutocompleteResult
    implements Built<NextcloudCoreAutocompleteResult, NextcloudCoreAutocompleteResultBuilder> {
  factory NextcloudCoreAutocompleteResult([final void Function(NextcloudCoreAutocompleteResultBuilder)? b]) =
      _$NextcloudCoreAutocompleteResult;
  const NextcloudCoreAutocompleteResult._();

  factory NextcloudCoreAutocompleteResult.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudCoreAutocompleteResult_Ocs get ocs;
  static Serializer<NextcloudCoreAutocompleteResult> get serializer => _$nextcloudCoreAutocompleteResultSerializer;
}

abstract class NextcloudNewsSupportedAPIVersions
    implements Built<NextcloudNewsSupportedAPIVersions, NextcloudNewsSupportedAPIVersionsBuilder> {
  factory NextcloudNewsSupportedAPIVersions([final void Function(NextcloudNewsSupportedAPIVersionsBuilder)? b]) =
      _$NextcloudNewsSupportedAPIVersions;
  const NextcloudNewsSupportedAPIVersions._();

  factory NextcloudNewsSupportedAPIVersions.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<String>? get apiLevels;
  static Serializer<NextcloudNewsSupportedAPIVersions> get serializer => _$nextcloudNewsSupportedAPIVersionsSerializer;
}

abstract class NextcloudNewsArticle implements Built<NextcloudNewsArticle, NextcloudNewsArticleBuilder> {
  factory NextcloudNewsArticle([final void Function(NextcloudNewsArticleBuilder)? b]) = _$NextcloudNewsArticle;
  const NextcloudNewsArticle._();

  factory NextcloudNewsArticle.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudNewsFeed([final void Function(NextcloudNewsFeedBuilder)? b]) = _$NextcloudNewsFeed;
  const NextcloudNewsFeed._();

  factory NextcloudNewsFeed.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudNewsFolder([final void Function(NextcloudNewsFolderBuilder)? b]) = _$NextcloudNewsFolder;
  const NextcloudNewsFolder._();

  factory NextcloudNewsFolder.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty
  BuiltList<NextcloudNewsFeed> get feeds;
  static Serializer<NextcloudNewsFolder> get serializer => _$nextcloudNewsFolderSerializer;
}

abstract class NextcloudNewsListFolders implements Built<NextcloudNewsListFolders, NextcloudNewsListFoldersBuilder> {
  factory NextcloudNewsListFolders([final void Function(NextcloudNewsListFoldersBuilder)? b]) =
      _$NextcloudNewsListFolders;
  const NextcloudNewsListFolders._();

  factory NextcloudNewsListFolders.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<NextcloudNewsFolder> get folders;
  static Serializer<NextcloudNewsListFolders> get serializer => _$nextcloudNewsListFoldersSerializer;
}

abstract class NextcloudNewsListFeeds implements Built<NextcloudNewsListFeeds, NextcloudNewsListFeedsBuilder> {
  factory NextcloudNewsListFeeds([final void Function(NextcloudNewsListFeedsBuilder)? b]) = _$NextcloudNewsListFeeds;
  const NextcloudNewsListFeeds._();

  factory NextcloudNewsListFeeds.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get starredCount;
  int? get newestItemId;
  BuiltList<NextcloudNewsFeed> get feeds;
  static Serializer<NextcloudNewsListFeeds> get serializer => _$nextcloudNewsListFeedsSerializer;
}

abstract class NextcloudNewsListArticles implements Built<NextcloudNewsListArticles, NextcloudNewsListArticlesBuilder> {
  factory NextcloudNewsListArticles([final void Function(NextcloudNewsListArticlesBuilder)? b]) =
      _$NextcloudNewsListArticles;
  const NextcloudNewsListArticles._();

  factory NextcloudNewsListArticles.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<NextcloudNewsArticle> get items;
  static Serializer<NextcloudNewsListArticles> get serializer => _$nextcloudNewsListArticlesSerializer;
}

abstract class NextcloudNotesNote implements Built<NextcloudNotesNote, NextcloudNotesNoteBuilder> {
  factory NextcloudNotesNote([final void Function(NextcloudNotesNoteBuilder)? b]) = _$NextcloudNotesNote;
  const NextcloudNotesNote._();

  factory NextcloudNotesNote.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  static NextcloudNotesSettings_NoteMode valueOf(final String name) => _$valueOfNextcloudNotesSettings_NoteMode(name);
  static Serializer<NextcloudNotesSettings_NoteMode> get serializer => _$nextcloudNotesSettingsNoteModeSerializer;
}

abstract class NextcloudNotesSettings implements Built<NextcloudNotesSettings, NextcloudNotesSettingsBuilder> {
  factory NextcloudNotesSettings([final void Function(NextcloudNotesSettingsBuilder)? b]) = _$NextcloudNotesSettings;
  const NextcloudNotesSettings._();

  factory NextcloudNotesSettings.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get notesPath;
  String get fileSuffix;
  NextcloudNotesSettings_NoteMode get noteMode;
  static Serializer<NextcloudNotesSettings> get serializer => _$nextcloudNotesSettingsSerializer;
}

abstract class NextcloudNotificationsNotificationAction
    implements Built<NextcloudNotificationsNotificationAction, NextcloudNotificationsNotificationActionBuilder> {
  factory NextcloudNotificationsNotificationAction([
    final void Function(NextcloudNotificationsNotificationActionBuilder)? b,
  ]) = _$NextcloudNotificationsNotificationAction;
  const NextcloudNotificationsNotificationAction._();

  factory NextcloudNotificationsNotificationAction.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get label;
  String get link;
  String get type;
  bool? get primary;
  static Serializer<NextcloudNotificationsNotificationAction> get serializer =>
      _$nextcloudNotificationsNotificationActionSerializer;
}

abstract class NextcloudNotificationsNotification
    implements Built<NextcloudNotificationsNotification, NextcloudNotificationsNotificationBuilder> {
  factory NextcloudNotificationsNotification([final void Function(NextcloudNotificationsNotificationBuilder)? b]) =
      _$NextcloudNotificationsNotification;
  const NextcloudNotificationsNotification._();

  factory NextcloudNotificationsNotification.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  String? get subjectRich;
  JsonObject? get subjectRichParameters;
  String? get messageRich;
  JsonObject? get messageRichParameters;
  String? get icon;
  bool? get shouldNotify;
  BuiltList<NextcloudNotificationsNotificationAction> get actions;
  static Serializer<NextcloudNotificationsNotification> get serializer =>
      _$nextcloudNotificationsNotificationSerializer;
}

abstract class NextcloudNotificationsListNotifications_Ocs
    implements Built<NextcloudNotificationsListNotifications_Ocs, NextcloudNotificationsListNotifications_OcsBuilder> {
  factory NextcloudNotificationsListNotifications_Ocs([
    final void Function(NextcloudNotificationsListNotifications_OcsBuilder)? b,
  ]) = _$NextcloudNotificationsListNotifications_Ocs;
  const NextcloudNotificationsListNotifications_Ocs._();

  factory NextcloudNotificationsListNotifications_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudNotificationsNotification> get data;
  static Serializer<NextcloudNotificationsListNotifications_Ocs> get serializer =>
      _$nextcloudNotificationsListNotificationsOcsSerializer;
}

abstract class NextcloudNotificationsListNotifications
    implements Built<NextcloudNotificationsListNotifications, NextcloudNotificationsListNotificationsBuilder> {
  factory NextcloudNotificationsListNotifications([
    final void Function(NextcloudNotificationsListNotificationsBuilder)? b,
  ]) = _$NextcloudNotificationsListNotifications;
  const NextcloudNotificationsListNotifications._();

  factory NextcloudNotificationsListNotifications.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudNotificationsListNotifications_Ocs get ocs;
  static Serializer<NextcloudNotificationsListNotifications> get serializer =>
      _$nextcloudNotificationsListNotificationsSerializer;
}

abstract class NextcloudNotificationsGetNotification_Ocs
    implements Built<NextcloudNotificationsGetNotification_Ocs, NextcloudNotificationsGetNotification_OcsBuilder> {
  factory NextcloudNotificationsGetNotification_Ocs([
    final void Function(NextcloudNotificationsGetNotification_OcsBuilder)? b,
  ]) = _$NextcloudNotificationsGetNotification_Ocs;
  const NextcloudNotificationsGetNotification_Ocs._();

  factory NextcloudNotificationsGetNotification_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudNotificationsNotification get data;
  static Serializer<NextcloudNotificationsGetNotification_Ocs> get serializer =>
      _$nextcloudNotificationsGetNotificationOcsSerializer;
}

abstract class NextcloudNotificationsGetNotification
    implements Built<NextcloudNotificationsGetNotification, NextcloudNotificationsGetNotificationBuilder> {
  factory NextcloudNotificationsGetNotification([
    final void Function(NextcloudNotificationsGetNotificationBuilder)? b,
  ]) = _$NextcloudNotificationsGetNotification;
  const NextcloudNotificationsGetNotification._();

  factory NextcloudNotificationsGetNotification.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudNotificationsGetNotification_Ocs get ocs;
  static Serializer<NextcloudNotificationsGetNotification> get serializer =>
      _$nextcloudNotificationsGetNotificationSerializer;
}

abstract class NextcloudEmptyOCS_Ocs implements Built<NextcloudEmptyOCS_Ocs, NextcloudEmptyOCS_OcsBuilder> {
  factory NextcloudEmptyOCS_Ocs([final void Function(NextcloudEmptyOCS_OcsBuilder)? b]) = _$NextcloudEmptyOCS_Ocs;
  const NextcloudEmptyOCS_Ocs._();

  factory NextcloudEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<NextcloudEmptyOCS_Ocs> get serializer => _$nextcloudEmptyOCSOcsSerializer;
}

abstract class NextcloudEmptyOCS implements Built<NextcloudEmptyOCS, NextcloudEmptyOCSBuilder> {
  factory NextcloudEmptyOCS([final void Function(NextcloudEmptyOCSBuilder)? b]) = _$NextcloudEmptyOCS;
  const NextcloudEmptyOCS._();

  factory NextcloudEmptyOCS.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudEmptyOCS_Ocs get ocs;
  static Serializer<NextcloudEmptyOCS> get serializer => _$nextcloudEmptyOCSSerializer;
}

abstract class NextcloudNotificationsPushServerSubscription
    implements
        Built<NextcloudNotificationsPushServerSubscription, NextcloudNotificationsPushServerSubscriptionBuilder> {
  factory NextcloudNotificationsPushServerSubscription([
    final void Function(NextcloudNotificationsPushServerSubscriptionBuilder)? b,
  ]) = _$NextcloudNotificationsPushServerSubscription;
  const NextcloudNotificationsPushServerSubscription._();

  factory NextcloudNotificationsPushServerSubscription.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudNotificationsPushServerRegistration_Ocs([
    final void Function(NextcloudNotificationsPushServerRegistration_OcsBuilder)? b,
  ]) = _$NextcloudNotificationsPushServerRegistration_Ocs;
  const NextcloudNotificationsPushServerRegistration_Ocs._();

  factory NextcloudNotificationsPushServerRegistration_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudNotificationsPushServerSubscription get data;
  static Serializer<NextcloudNotificationsPushServerRegistration_Ocs> get serializer =>
      _$nextcloudNotificationsPushServerRegistrationOcsSerializer;
}

abstract class NextcloudNotificationsPushServerRegistration
    implements
        Built<NextcloudNotificationsPushServerRegistration, NextcloudNotificationsPushServerRegistrationBuilder> {
  factory NextcloudNotificationsPushServerRegistration([
    final void Function(NextcloudNotificationsPushServerRegistrationBuilder)? b,
  ]) = _$NextcloudNotificationsPushServerRegistration;
  const NextcloudNotificationsPushServerRegistration._();

  factory NextcloudNotificationsPushServerRegistration.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudNotificationsPushServerRegistration_Ocs get ocs;
  static Serializer<NextcloudNotificationsPushServerRegistration> get serializer =>
      _$nextcloudNotificationsPushServerRegistrationSerializer;
}

abstract class NextcloudProvisioningApiUserDetails_Quota
    implements Built<NextcloudProvisioningApiUserDetails_Quota, NextcloudProvisioningApiUserDetails_QuotaBuilder> {
  factory NextcloudProvisioningApiUserDetails_Quota([
    final void Function(NextcloudProvisioningApiUserDetails_QuotaBuilder)? b,
  ]) = _$NextcloudProvisioningApiUserDetails_Quota;
  const NextcloudProvisioningApiUserDetails_Quota._();

  factory NextcloudProvisioningApiUserDetails_Quota.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudProvisioningApiUserDetails_BackendCapabilities([
    final void Function(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder)? b,
  ]) = _$NextcloudProvisioningApiUserDetails_BackendCapabilities;
  const NextcloudProvisioningApiUserDetails_BackendCapabilities._();

  factory NextcloudProvisioningApiUserDetails_BackendCapabilities.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get setDisplayName;
  bool get setPassword;
  static Serializer<NextcloudProvisioningApiUserDetails_BackendCapabilities> get serializer =>
      _$nextcloudProvisioningApiUserDetailsBackendCapabilitiesSerializer;
}

abstract class NextcloudProvisioningApiUserDetails
    implements Built<NextcloudProvisioningApiUserDetails, NextcloudProvisioningApiUserDetailsBuilder> {
  factory NextcloudProvisioningApiUserDetails([final void Function(NextcloudProvisioningApiUserDetailsBuilder)? b]) =
      _$NextcloudProvisioningApiUserDetails;
  const NextcloudProvisioningApiUserDetails._();

  factory NextcloudProvisioningApiUserDetails.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  factory NextcloudProvisioningApiUser_Ocs([final void Function(NextcloudProvisioningApiUser_OcsBuilder)? b]) =
      _$NextcloudProvisioningApiUser_Ocs;
  const NextcloudProvisioningApiUser_Ocs._();

  factory NextcloudProvisioningApiUser_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudProvisioningApiUserDetails get data;
  static Serializer<NextcloudProvisioningApiUser_Ocs> get serializer => _$nextcloudProvisioningApiUserOcsSerializer;
}

abstract class NextcloudProvisioningApiUser
    implements Built<NextcloudProvisioningApiUser, NextcloudProvisioningApiUserBuilder> {
  factory NextcloudProvisioningApiUser([final void Function(NextcloudProvisioningApiUserBuilder)? b]) =
      _$NextcloudProvisioningApiUser;
  const NextcloudProvisioningApiUser._();

  factory NextcloudProvisioningApiUser.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudProvisioningApiUser_Ocs get ocs;
  static Serializer<NextcloudProvisioningApiUser> get serializer => _$nextcloudProvisioningApiUserSerializer;
}

abstract class NextcloudUnifiedPushProviderCheckResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderCheckResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderCheckResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCheckResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCheckResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson,
            NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  String get deviceId;
  static Serializer<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson,
            NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson;
  const NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson._();

  factory NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  String get token;
  static Serializer<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush([
    final void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
        b,
  ]) = _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush;
  const NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._();

  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int get version;
  static Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush>
      get serializer =>
          _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderPushResponse201ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderPushResponse201ApplicationJson,
            NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderPushResponse201ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson;
  const NextcloudUnifiedPushProviderPushResponse201ApplicationJson._();

  factory NextcloudUnifiedPushProviderPushResponse201ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get success;
  static Serializer<NextcloudUnifiedPushProviderPushResponse201ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderPushResponse201ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush([
    final void Function(
      NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder,
    )? b,
  ]) = _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush;
  const NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._();

  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get gateway;
  static Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush>
      get serializer =>
          _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonUnifiedpushSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush get unifiedpush;
  static Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson> get serializer =>
      _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer;
}

abstract class NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson
    implements
        Built<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder> {
  factory NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson([
    final void Function(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder)? b,
  ]) = _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson;
  const NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson._();

  factory NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  static NextcloudUserStatusClearAt_Type valueOf(final String name) => _$valueOfNextcloudUserStatusClearAt_Type(name);
  static Serializer<NextcloudUserStatusClearAt_Type> get serializer => _$nextcloudUserStatusClearAtTypeSerializer;
}

class NextcloudUserStatusClearAt_Time0 extends EnumClass {
  const NextcloudUserStatusClearAt_Time0._(super.name);

  static const NextcloudUserStatusClearAt_Time0 day = _$nextcloudUserStatusClearAtTime0Day;

  static const NextcloudUserStatusClearAt_Time0 week = _$nextcloudUserStatusClearAtTime0Week;

  static BuiltSet<NextcloudUserStatusClearAt_Time0> get values => _$nextcloudUserStatusClearAtTime0Values;
  static NextcloudUserStatusClearAt_Time0 valueOf(final String name) => _$valueOfNextcloudUserStatusClearAt_Time0(name);
  static Serializer<NextcloudUserStatusClearAt_Time0> get serializer => _$nextcloudUserStatusClearAtTime0Serializer;
}

abstract class NextcloudUserStatusClearAt_Time
    implements Built<NextcloudUserStatusClearAt_Time, NextcloudUserStatusClearAt_TimeBuilder> {
  factory NextcloudUserStatusClearAt_Time([final void Function(NextcloudUserStatusClearAt_TimeBuilder)? b]) =
      _$NextcloudUserStatusClearAt_Time;
  const NextcloudUserStatusClearAt_Time._();

  JsonObject get data;
  NextcloudUserStatusClearAt_Time0? get userStatusClearAtTime0;

  /// Time offset in seconds
  int? get $int;
  static NextcloudUserStatusClearAt_Time fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusClearAt_Time> get serializer => _$NextcloudUserStatusClearAt_TimeSerializer();
}

class _$NextcloudUserStatusClearAt_TimeSerializer implements PrimitiveSerializer<NextcloudUserStatusClearAt_Time> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusClearAt_Time, _$NextcloudUserStatusClearAt_Time];

  @override
  final String wireName = 'NextcloudUserStatusClearAt_Time';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusClearAt_Time object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusClearAt_Time deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusClearAt_TimeBuilder()..data = JsonObject(data);
    try {
      result._userStatusClearAtTime0 = jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusClearAt_Time0),
      )! as NextcloudUserStatusClearAt_Time0;
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert(
      [result._userStatusClearAtTime0, result._$int].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusClearAt
    implements Built<NextcloudUserStatusClearAt, NextcloudUserStatusClearAtBuilder> {
  factory NextcloudUserStatusClearAt([final void Function(NextcloudUserStatusClearAtBuilder)? b]) =
      _$NextcloudUserStatusClearAt;
  const NextcloudUserStatusClearAt._();

  factory NextcloudUserStatusClearAt.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusClearAt_Type get type;
  NextcloudUserStatusClearAt_Time get time;
  static Serializer<NextcloudUserStatusClearAt> get serializer => _$nextcloudUserStatusClearAtSerializer;
}

abstract class NextcloudUserStatusPublicStatus_ClearAt
    implements Built<NextcloudUserStatusPublicStatus_ClearAt, NextcloudUserStatusPublicStatus_ClearAtBuilder> {
  factory NextcloudUserStatusPublicStatus_ClearAt([
    final void Function(NextcloudUserStatusPublicStatus_ClearAtBuilder)? b,
  ]) = _$NextcloudUserStatusPublicStatus_ClearAt;
  const NextcloudUserStatusPublicStatus_ClearAt._();

  JsonObject get data;
  NextcloudUserStatusClearAt? get userStatusClearAt;

  /// Time as unix timestamp
  int? get $int;
  static NextcloudUserStatusPublicStatus_ClearAt fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusPublicStatus_ClearAt> get serializer =>
      _$NextcloudUserStatusPublicStatus_ClearAtSerializer();
}

class _$NextcloudUserStatusPublicStatus_ClearAtSerializer
    implements PrimitiveSerializer<NextcloudUserStatusPublicStatus_ClearAt> {
  @override
  final Iterable<Type> types = const [
    NextcloudUserStatusPublicStatus_ClearAt,
    _$NextcloudUserStatusPublicStatus_ClearAt
  ];

  @override
  final String wireName = 'NextcloudUserStatusPublicStatus_ClearAt';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusPublicStatus_ClearAt object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusPublicStatus_ClearAt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusPublicStatus_ClearAtBuilder()..data = JsonObject(data);
    try {
      result._userStatusClearAt = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusClearAt),
      )! as NextcloudUserStatusClearAt)
          .toBuilder();
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert(
      [result._userStatusClearAt, result._$int].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

class NextcloudUserStatusType extends EnumClass {
  const NextcloudUserStatusType._(super.name);

  static const NextcloudUserStatusType online = _$nextcloudUserStatusTypeOnline;

  static const NextcloudUserStatusType offline = _$nextcloudUserStatusTypeOffline;

  static const NextcloudUserStatusType dnd = _$nextcloudUserStatusTypeDnd;

  static const NextcloudUserStatusType away = _$nextcloudUserStatusTypeAway;

  static const NextcloudUserStatusType invisible = _$nextcloudUserStatusTypeInvisible;

  static BuiltSet<NextcloudUserStatusType> get values => _$nextcloudUserStatusTypeValues;
  static NextcloudUserStatusType valueOf(final String name) => _$valueOfNextcloudUserStatusType(name);
  static Serializer<NextcloudUserStatusType> get serializer => _$nextcloudUserStatusTypeSerializer;
}

abstract class NextcloudUserStatusPublicStatus
    implements Built<NextcloudUserStatusPublicStatus, NextcloudUserStatusPublicStatusBuilder> {
  factory NextcloudUserStatusPublicStatus([final void Function(NextcloudUserStatusPublicStatusBuilder)? b]) =
      _$NextcloudUserStatusPublicStatus;
  const NextcloudUserStatusPublicStatus._();

  factory NextcloudUserStatusPublicStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get userId;
  String? get message;
  String? get icon;
  NextcloudUserStatusPublicStatus_ClearAt? get clearAt;
  NextcloudUserStatusType get status;
  static Serializer<NextcloudUserStatusPublicStatus> get serializer => _$nextcloudUserStatusPublicStatusSerializer;
}

abstract class NextcloudUserStatusGetPublicStatuses_Ocs
    implements Built<NextcloudUserStatusGetPublicStatuses_Ocs, NextcloudUserStatusGetPublicStatuses_OcsBuilder> {
  factory NextcloudUserStatusGetPublicStatuses_Ocs([
    final void Function(NextcloudUserStatusGetPublicStatuses_OcsBuilder)? b,
  ]) = _$NextcloudUserStatusGetPublicStatuses_Ocs;
  const NextcloudUserStatusGetPublicStatuses_Ocs._();

  factory NextcloudUserStatusGetPublicStatuses_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudUserStatusPublicStatus> get data;
  static Serializer<NextcloudUserStatusGetPublicStatuses_Ocs> get serializer =>
      _$nextcloudUserStatusGetPublicStatusesOcsSerializer;
}

abstract class NextcloudUserStatusGetPublicStatuses
    implements Built<NextcloudUserStatusGetPublicStatuses, NextcloudUserStatusGetPublicStatusesBuilder> {
  factory NextcloudUserStatusGetPublicStatuses([final void Function(NextcloudUserStatusGetPublicStatusesBuilder)? b]) =
      _$NextcloudUserStatusGetPublicStatuses;
  const NextcloudUserStatusGetPublicStatuses._();

  factory NextcloudUserStatusGetPublicStatuses.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusGetPublicStatuses_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetPublicStatuses> get serializer =>
      _$nextcloudUserStatusGetPublicStatusesSerializer;
}

abstract class NextcloudUserStatusGetPublicStatus_Ocs_Data
    implements Built<NextcloudUserStatusGetPublicStatus_Ocs_Data, NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder> {
  factory NextcloudUserStatusGetPublicStatus_Ocs_Data([
    final void Function(NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder)? b,
  ]) = _$NextcloudUserStatusGetPublicStatus_Ocs_Data;
  const NextcloudUserStatusGetPublicStatus_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  NextcloudUserStatusPublicStatus? get userStatusPublicStatus;
  static NextcloudUserStatusGetPublicStatus_Ocs_Data fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusGetPublicStatus_Ocs_Data> get serializer =>
      _$NextcloudUserStatusGetPublicStatus_Ocs_DataSerializer();
}

class _$NextcloudUserStatusGetPublicStatus_Ocs_DataSerializer
    implements PrimitiveSerializer<NextcloudUserStatusGetPublicStatus_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    NextcloudUserStatusGetPublicStatus_Ocs_Data,
    _$NextcloudUserStatusGetPublicStatus_Ocs_Data
  ];

  @override
  final String wireName = 'NextcloudUserStatusGetPublicStatus_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusGetPublicStatus_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusGetPublicStatus_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._userStatusPublicStatus = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusPublicStatus),
      )! as NextcloudUserStatusPublicStatus)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._userStatusPublicStatus].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusGetPublicStatus_Ocs
    implements Built<NextcloudUserStatusGetPublicStatus_Ocs, NextcloudUserStatusGetPublicStatus_OcsBuilder> {
  factory NextcloudUserStatusGetPublicStatus_Ocs([
    final void Function(NextcloudUserStatusGetPublicStatus_OcsBuilder)? b,
  ]) = _$NextcloudUserStatusGetPublicStatus_Ocs;
  const NextcloudUserStatusGetPublicStatus_Ocs._();

  factory NextcloudUserStatusGetPublicStatus_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudUserStatusGetPublicStatus_Ocs_Data get data;
  static Serializer<NextcloudUserStatusGetPublicStatus_Ocs> get serializer =>
      _$nextcloudUserStatusGetPublicStatusOcsSerializer;
}

abstract class NextcloudUserStatusGetPublicStatus
    implements Built<NextcloudUserStatusGetPublicStatus, NextcloudUserStatusGetPublicStatusBuilder> {
  factory NextcloudUserStatusGetPublicStatus([final void Function(NextcloudUserStatusGetPublicStatusBuilder)? b]) =
      _$NextcloudUserStatusGetPublicStatus;
  const NextcloudUserStatusGetPublicStatus._();

  factory NextcloudUserStatusGetPublicStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusGetPublicStatus_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetPublicStatus> get serializer =>
      _$nextcloudUserStatusGetPublicStatusSerializer;
}

abstract class NextcloudUserStatusStatus1
    implements Built<NextcloudUserStatusStatus1, NextcloudUserStatusStatus1Builder> {
  factory NextcloudUserStatusStatus1([final void Function(NextcloudUserStatusStatus1Builder)? b]) =
      _$NextcloudUserStatusStatus1;
  const NextcloudUserStatusStatus1._();

  factory NextcloudUserStatusStatus1.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get messageId;
  bool get messageIsPredefined;
  bool get statusIsUserDefined;
  static Serializer<NextcloudUserStatusStatus1> get serializer => _$nextcloudUserStatusStatus1Serializer;
}

abstract class NextcloudUserStatusStatus implements Built<NextcloudUserStatusStatus, NextcloudUserStatusStatusBuilder> {
  factory NextcloudUserStatusStatus([final void Function(NextcloudUserStatusStatusBuilder)? b]) =
      _$NextcloudUserStatusStatus;
  const NextcloudUserStatusStatus._();

  JsonObject get data;
  NextcloudUserStatusPublicStatus get userStatusPublicStatus;
  NextcloudUserStatusStatus1 get userStatusStatus1;
  static NextcloudUserStatusStatus fromJson(final Object json) => jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusStatus> get serializer => _$NextcloudUserStatusStatusSerializer();
}

class _$NextcloudUserStatusStatusSerializer implements PrimitiveSerializer<NextcloudUserStatusStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusStatus, _$NextcloudUserStatusStatus];

  @override
  final String wireName = 'NextcloudUserStatusStatus';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusStatus object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusStatus deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusStatusBuilder()..data = JsonObject(data);
    result.userStatusPublicStatus.replace(
      jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusPublicStatus),
      )! as NextcloudUserStatusPublicStatus,
    );
    result.userStatusStatus1.replace(
      jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusStatus1),
      )! as NextcloudUserStatusStatus1,
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusGetStatus_Ocs_Data
    implements Built<NextcloudUserStatusGetStatus_Ocs_Data, NextcloudUserStatusGetStatus_Ocs_DataBuilder> {
  factory NextcloudUserStatusGetStatus_Ocs_Data([
    final void Function(NextcloudUserStatusGetStatus_Ocs_DataBuilder)? b,
  ]) = _$NextcloudUserStatusGetStatus_Ocs_Data;
  const NextcloudUserStatusGetStatus_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  NextcloudUserStatusStatus? get userStatusStatus;
  static NextcloudUserStatusGetStatus_Ocs_Data fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusGetStatus_Ocs_Data> get serializer =>
      _$NextcloudUserStatusGetStatus_Ocs_DataSerializer();
}

class _$NextcloudUserStatusGetStatus_Ocs_DataSerializer
    implements PrimitiveSerializer<NextcloudUserStatusGetStatus_Ocs_Data> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetStatus_Ocs_Data, _$NextcloudUserStatusGetStatus_Ocs_Data];

  @override
  final String wireName = 'NextcloudUserStatusGetStatus_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusGetStatus_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusGetStatus_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusGetStatus_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._userStatusStatus = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusStatus),
      )! as NextcloudUserStatusStatus)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._userStatusStatus].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusGetStatus_Ocs
    implements Built<NextcloudUserStatusGetStatus_Ocs, NextcloudUserStatusGetStatus_OcsBuilder> {
  factory NextcloudUserStatusGetStatus_Ocs([final void Function(NextcloudUserStatusGetStatus_OcsBuilder)? b]) =
      _$NextcloudUserStatusGetStatus_Ocs;
  const NextcloudUserStatusGetStatus_Ocs._();

  factory NextcloudUserStatusGetStatus_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudUserStatusGetStatus_Ocs_Data get data;
  static Serializer<NextcloudUserStatusGetStatus_Ocs> get serializer => _$nextcloudUserStatusGetStatusOcsSerializer;
}

abstract class NextcloudUserStatusGetStatus
    implements Built<NextcloudUserStatusGetStatus, NextcloudUserStatusGetStatusBuilder> {
  factory NextcloudUserStatusGetStatus([final void Function(NextcloudUserStatusGetStatusBuilder)? b]) =
      _$NextcloudUserStatusGetStatus;
  const NextcloudUserStatusGetStatus._();

  factory NextcloudUserStatusGetStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusGetStatus_Ocs get ocs;
  static Serializer<NextcloudUserStatusGetStatus> get serializer => _$nextcloudUserStatusGetStatusSerializer;
}

abstract class NextcloudUserStatusPredefinedStatus_ClearAt
    implements Built<NextcloudUserStatusPredefinedStatus_ClearAt, NextcloudUserStatusPredefinedStatus_ClearAtBuilder> {
  factory NextcloudUserStatusPredefinedStatus_ClearAt([
    final void Function(NextcloudUserStatusPredefinedStatus_ClearAtBuilder)? b,
  ]) = _$NextcloudUserStatusPredefinedStatus_ClearAt;
  const NextcloudUserStatusPredefinedStatus_ClearAt._();

  JsonObject get data;
  NextcloudUserStatusClearAt? get userStatusClearAt;

  /// Time as unix timestamp
  int? get $int;
  static NextcloudUserStatusPredefinedStatus_ClearAt fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusPredefinedStatus_ClearAt> get serializer =>
      _$NextcloudUserStatusPredefinedStatus_ClearAtSerializer();
}

class _$NextcloudUserStatusPredefinedStatus_ClearAtSerializer
    implements PrimitiveSerializer<NextcloudUserStatusPredefinedStatus_ClearAt> {
  @override
  final Iterable<Type> types = const [
    NextcloudUserStatusPredefinedStatus_ClearAt,
    _$NextcloudUserStatusPredefinedStatus_ClearAt
  ];

  @override
  final String wireName = 'NextcloudUserStatusPredefinedStatus_ClearAt';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusPredefinedStatus_ClearAt object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusPredefinedStatus_ClearAt deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusPredefinedStatus_ClearAtBuilder()..data = JsonObject(data);
    try {
      result._userStatusClearAt = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusClearAt),
      )! as NextcloudUserStatusClearAt)
          .toBuilder();
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert(
      [result._userStatusClearAt, result._$int].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusPredefinedStatus
    implements Built<NextcloudUserStatusPredefinedStatus, NextcloudUserStatusPredefinedStatusBuilder> {
  factory NextcloudUserStatusPredefinedStatus([final void Function(NextcloudUserStatusPredefinedStatusBuilder)? b]) =
      _$NextcloudUserStatusPredefinedStatus;
  const NextcloudUserStatusPredefinedStatus._();

  factory NextcloudUserStatusPredefinedStatus.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get id;
  String get icon;
  String get message;
  NextcloudUserStatusPredefinedStatus_ClearAt? get clearAt;
  static Serializer<NextcloudUserStatusPredefinedStatus> get serializer =>
      _$nextcloudUserStatusPredefinedStatusSerializer;
}

abstract class NextcloudUserStatusPredefinedStatuses_Ocs
    implements Built<NextcloudUserStatusPredefinedStatuses_Ocs, NextcloudUserStatusPredefinedStatuses_OcsBuilder> {
  factory NextcloudUserStatusPredefinedStatuses_Ocs([
    final void Function(NextcloudUserStatusPredefinedStatuses_OcsBuilder)? b,
  ]) = _$NextcloudUserStatusPredefinedStatuses_Ocs;
  const NextcloudUserStatusPredefinedStatuses_Ocs._();

  factory NextcloudUserStatusPredefinedStatuses_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  BuiltList<NextcloudUserStatusPredefinedStatus> get data;
  static Serializer<NextcloudUserStatusPredefinedStatuses_Ocs> get serializer =>
      _$nextcloudUserStatusPredefinedStatusesOcsSerializer;
}

abstract class NextcloudUserStatusPredefinedStatuses
    implements Built<NextcloudUserStatusPredefinedStatuses, NextcloudUserStatusPredefinedStatusesBuilder> {
  factory NextcloudUserStatusPredefinedStatuses([
    final void Function(NextcloudUserStatusPredefinedStatusesBuilder)? b,
  ]) = _$NextcloudUserStatusPredefinedStatuses;
  const NextcloudUserStatusPredefinedStatuses._();

  factory NextcloudUserStatusPredefinedStatuses.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusPredefinedStatuses_Ocs get ocs;
  static Serializer<NextcloudUserStatusPredefinedStatuses> get serializer =>
      _$nextcloudUserStatusPredefinedStatusesSerializer;
}

abstract class NextcloudUserStatusHeartbeat_Ocs_Data
    implements Built<NextcloudUserStatusHeartbeat_Ocs_Data, NextcloudUserStatusHeartbeat_Ocs_DataBuilder> {
  factory NextcloudUserStatusHeartbeat_Ocs_Data([
    final void Function(NextcloudUserStatusHeartbeat_Ocs_DataBuilder)? b,
  ]) = _$NextcloudUserStatusHeartbeat_Ocs_Data;
  const NextcloudUserStatusHeartbeat_Ocs_Data._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  NextcloudUserStatusStatus? get userStatusStatus;
  static NextcloudUserStatusHeartbeat_Ocs_Data fromJson(final Object json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<NextcloudUserStatusHeartbeat_Ocs_Data> get serializer =>
      _$NextcloudUserStatusHeartbeat_Ocs_DataSerializer();
}

class _$NextcloudUserStatusHeartbeat_Ocs_DataSerializer
    implements PrimitiveSerializer<NextcloudUserStatusHeartbeat_Ocs_Data> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusHeartbeat_Ocs_Data, _$NextcloudUserStatusHeartbeat_Ocs_Data];

  @override
  final String wireName = 'NextcloudUserStatusHeartbeat_Ocs_Data';

  @override
  Object serialize(
    final Serializers serializers,
    final NextcloudUserStatusHeartbeat_Ocs_Data object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  NextcloudUserStatusHeartbeat_Ocs_Data deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NextcloudUserStatusHeartbeat_Ocs_DataBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(BuiltList, [FullType(JsonObject)]),
      )! as BuiltList<JsonObject>)
          .toBuilder();
    } catch (_) {}
    try {
      result._userStatusStatus = (jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(NextcloudUserStatusStatus),
      )! as NextcloudUserStatusStatus)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._builtListJsonObject, result._userStatusStatus].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

abstract class NextcloudUserStatusHeartbeat_Ocs
    implements Built<NextcloudUserStatusHeartbeat_Ocs, NextcloudUserStatusHeartbeat_OcsBuilder> {
  factory NextcloudUserStatusHeartbeat_Ocs([final void Function(NextcloudUserStatusHeartbeat_OcsBuilder)? b]) =
      _$NextcloudUserStatusHeartbeat_Ocs;
  const NextcloudUserStatusHeartbeat_Ocs._();

  factory NextcloudUserStatusHeartbeat_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudOCSMeta get meta;
  NextcloudUserStatusHeartbeat_Ocs_Data get data;
  static Serializer<NextcloudUserStatusHeartbeat_Ocs> get serializer => _$nextcloudUserStatusHeartbeatOcsSerializer;
}

abstract class NextcloudUserStatusHeartbeat
    implements Built<NextcloudUserStatusHeartbeat, NextcloudUserStatusHeartbeatBuilder> {
  factory NextcloudUserStatusHeartbeat([final void Function(NextcloudUserStatusHeartbeatBuilder)? b]) =
      _$NextcloudUserStatusHeartbeat;
  const NextcloudUserStatusHeartbeat._();

  factory NextcloudUserStatusHeartbeat.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  NextcloudUserStatusHeartbeat_Ocs get ocs;
  static Serializer<NextcloudUserStatusHeartbeat> get serializer => _$nextcloudUserStatusHeartbeatSerializer;
}

abstract class NextcloudNotificationsNotificationDecryptedSubject
    implements
        Built<NextcloudNotificationsNotificationDecryptedSubject,
            NextcloudNotificationsNotificationDecryptedSubjectBuilder> {
  factory NextcloudNotificationsNotificationDecryptedSubject([
    final void Function(NextcloudNotificationsNotificationDecryptedSubjectBuilder)? b,
  ]) = _$NextcloudNotificationsNotificationDecryptedSubject;
  const NextcloudNotificationsNotificationDecryptedSubject._();

  factory NextcloudNotificationsNotificationDecryptedSubject.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  NextcloudUserStatusStatus1,
  NextcloudUserStatusPredefinedStatuses,
  NextcloudUserStatusPredefinedStatuses_Ocs,
  NextcloudUserStatusPredefinedStatus,
  NextcloudUserStatusHeartbeat,
  NextcloudUserStatusHeartbeat_Ocs,
  NextcloudNotificationsNotificationDecryptedSubject,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(const FullType(NextcloudCoreServerStatus), NextcloudCoreServerStatus.new)
      ..addBuilderFactory(const FullType(NextcloudCoreServerCapabilities), NextcloudCoreServerCapabilities.new)
      ..addBuilderFactory(const FullType(NextcloudCoreNavigationApps), NextcloudCoreNavigationApps.new)
      ..addBuilderFactory(const FullType(NextcloudCoreLoginFlowInit), NextcloudCoreLoginFlowInit.new)
      ..addBuilderFactory(const FullType(NextcloudCoreLoginFlowResult), NextcloudCoreLoginFlowResult.new)
      ..addBuilderFactory(const FullType(List, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(const FullType(NextcloudCoreAutocompleteResult), NextcloudCoreAutocompleteResult.new)
      ..addBuilderFactory(const FullType(NextcloudNewsSupportedAPIVersions), NextcloudNewsSupportedAPIVersions.new)
      ..addBuilderFactory(const FullType(NextcloudNewsListFolders), NextcloudNewsListFolders.new)
      ..addBuilderFactory(const FullType(NextcloudNewsListFeeds), NextcloudNewsListFeeds.new)
      ..addBuilderFactory(const FullType(NextcloudNewsListArticles), NextcloudNewsListArticles.new)
      ..addBuilderFactory(const FullType(NextcloudNotesNote), NextcloudNotesNote.new)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NextcloudNotesNote)]),
        ListBuilder<NextcloudNotesNote>.new,
      )
      ..addBuilderFactory(const FullType(NextcloudNotesNote), NextcloudNotesNote.new)
      ..addBuilderFactory(const FullType(NextcloudNotesSettings), NextcloudNotesSettings.new)
      ..addBuilderFactory(
        const FullType(NextcloudNotificationsListNotifications),
        NextcloudNotificationsListNotifications.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudNotificationsGetNotification),
        NextcloudNotificationsGetNotification.new,
      )
      ..addBuilderFactory(const FullType(NextcloudEmptyOCS), NextcloudEmptyOCS.new)
      ..addBuilderFactory(
        const FullType(NextcloudNotificationsPushServerRegistration),
        NextcloudNotificationsPushServerRegistration.new,
      )
      ..addBuilderFactory(const FullType(NextcloudProvisioningApiUser), NextcloudProvisioningApiUser.new)
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderCheckResponse200ApplicationJson),
        NextcloudUnifiedPushProviderCheckResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson),
        NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson),
        NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson),
        NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson),
        NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson),
        NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson),
        NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson),
        NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderPushResponse201ApplicationJson),
        NextcloudUnifiedPushProviderPushResponse201ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson),
        NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson),
        NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(
        const FullType(NextcloudUserStatusGetPublicStatuses),
        NextcloudUserStatusGetPublicStatuses.new,
      )
      ..addBuilderFactory(const FullType(NextcloudUserStatusGetPublicStatus), NextcloudUserStatusGetPublicStatus.new)
      ..addBuilderFactory(const FullType(NextcloudUserStatusGetStatus), NextcloudUserStatusGetStatus.new)
      ..addBuilderFactory(
        const FullType(NextcloudUserStatusPredefinedStatuses),
        NextcloudUserStatusPredefinedStatuses.new,
      )
      ..addBuilderFactory(const FullType(NextcloudUserStatusHeartbeat), NextcloudUserStatusHeartbeat.new))
    .build();

final Serializers jsonSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

// coverage:ignore-start
T deserializeNextcloud<T>(final Object data) => serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNextcloud<T>(final T data) => serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
