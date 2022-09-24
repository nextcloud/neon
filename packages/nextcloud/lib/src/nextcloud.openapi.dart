import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'nextcloud.openapi.g.dart';

class Response {
  Response(
    this.statusCode,
    this.headers,
    this.body,
  );

  final int statusCode;

  final Map<String, String> headers;

  final Uint8List body;

  @override
  String toString() => 'Response(statusCode: $statusCode, headers: $headers, body: ${utf8.decode(body)})';
}

class ApiException extends Response implements Exception {
  ApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  factory ApiException.fromResponse(Response response) => ApiException(
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
  }

  final String baseURL;

  late final Map<String, String> baseHeaders;

  final Authentication? authentication;

  CoreClient get core => CoreClient(this);
  NewsClient get news => NewsClient(this);
  NotesClient get notes => NotesClient(this);
  NotificationsClient get notifications => NotificationsClient(this);
  ProvisioningApiClient get provisioningApi => ProvisioningApiClient(this);
  UserStatusClient get userStatus => UserStatusClient(this);
  Future<Response> _doRequest(
    String method,
    String path,
    Map<String, String> headers,
    Uint8List? body,
  ) async {
    final request = http.Request(method, Uri.parse('$baseURL$path'));
    request.headers.addAll(baseHeaders);
    request.headers.addAll(headers);
    if (body != null) {
      request.bodyBytes = body.toList();
    }

    final response = await http.Response.fromStream(await request.send());
    return Response(
      response.statusCode,
      response.headers,
      response.bodyBytes,
    );
  }
}

@JsonSerializable()
class CoreServerStatus {
  CoreServerStatus({
    this.installed,
    this.maintenance,
    this.needsDbUpgrade,
    this.version,
    this.versionstring,
    this.edition,
    this.productname,
    this.extendedSupport,
  });

  factory CoreServerStatus.fromJson(Map<String, dynamic> json) => _$CoreServerStatusFromJson(json);

  final bool? installed;

  final bool? maintenance;

  final bool? needsDbUpgrade;

  final String? version;

  final String? versionstring;

  final String? edition;

  final String? productname;

  final bool? extendedSupport;

  Map<String, dynamic> toJson() => _$CoreServerStatusToJson(this);
}

@JsonSerializable()
class OCSMeta {
  OCSMeta({
    this.status,
    this.statuscode,
    this.message,
    this.totalitems,
    this.itemsperpage,
  });

  factory OCSMeta.fromJson(Map<String, dynamic> json) => _$OCSMetaFromJson(json);

  final String? status;

  final int? statuscode;

  final String? message;

  final String? totalitems;

  final String? itemsperpage;

