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
  Future<ProvisioningApiAppConfigGetAppsResponseApplicationJson> getApps({final String oCSAPIRequest = 'true'}) async {
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
        specifiedType: const FullType(ProvisioningApiAppConfigGetAppsResponseApplicationJson),
      )! as ProvisioningApiAppConfigGetAppsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the config keys of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigGetKeysResponseApplicationJson> getKeys({
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
        specifiedType: const FullType(ProvisioningApiAppConfigGetKeysResponseApplicationJson),
      )! as ProvisioningApiAppConfigGetKeysResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a the config value of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigGetValueResponseApplicationJson> getValue({
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
        specifiedType: const FullType(ProvisioningApiAppConfigGetValueResponseApplicationJson),
      )! as ProvisioningApiAppConfigGetValueResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update the config value of an app
  Future<ProvisioningApiAppConfigSetValueResponseApplicationJson> setValue({
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
        specifiedType: const FullType(ProvisioningApiAppConfigSetValueResponseApplicationJson),
      )! as ProvisioningApiAppConfigSetValueResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a config key of an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppConfigDeleteKeyResponseApplicationJson> deleteKey({
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
        specifiedType: const FullType(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson),
      )! as ProvisioningApiAppConfigDeleteKeyResponseApplicationJson;
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
  Future<ProvisioningApiAppsGetAppsResponseApplicationJson> getApps({
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
        specifiedType: const FullType(ProvisioningApiAppsGetAppsResponseApplicationJson),
      )! as ProvisioningApiAppsGetAppsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the app info for an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsGetAppInfoResponseApplicationJson> getAppInfo({
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
        specifiedType: const FullType(ProvisioningApiAppsGetAppInfoResponseApplicationJson),
      )! as ProvisioningApiAppsGetAppInfoResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Enable an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsEnableResponseApplicationJson> enable({
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
        specifiedType: const FullType(ProvisioningApiAppsEnableResponseApplicationJson),
      )! as ProvisioningApiAppsEnableResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Disable an app
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiAppsDisableResponseApplicationJson> disable({
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
        specifiedType: const FullType(ProvisioningApiAppsDisableResponseApplicationJson),
      )! as ProvisioningApiAppsDisableResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiGroupsClient {
  ProvisioningApiGroupsClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of groups
  Future<ProvisioningApiGroupsGetGroupsResponseApplicationJson> getGroups({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupsResponseApplicationJson),
      )! as ProvisioningApiGroupsGetGroupsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a new group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsAddGroupResponseApplicationJson> addGroup({
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
        specifiedType: const FullType(ProvisioningApiGroupsAddGroupResponseApplicationJson),
      )! as ProvisioningApiGroupsAddGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of groups details
  Future<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson> getGroupsDetails({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson),
      )! as ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users in the specified group
  Future<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson> getGroupUsers({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson),
      )! as ProvisioningApiGroupsGetGroupUsersResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users details in the specified group
  Future<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson> getGroupUsersDetails({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson),
      )! as ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the list of user IDs that are a subadmin of the group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson> getSubAdminsOfGroup({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson),
      )! as ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users in the specified group
  @Deprecated('')
  Future<ProvisioningApiGroupsGetGroupResponseApplicationJson> getGroup({
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
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupResponseApplicationJson),
      )! as ProvisioningApiGroupsGetGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsUpdateGroupResponseApplicationJson> updateGroup({
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
        specifiedType: const FullType(ProvisioningApiGroupsUpdateGroupResponseApplicationJson),
      )! as ProvisioningApiGroupsUpdateGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiGroupsDeleteGroupResponseApplicationJson> deleteGroup({
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
        specifiedType: const FullType(ProvisioningApiGroupsDeleteGroupResponseApplicationJson),
      )! as ProvisioningApiGroupsDeleteGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiPreferencesClient {
  ProvisioningApiPreferencesClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Update a preference value of an app
  Future<ProvisioningApiPreferencesSetPreferenceResponseApplicationJson> setPreference({
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
    if (response.statusCode == 200 || response.statusCode == 400) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson),
      )! as ProvisioningApiPreferencesSetPreferenceResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a preference for an app
  Future<ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson> deletePreference({
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
    if (response.statusCode == 200 || response.statusCode == 400) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson),
      )! as ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update multiple preference values of an app
  Future<ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson> setMultiplePreferences({
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
    if (response.statusCode == 200 || response.statusCode == 400) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson),
      )! as ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete multiple preferences for an app
  Future<ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson> deleteMultiplePreference({
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
    if (response.statusCode == 200 || response.statusCode == 400) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson),
      )! as ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

class ProvisioningApiUsersClient {
  ProvisioningApiUsersClient(this._rootClient);

  final ProvisioningApiClient _rootClient;

  /// Get a list of users
  Future<ProvisioningApiUsersGetUsersResponseApplicationJson> getUsers({
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
        specifiedType: const FullType(ProvisioningApiUsersGetUsersResponseApplicationJson),
      )! as ProvisioningApiUsersGetUsersResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Create a new user
  Future<ProvisioningApiUsersAddUserResponseApplicationJson> addUser({
    required final String userid,
    final String password = '',
    final String displayName = '',
    final String email = '',
    final List<String> groups = const <String>[],
    final List<String> subadmin = const <String>[],
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
    if (groups != const <String>[]) {
      queryParameters['groups[]'] = groups.map((final e) => e);
    }
    if (subadmin != const <String>[]) {
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
        specifiedType: const FullType(ProvisioningApiUsersAddUserResponseApplicationJson),
      )! as ProvisioningApiUsersAddUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of users and their details
  Future<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson> getUsersDetails({
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
        specifiedType: const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson),
      )! as ProvisioningApiUsersGetUsersDetailsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Search users by their phone numbers
  Future<ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson> searchByPhoneNumbers({
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
        specifiedType: const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson),
      )! as ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the details of a user
  Future<ProvisioningApiUsersGetUserResponseApplicationJson> getUser({
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
        specifiedType: const FullType(ProvisioningApiUsersGetUserResponseApplicationJson),
      )! as ProvisioningApiUsersGetUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update a value of the user's details
  Future<ProvisioningApiUsersEditUserResponseApplicationJson> editUser({
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
        specifiedType: const FullType(ProvisioningApiUsersEditUserResponseApplicationJson),
      )! as ProvisioningApiUsersEditUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a user
  Future<ProvisioningApiUsersDeleteUserResponseApplicationJson> deleteUser({
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
        specifiedType: const FullType(ProvisioningApiUsersDeleteUserResponseApplicationJson),
      )! as ProvisioningApiUsersDeleteUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the details of the current user
  Future<ProvisioningApiUsersGetCurrentUserResponseApplicationJson> getCurrentUser({
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
        specifiedType: const FullType(ProvisioningApiUsersGetCurrentUserResponseApplicationJson),
      )! as ProvisioningApiUsersGetCurrentUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of fields that are editable for the current user
  Future<ProvisioningApiUsersGetEditableFieldsResponseApplicationJson> getEditableFields({
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
        specifiedType: const FullType(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson),
      )! as ProvisioningApiUsersGetEditableFieldsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of fields that are editable for a user
  Future<ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson> getEditableFieldsForUser({
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
        specifiedType: const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson),
      )! as ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update multiple values of the user's details
  Future<ProvisioningApiUsersEditUserMultiValueResponseApplicationJson> editUserMultiValue({
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
        specifiedType: const FullType(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson),
      )! as ProvisioningApiUsersEditUserMultiValueResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Wipe all devices of a user
  Future<ProvisioningApiUsersWipeUserDevicesResponseApplicationJson> wipeUserDevices({
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
        specifiedType: const FullType(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson),
      )! as ProvisioningApiUsersWipeUserDevicesResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Enable a user
  Future<ProvisioningApiUsersEnableUserResponseApplicationJson> enableUser({
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
        specifiedType: const FullType(ProvisioningApiUsersEnableUserResponseApplicationJson),
      )! as ProvisioningApiUsersEnableUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Disable a user
  Future<ProvisioningApiUsersDisableUserResponseApplicationJson> disableUser({
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
        specifiedType: const FullType(ProvisioningApiUsersDisableUserResponseApplicationJson),
      )! as ProvisioningApiUsersDisableUserResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a list of groups the user belongs to
  Future<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson> getUsersGroups({
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
        specifiedType: const FullType(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson),
      )! as ProvisioningApiUsersGetUsersGroupsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Add a user to a group
  Future<ProvisioningApiUsersAddToGroupResponseApplicationJson> addToGroup({
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
        specifiedType: const FullType(ProvisioningApiUsersAddToGroupResponseApplicationJson),
      )! as ProvisioningApiUsersAddToGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a user from a group
  Future<ProvisioningApiUsersRemoveFromGroupResponseApplicationJson> removeFromGroup({
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
        specifiedType: const FullType(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson),
      )! as ProvisioningApiUsersRemoveFromGroupResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the groups a user is a subadmin of
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson> getUserSubAdminGroups({
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
        specifiedType: const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson),
      )! as ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Make a user a subadmin of a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersAddSubAdminResponseApplicationJson> addSubAdmin({
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
        specifiedType: const FullType(ProvisioningApiUsersAddSubAdminResponseApplicationJson),
      )! as ProvisioningApiUsersAddSubAdminResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a user from the subadmins of a group
  ///
  /// This endpoint requires admin access
  Future<ProvisioningApiUsersRemoveSubAdminResponseApplicationJson> removeSubAdmin({
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
        specifiedType: const FullType(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson),
      )! as ProvisioningApiUsersRemoveSubAdminResponseApplicationJson;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Resend the welcome message
  Future<ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson> resendWelcomeMessage({
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
        specifiedType: const FullType(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson),
      )! as ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson;
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
abstract interface class ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetAppsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs,
            ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetAppsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetAppsResponseApplicationJsonInterface {
  ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetAppsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetAppsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetAppsResponseApplicationJson
    implements
        ProvisioningApiAppConfigGetAppsResponseApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetAppsResponseApplicationJson,
            ProvisioningApiAppConfigGetAppsResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson([
    final void Function(ProvisioningApiAppConfigGetAppsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetAppsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetAppsResponseApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetAppsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get data;
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetKeysResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs,
            ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetKeysResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetKeysResponseApplicationJsonInterface {
  ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetKeysResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetKeysResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetKeysResponseApplicationJson
    implements
        ProvisioningApiAppConfigGetKeysResponseApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetKeysResponseApplicationJson,
            ProvisioningApiAppConfigGetKeysResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson([
    final void Function(ProvisioningApiAppConfigGetKeysResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetKeysResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetKeysResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetKeysResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetKeysResponseApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetKeysResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataInterface {
  String get data;
  ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data,
            ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppConfigGetValueResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs,
            ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigGetValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigGetValueResponseApplicationJsonInterface {
  ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigGetValueResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigGetValueResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigGetValueResponseApplicationJson
    implements
        ProvisioningApiAppConfigGetValueResponseApplicationJsonInterface,
        Built<ProvisioningApiAppConfigGetValueResponseApplicationJson,
            ProvisioningApiAppConfigGetValueResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson([
    final void Function(ProvisioningApiAppConfigGetValueResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigGetValueResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigGetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigGetValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigGetValueResponseApplicationJson> get serializer =>
      _$provisioningApiAppConfigGetValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs,
            ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigSetValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigSetValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigSetValueResponseApplicationJsonInterface {
  ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigSetValueResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigSetValueResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigSetValueResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigSetValueResponseApplicationJson
    implements
        ProvisioningApiAppConfigSetValueResponseApplicationJsonInterface,
        Built<ProvisioningApiAppConfigSetValueResponseApplicationJson,
            ProvisioningApiAppConfigSetValueResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigSetValueResponseApplicationJson([
    final void Function(ProvisioningApiAppConfigSetValueResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigSetValueResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigSetValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigSetValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigSetValueResponseApplicationJson> get serializer =>
      _$provisioningApiAppConfigSetValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs,
            ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppConfigDeleteKeyResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonInterface {
  ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppConfigDeleteKeyResponseApplicationJson
    implements
        ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonInterface,
        Built<ProvisioningApiAppConfigDeleteKeyResponseApplicationJson,
            ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppConfigDeleteKeyResponseApplicationJson([
    final void Function(ProvisioningApiAppConfigDeleteKeyResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppConfigDeleteKeyResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppConfigDeleteKeyResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppConfigDeleteKeyResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppConfigDeleteKeyResponseApplicationJson> get serializer =>
      _$provisioningApiAppConfigDeleteKeyResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get apps;
  ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data,
            ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiAppsGetAppsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiAppsGetAppsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppsGetAppsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs,
            ProvisioningApiAppsGetAppsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsGetAppsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppsResponseApplicationJsonInterface {
  ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppsGetAppsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppsResponseApplicationJson
    implements
        ProvisioningApiAppsGetAppsResponseApplicationJsonInterface,
        Built<ProvisioningApiAppsGetAppsResponseApplicationJson,
            ProvisioningApiAppsGetAppsResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppsGetAppsResponseApplicationJson([
    final void Function(ProvisioningApiAppsGetAppsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppsResponseApplicationJson> get serializer =>
      _$provisioningApiAppsGetAppsResponseApplicationJsonSerializer;
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
abstract interface class ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiAppInfo get data;
  ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs,
            ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsGetAppInfoResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsGetAppInfoResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsGetAppInfoResponseApplicationJsonInterface {
  ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppsGetAppInfoResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsGetAppInfoResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsGetAppInfoResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsGetAppInfoResponseApplicationJson
    implements
        ProvisioningApiAppsGetAppInfoResponseApplicationJsonInterface,
        Built<ProvisioningApiAppsGetAppInfoResponseApplicationJson,
            ProvisioningApiAppsGetAppInfoResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppsGetAppInfoResponseApplicationJson([
    final void Function(ProvisioningApiAppsGetAppInfoResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsGetAppInfoResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsGetAppInfoResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsGetAppInfoResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsGetAppInfoResponseApplicationJson> get serializer =>
      _$provisioningApiAppsGetAppInfoResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsEnableResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppsEnableResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsEnableResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsEnableResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsEnableResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppsEnableResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsEnableResponseApplicationJson_Ocs,
            ProvisioningApiAppsEnableResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsEnableResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsEnableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsEnableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsEnableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsEnableResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsEnableResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsEnableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsEnableResponseApplicationJsonInterface {
  ProvisioningApiAppsEnableResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppsEnableResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsEnableResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsEnableResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsEnableResponseApplicationJson
    implements
        ProvisioningApiAppsEnableResponseApplicationJsonInterface,
        Built<ProvisioningApiAppsEnableResponseApplicationJson,
            ProvisioningApiAppsEnableResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppsEnableResponseApplicationJson([
    final void Function(ProvisioningApiAppsEnableResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsEnableResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsEnableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsEnableResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsEnableResponseApplicationJson> get serializer =>
      _$provisioningApiAppsEnableResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsDisableResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiAppsDisableResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiAppsDisableResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiAppsDisableResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsDisableResponseApplicationJson_Ocs
    implements
        ProvisioningApiAppsDisableResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiAppsDisableResponseApplicationJson_Ocs,
            ProvisioningApiAppsDisableResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiAppsDisableResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiAppsDisableResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiAppsDisableResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiAppsDisableResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsDisableResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsDisableResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiAppsDisableResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiAppsDisableResponseApplicationJsonInterface {
  ProvisioningApiAppsDisableResponseApplicationJson_Ocs get ocs;
  ProvisioningApiAppsDisableResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiAppsDisableResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiAppsDisableResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiAppsDisableResponseApplicationJson
    implements
        ProvisioningApiAppsDisableResponseApplicationJsonInterface,
        Built<ProvisioningApiAppsDisableResponseApplicationJson,
            ProvisioningApiAppsDisableResponseApplicationJsonBuilder> {
  factory ProvisioningApiAppsDisableResponseApplicationJson([
    final void Function(ProvisioningApiAppsDisableResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiAppsDisableResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiAppsDisableResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiAppsDisableResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiAppsDisableResponseApplicationJson> get serializer =>
      _$provisioningApiAppsDisableResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsResponseApplicationJson
    implements
        ProvisioningApiGroupsGetGroupsResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupsResponseApplicationJson,
            ProvisioningApiGroupsGetGroupsResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs,
            ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsAddGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsAddGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsAddGroupResponseApplicationJsonInterface {
  ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsAddGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsAddGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsAddGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsAddGroupResponseApplicationJson
    implements
        ProvisioningApiGroupsAddGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsAddGroupResponseApplicationJson,
            ProvisioningApiGroupsAddGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsAddGroupResponseApplicationJson([
    final void Function(ProvisioningApiGroupsAddGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsAddGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsAddGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsAddGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsAddGroupResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsAddGroupResponseApplicationJsonSerializer;
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
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<ProvisioningApiGroupDetails> get groups;
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson
    implements
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson,
            ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupsDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersResponseApplicationJson
    implements
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson,
            ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupUsersResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupUsersResponseApplicationJsonSerializer;
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
  int? get $int;
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
      result._$int = data as int?;
    } catch (_) {}
    try {
      result._string = data as String?;
    } catch (_) {}
    assert(
      [result._$num, result._$int, result._string].where((final x) => x != null).isNotEmpty,
      'Need oneOf for ${result._data}',
    );
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
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface rebuild(
    final void Function(
      ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1InterfaceBuilder,
    ) updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1InterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer;
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users
    implements
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
            ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  ProvisioningApiUserDetails? get userDetails;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
      get groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> get serializer =>
      _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer();
}

class _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
    _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder()
      ..data = JsonObject(data);
    try {
      result._userDetails = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUserDetails),
      )! as ProvisioningApiUserDetails)
          .toBuilder();
    } catch (_) {}
    try {
      result._groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1 = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._userDetails, result._groupsGetGroupUsersDetailsResponseApplicationJsonOcsDataUsers1]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder)
        updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson
    implements
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson,
            ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupUsersDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson
    implements
        ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson,
            ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data,
            ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiGroupsGetGroupResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs,
            ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsGetGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsGetGroupResponseApplicationJsonInterface {
  ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsGetGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsGetGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsGetGroupResponseApplicationJson
    implements
        ProvisioningApiGroupsGetGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsGetGroupResponseApplicationJson,
            ProvisioningApiGroupsGetGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson([
    final void Function(ProvisioningApiGroupsGetGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsGetGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsGetGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsGetGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsGetGroupResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsGetGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs,
            ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsUpdateGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsUpdateGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsUpdateGroupResponseApplicationJsonInterface {
  ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsUpdateGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsUpdateGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsUpdateGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsUpdateGroupResponseApplicationJson
    implements
        ProvisioningApiGroupsUpdateGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsUpdateGroupResponseApplicationJson,
            ProvisioningApiGroupsUpdateGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsUpdateGroupResponseApplicationJson([
    final void Function(ProvisioningApiGroupsUpdateGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsUpdateGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsUpdateGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsUpdateGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsUpdateGroupResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsUpdateGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs,
            ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiGroupsDeleteGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiGroupsDeleteGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiGroupsDeleteGroupResponseApplicationJsonInterface {
  ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiGroupsDeleteGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiGroupsDeleteGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiGroupsDeleteGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiGroupsDeleteGroupResponseApplicationJson
    implements
        ProvisioningApiGroupsDeleteGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiGroupsDeleteGroupResponseApplicationJson,
            ProvisioningApiGroupsDeleteGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiGroupsDeleteGroupResponseApplicationJson([
    final void Function(ProvisioningApiGroupsDeleteGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiGroupsDeleteGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiGroupsDeleteGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiGroupsDeleteGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiGroupsDeleteGroupResponseApplicationJson> get serializer =>
      _$provisioningApiGroupsDeleteGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs,
            ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesSetPreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonInterface {
  ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetPreferenceResponseApplicationJson
    implements
        ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonInterface,
        Built<ProvisioningApiPreferencesSetPreferenceResponseApplicationJson,
            ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesSetPreferenceResponseApplicationJson([
    final void Function(ProvisioningApiPreferencesSetPreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetPreferenceResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetPreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetPreferenceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetPreferenceResponseApplicationJson> get serializer =>
      _$provisioningApiPreferencesSetPreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs,
            ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesDeletePreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonInterface {
  ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson
    implements
        ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonInterface,
        Built<ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson,
            ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson([
    final void Function(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson> get serializer =>
      _$provisioningApiPreferencesDeletePreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs,
            ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonInterface {
  ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson
    implements
        ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonInterface,
        Built<ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson,
            ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson([
    final void Function(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson> get serializer =>
      _$provisioningApiPreferencesSetMultiplePreferencesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs
    implements
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs,
            ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface {
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs get ocs;
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonInterfaceBuilder)
        updates,
  );
  ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson
    implements
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonInterface,
        Built<ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson,
            ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder> {
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson([
    final void Function(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson> get serializer =>
      _$provisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get users;
  ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersResponseApplicationJsonInterface {
  ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersResponseApplicationJson
    implements
        ProvisioningApiUsersGetUsersResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersResponseApplicationJson,
            ProvisioningApiUsersGetUsersResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataInterface {
  String get id;
  ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data,
            ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersAddUserResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersAddUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersAddUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddUserResponseApplicationJsonInterface {
  ProvisioningApiUsersAddUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddUserResponseApplicationJson
    implements
        ProvisioningApiUsersAddUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersAddUserResponseApplicationJson,
            ProvisioningApiUsersAddUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersAddUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersAddUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface {
  String get id;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1InterfaceBuilder)
        updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1InterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1
    implements
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Interface,
        Built<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1,
            ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder> {
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1Builder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponseApplicationJsonOcsDataUsers1Serializer;
}

abstract class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users
    implements
        Built<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
            ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  JsonObject get data;
  ProvisioningApiUserDetails? get userDetails;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1?
      get usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1;
  @BuiltValueSerializer(custom: true)
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> get serializer =>
      _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer();
}

class _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersSerializer
    implements PrimitiveSerializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> {
  @override
  final Iterable<Type> types = const [
    ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
    _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users,
  ];

  @override
  final String wireName = 'ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users';

  @override
  Object serialize(
    final Serializers serializers,
    final ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_UsersBuilder()
      ..data = JsonObject(data);
    try {
      result._userDetails = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUserDetails),
      )! as ProvisioningApiUserDetails)
          .toBuilder();
    } catch (_) {}
    try {
      result._usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1 = (_jsonSerializers.deserialize(
        data,
        specifiedType: const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
      )! as ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1)
          .toBuilder();
    } catch (_) {}
    assert(
      [result._userDetails, result._usersGetUsersDetailsResponseApplicationJsonOcsDataUsers1]
          .where((final x) => x != null)
          .isNotEmpty,
      'Need oneOf for ${result._data}',
    );
    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface {
  BuiltMap<String, ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users> get users;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonInterface {
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersDetailsResponseApplicationJson
    implements
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson,
            ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersDetailsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersDetailsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersDetailsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersDetailsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersDetailsResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersDetailsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltMap<String, String> get data;
  ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs,
            ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonInterface {
  ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson
    implements
        ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson,
            ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson([
    final void Function(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson> get serializer =>
      _$provisioningApiUsersSearchByPhoneNumbersResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUserDetails get data;
  ProvisioningApiUsersGetUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserResponseApplicationJsonInterface {
  ProvisioningApiUsersGetUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserResponseApplicationJson
    implements
        ProvisioningApiUsersGetUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUserResponseApplicationJson,
            ProvisioningApiUsersGetUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEditUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersEditUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEditUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersEditUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEditUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEditUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEditUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserResponseApplicationJsonInterface {
  ProvisioningApiUsersEditUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEditUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserResponseApplicationJson
    implements
        ProvisioningApiUsersEditUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersEditUserResponseApplicationJson,
            ProvisioningApiUsersEditUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersEditUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersEditUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersEditUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersDeleteUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersDeleteUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDeleteUserResponseApplicationJsonInterface {
  ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersDeleteUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersDeleteUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDeleteUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDeleteUserResponseApplicationJson
    implements
        ProvisioningApiUsersDeleteUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersDeleteUserResponseApplicationJson,
            ProvisioningApiUsersDeleteUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersDeleteUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersDeleteUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersDeleteUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersDeleteUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDeleteUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDeleteUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersDeleteUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUserDetails get data;
  ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetCurrentUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetCurrentUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetCurrentUserResponseApplicationJsonInterface {
  ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetCurrentUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetCurrentUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetCurrentUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetCurrentUserResponseApplicationJson
    implements
        ProvisioningApiUsersGetCurrentUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetCurrentUserResponseApplicationJson,
            ProvisioningApiUsersGetCurrentUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetCurrentUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetCurrentUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetCurrentUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetCurrentUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetCurrentUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetCurrentUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetCurrentUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetEditableFieldsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonInterface {
  ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsResponseApplicationJson
    implements
        ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetEditableFieldsResponseApplicationJson,
            ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetEditableFieldsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetEditableFieldsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsInterfaceBuilder)
        updates,
  );
  ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonInterface {
  ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson
    implements
        ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson,
            ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetEditableFieldsForUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs,
            ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEditUserMultiValueResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonInterface {
  ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEditUserMultiValueResponseApplicationJson
    implements
        ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersEditUserMultiValueResponseApplicationJson,
            ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersEditUserMultiValueResponseApplicationJson([
    final void Function(ProvisioningApiUsersEditUserMultiValueResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEditUserMultiValueResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEditUserMultiValueResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEditUserMultiValueResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEditUserMultiValueResponseApplicationJson> get serializer =>
      _$provisioningApiUsersEditUserMultiValueResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs,
            ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersWipeUserDevicesResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonInterface {
  ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersWipeUserDevicesResponseApplicationJson
    implements
        ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersWipeUserDevicesResponseApplicationJson,
            ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersWipeUserDevicesResponseApplicationJson([
    final void Function(ProvisioningApiUsersWipeUserDevicesResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersWipeUserDevicesResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersWipeUserDevicesResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersWipeUserDevicesResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersWipeUserDevicesResponseApplicationJson> get serializer =>
      _$provisioningApiUsersWipeUserDevicesResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEnableUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersEnableUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersEnableUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEnableUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersEnableUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersEnableUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersEnableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersEnableUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersEnableUserResponseApplicationJsonInterface {
  ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersEnableUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersEnableUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersEnableUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersEnableUserResponseApplicationJson
    implements
        ProvisioningApiUsersEnableUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersEnableUserResponseApplicationJson,
            ProvisioningApiUsersEnableUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersEnableUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersEnableUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersEnableUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersEnableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersEnableUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersEnableUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersEnableUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDisableUserResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersDisableUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersDisableUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDisableUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersDisableUserResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs,
            ProvisioningApiUsersDisableUserResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersDisableUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersDisableUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersDisableUserResponseApplicationJsonInterface {
  ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersDisableUserResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersDisableUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersDisableUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersDisableUserResponseApplicationJson
    implements
        ProvisioningApiUsersDisableUserResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersDisableUserResponseApplicationJson,
            ProvisioningApiUsersDisableUserResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersDisableUserResponseApplicationJson([
    final void Function(ProvisioningApiUsersDisableUserResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersDisableUserResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersDisableUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersDisableUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersDisableUserResponseApplicationJson> get serializer =>
      _$provisioningApiUsersDisableUserResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface {
  BuiltList<String> get groups;
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data
    implements
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data,
            ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data get data;
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonInterface {
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUsersGroupsResponseApplicationJson
    implements
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson,
            ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetUsersGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUsersGroupsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUsersGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUsersGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUsersGroupsResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetUsersGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs,
            ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddToGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddToGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddToGroupResponseApplicationJsonInterface {
  ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddToGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddToGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddToGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddToGroupResponseApplicationJson
    implements
        ProvisioningApiUsersAddToGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersAddToGroupResponseApplicationJson,
            ProvisioningApiUsersAddToGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddToGroupResponseApplicationJson([
    final void Function(ProvisioningApiUsersAddToGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddToGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddToGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddToGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddToGroupResponseApplicationJson> get serializer =>
      _$provisioningApiUsersAddToGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs,
            ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersRemoveFromGroupResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonInterface {
  ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveFromGroupResponseApplicationJson
    implements
        ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersRemoveFromGroupResponseApplicationJson,
            ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersRemoveFromGroupResponseApplicationJson([
    final void Function(ProvisioningApiUsersRemoveFromGroupResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveFromGroupResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveFromGroupResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveFromGroupResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveFromGroupResponseApplicationJson> get serializer =>
      _$provisioningApiUsersRemoveFromGroupResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  BuiltList<String> get data;
  ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs,
            ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonInterface {
  ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson
    implements
        ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson,
            ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson([
    final void Function(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson> get serializer =>
      _$provisioningApiUsersGetUserSubAdminGroupsResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs,
            ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersAddSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersAddSubAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersAddSubAdminResponseApplicationJsonInterface {
  ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersAddSubAdminResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersAddSubAdminResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersAddSubAdminResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersAddSubAdminResponseApplicationJson
    implements
        ProvisioningApiUsersAddSubAdminResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersAddSubAdminResponseApplicationJson,
            ProvisioningApiUsersAddSubAdminResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersAddSubAdminResponseApplicationJson([
    final void Function(ProvisioningApiUsersAddSubAdminResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersAddSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersAddSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersAddSubAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersAddSubAdminResponseApplicationJson> get serializer =>
      _$provisioningApiUsersAddSubAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs,
            ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersRemoveSubAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonInterface {
  ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersRemoveSubAdminResponseApplicationJson
    implements
        ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersRemoveSubAdminResponseApplicationJson,
            ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersRemoveSubAdminResponseApplicationJson([
    final void Function(ProvisioningApiUsersRemoveSubAdminResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersRemoveSubAdminResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersRemoveSubAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersRemoveSubAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersRemoveSubAdminResponseApplicationJson> get serializer =>
      _$provisioningApiUsersRemoveSubAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsInterface {
  ProvisioningApiOCSMeta get meta;
  JsonObject get data;
  ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsInterface rebuild(
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs
    implements
        ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsInterface,
        Built<ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs,
            ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsBuilder> {
  factory ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs([
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_OcsBuilder)? b,
  ]) = _$ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs> get serializer =>
      _$provisioningApiUsersResendWelcomeMessageResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonInterface {
  ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs get ocs;
  ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonInterface rebuild(
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonInterfaceBuilder) updates,
  );
  ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson
    implements
        ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonInterface,
        Built<ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson,
            ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonBuilder> {
  factory ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson([
    final void Function(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJsonBuilder)? b,
  ]) = _$ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson;

  // coverage:ignore-start
  const ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson> get serializer =>
      _$provisioningApiUsersResendWelcomeMessageResponseApplicationJsonSerializer;
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
        const FullType(ProvisioningApiAppConfigGetAppsResponseApplicationJson),
        ProvisioningApiAppConfigGetAppsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs),
        ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiOCSMeta), ProvisioningApiOCSMeta.new)
      ..add(ProvisioningApiOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponseApplicationJson),
        ProvisioningApiAppConfigGetKeysResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs),
        ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetKeysResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponseApplicationJson),
        ProvisioningApiAppConfigGetValueResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs),
        ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data),
        ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppConfigGetValueResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigSetValueResponseApplicationJson),
        ProvisioningApiAppConfigSetValueResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigSetValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs),
        ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigSetValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson),
        ProvisioningApiAppConfigDeleteKeyResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs),
        ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppConfigDeleteKeyResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponseApplicationJson),
        ProvisioningApiAppsGetAppsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs),
        ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data),
        ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiAppsGetAppsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppInfoResponseApplicationJson),
        ProvisioningApiAppsGetAppInfoResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppsGetAppInfoResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs),
        ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsGetAppInfoResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ProvisioningApiAppInfo), ProvisioningApiAppInfo.new)
      ..add(ProvisioningApiAppInfo.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsEnableResponseApplicationJson),
        ProvisioningApiAppsEnableResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppsEnableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsEnableResponseApplicationJson_Ocs),
        ProvisioningApiAppsEnableResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsEnableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsDisableResponseApplicationJson),
        ProvisioningApiAppsDisableResponseApplicationJson.new,
      )
      ..add(ProvisioningApiAppsDisableResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiAppsDisableResponseApplicationJson_Ocs),
        ProvisioningApiAppsDisableResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiAppsDisableResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponseApplicationJson),
        ProvisioningApiGroupsGetGroupsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsAddGroupResponseApplicationJson),
        ProvisioningApiGroupsAddGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsAddGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs),
        ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsAddGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson),
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupsDetailsResponseApplicationJson_Ocs_Data.serializer)
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
        const FullType(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson),
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson),
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users.serializer)
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
        const FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        ]),
        MapBuilder<String, ProvisioningApiGroupsGetGroupUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
      )
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson),
        ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetSubAdminsOfGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponseApplicationJson),
        ProvisioningApiGroupsGetGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs),
        ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data),
        ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiGroupsGetGroupResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsUpdateGroupResponseApplicationJson),
        ProvisioningApiGroupsUpdateGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsUpdateGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs),
        ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsUpdateGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsDeleteGroupResponseApplicationJson),
        ProvisioningApiGroupsDeleteGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiGroupsDeleteGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs),
        ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiGroupsDeleteGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson),
        ProvisioningApiPreferencesSetPreferenceResponseApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs),
        ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesSetPreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson),
        ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs),
        ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesDeletePreferenceResponseApplicationJson_Ocs.serializer)
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
        const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson),
        ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs),
        ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesSetMultiplePreferencesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson),
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson.new,
      )
      ..add(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs),
        ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiPreferencesDeleteMultiplePreferenceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponseApplicationJson),
        ProvisioningApiUsersGetUsersResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponseApplicationJson),
        ProvisioningApiUsersAddUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersAddUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data),
        ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersAddUserResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson),
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users),
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1),
        ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.new,
      )
      ..add(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users1.serializer)
      ..addBuilderFactory(
        const FullType(
          BuiltMap,
          [FullType(String), FullType(ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users)],
        ),
        MapBuilder<String, ProvisioningApiUsersGetUsersDetailsResponseApplicationJson_Ocs_Data_Users>.new,
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
        const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson),
        ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs),
        ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersSearchByPhoneNumbersResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserResponseApplicationJson),
        ProvisioningApiUsersGetUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserResponseApplicationJson),
        ProvisioningApiUsersEditUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEditUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersEditUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEditUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDeleteUserResponseApplicationJson),
        ProvisioningApiUsersDeleteUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersDeleteUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersDeleteUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetCurrentUserResponseApplicationJson),
        ProvisioningApiUsersGetCurrentUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetCurrentUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetCurrentUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson),
        ProvisioningApiUsersGetEditableFieldsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson),
        ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetEditableFieldsForUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson),
        ProvisioningApiUsersEditUserMultiValueResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs),
        ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEditUserMultiValueResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson),
        ProvisioningApiUsersWipeUserDevicesResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs),
        ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersWipeUserDevicesResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEnableUserResponseApplicationJson),
        ProvisioningApiUsersEnableUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersEnableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersEnableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDisableUserResponseApplicationJson),
        ProvisioningApiUsersDisableUserResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersDisableUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs),
        ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersDisableUserResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson),
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data),
        ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data.new,
      )
      ..add(ProvisioningApiUsersGetUsersGroupsResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddToGroupResponseApplicationJson),
        ProvisioningApiUsersAddToGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddToGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs),
        ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddToGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson),
        ProvisioningApiUsersRemoveFromGroupResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs),
        ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersRemoveFromGroupResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson),
        ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs),
        ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersGetUserSubAdminGroupsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddSubAdminResponseApplicationJson),
        ProvisioningApiUsersAddSubAdminResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersAddSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs),
        ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersAddSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson),
        ProvisioningApiUsersRemoveSubAdminResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs),
        ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersRemoveSubAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson),
        ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson.new,
      )
      ..add(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs),
        ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs.new,
      )
      ..add(ProvisioningApiUsersResendWelcomeMessageResponseApplicationJson_Ocs.serializer)
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
