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
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
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

  Future<ProvisioningApiUser> getCurrentUser() async {
    const path = '/ocs/v2.php/cloud/user';
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
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(ProvisioningApiUser))!
          as ProvisioningApiUser;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<ProvisioningApiUser> getUser({required final String userId}) async {
    var path = '/ocs/v2.php/cloud/users/{userId}';
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
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(ProvisioningApiUser))!
          as ProvisioningApiUser;
    }
    throw await ProvisioningApiApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class ProvisioningApiOCSMeta implements Built<ProvisioningApiOCSMeta, ProvisioningApiOCSMetaBuilder> {
  factory ProvisioningApiOCSMeta([final void Function(ProvisioningApiOCSMetaBuilder)? b]) = _$ProvisioningApiOCSMeta;
  const ProvisioningApiOCSMeta._();

  factory ProvisioningApiOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<ProvisioningApiOCSMeta> get serializer => _$provisioningApiOCSMetaSerializer;
}

abstract class ProvisioningApiUserDetails_Quota
    implements Built<ProvisioningApiUserDetails_Quota, ProvisioningApiUserDetails_QuotaBuilder> {
  factory ProvisioningApiUserDetails_Quota([final void Function(ProvisioningApiUserDetails_QuotaBuilder)? b]) =
      _$ProvisioningApiUserDetails_Quota;
  const ProvisioningApiUserDetails_Quota._();

  factory ProvisioningApiUserDetails_Quota.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  int get free;
  int get used;
  int get total;
  num get relative;
  int get quota;
  static Serializer<ProvisioningApiUserDetails_Quota> get serializer => _$provisioningApiUserDetailsQuotaSerializer;
}

abstract class ProvisioningApiUserDetails_BackendCapabilities
    implements
        Built<ProvisioningApiUserDetails_BackendCapabilities, ProvisioningApiUserDetails_BackendCapabilitiesBuilder> {
  factory ProvisioningApiUserDetails_BackendCapabilities([
    final void Function(ProvisioningApiUserDetails_BackendCapabilitiesBuilder)? b,
  ]) = _$ProvisioningApiUserDetails_BackendCapabilities;
  const ProvisioningApiUserDetails_BackendCapabilities._();

  factory ProvisioningApiUserDetails_BackendCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool get setDisplayName;
  bool get setPassword;
  static Serializer<ProvisioningApiUserDetails_BackendCapabilities> get serializer =>
      _$provisioningApiUserDetailsBackendCapabilitiesSerializer;
}

abstract class ProvisioningApiUserDetails
    implements Built<ProvisioningApiUserDetails, ProvisioningApiUserDetailsBuilder> {
  factory ProvisioningApiUserDetails([final void Function(ProvisioningApiUserDetailsBuilder)? b]) =
      _$ProvisioningApiUserDetails;
  const ProvisioningApiUserDetails._();

  factory ProvisioningApiUserDetails.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  bool? get enabled;
  String? get storageLocation;
  String get id;
  int get lastLogin;
  String get backend;
  BuiltList<String> get subadmin;
  ProvisioningApiUserDetails_Quota get quota;
  String get avatarScope;
  String? get email;
  String get emailScope;
  @BuiltValueField(wireName: 'additional_mail')
  BuiltList<String> get additionalMail;
  @BuiltValueField(wireName: 'additional_mailScope')
  BuiltList<String> get additionalMailScope;
  String get displayname;
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
  ProvisioningApiUserDetails_BackendCapabilities get backendCapabilities;
  @BuiltValueField(wireName: 'display-name')
  String get displayName;
  static Serializer<ProvisioningApiUserDetails> get serializer => _$provisioningApiUserDetailsSerializer;
}

abstract class ProvisioningApiUser_Ocs implements Built<ProvisioningApiUser_Ocs, ProvisioningApiUser_OcsBuilder> {
  factory ProvisioningApiUser_Ocs([final void Function(ProvisioningApiUser_OcsBuilder)? b]) = _$ProvisioningApiUser_Ocs;
  const ProvisioningApiUser_Ocs._();

  factory ProvisioningApiUser_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  ProvisioningApiOCSMeta get meta;
  ProvisioningApiUserDetails get data;
  static Serializer<ProvisioningApiUser_Ocs> get serializer => _$provisioningApiUserOcsSerializer;
}

abstract class ProvisioningApiUser implements Built<ProvisioningApiUser, ProvisioningApiUserBuilder> {
  factory ProvisioningApiUser([final void Function(ProvisioningApiUserBuilder)? b]) = _$ProvisioningApiUser;
  const ProvisioningApiUser._();

  factory ProvisioningApiUser.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  ProvisioningApiUser_Ocs get ocs;
  static Serializer<ProvisioningApiUser> get serializer => _$provisioningApiUserSerializer;
}

abstract class ProvisioningApiEmptyOCS_Ocs
    implements Built<ProvisioningApiEmptyOCS_Ocs, ProvisioningApiEmptyOCS_OcsBuilder> {
  factory ProvisioningApiEmptyOCS_Ocs([final void Function(ProvisioningApiEmptyOCS_OcsBuilder)? b]) =
      _$ProvisioningApiEmptyOCS_Ocs;
  const ProvisioningApiEmptyOCS_Ocs._();

  factory ProvisioningApiEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  ProvisioningApiOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<ProvisioningApiEmptyOCS_Ocs> get serializer => _$provisioningApiEmptyOCSOcsSerializer;
}

abstract class ProvisioningApiEmptyOCS implements Built<ProvisioningApiEmptyOCS, ProvisioningApiEmptyOCSBuilder> {
  factory ProvisioningApiEmptyOCS([final void Function(ProvisioningApiEmptyOCSBuilder)? b]) = _$ProvisioningApiEmptyOCS;
  const ProvisioningApiEmptyOCS._();

  factory ProvisioningApiEmptyOCS.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  ProvisioningApiEmptyOCS_Ocs get ocs;
  static Serializer<ProvisioningApiEmptyOCS> get serializer => _$provisioningApiEmptyOCSSerializer;
}

@SerializersFor([
  ProvisioningApiUser,
  ProvisioningApiUser_Ocs,
  ProvisioningApiOCSMeta,
  ProvisioningApiUserDetails,
  ProvisioningApiUserDetails_Quota,
  ProvisioningApiUserDetails_BackendCapabilities,
  ProvisioningApiEmptyOCS,
  ProvisioningApiEmptyOCS_Ocs,
])
final Serializers _serializers = (_$_serializers.toBuilder()
      ..addBuilderFactory(const FullType(ProvisioningApiUser), ProvisioningApiUser.new))
    .build();

Serializers get provisioningApiSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

// coverage:ignore-start
T deserializeProvisioningApi<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeProvisioningApi<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