  Map<String, dynamic> toJson() => _$OCSMetaToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataVersion {
  CoreServerCapabilitiesOcsDataVersion({
    this.major,
    this.minor,
    this.micro,
    this.string,
    this.edition,
    this.extendedSupport,
  });

  factory CoreServerCapabilitiesOcsDataVersion.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataVersionFromJson(json);

  final int? major;

  final int? minor;

  final int? micro;

  final String? string;

  final String? edition;

  final bool? extendedSupport;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataVersionToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCore {
  CoreServerCapabilitiesOcsDataCapabilitiesCore({
    this.pollinterval,
    this.webdavRoot,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCore.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCoreFromJson(json);

  final int? pollinterval;

  @JsonKey(name: 'webdav-root')
  final String? webdavRoot;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCoreToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesBruteforce {
  CoreServerCapabilitiesOcsDataCapabilitiesBruteforce({this.delay});

  factory CoreServerCapabilitiesOcsDataCapabilitiesBruteforce.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesBruteforceFromJson(json);

  final int? delay;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesBruteforceToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable {
  CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable({this.size});

  factory CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableFromJson(json);

  final List<String>? size;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing({
    this.url,
    this.etag,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingFromJson(json);

  final String? url;

  final String? etag;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFiles {
  CoreServerCapabilitiesOcsDataCapabilitiesFiles({
    this.bigfilechunking,
    this.blacklistedFiles,
    this.directEditing,
    this.comments,
    this.undelete,
    this.versioning,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesFromJson(json);

  final bool? bigfilechunking;

  @JsonKey(name: 'blacklisted_files')
  final List<String>? blacklistedFiles;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing? directEditing;

  final bool? comments;

  final bool? undelete;

  final bool? versioning;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesActivity {
  CoreServerCapabilitiesOcsDataCapabilitiesActivity({this.apiv2});

  factory CoreServerCapabilitiesOcsDataCapabilitiesActivity.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesActivityFromJson(json);

  final List<String>? apiv2;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesActivityToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus({this.globalScale});

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusFromJson(json);

  final bool? globalScale;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings({
    this.frontendEnabled,
    this.allowedCircles,
    this.allowedUserTypes,
    this.membersLimit,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsFromJson(json);

  final bool? frontendEnabled;

  final int? allowedCircles;

  final int? allowedUserTypes;

  final int? membersLimit;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource({
    this.core,
    this.extra,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceFromJson(json);

  final dynamic? core;

  final dynamic? extra;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants({
    this.flags,
    this.source,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsFromJson(json);

  final dynamic? flags;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource? source;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig({
    this.coreFlags,
    this.systemFlags,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigFromJson(json);

  final List<int>? coreFlags;

  final List<int>? systemFlags;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle({
    this.constants,
    this.config,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleFromJson(json);

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants? constants;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig? config;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants({this.level});

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsFromJson(json);

  final dynamic? level;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember {
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember({
    this.constants,
    this.type,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberFromJson(json);

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants? constants;

  final dynamic? type;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesCircles {
  CoreServerCapabilitiesOcsDataCapabilitiesCircles({
    this.version,
    this.status,
    this.settings,
    this.circle,
    this.member,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesFromJson(json);

  final String? version;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus? status;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings? settings;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle? circle;

  final CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember? member;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols {
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols({this.webdav});

  factory CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsFromJson(json);

  final String? webdav;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes {
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes({
    this.name,
    this.shareTypes,
    this.protocols,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesFromJson(json);

  final String? name;

  final List<String>? shareTypes;

  final CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols? protocols;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesOcm {
  CoreServerCapabilitiesOcsDataCapabilitiesOcm({
    this.enabled,
    this.apiVersion,
    this.endPoint,
    this.resourceTypes,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesOcm.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesOcmFromJson(json);

  final bool? enabled;

  final String? apiVersion;

  final String? endPoint;

  final List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes>? resourceTypes;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesOcmToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesDav {
  CoreServerCapabilitiesOcsDataCapabilitiesDav({this.chunking});

  factory CoreServerCapabilitiesOcsDataCapabilitiesDav.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesDavFromJson(json);

  final String? chunking;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesDavToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword({
    this.enforced,
    this.askForOptionalPassword,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordFromJson(json);

  final bool? enforced;

  final bool? askForOptionalPassword;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic({
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

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicFromJson(json);

  final bool? enabled;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword? password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate? expireDate;

  @JsonKey(name: 'multiple_links')
  final bool? multipleLinks;

  @JsonKey(name: 'expire_date_internal')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal? expireDateInternal;

  @JsonKey(name: 'expire_date_remote')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote? expireDateRemote;

  @JsonKey(name: 'send_mail')
  final bool? sendMail;

  final bool? upload;

  @JsonKey(name: 'upload_files_drop')
  final bool? uploadFilesDrop;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser({
    this.sendMail,
    this.expireDate,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserFromJson(json);

  @JsonKey(name: 'send_mail')
  final bool? sendMail;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate? expireDate;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup({
    this.enabled,
    this.expireDate,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupFromJson(json);

  final bool? enabled;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate? expireDate;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation({
    this.outgoing,
    this.incoming,
    this.expireDate,
    this.expireDateSupported,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationFromJson(json);

  final bool? outgoing;

  final bool? incoming;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate? expireDate;

  @JsonKey(name: 'expire_date_supported')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported? expireDateSupported;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee({
    this.queryLookupDefault,
    this.alwaysShowUnique,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeFromJson(json);

  @JsonKey(name: 'query_lookup_default')
  final bool? queryLookupDefault;

  @JsonKey(name: 'always_show_unique')
  final bool? alwaysShowUnique;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword({
    this.enabled,
    this.enforced,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordFromJson(json);

  final bool? enabled;

  final bool? enforced;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate({
    this.enabled,
    this.enforced,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateFromJson(json);

  final bool? enabled;

  final bool? enforced;

  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail({
    this.enabled,
    this.sendPasswordByMail,
    this.uploadFilesDrop,
    this.password,
    this.expireDate,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailFromJson(json);

  final bool? enabled;

  @JsonKey(name: 'send_password_by_mail')
  final bool? sendPasswordByMail;

  @JsonKey(name: 'upload_files_drop')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop? uploadFilesDrop;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword? password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate? expireDate;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing {
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing({
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

  factory CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFromJson(json);

  @JsonKey(name: 'api_enabled')
  final bool? apiEnabled;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic? public;

  final bool? resharing;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser? user;

  @JsonKey(name: 'group_sharing')
  final bool? groupSharing;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup? group;

  @JsonKey(name: 'default_permissions')
  final int? defaultPermissions;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation? federation;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee? sharee;

  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail? sharebymail;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesNotes {
  CoreServerCapabilitiesOcsDataCapabilitiesNotes({
    this.apiVersion,
    this.version,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesNotes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesNotesFromJson(json);

  @JsonKey(name: 'api_version')
  final List<String>? apiVersion;

  final String? version;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesNotesToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesNotifications {
  CoreServerCapabilitiesOcsDataCapabilitiesNotifications({
    this.ocsEndpoints,
    this.push,
    this.adminNotifications,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesNotificationsFromJson(json);

  @JsonKey(name: 'ocs-endpoints')
  final List<String>? ocsEndpoints;

  final List<String>? push;

  @JsonKey(name: 'admin-notifications')
  final List<String>? adminNotifications;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesNotificationsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi {
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi({
    this.generate,
    this.validate,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiFromJson(json);

  final String? generate;

  final String? validate;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy {
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy({
    this.minLength,
    this.enforceNonCommonPassword,
    this.enforceNumericCharacters,
    this.enforceSpecialCharacters,
    this.enforceUpperLowerCase,
    this.api,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyFromJson(json);

  final int? minLength;

  final bool? enforceNonCommonPassword;

  final bool? enforceNumericCharacters;

  final bool? enforceSpecialCharacters;

  final bool? enforceUpperLowerCase;

  final CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi? api;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi {
  CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi({
    this.version,
    this.accountPropertyScopesVersion,
    this.accountPropertyScopesFederatedEnabled,
    this.accountPropertyScopesPublishedEnabled,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiFromJson(json);

  final String? version;

  @JsonKey(name: 'AccountPropertyScopesVersion')
  final int? accountPropertyScopesVersion;

  @JsonKey(name: 'AccountPropertyScopesFederatedEnabled')
  final bool? accountPropertyScopesFederatedEnabled;

  @JsonKey(name: 'AccountPropertyScopesPublishedEnabled')
  final bool? accountPropertyScopesPublishedEnabled;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesTheming {
  CoreServerCapabilitiesOcsDataCapabilitiesTheming({
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

  factory CoreServerCapabilitiesOcsDataCapabilitiesTheming.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesThemingFromJson(json);

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

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesThemingToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesUserStatus {
  CoreServerCapabilitiesOcsDataCapabilitiesUserStatus({
    this.enabled,
    this.supportsEmoji,
  });

  factory CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesUserStatusFromJson(json);

  final bool? enabled;

  @JsonKey(name: 'supports_emoji')
  final bool? supportsEmoji;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesUserStatusToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus {
  CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus({this.enabled});

  factory CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusFromJson(json);

  final bool? enabled;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsDataCapabilities {
  CoreServerCapabilitiesOcsDataCapabilities({
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

  factory CoreServerCapabilitiesOcsDataCapabilities.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataCapabilitiesFromJson(json);

  final CoreServerCapabilitiesOcsDataCapabilitiesCore? core;

  final CoreServerCapabilitiesOcsDataCapabilitiesBruteforce? bruteforce;

  final CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable? metadataAvailable;

  final CoreServerCapabilitiesOcsDataCapabilitiesFiles? files;

  final CoreServerCapabilitiesOcsDataCapabilitiesActivity? activity;

  final CoreServerCapabilitiesOcsDataCapabilitiesCircles? circles;

  final CoreServerCapabilitiesOcsDataCapabilitiesOcm? ocm;

  final CoreServerCapabilitiesOcsDataCapabilitiesDav? dav;

  @JsonKey(name: 'files_sharing')
  final CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing? filesSharing;

  final CoreServerCapabilitiesOcsDataCapabilitiesNotes? notes;

  final CoreServerCapabilitiesOcsDataCapabilitiesNotifications? notifications;

  @JsonKey(name: 'password_policy')
  final CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy? passwordPolicy;

  @JsonKey(name: 'provisioning_api')
  final CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi? provisioningApi;

  final CoreServerCapabilitiesOcsDataCapabilitiesTheming? theming;

  @JsonKey(name: 'user_status')
  final CoreServerCapabilitiesOcsDataCapabilitiesUserStatus? userStatus;

  @JsonKey(name: 'weather_status')
  final CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus? weatherStatus;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataCapabilitiesToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcsData {
  CoreServerCapabilitiesOcsData({
    this.version,
    this.capabilities,
  });

  factory CoreServerCapabilitiesOcsData.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilitiesOcsDataFromJson(json);

  final CoreServerCapabilitiesOcsDataVersion? version;

  final CoreServerCapabilitiesOcsDataCapabilities? capabilities;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsDataToJson(this);
}

@JsonSerializable()
class CoreServerCapabilitiesOcs {
  CoreServerCapabilitiesOcs({
    this.meta,
    this.data,
  });

  factory CoreServerCapabilitiesOcs.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilitiesOcsFromJson(json);

  final OCSMeta? meta;

  final CoreServerCapabilitiesOcsData? data;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesOcsToJson(this);
}

@JsonSerializable()
class CoreServerCapabilities {
  CoreServerCapabilities({this.ocs});

  factory CoreServerCapabilities.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilitiesFromJson(json);

  final CoreServerCapabilitiesOcs? ocs;

  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesToJson(this);
}

class CoreNavigationAppsOcsDataOrder {
  CoreNavigationAppsOcsDataOrder(
    this._data, {
    this.int_,
    this.string,
  });

  factory CoreNavigationAppsOcsDataOrder.fromJson(dynamic data) {
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    String? string;
    try {
      string = data as String;
    } catch (_) {}
    assert([int_, string].where((final x) => x != null).length == 1, 'Need oneOf');
    return CoreNavigationAppsOcsDataOrder(
      data,
      int_: int_,
      string: string,
    );
  }

  final dynamic _data;

  final int? int_;

  final String? string;

  dynamic toJson() => _data;
}

@JsonSerializable()
class CoreNavigationAppsOcsData {
  CoreNavigationAppsOcsData({
    this.id,
    this.order,
    this.href,
    this.icon,
    this.type,
    this.name,
    this.active,
    this.classes,
    this.unread,
  });

  factory CoreNavigationAppsOcsData.fromJson(Map<String, dynamic> json) => _$CoreNavigationAppsOcsDataFromJson(json);

  final String? id;

  /// Should always be an integer, but there is a bug. See https://github.com/nextcloud/server/issues/32828
  final CoreNavigationAppsOcsDataOrder? order;

  final String? href;

  final String? icon;

  final String? type;

  final String? name;

  final bool? active;

  final String? classes;

  final int? unread;

  Map<String, dynamic> toJson() => _$CoreNavigationAppsOcsDataToJson(this);
}

@JsonSerializable()
class CoreNavigationAppsOcs {
  CoreNavigationAppsOcs({
    this.meta,
    this.data,
  });

  factory CoreNavigationAppsOcs.fromJson(Map<String, dynamic> json) => _$CoreNavigationAppsOcsFromJson(json);

  final OCSMeta? meta;

  final List<CoreNavigationAppsOcsData>? data;

  Map<String, dynamic> toJson() => _$CoreNavigationAppsOcsToJson(this);
}

@JsonSerializable()
class CoreNavigationApps {
  CoreNavigationApps({this.ocs});

  factory CoreNavigationApps.fromJson(Map<String, dynamic> json) => _$CoreNavigationAppsFromJson(json);

  final CoreNavigationAppsOcs? ocs;

  Map<String, dynamic> toJson() => _$CoreNavigationAppsToJson(this);
}

@JsonSerializable()
class CoreLoginFlowInitPoll {
  CoreLoginFlowInitPoll({
    this.token,
    this.endpoint,
  });

  factory CoreLoginFlowInitPoll.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInitPollFromJson(json);

  final String? token;

  final String? endpoint;

  Map<String, dynamic> toJson() => _$CoreLoginFlowInitPollToJson(this);
}

@JsonSerializable()
class CoreLoginFlowInit {
  CoreLoginFlowInit({
    this.poll,
    this.login,
  });

  factory CoreLoginFlowInit.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInitFromJson(json);

  final CoreLoginFlowInitPoll? poll;

  final String? login;

  Map<String, dynamic> toJson() => _$CoreLoginFlowInitToJson(this);
}

@JsonSerializable()
class CoreLoginFlowResult {
  CoreLoginFlowResult({
    this.server,
    this.loginName,
    this.appPassword,
  });

  factory CoreLoginFlowResult.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowResultFromJson(json);

  final String? server;

  final String? loginName;

  final String? appPassword;

  Map<String, dynamic> toJson() => _$CoreLoginFlowResultToJson(this);
}

class CoreClient {
  CoreClient(this._client);

  final Client _client;

  Future<CoreServerStatus> getStatus() async {
    var path = '/status.php';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<CoreServerCapabilities> getCapabilities() async {
    var path = '/ocs/v1.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerCapabilities.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<CoreNavigationApps> getNavigationApps() async {
    var path = '/ocs/v1.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreNavigationApps.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<CoreLoginFlowInit> initLoginFlow() async {
    var path = '/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowInit.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<CoreLoginFlowResult> getLoginFlowResult({required String token}) async {
    var path = '/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['token'] = token.toString();
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowResult.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<Uint8List> getPreview({
    String file = '',
    int x = 32,
    int y = 32,
    int a = 0,
    int forceIcon = 1,
    String mode = 'fill',
  }) async {
    var path = '/core/preview.png';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['file'] = file.toString();
    queryParameters['x'] = x.toString();
    queryParameters['y'] = y.toString();
    queryParameters['a'] = a.toString();
    queryParameters['forceIcon'] = forceIcon.toString();
    queryParameters['mode'] = mode.toString();
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response);
  }

  Future<Uint8List> getAvatar({
    required String userId,
    required int size,
  }) async {
    var path = '/avatar/{userId}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response);
  }
}

@JsonSerializable()
class NewsArticle {
  NewsArticle({
    this.id,
    this.guid,
    this.guidHash,
    this.url,
    this.title,
    this.author,
    this.pubDate,
    this.updatedDate,
    this.body,
    this.enclosureMime,
    this.enclosureLink,
    this.mediaThumbnail,
    this.mediaDescription,
    this.feedId,
    this.unread,
    this.starred,
    this.lastModified,
    this.rtl,
    this.fingerprint,
    this.contentHash,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);

  final int? id;

  final String? guid;

  final String? guidHash;

  final String? url;

  final String? title;

  final String? author;

  final int? pubDate;

  final int? updatedDate;

  final String? body;

  final String? enclosureMime;

  final String? enclosureLink;

  final String? mediaThumbnail;

  final String? mediaDescription;

  final int? feedId;

  final bool? unread;

  final bool? starred;

  final int? lastModified;

  final bool? rtl;

  final String? fingerprint;

  final String? contentHash;

  Map<String, dynamic> toJson() => _$NewsArticleToJson(this);
}

@JsonSerializable()
class NewsFeed {
  NewsFeed({
    this.id,
    this.url,
    this.title,
    this.faviconLink,
    this.added,
    this.folderId,
    this.unreadCount,
    this.ordering,
    this.link,
    this.pinned,
    this.updateErrorCount,
    this.lastUpdateError,
    this.items,
  });

  factory NewsFeed.fromJson(Map<String, dynamic> json) => _$NewsFeedFromJson(json);

  final int? id;

  final String? url;

  final String? title;

  final String? faviconLink;

  final int? added;

  final int? folderId;

  final int? unreadCount;

  final int? ordering;

  final String? link;

  final bool? pinned;

  final int? updateErrorCount;

  final String? lastUpdateError;

  final List<NewsArticle>? items;

  Map<String, dynamic> toJson() => _$NewsFeedToJson(this);
}

@JsonSerializable()
class NewsFolder {
  NewsFolder({
    this.id,
    this.name,
    this.opened,
    this.feeds,
  });

  factory NewsFolder.fromJson(Map<String, dynamic> json) => _$NewsFolderFromJson(json);

  final int? id;

  final String? name;

  final bool? opened;

  /// This seems to be broken. In testing it is always empty
  final List<NewsFeed>? feeds;

  Map<String, dynamic> toJson() => _$NewsFolderToJson(this);
}

@JsonSerializable()
class NewsListFolders {
  NewsListFolders({this.folders});

  factory NewsListFolders.fromJson(Map<String, dynamic> json) => _$NewsListFoldersFromJson(json);

  final List<NewsFolder>? folders;

  Map<String, dynamic> toJson() => _$NewsListFoldersToJson(this);
}

@JsonSerializable()
class NewsListFeeds {
  NewsListFeeds({
    this.starredCount,
    this.newestItemId,
    this.feeds,
  });

  factory NewsListFeeds.fromJson(Map<String, dynamic> json) => _$NewsListFeedsFromJson(json);

  final int? starredCount;

  final int? newestItemId;

  final List<NewsFeed>? feeds;

  Map<String, dynamic> toJson() => _$NewsListFeedsToJson(this);
}

@JsonSerializable()
class NewsListArticles {
  NewsListArticles({this.items});

  factory NewsListArticles.fromJson(Map<String, dynamic> json) => _$NewsListArticlesFromJson(json);

  final List<NewsArticle>? items;

  Map<String, dynamic> toJson() => _$NewsListArticlesToJson(this);
}

class NewsClient {
  NewsClient(this._client);

  final Client _client;

  Future<NewsListFolders> listFolders() async {
    var path = '/apps/news/api/v1-2/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NewsListFolders> createFolder({required String name}) async {
    var path = '/apps/news/api/v1-2/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['name'] = name.toString();
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future renameFolder({
    required int folderId,
    required String name,
  }) async {
    var path = '/apps/news/api/v1-2/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future deleteFolder({required int folderId}) async {
    var path = '/apps/news/api/v1-2/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future markFolderAsRead({
    required int folderId,
    required int newestItemId,
  }) async {
    var path = '/apps/news/api/v1-2/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future<NewsListFeeds> listFeeds() async {
    var path = '/apps/news/api/v1-2/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NewsListFeeds> addFeed({
    required String url,
    int? folderId,
  }) async {
    var path = '/apps/news/api/v1-2/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['url'] = url.toString();
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future deleteFeed({required int feedId}) async {
    var path = '/apps/news/api/v1-2/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future moveFeed({
    required int feedId,
    int? folderId,
  }) async {
    var path = '/apps/news/api/v1-2/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future renameFeed({
    required int feedId,
    required String feedTitle,
  }) async {
    var path = '/apps/news/api/v1-2/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future markFeedAsRead({
    required int feedId,
    required int newestItemId,
  }) async {
    var path = '/apps/news/api/v1-2/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future<NewsListArticles> listArticles({
    int type = 3,
    int id = 0,
    int getRead = 1,
    int batchSize = -1,
    int offset = 0,
    int oldestFirst = 0,
  }) async {
    var path = '/apps/news/api/v1-2/items';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['type'] = type.toString();
    queryParameters['id'] = id.toString();
    queryParameters['getRead'] = getRead.toString();
    queryParameters['batchSize'] = batchSize.toString();
    queryParameters['offset'] = offset.toString();
    queryParameters['oldestFirst'] = oldestFirst.toString();
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NewsListArticles> listUpdatedArticles({
    int type = 3,
    int id = 0,
    int lastModified = 0,
  }) async {
    var path = '/apps/news/api/v1-2/items/updated';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['type'] = type.toString();
    queryParameters['id'] = id.toString();
    queryParameters['lastModified'] = lastModified.toString();
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future markArticleAsRead({required int itemId}) async {
    var path = '/apps/news/api/v1-2/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future markArticleAsUnread({required int itemId}) async {
    var path = '/apps/news/api/v1-2/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future starArticle({
    required int feedId,
    required String guidHash,
  }) async {
    var path = '/apps/news/api/v1-2/items/{feedId}/{guidHash}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    path = path.replaceAll('{guidHash}', Uri.encodeQueryComponent(guidHash.toString()));
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future unstarArticle({
    required int feedId,
    required String guidHash,
  }) async {
    var path = '/apps/news/api/v1-2/items/{feedId}/{guidHash}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    path = path.replaceAll('{guidHash}', Uri.encodeQueryComponent(guidHash.toString()));
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }
}

@JsonSerializable()
class NotesNote {
  NotesNote({
    this.id,
    this.etag,
    this.readonly,
    this.content,
    this.title,
    this.category,
    this.favorite,
    this.modified,
    this.error,
    this.errorType,
  });

  factory NotesNote.fromJson(Map<String, dynamic> json) => _$NotesNoteFromJson(json);

  final int? id;

  final String? etag;

  final bool? readonly;

  final String? content;

  final String? title;

  final String? category;

  final bool? favorite;

  final int? modified;

  final bool? error;

  final String? errorType;

  Map<String, dynamic> toJson() => _$NotesNoteToJson(this);
}

enum NotesSettingsNoteMode {
  edit('edit'),
  preview('preview');

  const NotesSettingsNoteMode(this.value);

  final String value;

  static NotesSettingsNoteMode fromValue(String value) {
    switch (value) {
      case 'edit':
        return NotesSettingsNoteMode.edit;
      case 'preview':
        return NotesSettingsNoteMode.preview;
      default:
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
    }
  }
}

@JsonSerializable()
class NotesSettings {
  NotesSettings({
    this.notesPath,
    this.fileSuffix,
    this.noteMode,
  });

  factory NotesSettings.fromJson(Map<String, dynamic> json) => _$NotesSettingsFromJson(json);

  final String? notesPath;

  final String? fileSuffix;

  final NotesSettingsNoteMode? noteMode;

  Map<String, dynamic> toJson() => _$NotesSettingsToJson(this);
}

class NotesClient {
  NotesClient(this._client);

  final Client _client;

  Future<List<NotesNote>> getNotes({
    String? category,
    String exclude = '',
    int pruneBefore = 0,
    int chunkSize = 0,
    String? chunkCursor,
    String? ifNoneMatch,
  }) async {
    var path = '/apps/notes/api/v1/notes';
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
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return (json.decode(utf8.decode(response.body)) as List)
          .map<NotesNote>((final e) => NotesNote.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotesNote> createNote({
    String category = '',
    String title = '',
    String content = '',
    int modified = 0,
    int favorite = 0,
  }) async {
    var path = '/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['category'] = category.toString();
    queryParameters['title'] = title.toString();
    queryParameters['content'] = content.toString();
    queryParameters['modified'] = modified.toString();
    queryParameters['favorite'] = favorite.toString();
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotesNote> getNote({
    required int id,
    String exclude = '',
    String? ifNoneMatch,
  }) async {
    var path = '/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    queryParameters['exclude'] = exclude.toString();
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch.toString();
    }
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
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
    var path = '/apps/notes/api/v1/notes/{id}';
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
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<String> deleteNote({required int id}) async {
    var path = '/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotesSettings> getSettings() async {
    var path = '/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotesSettings> updateSettings({required NotesSettings notesSettings}) async {
    var path = '/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    headers['Content-Type'] = 'application/json';
    body = Uint8List.fromList(utf8.encode(json.encode((notesSettings as NotesSettings).toJson())));
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }
}

@JsonSerializable()
class NotificationsNotificationAction {
  NotificationsNotificationAction({
    this.label,
    this.link,
    this.type,
    this.primary,
  });

  factory NotificationsNotificationAction.fromJson(Map<String, dynamic> json) =>
      _$NotificationsNotificationActionFromJson(json);

  final String? label;

  final String? link;

  final String? type;

  final bool? primary;

  Map<String, dynamic> toJson() => _$NotificationsNotificationActionToJson(this);
}

@JsonSerializable()
class NotificationsNotification {
  NotificationsNotification({
    this.notificationId,
    this.app,
    this.user,
    this.datetime,
    this.objectType,
    this.objectId,
    this.subject,
    this.message,
    this.link,
    this.subjectRich,
    this.subjectRichParameters,
    this.messageRich,
    this.messageRichParameters,
    this.icon,
    this.actions,
  });

  factory NotificationsNotification.fromJson(Map<String, dynamic> json) => _$NotificationsNotificationFromJson(json);

  @JsonKey(name: 'notification_id')
  final int? notificationId;

  final String? app;

  final String? user;

  final String? datetime;

  @JsonKey(name: 'object_type')
  final String? objectType;

  @JsonKey(name: 'object_id')
  final String? objectId;

  final String? subject;

  final String? message;

  final String? link;

  final String? subjectRich;

  final List<String>? subjectRichParameters;

  final String? messageRich;

  final List<String>? messageRichParameters;

  final String? icon;

  final List<NotificationsNotificationAction>? actions;

  Map<String, dynamic> toJson() => _$NotificationsNotificationToJson(this);
}

@JsonSerializable()
class NotificationsListNotificationsOcs {
  NotificationsListNotificationsOcs({
    this.meta,
    this.data,
  });

  factory NotificationsListNotificationsOcs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotificationsOcsFromJson(json);

  final OCSMeta? meta;

  final List<NotificationsNotification>? data;

  Map<String, dynamic> toJson() => _$NotificationsListNotificationsOcsToJson(this);
}

@JsonSerializable()
class NotificationsListNotifications {
  NotificationsListNotifications({this.ocs});

  factory NotificationsListNotifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotificationsFromJson(json);

  final NotificationsListNotificationsOcs? ocs;

  Map<String, dynamic> toJson() => _$NotificationsListNotificationsToJson(this);
}

@JsonSerializable()
class NotificationsGetNotificationOcs {
  NotificationsGetNotificationOcs({
    this.meta,
    this.data,
  });

  factory NotificationsGetNotificationOcs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotificationOcsFromJson(json);

  final OCSMeta? meta;

  final NotificationsNotification? data;

  Map<String, dynamic> toJson() => _$NotificationsGetNotificationOcsToJson(this);
}

@JsonSerializable()
class NotificationsGetNotification {
  NotificationsGetNotification({this.ocs});

  factory NotificationsGetNotification.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotificationFromJson(json);

  final NotificationsGetNotificationOcs? ocs;

  Map<String, dynamic> toJson() => _$NotificationsGetNotificationToJson(this);
}

@JsonSerializable()
class NotificationsEmptyOcs {
  NotificationsEmptyOcs({
    this.meta,
    this.data,
  });

  factory NotificationsEmptyOcs.fromJson(Map<String, dynamic> json) => _$NotificationsEmptyOcsFromJson(json);

  final OCSMeta? meta;

  final List<String>? data;

  Map<String, dynamic> toJson() => _$NotificationsEmptyOcsToJson(this);
}

@JsonSerializable()
class NotificationsEmpty {
  NotificationsEmpty({this.ocs});

  factory NotificationsEmpty.fromJson(Map<String, dynamic> json) => _$NotificationsEmptyFromJson(json);

  final NotificationsEmptyOcs? ocs;

  Map<String, dynamic> toJson() => _$NotificationsEmptyToJson(this);
}

@JsonSerializable()
class NotificationsPushServerSubscription {
  NotificationsPushServerSubscription({
    this.publicKey,
    this.deviceIdentifier,
    this.signature,
    this.message,
  });

  factory NotificationsPushServerSubscription.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerSubscriptionFromJson(json);

  final String? publicKey;

  final String? deviceIdentifier;

  final String? signature;

  final String? message;

  Map<String, dynamic> toJson() => _$NotificationsPushServerSubscriptionToJson(this);
}

@JsonSerializable()
class NotificationsPushServerRegistrationOcs {
  NotificationsPushServerRegistrationOcs({
    this.meta,
    this.data,
  });

  factory NotificationsPushServerRegistrationOcs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistrationOcsFromJson(json);

  final OCSMeta? meta;

  final NotificationsPushServerSubscription? data;

  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistrationOcsToJson(this);
}

@JsonSerializable()
class NotificationsPushServerRegistration {
  NotificationsPushServerRegistration({this.ocs});

  factory NotificationsPushServerRegistration.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistrationFromJson(json);

  final NotificationsPushServerRegistrationOcs? ocs;

  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistrationToJson(this);
}

class NotificationsClient {
  NotificationsClient(this._client);

  final Client _client;

  Future<NotificationsListNotifications> listNotifications() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsListNotifications.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<String> deleteAllNotifications() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotificationsGetNotification> getNotification({required int id}) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsGetNotification.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotificationsEmpty> deleteNotification({required int id}) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsEmpty.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotificationsPushServerRegistration> registerDevice({
    required String pushTokenHash,
    required String devicePublicKey,
    required String proxyServer,
  }) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['pushTokenHash'] = pushTokenHash.toString();
    queryParameters['devicePublicKey'] = devicePublicKey.toString();
    queryParameters['proxyServer'] = proxyServer.toString();
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsPushServerRegistration.fromJson(
          json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<String> removeDevice() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response);
  }

  Future<NotificationsEmpty> sendAdminNotification({
    required String userId,
    required String shortMessage,
    String longMessage = '',
  }) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/admin_notifications/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    queryParameters['shortMessage'] = shortMessage.toString();
    queryParameters['longMessage'] = longMessage.toString();
    final response = await _client._doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsEmpty.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }
}

@JsonSerializable()
class ProvisioningApiUserDetailsQuota {
  ProvisioningApiUserDetailsQuota({
    this.free,
    this.used,
    this.total,
    this.relative,
    this.quota,
  });

  factory ProvisioningApiUserDetailsQuota.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningApiUserDetailsQuotaFromJson(json);

  final int? free;

  final int? used;

  final int? total;

  final num? relative;

  final int? quota;

  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetailsQuotaToJson(this);
}

@JsonSerializable()
class ProvisioningApiUserDetailsBackendCapabilities {
  ProvisioningApiUserDetailsBackendCapabilities({
    this.setDisplayName,
    this.setPassword,
  });

  factory ProvisioningApiUserDetailsBackendCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningApiUserDetailsBackendCapabilitiesFromJson(json);

  final bool? setDisplayName;

  final bool? setPassword;

  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetailsBackendCapabilitiesToJson(this);
}

@JsonSerializable()
class ProvisioningApiUserDetails {
  ProvisioningApiUserDetails({
    this.enabled,
    this.storageLocation,
    this.id,
    this.lastLogin,
    this.backend,
    this.subadmin,
    this.quota,
    this.avatarScope,
    this.email,
    this.emailScope,
    this.additionalMail,
    this.additionalMailScope,
    this.displayname,
    this.displaynameScope,
    this.phone,
    this.phoneScope,
    this.address,
    this.addressScope,
    this.website,
    this.websiteScope,
    this.twitter,
    this.twitterScope,
    this.organisation,
    this.organisationScope,
    this.role,
    this.roleScope,
    this.headline,
    this.headlineScope,
    this.biography,
    this.biographyScope,
    this.profileEnabled,
    this.profileEnabledScope,
    this.groups,
    this.language,
    this.locale,
    this.notifyEmail,
    this.backendCapabilities,
    this.displayName,
  });

  factory ProvisioningApiUserDetails.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserDetailsFromJson(json);

  final bool? enabled;

  final String? storageLocation;

  final String? id;

  final int? lastLogin;

  final String? backend;

  final List<String>? subadmin;

  final ProvisioningApiUserDetailsQuota? quota;

  final String? avatarScope;

  final String? email;

  final String? emailScope;

  @JsonKey(name: 'additional_mail')
  final List<String>? additionalMail;

  @JsonKey(name: 'additional_mailScope')
  final List<String>? additionalMailScope;

  final String? displayname;

  final String? displaynameScope;

  final String? phone;

  final String? phoneScope;

  final String? address;

  final String? addressScope;

  final String? website;

  final String? websiteScope;

  final String? twitter;

  final String? twitterScope;

  final String? organisation;

  final String? organisationScope;

  final String? role;

  final String? roleScope;

  final String? headline;

  final String? headlineScope;

  final String? biography;

  final String? biographyScope;

  @JsonKey(name: 'profile_enabled')
  final String? profileEnabled;

  @JsonKey(name: 'profile_enabledScope')
  final String? profileEnabledScope;

  final List<String>? groups;

  final String? language;

  final String? locale;

  @JsonKey(name: 'notify_email')
  final String? notifyEmail;

  final ProvisioningApiUserDetailsBackendCapabilities? backendCapabilities;

  @JsonKey(name: 'display-name')
  final String? displayName;

  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetailsToJson(this);
}

@JsonSerializable()
class ProvisioningApiUserOcs {
  ProvisioningApiUserOcs({
    this.meta,
    this.data,
  });

  factory ProvisioningApiUserOcs.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserOcsFromJson(json);

  final OCSMeta? meta;

  final ProvisioningApiUserDetails? data;

  Map<String, dynamic> toJson() => _$ProvisioningApiUserOcsToJson(this);
}

@JsonSerializable()
class ProvisioningApiUser {
  ProvisioningApiUser({this.ocs});

  factory ProvisioningApiUser.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserFromJson(json);

  final ProvisioningApiUserOcs? ocs;

  Map<String, dynamic> toJson() => _$ProvisioningApiUserToJson(this);
}

class ProvisioningApiClient {
  ProvisioningApiClient(this._client);

  final Client _client;

  Future<ProvisioningApiUser> getCurrentUser() async {
    var path = '/ocs/v1.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<ProvisioningApiUser> getUser({required String userId}) async {
    var path = '/ocs/v1.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }
}

enum UserStatusClearAtType {
  period('period'),
  @JsonValue('end-of')
  endOf('end-of');

  const UserStatusClearAtType(this.value);

  final String value;

  static UserStatusClearAtType fromValue(String value) {
    switch (value) {
      case 'period':
        return UserStatusClearAtType.period;
      case 'end-of':
        return UserStatusClearAtType.endOf;
      default:
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
    }
  }
}

enum UserStatusClearAtTime0 {
  day('day'),
  week('week');

  const UserStatusClearAtTime0(this.value);

  final String value;

  static UserStatusClearAtTime0 fromValue(String value) {
    switch (value) {
      case 'day':
        return UserStatusClearAtTime0.day;
      case 'week':
        return UserStatusClearAtTime0.week;
      default:
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
    }
  }
}

class UserStatusClearAtTime {
  UserStatusClearAtTime(
    this._data, {
    this.userStatusClearAtTime0,
    this.int_,
  });

  factory UserStatusClearAtTime.fromJson(dynamic data) {
    UserStatusClearAtTime0? userStatusClearAtTime0;
    try {
      userStatusClearAtTime0 = UserStatusClearAtTime0.fromValue(data as String);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    assert([userStatusClearAtTime0, int_].where((final x) => x != null).length == 1, 'Need oneOf');
    return UserStatusClearAtTime(
      data,
      userStatusClearAtTime0: userStatusClearAtTime0,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAtTime0? userStatusClearAtTime0;

  /// Time offset in seconds
  final int? int_;

  dynamic toJson() => _data;
}

@JsonSerializable()
class UserStatusClearAt {
  UserStatusClearAt({
    this.type,
    this.time,
  });

  factory UserStatusClearAt.fromJson(Map<String, dynamic> json) => _$UserStatusClearAtFromJson(json);

  final UserStatusClearAtType? type;

  final UserStatusClearAtTime? time;

  Map<String, dynamic> toJson() => _$UserStatusClearAtToJson(this);
}

class UserStatusClearAtWrap {
  UserStatusClearAtWrap(
    this._data, {
    this.userStatusClearAt,
    this.int_,
  });

  factory UserStatusClearAtWrap.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    assert([userStatusClearAt, int_].where((final x) => x != null).length == 1, 'Need oneOf');
    return UserStatusClearAtWrap(
      data,
      userStatusClearAt: userStatusClearAt,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? int_;

  dynamic toJson() => _data;
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
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
    }
  }
}

@JsonSerializable()
class UserStatusPublicUserStatus {
  UserStatusPublicUserStatus({
    this.userId,
    this.message,
    this.icon,
    this.clearAt,
    this.status,
  });

  factory UserStatusPublicUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusPublicUserStatusFromJson(json);

  final String? userId;

  final String? message;

  final String? icon;

  final UserStatusClearAtWrap? clearAt;

  final UserStatusType? status;

  Map<String, dynamic> toJson() => _$UserStatusPublicUserStatusToJson(this);
}

@JsonSerializable()
class UserStatusFindAllStatusesOcs {
  UserStatusFindAllStatusesOcs({
    this.meta,
    this.data,
  });

  factory UserStatusFindAllStatusesOcs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFindAllStatusesOcsFromJson(json);

  final OCSMeta? meta;

  final List<UserStatusPublicUserStatus>? data;

  Map<String, dynamic> toJson() => _$UserStatusFindAllStatusesOcsToJson(this);
}

@JsonSerializable()
class UserStatusFindAllStatuses {
  UserStatusFindAllStatuses({this.ocs});

  factory UserStatusFindAllStatuses.fromJson(Map<String, dynamic> json) => _$UserStatusFindAllStatusesFromJson(json);

  final UserStatusFindAllStatusesOcs? ocs;

  Map<String, dynamic> toJson() => _$UserStatusFindAllStatusesToJson(this);
}

class UserStatusFindStatusOcsData {
  UserStatusFindStatusOcsData(
    this._data, {
    this.userStatusPublicUserStatus,
    this.list,
  });

  factory UserStatusFindStatusOcsData.fromJson(dynamic data) {
    UserStatusPublicUserStatus? userStatusPublicUserStatus;
    try {
      userStatusPublicUserStatus = UserStatusPublicUserStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    List? list;
    try {
      list = data as List;
    } catch (_) {}
    assert([userStatusPublicUserStatus, list].where((final x) => x != null).length == 1, 'Need oneOf');
    return UserStatusFindStatusOcsData(
      data,
      userStatusPublicUserStatus: userStatusPublicUserStatus,
      list: list,
    );
  }

  final dynamic _data;

  final UserStatusPublicUserStatus? userStatusPublicUserStatus;

  /// Only happens when the user has never set a status
  final List? list;

  dynamic toJson() => _data;
}

@JsonSerializable()
class UserStatusFindStatusOcs {
  UserStatusFindStatusOcs({
    this.meta,
    this.data,
  });

  factory UserStatusFindStatusOcs.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatusOcsFromJson(json);

  final OCSMeta? meta;

  final UserStatusFindStatusOcsData? data;

  Map<String, dynamic> toJson() => _$UserStatusFindStatusOcsToJson(this);
}

@JsonSerializable()
class UserStatusFindStatus {
  UserStatusFindStatus({this.ocs});

  factory UserStatusFindStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatusFromJson(json);

  final UserStatusFindStatusOcs? ocs;

  Map<String, dynamic> toJson() => _$UserStatusFindStatusToJson(this);
}

@JsonSerializable()
class UserStatus {
  UserStatus({
    this.userId,
    this.message,
    this.messageId,
    this.messageIsPredefined,
    this.icon,
    this.clearAt,
    this.status,
    this.statusIsUserDefined,
  });

  factory UserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFromJson(json);

  final String? userId;

  final String? message;

  final String? messageId;

  final bool? messageIsPredefined;

  final String? icon;

  final UserStatusClearAtWrap? clearAt;

  final UserStatusType? status;

  final bool? statusIsUserDefined;

  Map<String, dynamic> toJson() => _$UserStatusToJson(this);
}

class UserStatusGetUserStatusOcsData {
  UserStatusGetUserStatusOcsData(
    this._data, {
    this.userStatus,
    this.list,
  });

  factory UserStatusGetUserStatusOcsData.fromJson(dynamic data) {
    UserStatus? userStatus;
    try {
      userStatus = UserStatus.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    List? list;
    try {
      list = data as List;
    } catch (_) {}
    assert([userStatus, list].where((final x) => x != null).length == 1, 'Need oneOf');
    return UserStatusGetUserStatusOcsData(
      data,
      userStatus: userStatus,
      list: list,
    );
  }

  final dynamic _data;

  final UserStatus? userStatus;

  /// Only happens when the user has never set a status
  final List? list;

  dynamic toJson() => _data;
}

@JsonSerializable()
class UserStatusGetUserStatusOcs {
  UserStatusGetUserStatusOcs({
    this.meta,
    this.data,
  });

  factory UserStatusGetUserStatusOcs.fromJson(Map<String, dynamic> json) => _$UserStatusGetUserStatusOcsFromJson(json);

  final OCSMeta? meta;

  final UserStatusGetUserStatusOcsData? data;

  Map<String, dynamic> toJson() => _$UserStatusGetUserStatusOcsToJson(this);
}

@JsonSerializable()
class UserStatusGetUserStatus {
  UserStatusGetUserStatus({this.ocs});

  factory UserStatusGetUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusGetUserStatusFromJson(json);

  final UserStatusGetUserStatusOcs? ocs;

  Map<String, dynamic> toJson() => _$UserStatusGetUserStatusToJson(this);
}

@JsonSerializable()
class UserStatusPredefinedStatus {
  UserStatusPredefinedStatus({
    this.id,
    this.icon,
    this.message,
    this.clearAt,
  });

  factory UserStatusPredefinedStatus.fromJson(Map<String, dynamic> json) => _$UserStatusPredefinedStatusFromJson(json);

  final String? id;

  final String? icon;

  final String? message;

  final UserStatusClearAtWrap? clearAt;

  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusToJson(this);
}

@JsonSerializable()
class UserStatusPredefinedStatusesOcs {
  UserStatusPredefinedStatusesOcs({
    this.meta,
    this.data,
  });

  factory UserStatusPredefinedStatusesOcs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatusesOcsFromJson(json);

  final OCSMeta? meta;

  final List<UserStatusPredefinedStatus>? data;

  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusesOcsToJson(this);
}

@JsonSerializable()
class UserStatusPredefinedStatuses {
  UserStatusPredefinedStatuses({this.ocs});

  factory UserStatusPredefinedStatuses.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatusesFromJson(json);

  final UserStatusPredefinedStatusesOcs? ocs;

  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusesToJson(this);
}

class UserStatusClient {
  UserStatusClient(this._client);

  final Client _client;

  Future<UserStatusFindAllStatuses> findAllStatuses() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindAllStatuses.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusFindStatus> findStatus({required String userId}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusGetUserStatus> getStatus() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusGetUserStatus> setStatus({required UserStatusType statusType}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['statusType'] = statusType.value.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusGetUserStatus> setPredefinedMessage({
    required String messageId,
    int? clearAt,
  }) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/message/predefined';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['messageId'] = messageId.toString();
    if (clearAt != null) {
      queryParameters['clearAt'] = clearAt.toString();
    }
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusGetUserStatus> setCustomMessage({
    String? statusIcon,
    String? message,
    int? clearAt,
  }) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/message/custom';
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
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future clearMessage() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }

  Future<UserStatusPredefinedStatuses> findAllPredefinedStatuses() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await _client._doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusPredefinedStatuses.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response);
  }

  Future heartbeat({required UserStatusType status}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['status'] = status.value.toString();
    final response = await _client._doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response);
  }
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

  final int? nid;

  final String? app;

  final String? subject;

  final String? type;

  final String? id;

  final bool? delete;

  @JsonKey(name: 'delete-all')
  final bool? deleteAll;

  Map<String, dynamic> toJson() => _$NotificationsPushNotificationDecryptedSubjectToJson(this);
}

@JsonSerializable()
class NotificationsPushNotification {
  NotificationsPushNotification({
    this.accountID,
    this.priority,
    this.type,
    this.subject,
  });

  factory NotificationsPushNotification.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushNotificationFromJson(json);

  final String? accountID;

  final String? priority;

  final String? type;

  final NotificationsPushNotificationDecryptedSubject? subject;

  Map<String, dynamic> toJson() => _$NotificationsPushNotificationToJson(this);
}

final _deserializers = <Type, dynamic Function(dynamic)>{
  CoreServerStatus: (final data) => CoreServerStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerStatus>: (final data) =>
      (data as List).map<CoreServerStatus>((final e) => CoreServerStatus.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities: (final data) => CoreServerCapabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities>: (final data) => (data as List)
      .map<CoreServerCapabilities>((final e) => CoreServerCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcs: (final data) => CoreServerCapabilitiesOcs.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcs>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcs>((final e) => CoreServerCapabilitiesOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  OCSMeta: (final data) => OCSMeta.fromJson(data as Map<String, dynamic>),
  List<OCSMeta>: (final data) =>
      (data as List).map<OCSMeta>((final e) => OCSMeta.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilitiesOcsData: (final data) => CoreServerCapabilitiesOcsData.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsData>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsData>(
          (final e) => CoreServerCapabilitiesOcsData.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataVersion: (final data) =>
      CoreServerCapabilitiesOcsDataVersion.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataVersion>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataVersion>(
          (final e) => CoreServerCapabilitiesOcsDataVersion.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilities: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilities>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilities>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCore: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCore.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCore>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCore>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCore.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesBruteforce: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesBruteforce.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesBruteforce>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesBruteforce>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesBruteforce.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFiles: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFiles>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesActivity: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesActivity.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesActivity>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesActivity>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesActivity.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCircles: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCircles>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcm: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesOcm.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcm>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesOcm>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesOcm.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesDav: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesDav.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesDav>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesDav>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesDav.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported>: (final data) =>
      (data as List)
          .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported>((final e) =>
              CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate>((final e) =>
          CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesNotes: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesNotes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesNotes>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesNotes>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesNotes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesNotifications: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesTheming: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesTheming.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesTheming>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesTheming>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesTheming.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesUserStatus: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus: (final data) =>
      CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus>: (final data) => (data as List)
      .map<CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus>(
          (final e) => CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationApps: (final data) => CoreNavigationApps.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps>: (final data) => (data as List)
      .map<CoreNavigationApps>((final e) => CoreNavigationApps.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationAppsOcs: (final data) => CoreNavigationAppsOcs.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationAppsOcs>: (final data) => (data as List)
      .map<CoreNavigationAppsOcs>((final e) => CoreNavigationAppsOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationAppsOcsData: (final data) => CoreNavigationAppsOcsData.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationAppsOcsData>: (final data) => (data as List)
      .map<CoreNavigationAppsOcsData>((final e) => CoreNavigationAppsOcsData.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowInit: (final data) => CoreLoginFlowInit.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInit>: (final data) => (data as List)
      .map<CoreLoginFlowInit>((final e) => CoreLoginFlowInit.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowInitPoll: (final data) => CoreLoginFlowInitPoll.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInitPoll>: (final data) => (data as List)
      .map<CoreLoginFlowInitPoll>((final e) => CoreLoginFlowInitPoll.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowResult: (final data) => CoreLoginFlowResult.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowResult>: (final data) => (data as List)
      .map<CoreLoginFlowResult>((final e) => CoreLoginFlowResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  NewsListFolders: (final data) => NewsListFolders.fromJson(data as Map<String, dynamic>),
  List<NewsListFolders>: (final data) =>
      (data as List).map<NewsListFolders>((final e) => NewsListFolders.fromJson(e as Map<String, dynamic>)).toList(),
  NewsFolder: (final data) => NewsFolder.fromJson(data as Map<String, dynamic>),
  List<NewsFolder>: (final data) =>
      (data as List).map<NewsFolder>((final e) => NewsFolder.fromJson(e as Map<String, dynamic>)).toList(),
  NewsFeed: (final data) => NewsFeed.fromJson(data as Map<String, dynamic>),
  List<NewsFeed>: (final data) =>
      (data as List).map<NewsFeed>((final e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
  NewsArticle: (final data) => NewsArticle.fromJson(data as Map<String, dynamic>),
  List<NewsArticle>: (final data) =>
      (data as List).map<NewsArticle>((final e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
  NewsListFeeds: (final data) => NewsListFeeds.fromJson(data as Map<String, dynamic>),
  List<NewsListFeeds>: (final data) =>
      (data as List).map<NewsListFeeds>((final e) => NewsListFeeds.fromJson(e as Map<String, dynamic>)).toList(),
  NewsListArticles: (final data) => NewsListArticles.fromJson(data as Map<String, dynamic>),
  List<NewsListArticles>: (final data) =>
      (data as List).map<NewsListArticles>((final e) => NewsListArticles.fromJson(e as Map<String, dynamic>)).toList(),
  NotesNote: (final data) => NotesNote.fromJson(data as Map<String, dynamic>),
  List<NotesNote>: (final data) =>
      (data as List).map<NotesNote>((final e) => NotesNote.fromJson(e as Map<String, dynamic>)).toList(),
  NotesSettings: (final data) => NotesSettings.fromJson(data as Map<String, dynamic>),
  List<NotesSettings>: (final data) =>
      (data as List).map<NotesSettings>((final e) => NotesSettings.fromJson(e as Map<String, dynamic>)).toList(),
  NotificationsListNotifications: (final data) => NotificationsListNotifications.fromJson(data as Map<String, dynamic>),
  List<NotificationsListNotifications>: (final data) => (data as List)
      .map<NotificationsListNotifications>(
          (final e) => NotificationsListNotifications.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsListNotificationsOcs: (final data) =>
      NotificationsListNotificationsOcs.fromJson(data as Map<String, dynamic>),
  List<NotificationsListNotificationsOcs>: (final data) => (data as List)
      .map<NotificationsListNotificationsOcs>(
          (final e) => NotificationsListNotificationsOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsNotification: (final data) => NotificationsNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsNotification>: (final data) => (data as List)
      .map<NotificationsNotification>((final e) => NotificationsNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsNotificationAction: (final data) =>
      NotificationsNotificationAction.fromJson(data as Map<String, dynamic>),
  List<NotificationsNotificationAction>: (final data) => (data as List)
      .map<NotificationsNotificationAction>(
          (final e) => NotificationsNotificationAction.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsGetNotification: (final data) => NotificationsGetNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsGetNotification>: (final data) => (data as List)
      .map<NotificationsGetNotification>((final e) => NotificationsGetNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsGetNotificationOcs: (final data) =>
      NotificationsGetNotificationOcs.fromJson(data as Map<String, dynamic>),
  List<NotificationsGetNotificationOcs>: (final data) => (data as List)
      .map<NotificationsGetNotificationOcs>(
          (final e) => NotificationsGetNotificationOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsEmpty: (final data) => NotificationsEmpty.fromJson(data as Map<String, dynamic>),
  List<NotificationsEmpty>: (final data) => (data as List)
      .map<NotificationsEmpty>((final e) => NotificationsEmpty.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsEmptyOcs: (final data) => NotificationsEmptyOcs.fromJson(data as Map<String, dynamic>),
  List<NotificationsEmptyOcs>: (final data) => (data as List)
      .map<NotificationsEmptyOcs>((final e) => NotificationsEmptyOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerRegistration: (final data) =>
      NotificationsPushServerRegistration.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistration>: (final data) => (data as List)
      .map<NotificationsPushServerRegistration>(
          (final e) => NotificationsPushServerRegistration.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerRegistrationOcs: (final data) =>
      NotificationsPushServerRegistrationOcs.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistrationOcs>: (final data) => (data as List)
      .map<NotificationsPushServerRegistrationOcs>(
          (final e) => NotificationsPushServerRegistrationOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerSubscription: (final data) =>
      NotificationsPushServerSubscription.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerSubscription>: (final data) => (data as List)
      .map<NotificationsPushServerSubscription>(
          (final e) => NotificationsPushServerSubscription.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUser: (final data) => ProvisioningApiUser.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUser>: (final data) => (data as List)
      .map<ProvisioningApiUser>((final e) => ProvisioningApiUser.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserOcs: (final data) => ProvisioningApiUserOcs.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserOcs>: (final data) => (data as List)
      .map<ProvisioningApiUserOcs>((final e) => ProvisioningApiUserOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetails: (final data) => ProvisioningApiUserDetails.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails>: (final data) => (data as List)
      .map<ProvisioningApiUserDetails>((final e) => ProvisioningApiUserDetails.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetailsQuota: (final data) =>
      ProvisioningApiUserDetailsQuota.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetailsQuota>: (final data) => (data as List)
      .map<ProvisioningApiUserDetailsQuota>(
          (final e) => ProvisioningApiUserDetailsQuota.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetailsBackendCapabilities: (final data) =>
      ProvisioningApiUserDetailsBackendCapabilities.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetailsBackendCapabilities>: (final data) => (data as List)
      .map<ProvisioningApiUserDetailsBackendCapabilities>(
          (final e) => ProvisioningApiUserDetailsBackendCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindAllStatuses: (final data) => UserStatusFindAllStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatuses>: (final data) => (data as List)
      .map<UserStatusFindAllStatuses>((final e) => UserStatusFindAllStatuses.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindAllStatusesOcs: (final data) => UserStatusFindAllStatusesOcs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatusesOcs>: (final data) => (data as List)
      .map<UserStatusFindAllStatusesOcs>((final e) => UserStatusFindAllStatusesOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusPublicUserStatus: (final data) => UserStatusPublicUserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusPublicUserStatus>: (final data) => (data as List)
      .map<UserStatusPublicUserStatus>((final e) => UserStatusPublicUserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusClearAt: (final data) => UserStatusClearAt.fromJson(data as Map<String, dynamic>),
  List<UserStatusClearAt>: (final data) => (data as List)
      .map<UserStatusClearAt>((final e) => UserStatusClearAt.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindStatus: (final data) => UserStatusFindStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindStatus>: (final data) => (data as List)
      .map<UserStatusFindStatus>((final e) => UserStatusFindStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindStatusOcs: (final data) => UserStatusFindStatusOcs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindStatusOcs>: (final data) => (data as List)
      .map<UserStatusFindStatusOcs>((final e) => UserStatusFindStatusOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusGetUserStatus: (final data) => UserStatusGetUserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatus>: (final data) => (data as List)
      .map<UserStatusGetUserStatus>((final e) => UserStatusGetUserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusGetUserStatusOcs: (final data) => UserStatusGetUserStatusOcs.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatusOcs>: (final data) => (data as List)
      .map<UserStatusGetUserStatusOcs>((final e) => UserStatusGetUserStatusOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatus: (final data) => UserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatus>: (final data) =>
      (data as List).map<UserStatus>((final e) => UserStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPredefinedStatuses: (final data) => UserStatusPredefinedStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatuses>: (final data) => (data as List)
      .map<UserStatusPredefinedStatuses>((final e) => UserStatusPredefinedStatuses.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusPredefinedStatusesOcs: (final data) =>
      UserStatusPredefinedStatusesOcs.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatusesOcs>: (final data) => (data as List)
      .map<UserStatusPredefinedStatusesOcs>(
          (final e) => UserStatusPredefinedStatusesOcs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusPredefinedStatus: (final data) => UserStatusPredefinedStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatus>: (final data) => (data as List)
      .map<UserStatusPredefinedStatus>((final e) => UserStatusPredefinedStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushNotification: (final data) => NotificationsPushNotification.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushNotification>: (final data) => (data as List)
      .map<NotificationsPushNotification>(
          (final e) => NotificationsPushNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushNotificationDecryptedSubject: (final data) =>
      NotificationsPushNotificationDecryptedSubject.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushNotificationDecryptedSubject>: (final data) => (data as List)
      .map<NotificationsPushNotificationDecryptedSubject>(
          (final e) => NotificationsPushNotificationDecryptedSubject.fromJson(e as Map<String, dynamic>))
      .toList(),
};

final _serializers = <Type, dynamic Function(dynamic)>{
  CoreServerStatus: (final data) => (data as CoreServerStatus).toJson(),
  List<CoreServerStatus>: (final data) =>
      (data as List<CoreServerStatus>).map((final e) => (e as CoreServerStatus).toJson()).toList(),
  CoreServerCapabilities: (final data) => (data as CoreServerCapabilities).toJson(),
  List<CoreServerCapabilities>: (final data) =>
      (data as List<CoreServerCapabilities>).map((final e) => (e as CoreServerCapabilities).toJson()).toList(),
  CoreServerCapabilitiesOcs: (final data) => (data as CoreServerCapabilitiesOcs).toJson(),
  List<CoreServerCapabilitiesOcs>: (final data) =>
      (data as List<CoreServerCapabilitiesOcs>).map((final e) => (e as CoreServerCapabilitiesOcs).toJson()).toList(),
  OCSMeta: (final data) => (data as OCSMeta).toJson(),
  List<OCSMeta>: (final data) => (data as List<OCSMeta>).map((final e) => (e as OCSMeta).toJson()).toList(),
  CoreServerCapabilitiesOcsData: (final data) => (data as CoreServerCapabilitiesOcsData).toJson(),
  List<CoreServerCapabilitiesOcsData>: (final data) => (data as List<CoreServerCapabilitiesOcsData>)
      .map((final e) => (e as CoreServerCapabilitiesOcsData).toJson())
      .toList(),
  CoreServerCapabilitiesOcsDataVersion: (final data) => (data as CoreServerCapabilitiesOcsDataVersion).toJson(),
  List<CoreServerCapabilitiesOcsDataVersion>: (final data) => (data as List<CoreServerCapabilitiesOcsDataVersion>)
      .map((final e) => (e as CoreServerCapabilitiesOcsDataVersion).toJson())
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilities: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilities).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilities>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilities>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilities).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCore: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCore).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCore>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCore>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCore).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesBruteforce: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesBruteforce).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesBruteforce>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesBruteforce>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesBruteforce).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFiles: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFiles).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFiles>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFiles).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesActivity: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesActivity).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesActivity>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesActivity>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesActivity).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCircles: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCircles).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCircles>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCircles).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcm: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesOcm).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcm>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesOcm>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesOcm).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesDav: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesDav).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesDav>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesDav>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesDav).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal>: (final data) => (data
          as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal>)
      .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal).toJson())
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported>)
          .map((final e) =>
              (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop>: (final data) => (data
          as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop>)
      .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop).toJson())
      .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesNotes: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesNotes).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesNotes>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesNotes>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesNotes).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesNotifications: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesNotifications).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesNotifications>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesNotifications).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesTheming: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesTheming).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesTheming>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesTheming>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesTheming).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesUserStatus: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesUserStatus).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesUserStatus>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesUserStatus).toJson())
          .toList(),
  CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus: (final data) =>
      (data as CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus).toJson(),
  List<CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus>: (final data) =>
      (data as List<CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus>)
          .map((final e) => (e as CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus).toJson())
          .toList(),
  CoreNavigationApps: (final data) => (data as CoreNavigationApps).toJson(),
  List<CoreNavigationApps>: (final data) =>
      (data as List<CoreNavigationApps>).map((final e) => (e as CoreNavigationApps).toJson()).toList(),
  CoreNavigationAppsOcs: (final data) => (data as CoreNavigationAppsOcs).toJson(),
  List<CoreNavigationAppsOcs>: (final data) =>
      (data as List<CoreNavigationAppsOcs>).map((final e) => (e as CoreNavigationAppsOcs).toJson()).toList(),
  CoreNavigationAppsOcsData: (final data) => (data as CoreNavigationAppsOcsData).toJson(),
  List<CoreNavigationAppsOcsData>: (final data) =>
      (data as List<CoreNavigationAppsOcsData>).map((final e) => (e as CoreNavigationAppsOcsData).toJson()).toList(),
  CoreLoginFlowInit: (final data) => (data as CoreLoginFlowInit).toJson(),
  List<CoreLoginFlowInit>: (final data) =>
      (data as List<CoreLoginFlowInit>).map((final e) => (e as CoreLoginFlowInit).toJson()).toList(),
  CoreLoginFlowInitPoll: (final data) => (data as CoreLoginFlowInitPoll).toJson(),
  List<CoreLoginFlowInitPoll>: (final data) =>
      (data as List<CoreLoginFlowInitPoll>).map((final e) => (e as CoreLoginFlowInitPoll).toJson()).toList(),
  CoreLoginFlowResult: (final data) => (data as CoreLoginFlowResult).toJson(),
  List<CoreLoginFlowResult>: (final data) =>
      (data as List<CoreLoginFlowResult>).map((final e) => (e as CoreLoginFlowResult).toJson()).toList(),
  NewsListFolders: (final data) => (data as NewsListFolders).toJson(),
  List<NewsListFolders>: (final data) =>
      (data as List<NewsListFolders>).map((final e) => (e as NewsListFolders).toJson()).toList(),
  NewsFolder: (final data) => (data as NewsFolder).toJson(),
  List<NewsFolder>: (final data) => (data as List<NewsFolder>).map((final e) => (e as NewsFolder).toJson()).toList(),
  NewsFeed: (final data) => (data as NewsFeed).toJson(),
  List<NewsFeed>: (final data) => (data as List<NewsFeed>).map((final e) => (e as NewsFeed).toJson()).toList(),
  NewsArticle: (final data) => (data as NewsArticle).toJson(),
  List<NewsArticle>: (final data) => (data as List<NewsArticle>).map((final e) => (e as NewsArticle).toJson()).toList(),
  NewsListFeeds: (final data) => (data as NewsListFeeds).toJson(),
  List<NewsListFeeds>: (final data) =>
      (data as List<NewsListFeeds>).map((final e) => (e as NewsListFeeds).toJson()).toList(),
  NewsListArticles: (final data) => (data as NewsListArticles).toJson(),
  List<NewsListArticles>: (final data) =>
      (data as List<NewsListArticles>).map((final e) => (e as NewsListArticles).toJson()).toList(),
  NotesNote: (final data) => (data as NotesNote).toJson(),
  List<NotesNote>: (final data) => (data as List<NotesNote>).map((final e) => (e as NotesNote).toJson()).toList(),
  NotesSettings: (final data) => (data as NotesSettings).toJson(),
  List<NotesSettings>: (final data) =>
      (data as List<NotesSettings>).map((final e) => (e as NotesSettings).toJson()).toList(),
  NotificationsListNotifications: (final data) => (data as NotificationsListNotifications).toJson(),
  List<NotificationsListNotifications>: (final data) => (data as List<NotificationsListNotifications>)
      .map((final e) => (e as NotificationsListNotifications).toJson())
      .toList(),
  NotificationsListNotificationsOcs: (final data) => (data as NotificationsListNotificationsOcs).toJson(),
  List<NotificationsListNotificationsOcs>: (final data) => (data as List<NotificationsListNotificationsOcs>)
      .map((final e) => (e as NotificationsListNotificationsOcs).toJson())
      .toList(),
  NotificationsNotification: (final data) => (data as NotificationsNotification).toJson(),
  List<NotificationsNotification>: (final data) =>
      (data as List<NotificationsNotification>).map((final e) => (e as NotificationsNotification).toJson()).toList(),
  NotificationsNotificationAction: (final data) => (data as NotificationsNotificationAction).toJson(),
  List<NotificationsNotificationAction>: (final data) => (data as List<NotificationsNotificationAction>)
      .map((final e) => (e as NotificationsNotificationAction).toJson())
      .toList(),
  NotificationsGetNotification: (final data) => (data as NotificationsGetNotification).toJson(),
  List<NotificationsGetNotification>: (final data) => (data as List<NotificationsGetNotification>)
      .map((final e) => (e as NotificationsGetNotification).toJson())
      .toList(),
  NotificationsGetNotificationOcs: (final data) => (data as NotificationsGetNotificationOcs).toJson(),
  List<NotificationsGetNotificationOcs>: (final data) => (data as List<NotificationsGetNotificationOcs>)
      .map((final e) => (e as NotificationsGetNotificationOcs).toJson())
      .toList(),
  NotificationsEmpty: (final data) => (data as NotificationsEmpty).toJson(),
  List<NotificationsEmpty>: (final data) =>
      (data as List<NotificationsEmpty>).map((final e) => (e as NotificationsEmpty).toJson()).toList(),
  NotificationsEmptyOcs: (final data) => (data as NotificationsEmptyOcs).toJson(),
  List<NotificationsEmptyOcs>: (final data) =>
      (data as List<NotificationsEmptyOcs>).map((final e) => (e as NotificationsEmptyOcs).toJson()).toList(),
  NotificationsPushServerRegistration: (final data) => (data as NotificationsPushServerRegistration).toJson(),
  List<NotificationsPushServerRegistration>: (final data) => (data as List<NotificationsPushServerRegistration>)
      .map((final e) => (e as NotificationsPushServerRegistration).toJson())
      .toList(),
  NotificationsPushServerRegistrationOcs: (final data) => (data as NotificationsPushServerRegistrationOcs).toJson(),
  List<NotificationsPushServerRegistrationOcs>: (final data) => (data as List<NotificationsPushServerRegistrationOcs>)
      .map((final e) => (e as NotificationsPushServerRegistrationOcs).toJson())
      .toList(),
  NotificationsPushServerSubscription: (final data) => (data as NotificationsPushServerSubscription).toJson(),
  List<NotificationsPushServerSubscription>: (final data) => (data as List<NotificationsPushServerSubscription>)
      .map((final e) => (e as NotificationsPushServerSubscription).toJson())
      .toList(),
  ProvisioningApiUser: (final data) => (data as ProvisioningApiUser).toJson(),
  List<ProvisioningApiUser>: (final data) =>
      (data as List<ProvisioningApiUser>).map((final e) => (e as ProvisioningApiUser).toJson()).toList(),
  ProvisioningApiUserOcs: (final data) => (data as ProvisioningApiUserOcs).toJson(),
  List<ProvisioningApiUserOcs>: (final data) =>
      (data as List<ProvisioningApiUserOcs>).map((final e) => (e as ProvisioningApiUserOcs).toJson()).toList(),
  ProvisioningApiUserDetails: (final data) => (data as ProvisioningApiUserDetails).toJson(),
  List<ProvisioningApiUserDetails>: (final data) =>
      (data as List<ProvisioningApiUserDetails>).map((final e) => (e as ProvisioningApiUserDetails).toJson()).toList(),
  ProvisioningApiUserDetailsQuota: (final data) => (data as ProvisioningApiUserDetailsQuota).toJson(),
  List<ProvisioningApiUserDetailsQuota>: (final data) => (data as List<ProvisioningApiUserDetailsQuota>)
      .map((final e) => (e as ProvisioningApiUserDetailsQuota).toJson())
      .toList(),
  ProvisioningApiUserDetailsBackendCapabilities: (final data) =>
      (data as ProvisioningApiUserDetailsBackendCapabilities).toJson(),
  List<ProvisioningApiUserDetailsBackendCapabilities>: (final data) =>
      (data as List<ProvisioningApiUserDetailsBackendCapabilities>)
          .map((final e) => (e as ProvisioningApiUserDetailsBackendCapabilities).toJson())
          .toList(),
  UserStatusFindAllStatuses: (final data) => (data as UserStatusFindAllStatuses).toJson(),
  List<UserStatusFindAllStatuses>: (final data) =>
      (data as List<UserStatusFindAllStatuses>).map((final e) => (e as UserStatusFindAllStatuses).toJson()).toList(),
  UserStatusFindAllStatusesOcs: (final data) => (data as UserStatusFindAllStatusesOcs).toJson(),
  List<UserStatusFindAllStatusesOcs>: (final data) => (data as List<UserStatusFindAllStatusesOcs>)
      .map((final e) => (e as UserStatusFindAllStatusesOcs).toJson())
      .toList(),
  UserStatusPublicUserStatus: (final data) => (data as UserStatusPublicUserStatus).toJson(),
  List<UserStatusPublicUserStatus>: (final data) =>
      (data as List<UserStatusPublicUserStatus>).map((final e) => (e as UserStatusPublicUserStatus).toJson()).toList(),
  UserStatusClearAt: (final data) => (data as UserStatusClearAt).toJson(),
  List<UserStatusClearAt>: (final data) =>
      (data as List<UserStatusClearAt>).map((final e) => (e as UserStatusClearAt).toJson()).toList(),
  UserStatusFindStatus: (final data) => (data as UserStatusFindStatus).toJson(),
  List<UserStatusFindStatus>: (final data) =>
      (data as List<UserStatusFindStatus>).map((final e) => (e as UserStatusFindStatus).toJson()).toList(),
  UserStatusFindStatusOcs: (final data) => (data as UserStatusFindStatusOcs).toJson(),
  List<UserStatusFindStatusOcs>: (final data) =>
      (data as List<UserStatusFindStatusOcs>).map((final e) => (e as UserStatusFindStatusOcs).toJson()).toList(),
  UserStatusGetUserStatus: (final data) => (data as UserStatusGetUserStatus).toJson(),
  List<UserStatusGetUserStatus>: (final data) =>
      (data as List<UserStatusGetUserStatus>).map((final e) => (e as UserStatusGetUserStatus).toJson()).toList(),
  UserStatusGetUserStatusOcs: (final data) => (data as UserStatusGetUserStatusOcs).toJson(),
  List<UserStatusGetUserStatusOcs>: (final data) =>
      (data as List<UserStatusGetUserStatusOcs>).map((final e) => (e as UserStatusGetUserStatusOcs).toJson()).toList(),
  UserStatus: (final data) => (data as UserStatus).toJson(),
  List<UserStatus>: (final data) => (data as List<UserStatus>).map((final e) => (e as UserStatus).toJson()).toList(),
  UserStatusPredefinedStatuses: (final data) => (data as UserStatusPredefinedStatuses).toJson(),
  List<UserStatusPredefinedStatuses>: (final data) => (data as List<UserStatusPredefinedStatuses>)
      .map((final e) => (e as UserStatusPredefinedStatuses).toJson())
      .toList(),
  UserStatusPredefinedStatusesOcs: (final data) => (data as UserStatusPredefinedStatusesOcs).toJson(),
  List<UserStatusPredefinedStatusesOcs>: (final data) => (data as List<UserStatusPredefinedStatusesOcs>)
      .map((final e) => (e as UserStatusPredefinedStatusesOcs).toJson())
      .toList(),
  UserStatusPredefinedStatus: (final data) => (data as UserStatusPredefinedStatus).toJson(),
  List<UserStatusPredefinedStatus>: (final data) =>
      (data as List<UserStatusPredefinedStatus>).map((final e) => (e as UserStatusPredefinedStatus).toJson()).toList(),
  NotificationsPushNotification: (final data) => (data as NotificationsPushNotification).toJson(),
  List<NotificationsPushNotification>: (final data) => (data as List<NotificationsPushNotification>)
      .map((final e) => (e as NotificationsPushNotification).toJson())
      .toList(),
  NotificationsPushNotificationDecryptedSubject: (final data) =>
      (data as NotificationsPushNotificationDecryptedSubject).toJson(),
  List<NotificationsPushNotificationDecryptedSubject>: (final data) =>
      (data as List<NotificationsPushNotificationDecryptedSubject>)
          .map((final e) => (e as NotificationsPushNotificationDecryptedSubject).toJson())
          .toList(),
};

T deserialize<T>(final dynamic data) => _deserializers[T]!(data) as T;

dynamic serialize<T>(final T data) => _serializers[T]!(data);
