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

part 'provisioning_api.openapi.g.dart';

class ProvisioningApiResponse<T, U> extends DynamiteResponse<T, U> {
  ProvisioningApiResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'ProvisioningApiResponse(data: $data, headers: $headers)';
}

class ProvisioningApiApiException extends DynamiteApiException {
  ProvisioningApiApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<ProvisioningApiApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return ProvisioningApiApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'ProvisioningApiApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class ProvisioningApiClient extends DynamiteClient {
  ProvisioningApiClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  ProvisioningApiClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  ProvisioningApiAppConfigClient get appConfig => ProvisioningApiAppConfigClient(this);
  ProvisioningApiAppsClient get apps => ProvisioningApiAppsClient(this);
  ProvisioningApiGroupsClient get groups => ProvisioningApiGroupsClient(this);
  ProvisioningApiPreferencesClient get preferences => ProvisioningApiPreferencesClient(this);
  ProvisioningApiUsersClient get users => ProvisioningApiUsersClient(this);
}

class ProvisioningApiAppConfigClient {
  ProvisioningApiAppConfigClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of apps
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson> getApps({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson),
      )! as ProvisioningApiAppConfigGetAppsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the config keys of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson> getKeys({
    required final String app,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson),
      )! as ProvisioningApiAppConfigGetKeysResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a the config value of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigGetValueResponse200ApplicationJson> getValue({
    required final String app,
    required final String key,
    final String defaultValue = '',
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    path = path.replaceAll('{key}', Uri.encodeQueryComponent(key));
    if (defaultValue != '') {
      queryParameters['defaultValue'] = defaultValue;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppConfigGetValueResponse200ApplicationJson),
      )! as ProvisioningApiAppConfigGetValueResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update the config value of an app
  Future<ProvisioningApiAppConfigSetValueResponse200ApplicationJson> setValue({
    required final String value,
    required final String app,
    required final String key,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['value'] = value;
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    path = path.replaceAll('{key}', Uri.encodeQueryComponent(key));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppConfigSetValueResponse200ApplicationJson),
      )! as ProvisioningApiAppConfigSetValueResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a config key of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson> deleteKey({
    required final String app,
    required final String key,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/apps/{app}/{key}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    path = path.replaceAll('{key}', Uri.encodeQueryComponent(key));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson),
      )! as ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiAppsClient {
  ProvisioningApiAppsClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of installed apps
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsGetAppsResponse200ApplicationJson> getApps({
    final String? filter,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (filter != null) {
      queryParameters['filter'] = filter;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppsGetAppsResponse200ApplicationJson),
      )! as ProvisioningApiAppsGetAppsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the app info for an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsGetAppInfoResponse200ApplicationJson> getAppInfo({
    required final String app,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/apps/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson),
      )! as ProvisioningApiAppsGetAppInfoResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Enable an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsEnableResponse200ApplicationJson> enable({
    required final String app,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/apps/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppsEnableResponse200ApplicationJson),
      )! as ProvisioningApiAppsEnableResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Disable an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsDisableResponse200ApplicationJson> disable({
    required final String app,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/apps/{app}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{app}', Uri.encodeQueryComponent(app));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiAppsDisableResponse200ApplicationJson),
      )! as ProvisioningApiAppsDisableResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiGroupsClient {
  ProvisioningApiGroupsClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of groups
  Future<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson> getGroups({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/groups';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetGroupsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a new group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsAddGroupResponse200ApplicationJson> addGroup({
    required final String groupid,
    final String displayname = '',
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/groups';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['groupid'] = groupid;
    if (displayname != '') {
      queryParameters['displayname'] = displayname;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsAddGroupResponse200ApplicationJson),
      )! as ProvisioningApiGroupsAddGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of groups details
  Future<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson> getGroupsDetails({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/groups/details';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users in the specified group
  Future<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson> getGroupUsers({
    required final String groupId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}/users';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users details in the specified group
  Future<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson> getGroupUsersDetails({
    required final String groupId,
    final String search = '',
    final int? limit,
    final int offset = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}/users/details';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the list of user IDs that are a subadmin of the group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson> getSubAdminsOfGroup({
    required final String groupId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}/subadmins';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users in the specified group
  @Deprecated('')
  Future<ProvisioningApiGroupsGetGroupResponse200ApplicationJson> getGroup({
    required final String groupId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupResponse200ApplicationJson),
      )! as ProvisioningApiGroupsGetGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson> updateGroup({
    required final String key,
    required final String value,
    required final String groupId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson),
      )! as ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson> deleteGroup({
    required final String groupId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/groups/{groupId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (!RegExp(r'^.+$').hasMatch(groupId)) {
      throw Exception(
        'Invalid value "$groupId" for parameter "groupId" with pattern "${r'^.+$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{groupId}', Uri.encodeQueryComponent(groupId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson),
      )! as ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiPreferencesClient {
  ProvisioningApiPreferencesClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Update a preference value of an app
  Future<ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson> setPreference({
    required final String configValue,
    required final String appId,
    required final String configKey,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['configValue'] = configValue;
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    path = path.replaceAll('{configKey}', Uri.encodeQueryComponent(configKey));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson),
      )! as ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a preference for an app
  Future<ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson> deletePreference({
    required final String appId,
    required final String configKey,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}/{configKey}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    path = path.replaceAll('{configKey}', Uri.encodeQueryComponent(configKey));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson),
      )! as ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update multiple preference values of an app
  Future<ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson> setMultiplePreferences({
    required final ContentString<BuiltMap<String, String>> configs,
    required final String appId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['configs'] = _jsonSerializers.serialize(
      configs,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [FullType(String), FullType(String)]),
      ]),
    );
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson),
      )! as ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete multiple preferences for an app
  Future<ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson> deleteMultiplePreference({
    required final List<String> configKeys,
    required final String appId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/provisioning_api/api/v1/config/users/{appId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['configKeys[]'] = configKeys.map((final e) => e);
    path = path.replaceAll('{appId}', Uri.encodeQueryComponent(appId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson),
      )! as ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiUsersClient {
  ProvisioningApiUsersClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of users
  Future<ProvisioningApiUsersGetUsersResponse200ApplicationJson> getUsers({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/users';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetUsersResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetUsersResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a new user
  Future<ProvisioningApiUsersAddUserResponse200ApplicationJson> addUser({
    required final String userid,
    final String password = '',
    final String displayName = '',
    final String email = '',
    final List<String> groups = const [],
    final List<String> subadmin = const [],
    final String quota = '',
    final String language = '',
    final String? manager,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/users';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['userid'] = userid;
    if (password != '') {
      queryParameters['password'] = password;
    }
    if (displayName != '') {
      queryParameters['displayName'] = displayName;
    }
    if (email != '') {
      queryParameters['email'] = email;
    }
    if (groups != const []) {
      queryParameters['groups[]'] = groups.map((final e) => e);
    }
    if (subadmin != const []) {
      queryParameters['subadmin[]'] = subadmin.map((final e) => e);
    }
    if (quota != '') {
      queryParameters['quota'] = quota;
    }
    if (language != '') {
      queryParameters['language'] = language;
    }
    if (manager != null) {
      queryParameters['manager'] = manager;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersAddUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersAddUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users and their details
  Future<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson> getUsersDetails({
    final String search = '',
    final int? limit,
    final int offset = 0,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/users/details';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (search != '') {
      queryParameters['search'] = search;
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Search users by their phone numbers
  Future<ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson> searchByPhoneNumbers({
    required final String location,
    required final ContentString<BuiltMap<String, BuiltList<String>>> search,
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/users/search/by-phone';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['location'] = location;
    queryParameters['search'] = _jsonSerializers.serialize(
      search,
      specifiedType: const FullType(ContentString, [
        FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
      ]),
    );
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson),
      )! as ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the details of a user
  Future<ProvisioningApiUsersGetUserResponse200ApplicationJson> getUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a value of the user's details
  Future<ProvisioningApiUsersEditUserResponse200ApplicationJson> editUser({
    required final String key,
    required final String value,
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersEditUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersEditUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a user
  Future<ProvisioningApiUsersDeleteUserResponse200ApplicationJson> deleteUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersDeleteUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersDeleteUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the details of the current user
  Future<ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson> getCurrentUser({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of fields that are editable for the current user
  Future<ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson> getEditableFields({
    final String oCSAPIRequest = 'true',
  }) async {
    const path = '/ocs/v2.php/cloud/user/fields';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of fields that are editable for a user
  Future<ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson> getEditableFieldsForUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/user/fields/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update multiple values of the user's details
  Future<ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson> editUserMultiValue({
    required final String key,
    required final String value,
    required final String userId,
    required final String collectionName,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/{collectionName}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['key'] = key;
    queryParameters['value'] = value;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    if (!RegExp(r'^(?!enable$|disable$)[a-zA-Z0-9_]*$').hasMatch(collectionName)) {
      throw Exception(
        'Invalid value "$collectionName" for parameter "collectionName" with pattern "${r'^(?!enable$|disable$)[a-zA-Z0-9_]*$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{collectionName}', Uri.encodeQueryComponent(collectionName));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson),
      )! as ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Wipe all devices of a user
  Future<ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson> wipeUserDevices({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/wipe';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson),
      )! as ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Enable a user
  Future<ProvisioningApiUsersEnableUserResponse200ApplicationJson> enableUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/enable';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersEnableUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersEnableUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Disable a user
  Future<ProvisioningApiUsersDisableUserResponse200ApplicationJson> disableUser({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/disable';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersDisableUserResponse200ApplicationJson),
      )! as ProvisioningApiUsersDisableUserResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of groups the user belongs to
  Future<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson> getUsersGroups({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/groups';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Add a user to a group
  Future<ProvisioningApiUsersAddToGroupResponse200ApplicationJson> addToGroup({
    required final String userId,
    final String groupid = '',
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/groups';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    if (groupid != '') {
      queryParameters['groupid'] = groupid;
    }
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersAddToGroupResponse200ApplicationJson),
      )! as ProvisioningApiUsersAddToGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a user from a group
  Future<ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson> removeFromGroup({
    required final String groupid,
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/groups';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['groupid'] = groupid;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson),
      )! as ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the groups a user is a subadmin of
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson> getUserSubAdminGroups({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/subadmins';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson),
      )! as ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Make a user a subadmin of a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersAddSubAdminResponse200ApplicationJson> addSubAdmin({
    required final String groupid,
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/subadmins';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['groupid'] = groupid;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson),
      )! as ProvisioningApiUsersAddSubAdminResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a user from the subadmins of a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson> removeSubAdmin({
    required final String groupid,
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/subadmins';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['groupid'] = groupid;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson),
      )! as ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Resend the welcome message
  Future<ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson> resendWelcomeMessage({
    required final String userId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/cloud/users/{userId}/welcome';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson),
      )! as ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  ProvisioningApiOCSMetaInterface rebuild(final void Function(ProvisioningApiOCSMetaInterfaceBuilder) updates);
  ProvisioningApiOCSMetaInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiOCSMeta
    implements ProvisioningApiOCSMetaInterface, Built<ProvisioningApiOCSMeta, ProvisioningApiOCSMetaBuilder> {
  factory ProvisioningApiOCSMeta([final void Function(ProvisioningApiOCSMetaBuilder)? b]) = _$ProvisioningApiOCSMeta;

  // coverage:ignore-start
  const ProvisioningApiOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiOCSMeta> get serializer => _$provisioningApiOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetAppsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs,
            ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetAppsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonInterface {
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponse200ApplicationJson
    implements
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson,
            ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson([
    final void Function(ProvisioningApiAppConfigGetAppsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetAppsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetKeysResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs,
            ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetKeysResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonInterface {
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponse200ApplicationJson
    implements
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson,
            ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson([
    final void Function(ProvisioningApiAppConfigGetKeysResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetKeysResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataInterface {
  String get data;
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetValueResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs,
            ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetValueResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponse200ApplicationJsonInterface {
  ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetValueResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponse200ApplicationJson
    implements
        ProvisioningApiAppConfigGetValueResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetValueResponse200ApplicationJson,
            ProvisioningApiAppConfigGetValueResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson([
    final void Function(ProvisioningApiAppConfigGetValueResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetValueResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs,
            ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigSetValueResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigSetValueResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigSetValueResponse200ApplicationJsonInterface {
  ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigSetValueResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigSetValueResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigSetValueResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigSetValueResponse200ApplicationJson
    implements
        ProvisioningApiAppConfigSetValueResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppConfigSetValueResponse200ApplicationJson,
            ProvisioningApiAppConfigSetValueResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigSetValueResponse200ApplicationJson([
    final void Function(ProvisioningApiAppConfigSetValueResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigSetValueResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigSetValueResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigSetValueResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigSetValueResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppConfigSetValueResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs,
            ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigDeleteKeyResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonInterface {
  ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson
    implements
        ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson,
            ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson([
    final void Function(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppConfigDeleteKeyResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get apps;
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppsGetAppsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs,
            ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsGetAppsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponse200ApplicationJsonInterface {
  ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppsGetAppsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponse200ApplicationJson
    implements
        ProvisioningApiAppsGetAppsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppsGetAppsResponse200ApplicationJson,
            ProvisioningApiAppsGetAppsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson([
    final void Function(ProvisioningApiAppsGetAppsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppsGetAppsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppInfoInterface {
  bool? get active;
  JsonObject? get activity;
  JsonObject? get author;
  @BuiltValueField(wireName: 'background-jobs')
  JsonObject? get backgroundJobs;
  JsonObject? get bugs;
  JsonObject? get category;
  JsonObject? get collaboration;
  JsonObject? get commands;
  @BuiltValueField(wireName: 'default_enable')
  JsonObject? get defaultEnable;
  JsonObject? get dependencies;
  String get description;
  JsonObject? get discussion;
  JsonObject? get documentation;
  JsonObject? get groups;
  String get id;
  JsonObject? get info;
  bool? get internal;
  int? get level;
  JsonObject? get licence;
  String get name;
  JsonObject? get namespace;
  JsonObject? get navigations;
  JsonObject? get preview;
  bool? get previewAsIcon;
  JsonObject? get public;
  JsonObject? get remote;
  bool? get removable;
  @BuiltValueField(wireName: 'repair-steps')
  JsonObject? get repairSteps;
  JsonObject? get repository;
  JsonObject? get sabre;
  JsonObject? get screenshot;
  JsonObject? get settings;
  String get summary;
  JsonObject? get trash;
  @BuiltValueField(wireName: 'two-factor-providers')
  JsonObject? get twoFactorProviders;
  JsonObject? get types;
  String get version;
  JsonObject? get versions;
  JsonObject? get website;
  ProvisioningApiAppInfoInterface rebuild(final void Function(ProvisioningApiAppInfoInterfaceBuilder) updates);
  ProvisioningApiAppInfoInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppInfo
    implements ProvisioningApiAppInfoInterface, Built<ProvisioningApiAppInfo, ProvisioningApiAppInfoBuilder> {
  factory ProvisioningApiAppInfo([final void Function(ProvisioningApiAppInfoBuilder)? b]) = _$ProvisioningApiAppInfo;

  // coverage:ignore-start
  const ProvisioningApiAppInfo._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppInfo.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppInfo> get serializer => _$provisioningApiAppInfoSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppInfo get data;
  ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs,
            ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsGetAppInfoResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonInterface {
  ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppInfoResponse200ApplicationJson
    implements
        ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppsGetAppInfoResponse200ApplicationJson,
            ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppsGetAppInfoResponse200ApplicationJson([
    final void Function(ProvisioningApiAppsGetAppInfoResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppInfoResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppInfoResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppInfoResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppInfoResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppsGetAppInfoResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsEnableResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppsEnableResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsEnableResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsEnableResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppsEnableResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs,
            ProvisioningApiAppsEnableResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsEnableResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsEnableResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsEnableResponse200ApplicationJsonInterface {
  ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppsEnableResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsEnableResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsEnableResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsEnableResponse200ApplicationJson
    implements
        ProvisioningApiAppsEnableResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppsEnableResponse200ApplicationJson,
            ProvisioningApiAppsEnableResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppsEnableResponse200ApplicationJson([
    final void Function(ProvisioningApiAppsEnableResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsEnableResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsEnableResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsEnableResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsEnableResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppsEnableResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsDisableResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppsDisableResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsDisableResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsDisableResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiAppsDisableResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs,
            ProvisioningApiAppsDisableResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsDisableResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsDisableResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsDisableResponse200ApplicationJsonInterface {
  ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiAppsDisableResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsDisableResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsDisableResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsDisableResponse200ApplicationJson
    implements
        ProvisioningApiAppsDisableResponse200ApplicationJsonInterface,
        Built<ProvisioningApiAppsDisableResponse200ApplicationJson,
            ProvisioningApiAppsDisableResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiAppsDisableResponse200ApplicationJson([
    final void Function(ProvisioningApiAppsDisableResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsDisableResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsDisableResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsDisableResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsDisableResponse200ApplicationJson> get serializer =>
      _$provisioningApiAppsDisableResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson,
            ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsAddGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsAddGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsAddGroupResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsAddGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsAddGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsAddGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsAddGroupResponse200ApplicationJson
    implements
        ProvisioningApiGroupsAddGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsAddGroupResponse200ApplicationJson,
            ProvisioningApiGroupsAddGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsAddGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsAddGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsAddGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsAddGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsAddGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsAddGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsAddGroupResponse200ApplicationJsonSerializer;
}

abstract class ProvisioningApiGroupDetails_Usercount
    implements Built<ProvisioningApiGroupDetails_Usercount, ProvisioningApiGroupDetails_UsercountBuilder> {
  factory ProvisioningApiGroupDetails_Usercount([
    final void Function(ProvisioningApiGroupDetails_UsercountBuilder)? b,
  ]) = _$ProvisioningApiGroupDetails_Usercount;

  // coverage:ignore-start
  const ProvisioningApiGroupDetails_Usercount._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupDetails_Usercount.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  bool? get $bool;
  int? get $int;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiGroupDetails_Usercount> get serializer =>
      _$ProvisioningApiGroupDetails_UsercountSerializer();
}

class _$ProvisioningApiGroupDetails_UsercountSerializer
    implements PrimitiveSerializer<ProvisioningApiGroupDetails_Usercount> {
  @override
  final Iterable<Type> types = const [ProvisioningApiGroupDetails_Usercount, _$ProvisioningApiGroupDetails_Usercount];

  @override
  final String wireName = 'ProvisioningApiGroupDetails_Usercount';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiGroupDetails_Usercount object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiGroupDetails_Usercount deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiGroupDetails_UsercountBuilder()..data = JsonObject(data);
    try {
      result._$bool = data as bool?;
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert([result._$bool, result._$int].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

abstract class ProvisioningApiGroupDetails_Disabled
    implements Built<ProvisioningApiGroupDetails_Disabled, ProvisioningApiGroupDetails_DisabledBuilder> {
  factory ProvisioningApiGroupDetails_Disabled([final void Function(ProvisioningApiGroupDetails_DisabledBuilder)? b]) =
      _$ProvisioningApiGroupDetails_Disabled;

  // coverage:ignore-start
  const ProvisioningApiGroupDetails_Disabled._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupDetails_Disabled.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  bool? get $bool;
  int? get $int;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiGroupDetails_Disabled> get serializer =>
      _$ProvisioningApiGroupDetails_DisabledSerializer();
}

class _$ProvisioningApiGroupDetails_DisabledSerializer
    implements PrimitiveSerializer<ProvisioningApiGroupDetails_Disabled> {
  @override
  final Iterable<Type> types = const [ProvisioningApiGroupDetails_Disabled, _$ProvisioningApiGroupDetails_Disabled];

  @override
  final String wireName = 'ProvisioningApiGroupDetails_Disabled';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiGroupDetails_Disabled object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiGroupDetails_Disabled deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiGroupDetails_DisabledBuilder()..data = JsonObject(data);
    try {
      result._$bool = data as bool?;
    } catch (_) {}
    try {
      result._$int = data as int?;
    } catch (_) {}
    assert([result._$bool, result._$int].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupDetailsInterface {
  String get id;
  String get displayname;
  ProvisioningApiGroupDetails_Usercount get usercount;
  ProvisioningApiGroupDetails_Disabled get disabled;
  bool get canAdd;
  bool get canRemove;
  ProvisioningApiGroupDetailsInterface rebuild(
    final void Function(ProvisioningApiGroupDetailsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupDetailsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupDetails
    implements
        ProvisioningApiGroupDetailsInterface,
        Built<ProvisioningApiGroupDetails, ProvisioningApiGroupDetailsBuilder> {
  factory ProvisioningApiGroupDetails([final void Function(ProvisioningApiGroupDetailsBuilder)? b]) =
      _$ProvisioningApiGroupDetails;

  // coverage:ignore-start
  const ProvisioningApiGroupDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupDetails.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupDetails> get serializer => _$provisioningApiGroupDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<ProvisioningApiGroupDetails> get groups;
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder)
        updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson,
            ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson,
            ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUserDetails_BackendCapabilitiesInterface {
  bool get setDisplayName;
  bool get setPassword;
  ProvisioningApiUserDetails_BackendCapabilitiesInterface rebuild(
    final void Function(ProvisioningApiUserDetails_BackendCapabilitiesInterfaceBuilder) updates,
  );
  ProvisioningApiUserDetails_BackendCapabilitiesInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUserDetails_BackendCapabilities
    implements
        ProvisioningApiUserDetails_BackendCapabilitiesInterface,
        Built<ProvisioningApiUserDetails_BackendCapabilities, ProvisioningApiUserDetails_BackendCapabilitiesBuilder> {
  factory ProvisioningApiUserDetails_BackendCapabilities([
    final void Function(ProvisioningApiUserDetails_BackendCapabilitiesBuilder)? b,
  ]) = _$ProvisioningApiUserDetails_BackendCapabilities;

  // coverage:ignore-start
  const ProvisioningApiUserDetails_BackendCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUserDetails_BackendCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUserDetails_BackendCapabilities> get serializer =>
      _$provisioningApiUserDetailsBackendCapabilitiesSerializer;
}

abstract class ProvisioningApiUserDetailsQuota_Quota
    implements Built<ProvisioningApiUserDetailsQuota_Quota, ProvisioningApiUserDetailsQuota_QuotaBuilder> {
  factory ProvisioningApiUserDetailsQuota_Quota([
    final void Function(ProvisioningApiUserDetailsQuota_QuotaBuilder)? b,
  ]) = _$ProvisioningApiUserDetailsQuota_Quota;

  // coverage:ignore-start
  const ProvisioningApiUserDetailsQuota_Quota._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUserDetailsQuota_Quota.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  num? get $num;
  String? get string;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiUserDetailsQuota_Quota> get serializer =>
      _$ProvisioningApiUserDetailsQuota_QuotaSerializer();
}

class _$ProvisioningApiUserDetailsQuota_QuotaSerializer
    implements PrimitiveSerializer<ProvisioningApiUserDetailsQuota_Quota> {
  @override
  final Iterable<Type> types = const [ProvisioningApiUserDetailsQuota_Quota, _$ProvisioningApiUserDetailsQuota_Quota];

  @override
  final String wireName = 'ProvisioningApiUserDetailsQuota_Quota';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiUserDetailsQuota_Quota object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiUserDetailsQuota_Quota deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiUserDetailsQuota_QuotaBuilder()..data = JsonObject(data);
    try {
      result._$num = data as num?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert([result._$num, result._string].where((final x) => x != null).isNotEmpty, 'Need oneOf for ${result._data}');
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUserDetailsQuotaInterface {
  num? get free;
  ProvisioningApiUserDetailsQuota_Quota? get quota;
  num? get relative;
  num? get total;
  num? get used;
  ProvisioningApiUserDetailsQuotaInterface rebuild(
    final void Function(ProvisioningApiUserDetailsQuotaInterfaceBuilder) updates,
  );
  ProvisioningApiUserDetailsQuotaInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUserDetailsQuota
    implements
        ProvisioningApiUserDetailsQuotaInterface,
        Built<ProvisioningApiUserDetailsQuota, ProvisioningApiUserDetailsQuotaBuilder> {
  factory ProvisioningApiUserDetailsQuota([final void Function(ProvisioningApiUserDetailsQuotaBuilder)? b]) =
      _$ProvisioningApiUserDetailsQuota;

  // coverage:ignore-start
  const ProvisioningApiUserDetailsQuota._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUserDetailsQuota.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUserDetailsQuota> get serializer => _$provisioningApiUserDetailsQuotaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUserDetailsInterface {
  @BuiltValueField(wireName: 'additional_mail')
  BuiltList<String> get additionalMail;
  @BuiltValueField(wireName: 'additional_mailScope')
  BuiltList<String>? get additionalMailScope;
  String get address;
  String? get addressScope;
  String? get avatarScope;
  String get backend;
  ProvisioningApiUserDetails_BackendCapabilities get backendCapabilities;
  String get biography;
  String? get biographyScope;
  @BuiltValueField(wireName: 'display-name')
  String get displayName;
  String get displayname;
  String? get displaynameScope;
  String? get email;
  String? get emailScope;
  bool? get enabled;
  String get fediverse;
  String? get fediverseScope;
  BuiltList<String> get groups;
  String get headline;
  String? get headlineScope;
  String get id;
  String get language;
  int get lastLogin;
  String get locale;
  String get manager;
  @BuiltValueField(wireName: 'notify_email')
  String? get notifyEmail;
  String get organisation;
  String? get organisationScope;
  String get phone;
  String? get phoneScope;
  @BuiltValueField(wireName: 'profile_enabled')
  String get profileEnabled;
  @BuiltValueField(wireName: 'profile_enabledScope')
  String? get profileEnabledScope;
  ProvisioningApiUserDetailsQuota get quota;
  String get role;
  String? get roleScope;
  String? get storageLocation;
  BuiltList<String> get subadmin;
  String get twitter;
  String? get twitterScope;
  String get website;
  String? get websiteScope;
  ProvisioningApiUserDetailsInterface rebuild(final void Function(ProvisioningApiUserDetailsInterfaceBuilder) updates);
  ProvisioningApiUserDetailsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUserDetails
    implements
        ProvisioningApiUserDetailsInterface,
        Built<ProvisioningApiUserDetails, ProvisioningApiUserDetailsBuilder> {
  factory ProvisioningApiUserDetails([final void Function(ProvisioningApiUserDetailsBuilder)? b]) =
      _$ProvisioningApiUserDetails;

  // coverage:ignore-start
  const ProvisioningApiUserDetails._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUserDetails.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUserDetails> get serializer => _$provisioningApiUserDetailsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface {
  String get id;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface rebuild(
    final void Function(
      ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1InterfaceBuilder,
    ) updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1InterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1,
            ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Builder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1>
      get serializer => _$provisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonOcsDataUsers1Serializer;
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users
    implements
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
            ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  ProvisioningApiUserDetails? get userDetails;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1?
      get groupsGetGroupUsersDetailsResponse200ApplicationJsonOcsDataUsers1;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users>
      get serializer =>
          _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersSerializer();
}

class _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
    _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder()
      ..data = JsonObject(data);
    try {
      result._userDetails = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUserDetails),
      )! as ProvisioningApiUserDetails)
          .toBuilder();
    } catch (_) {}
    try {
      result._groupsGetGroupUsersDetailsResponse200ApplicationJsonOcsDataUsers1 = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(
          ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1,
        ),
      )! as ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._userDetails, result._groupsGetGroupUsersDetailsResponse200ApplicationJsonOcsDataUsers1]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltMap<String, ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users> get users;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder)
        updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson,
            ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson,
            ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponse200ApplicationJson
    implements
        ProvisioningApiGroupsGetGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupResponse200ApplicationJson,
            ProvisioningApiGroupsGetGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsUpdateGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson
    implements
        ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson,
            ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsUpdateGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsDeleteGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonInterface {
  ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson
    implements
        ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson,
            ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiGroupsDeleteGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs,
            ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesSetPreferenceResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonInterface {
  ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson
    implements
        ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonInterface,
        Built<ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson,
            ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson([
    final void Function(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson> get serializer =>
      _$provisioningApiPreferencesSetPreferenceResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs,
            ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonInterface {
  ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson
    implements
        ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonInterface,
        Built<ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson,
            ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson([
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson> get serializer =>
      _$provisioningApiPreferencesDeletePreferenceResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs,
            ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonInterface {
  ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson
    implements
        ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonInterface,
        Built<ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson,
            ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson([
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson> get serializer =>
      _$provisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(
      ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsInterfaceBuilder,
    ) updates,
  );
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs,
            ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonInterface {
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson
    implements
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonInterface,
        Built<ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson,
            ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson([
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson> get serializer =>
      _$provisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetUsersResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersResponse200ApplicationJson,
            ProvisioningApiUsersGetUsersResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataInterface {
  String get id;
  ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersAddUserResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersAddUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersAddUserResponse200ApplicationJson,
            ProvisioningApiUsersAddUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersAddUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersAddUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface {
  String get id;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1InterfaceBuilder)
        updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1InterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1
    implements
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Interface,
        Built<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1,
            ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Builder> {
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponse200ApplicationJsonOcsDataUsers1Serializer;
}

abstract class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users
    implements
        Built<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
            ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  ProvisioningApiUserDetails? get userDetails;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1?
      get usersGetUsersDetailsResponse200ApplicationJsonOcsDataUsers1;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users> get serializer =>
      _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersSerializer();
}

class _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
    _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_UsersBuilder()
      ..data = JsonObject(data);
    try {
      result._userDetails = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUserDetails),
      )! as ProvisioningApiUserDetails)
          .toBuilder();
    } catch (_) {}
    try {
      result._usersGetUsersDetailsResponse200ApplicationJsonOcsDataUsers1 = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1),
      )! as ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._userDetails, result._usersGetUsersDetailsResponse200ApplicationJsonOcsDataUsers1]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltMap<String, ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users> get users;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson,
            ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltMap<String, String> get data;
  ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonInterface {
  ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson
    implements
        ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson,
            ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUserDetails get data;
  ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUserResponse200ApplicationJson,
            ProvisioningApiUsersGetUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEditUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEditUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEditUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersEditUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersEditUserResponse200ApplicationJson,
            ProvisioningApiUsersEditUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersEditUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersEditUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersEditUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersDeleteUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersDeleteUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDeleteUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersDeleteUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersDeleteUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDeleteUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDeleteUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersDeleteUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersDeleteUserResponse200ApplicationJson,
            ProvisioningApiUsersDeleteUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersDeleteUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersDeleteUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersDeleteUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersDeleteUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDeleteUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDeleteUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersDeleteUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUserDetails get data;
  ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetCurrentUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson,
            ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetCurrentUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetEditableFieldsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson,
            ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetEditableFieldsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson,
            ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEditUserMultiValueResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonInterface {
  ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson
    implements
        ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson,
            ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersEditUserMultiValueResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersWipeUserDevicesResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonInterface {
  ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson
    implements
        ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson,
            ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersWipeUserDevicesResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEnableUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEnableUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEnableUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEnableUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEnableUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEnableUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEnableUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersEnableUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersEnableUserResponse200ApplicationJson,
            ProvisioningApiUsersEnableUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersEnableUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersEnableUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEnableUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEnableUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEnableUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEnableUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersEnableUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersDisableUserResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersDisableUserResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDisableUserResponse200ApplicationJsonInterface {
  ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersDisableUserResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersDisableUserResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDisableUserResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDisableUserResponse200ApplicationJson
    implements
        ProvisioningApiUsersDisableUserResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersDisableUserResponse200ApplicationJson,
            ProvisioningApiUsersDisableUserResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersDisableUserResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersDisableUserResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersDisableUserResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersDisableUserResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDisableUserResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDisableUserResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersDisableUserResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponse200ApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson,
            ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddToGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddToGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddToGroupResponse200ApplicationJsonInterface {
  ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddToGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddToGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddToGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddToGroupResponse200ApplicationJson
    implements
        ProvisioningApiUsersAddToGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersAddToGroupResponse200ApplicationJson,
            ProvisioningApiUsersAddToGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddToGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersAddToGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddToGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddToGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddToGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddToGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersAddToGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersRemoveFromGroupResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonInterface {
  ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson
    implements
        ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson,
            ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersRemoveFromGroupResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonInterface {
  ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson
    implements
        ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson,
            ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddSubAdminResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonInterface {
  ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddSubAdminResponse200ApplicationJson
    implements
        ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersAddSubAdminResponse200ApplicationJson,
            ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddSubAdminResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersAddSubAdminResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddSubAdminResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddSubAdminResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddSubAdminResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddSubAdminResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersAddSubAdminResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersRemoveSubAdminResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonInterface {
  ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson
    implements
        ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson,
            ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersRemoveSubAdminResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs
    implements
        ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs,
            ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonInterface {
  ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs get ocs;
  ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson
    implements
        ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonInterface,
        Built<ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson,
            ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonBuilder> {
  factory ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson([
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson> get serializer =>
      _$provisioningApiUsersResendWelcomeMessageResponse200ApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiCapabilities_ProvisioningApiInterface {
  String get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool get accountPropertyScopesPublishedEnabled;
  ProvisioningApiCapabilities_ProvisioningApiInterface rebuild(
    final void Function(ProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder) updates,
  );
  ProvisioningApiCapabilities_ProvisioningApiInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiCapabilities_ProvisioningApi
    implements
        ProvisioningApiCapabilities_ProvisioningApiInterface,
        Built<ProvisioningApiCapabilities_ProvisioningApi, ProvisioningApiCapabilities_ProvisioningApiBuilder> {
  factory ProvisioningApiCapabilities_ProvisioningApi([
    final void Function(ProvisioningApiCapabilities_ProvisioningApiBuilder)? b,
  ]) = _$ProvisioningApiCapabilities_ProvisioningApi;

  // coverage:ignore-start
  const ProvisioningApiCapabilities_ProvisioningApi._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities_ProvisioningApi.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiCapabilities_ProvisioningApi> get serializer =>
      _$provisioningApiCapabilitiesProvisioningApiSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiCapabilitiesInterface {
  @BuiltValueField(wireName: 'provisioning_api')
  ProvisioningApiCapabilities_ProvisioningApi get provisioningApi;
  ProvisioningApiCapabilitiesInterface rebuild(
    final void Function(ProvisioningApiCapabilitiesInterfaceBuilder) updates,
  );
  ProvisioningApiCapabilitiesInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiCapabilities
    implements
        ProvisioningApiCapabilitiesInterface,
        Built<ProvisioningApiCapabilities, ProvisioningApiCapabilitiesBuilder> {
  factory ProvisioningApiCapabilities([final void Function(ProvisioningApiCapabilitiesBuilder)? b]) =
      _$ProvisioningApiCapabilities;

  // coverage:ignore-start
  const ProvisioningApiCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiCapabilities> get serializer => _$provisioningApiCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson),
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs),
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiOCSMeta), ProvisioningApiOCSMeta.new)
      ..add(ProvisioningApiOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson),
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs),
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponse200ApplicationJson),
        ProvisioningApiAppConfigGetValueResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs),
        ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigSetValueResponse200ApplicationJson),
        ProvisioningApiAppConfigSetValueResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigSetValueResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs),
        ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigSetValueResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson),
        ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs),
        ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigDeleteKeyResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponse200ApplicationJson),
        ProvisioningApiAppsGetAppsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs),
        ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson),
        ProvisioningApiAppsGetAppInfoResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs),
        ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsGetAppInfoResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiAppInfo), ProvisioningApiAppInfo.new)
      ..add(ProvisioningApiAppInfo.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsEnableResponse200ApplicationJson),
        ProvisioningApiAppsEnableResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppsEnableResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs),
        ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsEnableResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsDisableResponse200ApplicationJson),
        ProvisioningApiAppsDisableResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiAppsDisableResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs),
        ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsDisableResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson),
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsAddGroupResponse200ApplicationJson),
        ProvisioningApiGroupsAddGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsAddGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsAddGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson),
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiGroupDetails), ProvisioningApiGroupDetails.new)
      ..add(ProvisioningApiGroupDetails.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupDetails_Usercount),
        ProvisioningApiGroupDetails_Usercount.new,
      )
      ..add(ProvisioningApiGroupDetails_Usercount.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupDetails_Disabled),
        ProvisioningApiGroupDetails_Disabled.new,
      )
      ..add(ProvisioningApiGroupDetails_Disabled.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(ProvisioningApiGroupDetails)]),
        ListBuilder<ProvisioningApiGroupDetails>.new,
      )
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson),
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson),
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users),
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiUserDetails), ProvisioningApiUserDetails.new)
      ..add(ProvisioningApiUserDetails.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUserDetails_BackendCapabilities),
        ProvisioningApiUserDetails_BackendCapabilities.new,
      )
      ..add(ProvisioningApiUserDetails_BackendCapabilities.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiUserDetailsQuota), ProvisioningApiUserDetailsQuota.new)
      ..add(ProvisioningApiUserDetailsQuota.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUserDetailsQuota_Quota),
        ProvisioningApiUserDetailsQuota_Quota.new,
      )
      ..add(ProvisioningApiUserDetailsQuota_Quota.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1),
        ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users),
        ]),
        MapBuilder<String, ProvisioningApiGroupsGetGroupUsersDetailsResponse200ApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson),
        ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetSubAdminsOfGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponse200ApplicationJson),
        ProvisioningApiGroupsGetGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson),
        ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsUpdateGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson),
        ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsDeleteGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson),
        ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs),
        ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesSetPreferenceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson),
        ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs),
        ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesDeletePreferenceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(String)]),
        MapBuilder<String, String>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(String)]),
        ]),
        ContentString<BuiltMap<String, String>>.new,
      )
      ..add(ContentString.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson),
        ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs),
        ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesSetMultiplePreferencesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson),
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs),
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesDeleteMultiplePreferenceResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponse200ApplicationJson),
        ProvisioningApiUsersGetUsersResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponse200ApplicationJson),
        ProvisioningApiUsersAddUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersAddUserResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson),
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users),
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1),
        ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users),
        ]),
        MapBuilder<String, ProvisioningApiUsersGetUsersDetailsResponse200ApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
        MapBuilder<String, BuiltList>.new,
      )
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [
            FullType(String),
            FullType(BuiltList, [FullType(String)]),
          ]),
        ]),
        ContentString<BuiltMap<String, BuiltList<String>>>.new,
      )
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson),
        ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersSearchByPhoneNumbersResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserResponse200ApplicationJson),
        ProvisioningApiUsersGetUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserResponse200ApplicationJson),
        ProvisioningApiUsersEditUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEditUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEditUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDeleteUserResponse200ApplicationJson),
        ProvisioningApiUsersDeleteUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersDeleteUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersDeleteUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson),
        ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetCurrentUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson),
        ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson),
        ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsForUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson),
        ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEditUserMultiValueResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson),
        ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersWipeUserDevicesResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEnableUserResponse200ApplicationJson),
        ProvisioningApiUsersEnableUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEnableUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEnableUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDisableUserResponse200ApplicationJson),
        ProvisioningApiUsersDisableUserResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersDisableUserResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersDisableUserResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson),
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddToGroupResponse200ApplicationJson),
        ProvisioningApiUsersAddToGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddToGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddToGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson),
        ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersRemoveFromGroupResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson),
        ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUserSubAdminGroupsResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson),
        ProvisioningApiUsersAddSubAdminResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddSubAdminResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson),
        ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersRemoveSubAdminResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson),
        ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson.new,
      )
      ..add(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs),
        ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersResendWelcomeMessageResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiCapabilities), ProvisioningApiCapabilities.new)
      ..add(ProvisioningApiCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiCapabilities_ProvisioningApi),
        ProvisioningApiCapabilities_ProvisioningApi.new,
      )
      ..add(ProvisioningApiCapabilities_ProvisioningApi.serializer))
    .build();

Serializers get provisioningApiSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeProvisioningApi<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeProvisioningApi<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
