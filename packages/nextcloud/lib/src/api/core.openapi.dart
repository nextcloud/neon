// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
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

part 'core.openapi.g.dart';

class CoreResponse<T, U> extends DynamiteResponse<T, U> {
  CoreResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'CoreResponse(data: $data, headers: $headers)';
}

class CoreApiException extends DynamiteApiException {
  CoreApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<CoreApiException> fromResponse(final HttpClientResponse response) async {
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
    } on FormatException {
      body = 'binary';
    }

    return CoreApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'CoreApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class CoreClient extends DynamiteClient {
  CoreClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  CoreClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  Future<CoreServerStatus> getStatus() async {
    const path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreServerStatus))!
          as CoreServerStatus;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreServerCapabilities> getCapabilities() async {
    const path = '/ocs/v2.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreServerCapabilities),
      )! as CoreServerCapabilities;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreNavigationApps> getNavigationApps() async {
    const path = '/ocs/v2.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreNavigationApps))!
          as CoreNavigationApps;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowInit> initLoginFlow() async {
    const path = '/index.php/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreLoginFlowInit))!
          as CoreLoginFlowInit;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowResult> getLoginFlowResult({required final String token}) async {
    const path = '/index.php/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    queryParameters['token'] = token;
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(CoreLoginFlowResult))!
          as CoreLoginFlowResult;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
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
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
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
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
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
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
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
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreAutocompleteResult> autocomplete({
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
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
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
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreAutocompleteResult),
      )! as CoreAutocompleteResult;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<JsonObject> deleteAppPassword() async {
    const path = '/ocs/v2.php/core/apppassword';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return JsonObject(await response.body);
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get the providers for unified search
  Future<CoreUnifiedSearchProvidersResponse200ApplicationJson> unifiedSearchProviders({final String from = ''}) async {
    const path = '/ocs/v2.php/search/providers';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    if (from != '') {
      queryParameters['from'] = from;
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreUnifiedSearchProvidersResponse200ApplicationJson),
      )! as CoreUnifiedSearchProvidersResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Search
  Future<CoreUnifiedSearchResponse200ApplicationJson> unifiedSearch({
    required final String providerId,
    final String term = '',
    final int? sortOrder,
    final int? limit,
    final ContentString<CoreUnifiedSearchCursor>? cursor,
    final String from = '',
  }) async {
    var path = '/ocs/v2.php/search/providers/{providerId}/search';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth'); // coverage:ignore-line
    }
    path = path.replaceAll('{providerId}', Uri.encodeQueryComponent(providerId));
    if (term != '') {
      queryParameters['term'] = term;
    }
    if (sortOrder != null) {
      queryParameters['sortOrder'] = sortOrder.toString();
    }
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (cursor != null) {
      queryParameters['cursor'] = _jsonSerializers.serialize(
        cursor,
        specifiedType: const FullType(ContentString, [FullType(CoreUnifiedSearchCursor)]),
      );
    }
    if (from != '') {
      queryParameters['from'] = from;
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(CoreUnifiedSearchResponse200ApplicationJson),
      )! as CoreUnifiedSearchResponse200ApplicationJson;
    }
    throw await CoreApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class CoreServerStatus implements Built<CoreServerStatus, CoreServerStatusBuilder> {
  factory CoreServerStatus([final void Function(CoreServerStatusBuilder)? b]) = _$CoreServerStatus;
  const CoreServerStatus._();

  factory CoreServerStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get installed;
  bool get maintenance;
  bool get needsDbUpgrade;
  String get version;
  String get versionstring;
  String get edition;
  String get productname;
  bool get extendedSupport;
  static Serializer<CoreServerStatus> get serializer => _$coreServerStatusSerializer;
}

abstract class CoreOCSMeta implements Built<CoreOCSMeta, CoreOCSMetaBuilder> {
  factory CoreOCSMeta([final void Function(CoreOCSMetaBuilder)? b]) = _$CoreOCSMeta;
  const CoreOCSMeta._();

  factory CoreOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<CoreOCSMeta> get serializer => _$coreOCSMetaSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Version
    implements Built<CoreServerCapabilities_Ocs_Data_Version, CoreServerCapabilities_Ocs_Data_VersionBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Version([
    final void Function(CoreServerCapabilities_Ocs_Data_VersionBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Version;
  const CoreServerCapabilities_Ocs_Data_Version._();

  factory CoreServerCapabilities_Ocs_Data_Version.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get major;
  int? get minor;
  int? get micro;
  String? get string;
  String? get edition;
  bool? get extendedSupport;
  static Serializer<CoreServerCapabilities_Ocs_Data_Version> get serializer =>
      _$coreServerCapabilitiesOcsDataVersionSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Core
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Core,
            CoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Core([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Core;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Core._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get pollinterval;
  @BuiltValueField(wireName: 'webdav-root')
  String? get webdavRoot;
  @BuiltValueField(wireName: 'reference-api')
  bool? get referenceApi;
  @BuiltValueField(wireName: 'reference-regex')
  String? get referenceRegex;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Core> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCoreSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
            CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get delay;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesBruteforceSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
            CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable;
  const CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<String>? get size;
  BuiltList<String>? get gps;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
            CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get url;
  String? get etag;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Files
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Files,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Files;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Files._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get bigfilechunking;
  @BuiltValueField(wireName: 'blacklisted_files')
  BuiltList<String>? get blacklistedFiles;
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? get directEditing;
  bool? get comments;
  bool? get undelete;
  bool? get versioning;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Files> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Activity
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Activity,
            CoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Activity([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Activity;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Activity._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<String>? get apiv2;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Activity> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesActivitySerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get globalScale;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesStatusSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get frontendEnabled;
  int? get allowedCircles;
  int? get allowedUserTypes;
  int? get membersLimit;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get core;
  JsonObject? get extra;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get flags;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? get source;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  BuiltList<int>? get coreFlags;
  BuiltList<int>? get systemFlags;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? get constants;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? get config;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesCircleSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  JsonObject? get level;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
            CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? get constants;
  JsonObject? get type;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesMemberSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Circles
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Circles,
            CoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Circles._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get version;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? get status;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? get settings;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? get circle;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? get member;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Circles> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesCirclesSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
            CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get webdav;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
            CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get name;
  BuiltList<String>? get shareTypes;
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? get protocols;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
            CoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Ocm._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  String? get apiVersion;
  String? get endPoint;
  BuiltList<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? get resourceTypes;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesOcmSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Dav
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Dav,
            CoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Dav([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Dav;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Dav._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get bulkupload;
  String? get chunking;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Dav> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesDavSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enforced;
  bool? get askForOptionalPassword;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>
      get serializer => _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? get password;
  @BuiltValueField(wireName: 'expire_date')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'multiple_links')
  bool? get multipleLinks;
  @BuiltValueField(wireName: 'expire_date_internal')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal? get expireDateInternal;
  @BuiltValueField(wireName: 'expire_date_remote')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? get expireDateRemote;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  bool? get upload;
  @BuiltValueField(wireName: 'upload_files_drop')
  bool? get uploadFilesDrop;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueField(wireName: 'send_mail')
  bool? get sendMail;
  @BuiltValueField(wireName: 'expire_date')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? get expireDate;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  @BuiltValueField(wireName: 'expire_date')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? get expireDate;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported([
    final void Function(
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder,
    )? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>
      get serializer => _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get outgoing;
  bool? get incoming;
  @BuiltValueField(wireName: 'expire_date')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? get expireDate;
  @BuiltValueField(wireName: 'expire_date_supported')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported? get expireDateSupported;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueField(wireName: 'query_lookup_default')
  bool? get queryLookupDefault;
  @BuiltValueField(wireName: 'always_show_unique')
  bool? get alwaysShowUnique;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)?
        b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>
      get serializer => _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  bool? get enforced;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  bool? get enforced;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  @BuiltValueField(wireName: 'send_password_by_mail')
  bool? get sendPasswordByMail;
  @BuiltValueField(wireName: 'upload_files_drop')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? get uploadFilesDrop;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? get password;
  @BuiltValueField(wireName: 'expire_date')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? get expireDate;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
            CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing;
  const CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueField(wireName: 'api_enabled')
  bool? get apiEnabled;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? get public;
  bool? get resharing;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? get user;
  @BuiltValueField(wireName: 'group_sharing')
  bool? get groupSharing;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? get group;
  @BuiltValueField(wireName: 'default_permissions')
  int? get defaultPermissions;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? get federation;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? get sharee;
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? get sharebymail;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesFilesSharingSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Notes
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Notes,
            CoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notes([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Notes;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Notes._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Notes> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesNotesSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Notifications
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
            CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notifications([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Notifications;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Notifications._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String>? get ocsEndpoints;
  BuiltList<String>? get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String>? get adminNotifications;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesNotificationsSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
            CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api;
  const CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get generate;
  String? get validate;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
            CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy;
  const CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int? get minLength;
  bool? get enforceNonCommonPassword;
  bool? get enforceNumericCharacters;
  bool? get enforceSpecialCharacters;
  bool? get enforceUpperLowerCase;
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? get api;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesPasswordPolicySerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
            CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi;
  const CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String? get version;
  @BuiltValueField(wireName: 'AccountPropertyScopesVersion')
  int? get accountPropertyScopesVersion;
  @BuiltValueField(wireName: 'AccountPropertyScopesFederatedEnabled')
  bool? get accountPropertyScopesFederatedEnabled;
  @BuiltValueField(wireName: 'AccountPropertyScopesPublishedEnabled')
  bool? get accountPropertyScopesPublishedEnabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesProvisioningApiSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_Theming
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_Theming,
            CoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_Theming([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_Theming;
  const CoreServerCapabilities_Ocs_Data_Capabilities_Theming._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
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
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_Theming> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesThemingSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
            CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus;
  const CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get restore;
  bool? get enabled;
  @BuiltValueField(wireName: 'supports_emoji')
  bool? get supportsEmoji;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesUserStatusSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
            CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus([
    final void Function(CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus;
  const CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesWeatherStatusSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data_Capabilities
    implements
        Built<CoreServerCapabilities_Ocs_Data_Capabilities, CoreServerCapabilities_Ocs_Data_CapabilitiesBuilder> {
  factory CoreServerCapabilities_Ocs_Data_Capabilities([
    final void Function(CoreServerCapabilities_Ocs_Data_CapabilitiesBuilder)? b,
  ]) = _$CoreServerCapabilities_Ocs_Data_Capabilities;
  const CoreServerCapabilities_Ocs_Data_Capabilities._();

  factory CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreServerCapabilities_Ocs_Data_Capabilities_Core? get core;
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? get bruteforce;
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? get metadataAvailable;
  CoreServerCapabilities_Ocs_Data_Capabilities_Files? get files;
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity? get activity;
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles? get circles;
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm? get ocm;
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav? get dav;
  @BuiltValueField(wireName: 'files_sharing')
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? get filesSharing;
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes? get notes;
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications? get notifications;
  @BuiltValueField(wireName: 'password_policy')
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? get passwordPolicy;
  @BuiltValueField(wireName: 'provisioning_api')
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? get provisioningApi;
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming? get theming;
  @BuiltValueField(wireName: 'user_status')
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? get userStatus;
  @BuiltValueField(wireName: 'weather_status')
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? get weatherStatus;
  static Serializer<CoreServerCapabilities_Ocs_Data_Capabilities> get serializer =>
      _$coreServerCapabilitiesOcsDataCapabilitiesSerializer;
}

abstract class CoreServerCapabilities_Ocs_Data
    implements Built<CoreServerCapabilities_Ocs_Data, CoreServerCapabilities_Ocs_DataBuilder> {
  factory CoreServerCapabilities_Ocs_Data([final void Function(CoreServerCapabilities_Ocs_DataBuilder)? b]) =
      _$CoreServerCapabilities_Ocs_Data;
  const CoreServerCapabilities_Ocs_Data._();

  factory CoreServerCapabilities_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreServerCapabilities_Ocs_Data_Version get version;
  CoreServerCapabilities_Ocs_Data_Capabilities get capabilities;
  static Serializer<CoreServerCapabilities_Ocs_Data> get serializer => _$coreServerCapabilitiesOcsDataSerializer;
}

abstract class CoreServerCapabilities_Ocs
    implements Built<CoreServerCapabilities_Ocs, CoreServerCapabilities_OcsBuilder> {
  factory CoreServerCapabilities_Ocs([final void Function(CoreServerCapabilities_OcsBuilder)? b]) =
      _$CoreServerCapabilities_Ocs;
  const CoreServerCapabilities_Ocs._();

  factory CoreServerCapabilities_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  CoreServerCapabilities_Ocs_Data get data;
  static Serializer<CoreServerCapabilities_Ocs> get serializer => _$coreServerCapabilitiesOcsSerializer;
}

abstract class CoreServerCapabilities implements Built<CoreServerCapabilities, CoreServerCapabilitiesBuilder> {
  factory CoreServerCapabilities([final void Function(CoreServerCapabilitiesBuilder)? b]) = _$CoreServerCapabilities;
  const CoreServerCapabilities._();

  factory CoreServerCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreServerCapabilities_Ocs get ocs;
  static Serializer<CoreServerCapabilities> get serializer => _$coreServerCapabilitiesSerializer;
}

abstract class CoreNavigationApps_Ocs_Data_Order
    implements Built<CoreNavigationApps_Ocs_Data_Order, CoreNavigationApps_Ocs_Data_OrderBuilder> {
  factory CoreNavigationApps_Ocs_Data_Order([final void Function(CoreNavigationApps_Ocs_Data_OrderBuilder)? b]) =
      _$CoreNavigationApps_Ocs_Data_Order;
  const CoreNavigationApps_Ocs_Data_Order._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreNavigationApps_Ocs_Data_Order fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreNavigationApps_Ocs_Data_Order> get serializer =>
      _$CoreNavigationApps_Ocs_Data_OrderSerializer();
}

class _$CoreNavigationApps_Ocs_Data_OrderSerializer implements PrimitiveSerializer<CoreNavigationApps_Ocs_Data_Order> {
  @override
  final Iterable<Type> types = const [CoreNavigationApps_Ocs_Data_Order, _$CoreNavigationApps_Ocs_Data_Order];

  @override
  final String wireName = 'CoreNavigationApps_Ocs_Data_Order';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreNavigationApps_Ocs_Data_Order object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreNavigationApps_Ocs_Data_Order deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreNavigationApps_Ocs_Data_OrderBuilder()..data = JsonObject(data);
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

abstract class CoreNavigationApps_Ocs_Data
    implements Built<CoreNavigationApps_Ocs_Data, CoreNavigationApps_Ocs_DataBuilder> {
  factory CoreNavigationApps_Ocs_Data([final void Function(CoreNavigationApps_Ocs_DataBuilder)? b]) =
      _$CoreNavigationApps_Ocs_Data;
  const CoreNavigationApps_Ocs_Data._();

  factory CoreNavigationApps_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get id;

  /// Should always be an integer, but there is a bug. See https://github.com/nextcloud/server/issues/32828
  CoreNavigationApps_Ocs_Data_Order get order;
  String get href;
  String get icon;
  String get type;
  String get name;
  bool get active;
  String get classes;
  int get unread;
  static Serializer<CoreNavigationApps_Ocs_Data> get serializer => _$coreNavigationAppsOcsDataSerializer;
}

abstract class CoreNavigationApps_Ocs implements Built<CoreNavigationApps_Ocs, CoreNavigationApps_OcsBuilder> {
  factory CoreNavigationApps_Ocs([final void Function(CoreNavigationApps_OcsBuilder)? b]) = _$CoreNavigationApps_Ocs;
  const CoreNavigationApps_Ocs._();

  factory CoreNavigationApps_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  BuiltList<CoreNavigationApps_Ocs_Data> get data;
  static Serializer<CoreNavigationApps_Ocs> get serializer => _$coreNavigationAppsOcsSerializer;
}

abstract class CoreNavigationApps implements Built<CoreNavigationApps, CoreNavigationAppsBuilder> {
  factory CoreNavigationApps([final void Function(CoreNavigationAppsBuilder)? b]) = _$CoreNavigationApps;
  const CoreNavigationApps._();

  factory CoreNavigationApps.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreNavigationApps_Ocs get ocs;
  static Serializer<CoreNavigationApps> get serializer => _$coreNavigationAppsSerializer;
}

abstract class CoreLoginFlowInit_Poll implements Built<CoreLoginFlowInit_Poll, CoreLoginFlowInit_PollBuilder> {
  factory CoreLoginFlowInit_Poll([final void Function(CoreLoginFlowInit_PollBuilder)? b]) = _$CoreLoginFlowInit_Poll;
  const CoreLoginFlowInit_Poll._();

  factory CoreLoginFlowInit_Poll.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get token;
  String get endpoint;
  static Serializer<CoreLoginFlowInit_Poll> get serializer => _$coreLoginFlowInitPollSerializer;
}

abstract class CoreLoginFlowInit implements Built<CoreLoginFlowInit, CoreLoginFlowInitBuilder> {
  factory CoreLoginFlowInit([final void Function(CoreLoginFlowInitBuilder)? b]) = _$CoreLoginFlowInit;
  const CoreLoginFlowInit._();

  factory CoreLoginFlowInit.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreLoginFlowInit_Poll get poll;
  String get login;
  static Serializer<CoreLoginFlowInit> get serializer => _$coreLoginFlowInitSerializer;
}

abstract class CoreLoginFlowResult implements Built<CoreLoginFlowResult, CoreLoginFlowResultBuilder> {
  factory CoreLoginFlowResult([final void Function(CoreLoginFlowResultBuilder)? b]) = _$CoreLoginFlowResult;
  const CoreLoginFlowResult._();

  factory CoreLoginFlowResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get server;
  String get loginName;
  String get appPassword;
  static Serializer<CoreLoginFlowResult> get serializer => _$coreLoginFlowResultSerializer;
}

abstract class CoreAutocompleteResult_Ocs_Data_Status
    implements Built<CoreAutocompleteResult_Ocs_Data_Status, CoreAutocompleteResult_Ocs_Data_StatusBuilder> {
  factory CoreAutocompleteResult_Ocs_Data_Status([
    final void Function(CoreAutocompleteResult_Ocs_Data_StatusBuilder)? b,
  ]) = _$CoreAutocompleteResult_Ocs_Data_Status;
  const CoreAutocompleteResult_Ocs_Data_Status._();

  JsonObject get data;
  BuiltList<JsonObject>? get builtListJsonObject;
  String? get string;
  static CoreAutocompleteResult_Ocs_Data_Status fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreAutocompleteResult_Ocs_Data_Status> get serializer =>
      _$CoreAutocompleteResult_Ocs_Data_StatusSerializer();
}

class _$CoreAutocompleteResult_Ocs_Data_StatusSerializer
    implements PrimitiveSerializer<CoreAutocompleteResult_Ocs_Data_Status> {
  @override
  final Iterable<Type> types = const [CoreAutocompleteResult_Ocs_Data_Status, _$CoreAutocompleteResult_Ocs_Data_Status];

  @override
  final String wireName = 'CoreAutocompleteResult_Ocs_Data_Status';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreAutocompleteResult_Ocs_Data_Status object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreAutocompleteResult_Ocs_Data_Status deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreAutocompleteResult_Ocs_Data_StatusBuilder()..data = JsonObject(data);
    try {
      result._builtListJsonObject = (_jsonSerializers.deserialize(
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

abstract class CoreAutocompleteResult_Ocs_Data
    implements Built<CoreAutocompleteResult_Ocs_Data, CoreAutocompleteResult_Ocs_DataBuilder> {
  factory CoreAutocompleteResult_Ocs_Data([final void Function(CoreAutocompleteResult_Ocs_DataBuilder)? b]) =
      _$CoreAutocompleteResult_Ocs_Data;
  const CoreAutocompleteResult_Ocs_Data._();

  factory CoreAutocompleteResult_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get id;
  String get label;
  String get icon;
  String get source;
  CoreAutocompleteResult_Ocs_Data_Status get status;
  String get subline;
  String get shareWithDisplayNameUnique;
  static Serializer<CoreAutocompleteResult_Ocs_Data> get serializer => _$coreAutocompleteResultOcsDataSerializer;
}

abstract class CoreAutocompleteResult_Ocs
    implements Built<CoreAutocompleteResult_Ocs, CoreAutocompleteResult_OcsBuilder> {
  factory CoreAutocompleteResult_Ocs([final void Function(CoreAutocompleteResult_OcsBuilder)? b]) =
      _$CoreAutocompleteResult_Ocs;
  const CoreAutocompleteResult_Ocs._();

  factory CoreAutocompleteResult_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  BuiltList<CoreAutocompleteResult_Ocs_Data> get data;
  static Serializer<CoreAutocompleteResult_Ocs> get serializer => _$coreAutocompleteResultOcsSerializer;
}

abstract class CoreAutocompleteResult implements Built<CoreAutocompleteResult, CoreAutocompleteResultBuilder> {
  factory CoreAutocompleteResult([final void Function(CoreAutocompleteResultBuilder)? b]) = _$CoreAutocompleteResult;
  const CoreAutocompleteResult._();

  factory CoreAutocompleteResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreAutocompleteResult_Ocs get ocs;
  static Serializer<CoreAutocompleteResult> get serializer => _$coreAutocompleteResultSerializer;
}

abstract class CoreUnifiedSearchProvider implements Built<CoreUnifiedSearchProvider, CoreUnifiedSearchProviderBuilder> {
  factory CoreUnifiedSearchProvider([final void Function(CoreUnifiedSearchProviderBuilder)? b]) =
      _$CoreUnifiedSearchProvider;
  const CoreUnifiedSearchProvider._();

  factory CoreUnifiedSearchProvider.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get id;
  String get name;
  int get order;
  static Serializer<CoreUnifiedSearchProvider> get serializer => _$coreUnifiedSearchProviderSerializer;
}

abstract class CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs
    implements
        Built<CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs,
            CoreUnifiedSearchProvidersResponse200ApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchProvidersResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs;
  const CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs._();

  factory CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  BuiltList<CoreUnifiedSearchProvider> get data;
  static Serializer<CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchProvidersResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreUnifiedSearchProvidersResponse200ApplicationJson
    implements
        Built<CoreUnifiedSearchProvidersResponse200ApplicationJson,
            CoreUnifiedSearchProvidersResponse200ApplicationJsonBuilder> {
  factory CoreUnifiedSearchProvidersResponse200ApplicationJson([
    final void Function(CoreUnifiedSearchProvidersResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchProvidersResponse200ApplicationJson;
  const CoreUnifiedSearchProvidersResponse200ApplicationJson._();

  factory CoreUnifiedSearchProvidersResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreUnifiedSearchProvidersResponse200ApplicationJson> get serializer =>
      _$coreUnifiedSearchProvidersResponse200ApplicationJsonSerializer;
}

abstract class CoreUnifiedSearchCursor implements Built<CoreUnifiedSearchCursor, CoreUnifiedSearchCursorBuilder> {
  factory CoreUnifiedSearchCursor([final void Function(CoreUnifiedSearchCursorBuilder)? b]) = _$CoreUnifiedSearchCursor;
  const CoreUnifiedSearchCursor._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreUnifiedSearchCursor fromJson(final Object json) => _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreUnifiedSearchCursor> get serializer => _$CoreUnifiedSearchCursorSerializer();
}

class _$CoreUnifiedSearchCursorSerializer implements PrimitiveSerializer<CoreUnifiedSearchCursor> {
  @override
  final Iterable<Type> types = const [CoreUnifiedSearchCursor, _$CoreUnifiedSearchCursor];

  @override
  final String wireName = 'CoreUnifiedSearchCursor';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreUnifiedSearchCursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreUnifiedSearchCursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreUnifiedSearchCursorBuilder()..data = JsonObject(data);
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

abstract class CoreUnifiedSearchResultEntry
    implements Built<CoreUnifiedSearchResultEntry, CoreUnifiedSearchResultEntryBuilder> {
  factory CoreUnifiedSearchResultEntry([final void Function(CoreUnifiedSearchResultEntryBuilder)? b]) =
      _$CoreUnifiedSearchResultEntry;
  const CoreUnifiedSearchResultEntry._();

  factory CoreUnifiedSearchResultEntry.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get thumbnailUrl;
  String get title;
  String get subline;
  String get resourceUrl;
  String get icon;
  bool get rounded;
  BuiltList<String> get attributes;
  static Serializer<CoreUnifiedSearchResultEntry> get serializer => _$coreUnifiedSearchResultEntrySerializer;
}

abstract class CoreUnifiedSearchResult_Cursor
    implements Built<CoreUnifiedSearchResult_Cursor, CoreUnifiedSearchResult_CursorBuilder> {
  factory CoreUnifiedSearchResult_Cursor([final void Function(CoreUnifiedSearchResult_CursorBuilder)? b]) =
      _$CoreUnifiedSearchResult_Cursor;
  const CoreUnifiedSearchResult_Cursor._();

  JsonObject get data;
  int? get $int;
  String? get string;
  static CoreUnifiedSearchResult_Cursor fromJson(final Object json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  @BuiltValueSerializer(custom: true)
  static Serializer<CoreUnifiedSearchResult_Cursor> get serializer => _$CoreUnifiedSearchResult_CursorSerializer();
}

class _$CoreUnifiedSearchResult_CursorSerializer implements PrimitiveSerializer<CoreUnifiedSearchResult_Cursor> {
  @override
  final Iterable<Type> types = const [CoreUnifiedSearchResult_Cursor, _$CoreUnifiedSearchResult_Cursor];

  @override
  final String wireName = 'CoreUnifiedSearchResult_Cursor';

  @override
  Object serialize(
    final Serializers serializers,
    final CoreUnifiedSearchResult_Cursor object, {
    final FullType specifiedType = FullType.unspecified,
  }) =>
      object.data.value;

  @override
  CoreUnifiedSearchResult_Cursor deserialize(
    final Serializers serializers,
    final Object data, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CoreUnifiedSearchResult_CursorBuilder()..data = JsonObject(data);
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

abstract class CoreUnifiedSearchResult implements Built<CoreUnifiedSearchResult, CoreUnifiedSearchResultBuilder> {
  factory CoreUnifiedSearchResult([final void Function(CoreUnifiedSearchResultBuilder)? b]) = _$CoreUnifiedSearchResult;
  const CoreUnifiedSearchResult._();

  factory CoreUnifiedSearchResult.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get name;
  bool get isPaginated;
  BuiltList<CoreUnifiedSearchResultEntry> get entries;
  CoreUnifiedSearchResult_Cursor? get cursor;
  static Serializer<CoreUnifiedSearchResult> get serializer => _$coreUnifiedSearchResultSerializer;
}

abstract class CoreUnifiedSearchResponse200ApplicationJson_Ocs
    implements
        Built<CoreUnifiedSearchResponse200ApplicationJson_Ocs, CoreUnifiedSearchResponse200ApplicationJson_OcsBuilder> {
  factory CoreUnifiedSearchResponse200ApplicationJson_Ocs([
    final void Function(CoreUnifiedSearchResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$CoreUnifiedSearchResponse200ApplicationJson_Ocs;
  const CoreUnifiedSearchResponse200ApplicationJson_Ocs._();

  factory CoreUnifiedSearchResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  CoreUnifiedSearchResult get data;
  static Serializer<CoreUnifiedSearchResponse200ApplicationJson_Ocs> get serializer =>
      _$coreUnifiedSearchResponse200ApplicationJsonOcsSerializer;
}

abstract class CoreUnifiedSearchResponse200ApplicationJson
    implements Built<CoreUnifiedSearchResponse200ApplicationJson, CoreUnifiedSearchResponse200ApplicationJsonBuilder> {
  factory CoreUnifiedSearchResponse200ApplicationJson([
    final void Function(CoreUnifiedSearchResponse200ApplicationJsonBuilder)? b,
  ]) = _$CoreUnifiedSearchResponse200ApplicationJson;
  const CoreUnifiedSearchResponse200ApplicationJson._();

  factory CoreUnifiedSearchResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreUnifiedSearchResponse200ApplicationJson_Ocs get ocs;
  static Serializer<CoreUnifiedSearchResponse200ApplicationJson> get serializer =>
      _$coreUnifiedSearchResponse200ApplicationJsonSerializer;
}

abstract class CoreEmptyOCS_Ocs implements Built<CoreEmptyOCS_Ocs, CoreEmptyOCS_OcsBuilder> {
  factory CoreEmptyOCS_Ocs([final void Function(CoreEmptyOCS_OcsBuilder)? b]) = _$CoreEmptyOCS_Ocs;
  const CoreEmptyOCS_Ocs._();

  factory CoreEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<CoreEmptyOCS_Ocs> get serializer => _$coreEmptyOCSOcsSerializer;
}

abstract class CoreEmptyOCS implements Built<CoreEmptyOCS, CoreEmptyOCSBuilder> {
  factory CoreEmptyOCS([final void Function(CoreEmptyOCSBuilder)? b]) = _$CoreEmptyOCS;
  const CoreEmptyOCS._();

  factory CoreEmptyOCS.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  CoreEmptyOCS_Ocs get ocs;
  static Serializer<CoreEmptyOCS> get serializer => _$coreEmptyOCSSerializer;
}

@SerializersFor([
  CoreServerStatus,
  CoreServerCapabilities,
  CoreServerCapabilities_Ocs,
  CoreOCSMeta,
  CoreServerCapabilities_Ocs_Data,
  CoreServerCapabilities_Ocs_Data_Version,
  CoreServerCapabilities_Ocs_Data_Capabilities,
  CoreServerCapabilities_Ocs_Data_Capabilities_Core,
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
  CoreServerCapabilities_Ocs_Data_Capabilities_Files,
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes,
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming,
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
  CoreNavigationApps,
  CoreNavigationApps_Ocs,
  CoreNavigationApps_Ocs_Data,
  CoreLoginFlowInit,
  CoreLoginFlowInit_Poll,
  CoreLoginFlowResult,
  CoreAutocompleteResult,
  CoreAutocompleteResult_Ocs,
  CoreAutocompleteResult_Ocs_Data,
  CoreUnifiedSearchProvidersResponse200ApplicationJson,
  CoreUnifiedSearchProvidersResponse200ApplicationJson_Ocs,
  CoreUnifiedSearchProvider,
  CoreUnifiedSearchResponse200ApplicationJson,
  CoreUnifiedSearchResponse200ApplicationJson_Ocs,
  CoreUnifiedSearchResult,
  CoreUnifiedSearchResultEntry,
  CoreEmptyOCS,
  CoreEmptyOCS_Ocs,
])
final Serializers _serializers = (_$_serializers.toBuilder()
      ..addBuilderFactory(const FullType(CoreServerStatus), CoreServerStatus.new)
      ..addBuilderFactory(const FullType(CoreServerCapabilities), CoreServerCapabilities.new)
      ..addBuilderFactory(const FullType(CoreNavigationApps), CoreNavigationApps.new)
      ..addBuilderFactory(const FullType(CoreLoginFlowInit), CoreLoginFlowInit.new)
      ..addBuilderFactory(const FullType(CoreLoginFlowResult), CoreLoginFlowResult.new)
      ..addBuilderFactory(const FullType(List, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(const FullType(CoreAutocompleteResult), CoreAutocompleteResult.new)
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchProvidersResponse200ApplicationJson),
        CoreUnifiedSearchProvidersResponse200ApplicationJson.new,
      )
      ..addBuilderFactory(const FullType(CoreUnifiedSearchCursor), CoreUnifiedSearchCursor.new)
      ..addBuilderFactory(
        const FullType(ContentString, [FullType(CoreUnifiedSearchCursor)]),
        ContentString<CoreUnifiedSearchCursor>.new,
      )
      ..addBuilderFactory(
        const FullType(CoreUnifiedSearchResponse200ApplicationJson),
        CoreUnifiedSearchResponse200ApplicationJson.new,
      ))
    .build();

Serializers get coreSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

// coverage:ignore-start
T deserializeCore<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeCore<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
