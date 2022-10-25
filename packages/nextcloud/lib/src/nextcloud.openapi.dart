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
  Future<Response> doRequest(
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
}

@JsonSerializable()
class OCSMeta {
  OCSMeta({
    required this.status,
    required this.statuscode,
    this.message,
    required this.totalitems,
    required this.itemsperpage,
  });

  factory OCSMeta.fromJson(Map<String, dynamic> json) => _$OCSMetaFromJson(json);

  final String status;

  final int statuscode;

  final String? message;

  final String totalitems;

  final String itemsperpage;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$OCSMetaToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Version {
  CoreServerCapabilities_Ocs_Data_Version({
    required this.major,
    required this.minor,
    required this.micro,
    required this.string,
    required this.edition,
    required this.extendedSupport,
  });

  factory CoreServerCapabilities_Ocs_Data_Version.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_VersionFromJson(json);

  final int major;

  final int minor;

  final int micro;

  final String string;

  final String edition;

  final bool extendedSupport;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_VersionToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Core {
  CoreServerCapabilities_Ocs_Data_Capabilities_Core({
    required this.pollinterval,
    required this.webdavRoot,
    required this.referenceApi,
    required this.referenceRegex,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreFromJson(json);

  final int pollinterval;

  @JsonKey(name: 'webdav-root')
  final String webdavRoot;

  @JsonKey(name: 'reference-api')
  final bool referenceApi;

  @JsonKey(name: 'reference-regex')
  final String referenceRegex;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce {
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce({required this.delay});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceFromJson(json);

  final int delay;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable {
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable({required this.size});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableFromJson(json);

  final List<String> size;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing {
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing({
    required this.url,
    required this.etag,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingFromJson(json);

  final String url;

  final String etag;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Files {
  CoreServerCapabilities_Ocs_Data_Capabilities_Files({
    required this.bigfilechunking,
    required this.blacklistedFiles,
    required this.directEditing,
    required this.comments,
    required this.undelete,
    required this.versioning,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesFromJson(json);

  final bool bigfilechunking;

  @JsonKey(name: 'blacklisted_files')
  final List<String> blacklistedFiles;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing directEditing;

  final bool comments;

  final bool undelete;

  final bool versioning;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Activity {
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity({required this.apiv2});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityFromJson(json);

  final List<String> apiv2;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status({required this.globalScale});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusFromJson(json);

  final bool globalScale;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings({
    required this.frontendEnabled,
    required this.allowedCircles,
    required this.allowedUserTypes,
    required this.membersLimit,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsFromJson(json);

  final bool frontendEnabled;

  final int allowedCircles;

  final int allowedUserTypes;

  final int membersLimit;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source({
    required this.core,
    required this.extra,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceFromJson(json);

  final dynamic core;

  final dynamic extra;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants({
    required this.flags,
    required this.source,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsFromJson(json);

  final dynamic flags;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source source;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config({
    required this.coreFlags,
    required this.systemFlags,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigFromJson(json);

  final List<int> coreFlags;

  final List<int> systemFlags;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle({
    required this.constants,
    required this.config,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleFromJson(json);

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants constants;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config config;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants({required this.level});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsFromJson(json);

  final dynamic level;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member({
    required this.constants,
    required this.type,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberFromJson(json);

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants constants;

  final dynamic type;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Circles {
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles({
    required this.version,
    required this.status,
    required this.settings,
    required this.circle,
    required this.member,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesFromJson(json);

  final String version;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status status;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings settings;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle circle;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member member;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols({required this.webdav});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsFromJson(json);

  final String webdav;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes({
    required this.name,
    required this.shareTypes,
    required this.protocols,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesFromJson(json);

  final String name;

  final List<String> shareTypes;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols protocols;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Ocm {
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm({
    required this.enabled,
    required this.apiVersion,
    required this.endPoint,
    required this.resourceTypes,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmFromJson(json);

  final bool enabled;

  final String apiVersion;

  final String endPoint;

  final List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes> resourceTypes;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Dav {
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav({
    this.bulkupload,
    required this.chunking,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_DavFromJson(json);

  final String? bulkupload;

  final String chunking;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_DavToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password({
    required this.enforced,
    required this.askForOptionalPassword,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordFromJson(json);

  final bool enforced;

  final bool askForOptionalPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public({
    required this.enabled,
    required this.password,
    required this.expireDate,
    required this.multipleLinks,
    required this.expireDateInternal,
    required this.expireDateRemote,
    required this.sendMail,
    required this.upload,
    required this.uploadFilesDrop,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicFromJson(json);

  final bool enabled;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate expireDate;

  @JsonKey(name: 'multiple_links')
  final bool multipleLinks;

  @JsonKey(name: 'expire_date_internal')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal expireDateInternal;

  @JsonKey(name: 'expire_date_remote')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote expireDateRemote;

  @JsonKey(name: 'send_mail')
  final bool sendMail;

  final bool upload;

  @JsonKey(name: 'upload_files_drop')
  final bool uploadFilesDrop;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User({
    required this.sendMail,
    required this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserFromJson(json);

  @JsonKey(name: 'send_mail')
  final bool sendMail;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group({
    required this.enabled,
    required this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupFromJson(json);

  final bool enabled;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation({
    required this.outgoing,
    required this.incoming,
    required this.expireDate,
    required this.expireDateSupported,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationFromJson(json);

  final bool outgoing;

  final bool incoming;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate expireDate;

  @JsonKey(name: 'expire_date_supported')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported expireDateSupported;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee({
    required this.queryLookupDefault,
    required this.alwaysShowUnique,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeFromJson(json);

  @JsonKey(name: 'query_lookup_default')
  final bool queryLookupDefault;

  @JsonKey(name: 'always_show_unique')
  final bool alwaysShowUnique;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password({
    required this.enabled,
    required this.enforced,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordFromJson(json);

  final bool enabled;

  final bool enforced;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate({
    required this.enabled,
    required this.enforced,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateFromJson(json);

  final bool enabled;

  final bool enforced;

  // coverage:ignore-start
  Map<String, dynamic> toJson() =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail({
    required this.enabled,
    required this.sendPasswordByMail,
    required this.uploadFilesDrop,
    required this.password,
    required this.expireDate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailFromJson(json);

  final bool enabled;

  @JsonKey(name: 'send_password_by_mail')
  final bool sendPasswordByMail;

  @JsonKey(name: 'upload_files_drop')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop uploadFilesDrop;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password password;

  @JsonKey(name: 'expire_date')
  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate expireDate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing {
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing({
    required this.apiEnabled,
    required this.public,
    required this.resharing,
    required this.user,
    required this.groupSharing,
    required this.group,
    required this.defaultPermissions,
    required this.federation,
    required this.sharee,
    required this.sharebymail,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingFromJson(json);

  @JsonKey(name: 'api_enabled')
  final bool apiEnabled;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public public;

  final bool resharing;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User user;

  @JsonKey(name: 'group_sharing')
  final bool groupSharing;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group group;

  @JsonKey(name: 'default_permissions')
  final int defaultPermissions;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation federation;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee sharee;

  final CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail sharebymail;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Notes {
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes({
    required this.apiVersion,
    required this.version,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesFromJson(json);

  @JsonKey(name: 'api_version')
  final List<String> apiVersion;

  final String version;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Notifications {
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications({
    required this.ocsEndpoints,
    required this.push,
    required this.adminNotifications,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsFromJson(json);

  @JsonKey(name: 'ocs-endpoints')
  final List<String> ocsEndpoints;

  final List<String> push;

  @JsonKey(name: 'admin-notifications')
  final List<String> adminNotifications;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api {
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api({
    required this.generate,
    required this.validate,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiFromJson(json);

  final String generate;

  final String validate;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy {
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy({
    required this.minLength,
    required this.enforceNonCommonPassword,
    required this.enforceNumericCharacters,
    required this.enforceSpecialCharacters,
    required this.enforceUpperLowerCase,
    required this.api,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyFromJson(json);

  final int minLength;

  final bool enforceNonCommonPassword;

  final bool enforceNumericCharacters;

  final bool enforceSpecialCharacters;

  final bool enforceUpperLowerCase;

  final CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api api;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi {
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi({
    required this.version,
    required this.accountPropertyScopesVersion,
    required this.accountPropertyScopesFederatedEnabled,
    required this.accountPropertyScopesPublishedEnabled,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiFromJson(json);

  final String version;

  @JsonKey(name: 'AccountPropertyScopesVersion')
  final int accountPropertyScopesVersion;

  @JsonKey(name: 'AccountPropertyScopesFederatedEnabled')
  final bool accountPropertyScopesFederatedEnabled;

  @JsonKey(name: 'AccountPropertyScopesPublishedEnabled')
  final bool accountPropertyScopesPublishedEnabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_Theming {
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming({
    required this.name,
    required this.url,
    required this.slogan,
    required this.color,
    required this.colorText,
    required this.colorElement,
    required this.colorElementBright,
    required this.colorElementDark,
    required this.logo,
    required this.background,
    required this.backgroundPlain,
    required this.backgroundDefault,
    required this.logoheader,
    required this.favicon,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingFromJson(json);

  final String name;

  final String url;

  final String slogan;

  final String color;

  @JsonKey(name: 'color-text')
  final String colorText;

  @JsonKey(name: 'color-element')
  final String colorElement;

  @JsonKey(name: 'color-element-bright')
  final String colorElementBright;

  @JsonKey(name: 'color-element-dark')
  final String colorElementDark;

  final String logo;

  final String background;

  @JsonKey(name: 'background-plain')
  final bool backgroundPlain;

  @JsonKey(name: 'background-default')
  final bool backgroundDefault;

  final String logoheader;

  final String favicon;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus {
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus({
    required this.enabled,
    required this.supportsEmoji,
  });

  factory CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusFromJson(json);

  final bool enabled;

  @JsonKey(name: 'supports_emoji')
  final bool supportsEmoji;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus {
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus({required this.enabled});

  factory CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusFromJson(json);

  final bool enabled;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data_Capabilities {
  CoreServerCapabilities_Ocs_Data_Capabilities({
    required this.core,
    required this.bruteforce,
    required this.metadataAvailable,
    required this.files,
    this.activity,
    this.circles,
    required this.ocm,
    required this.dav,
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

  final CoreServerCapabilities_Ocs_Data_Capabilities_Core core;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce bruteforce;

  final CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable metadataAvailable;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Files files;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Activity? activity;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Circles? circles;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Ocm ocm;

  final CoreServerCapabilities_Ocs_Data_Capabilities_Dav dav;

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
}

@JsonSerializable()
class CoreServerCapabilities_Ocs_Data {
  CoreServerCapabilities_Ocs_Data({
    required this.version,
    required this.capabilities,
  });

  factory CoreServerCapabilities_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      _$CoreServerCapabilities_Ocs_DataFromJson(json);

  final CoreServerCapabilities_Ocs_Data_Version version;

  final CoreServerCapabilities_Ocs_Data_Capabilities capabilities;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_Ocs_DataToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities_Ocs {
  CoreServerCapabilities_Ocs({
    required this.meta,
    required this.data,
  });

  factory CoreServerCapabilities_Ocs.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilities_OcsFromJson(json);

  final OCSMeta meta;

  final CoreServerCapabilities_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilities_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreServerCapabilities {
  CoreServerCapabilities({required this.ocs});

  factory CoreServerCapabilities.fromJson(Map<String, dynamic> json) => _$CoreServerCapabilitiesFromJson(json);

  final CoreServerCapabilities_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreServerCapabilitiesToJson(this);
  // coverage:ignore-end
}

class CoreNavigationApps_Ocs_Data_Order {
  CoreNavigationApps_Ocs_Data_Order(
    this._data, {
    this.int_,
    this.string,
  });

  factory CoreNavigationApps_Ocs_Data_Order.fromJson(dynamic data) {
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    String? string;
    try {
      string = data as String;
    } catch (_) {}
    assert([int_, string].where((final x) => x != null).length == 1, 'Need oneOf');
    return CoreNavigationApps_Ocs_Data_Order(
      data,
      int_: int_,
      string: string,
    );
  }

  final dynamic _data;

  final int? int_;

  final String? string;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
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
}

@JsonSerializable()
class CoreNavigationApps_Ocs {
  CoreNavigationApps_Ocs({
    required this.meta,
    required this.data,
  });

  factory CoreNavigationApps_Ocs.fromJson(Map<String, dynamic> json) => _$CoreNavigationApps_OcsFromJson(json);

  final OCSMeta meta;

  final List<CoreNavigationApps_Ocs_Data> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreNavigationApps_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreNavigationApps {
  CoreNavigationApps({required this.ocs});

  factory CoreNavigationApps.fromJson(Map<String, dynamic> json) => _$CoreNavigationAppsFromJson(json);

  final CoreNavigationApps_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreNavigationAppsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreLoginFlowInit_Poll {
  CoreLoginFlowInit_Poll({
    required this.token,
    required this.endpoint,
  });

  factory CoreLoginFlowInit_Poll.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInit_PollFromJson(json);

  final String token;

  final String endpoint;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowInit_PollToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreLoginFlowInit {
  CoreLoginFlowInit({
    required this.poll,
    required this.login,
  });

  factory CoreLoginFlowInit.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowInitFromJson(json);

  final CoreLoginFlowInit_Poll poll;

  final String login;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowInitToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class CoreLoginFlowResult {
  CoreLoginFlowResult({
    required this.server,
    required this.loginName,
    required this.appPassword,
  });

  factory CoreLoginFlowResult.fromJson(Map<String, dynamic> json) => _$CoreLoginFlowResultFromJson(json);

  final String server;

  final String loginName;

  final String appPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$CoreLoginFlowResultToJson(this);
  // coverage:ignore-end
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
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreServerCapabilities> getCapabilities() async {
    var path = '/ocs/v1.php/cloud/capabilities';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreServerCapabilities.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreNavigationApps> getNavigationApps() async {
    var path = '/ocs/v1.php/core/navigation/apps';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreNavigationApps.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowInit> initLoginFlow() async {
    var path = '/login/v2';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowInit.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<CoreLoginFlowResult> getLoginFlowResult({required String token}) async {
    var path = '/login/v2/poll';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['token'] = token.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return CoreLoginFlowResult.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
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
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/avatar/{userId}/{size}/dark';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/avatar/{userId}/{size}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    path = path.replaceAll('{size}', Uri.encodeQueryComponent(size.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

@JsonSerializable()
class GetSupportedApiVersions {
  GetSupportedApiVersions({this.apiLevels});

  factory GetSupportedApiVersions.fromJson(Map<String, dynamic> json) => _$GetSupportedApiVersionsFromJson(json);

  final List<String>? apiLevels;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$GetSupportedApiVersionsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NewsArticle {
  NewsArticle({
    required this.id,
    required this.guid,
    required this.guidHash,
    required this.url,
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

  final int id;

  final String guid;

  final String guidHash;

  final String url;

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

  final int id;

  final String name;

  final bool opened;

  /// This seems to be broken. In testing it is always empty
  final List<NewsFeed> feeds;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsFolderToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NewsListFolders {
  NewsListFolders({required this.folders});

  factory NewsListFolders.fromJson(Map<String, dynamic> json) => _$NewsListFoldersFromJson(json);

  final List<NewsFolder> folders;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListFoldersToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NewsListFeeds {
  NewsListFeeds({
    this.starredCount,
    this.newestItemId,
    required this.feeds,
  });

  factory NewsListFeeds.fromJson(Map<String, dynamic> json) => _$NewsListFeedsFromJson(json);

  final int? starredCount;

  final int? newestItemId;

  final List<NewsFeed> feeds;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListFeedsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NewsListArticles {
  NewsListArticles({required this.items});

  factory NewsListArticles.fromJson(Map<String, dynamic> json) => _$NewsListArticlesFromJson(json);

  final List<NewsArticle> items;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NewsListArticlesToJson(this);
  // coverage:ignore-end
}

class NewsClient {
  NewsClient(this.rootClient);

  final Client rootClient;

  Future<GetSupportedApiVersions> getSupportedApiVersions() async {
    var path = '/apps/news/api';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return GetSupportedApiVersions.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> listFolders() async {
    var path = '/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFolders> createFolder({required String name}) async {
    var path = '/apps/news/api/v1-3/folders';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['name'] = name.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFolders.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future renameFolder({
    required int folderId,
    required String name,
  }) async {
    var path = '/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['name'] = name.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFolder({required int folderId}) async {
    var path = '/apps/news/api/v1-3/folders/{folderId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/apps/news/api/v1-3/folders/{folderId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{folderId}', Uri.encodeQueryComponent(folderId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> listFeeds() async {
    var path = '/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListFeeds> addFeed({
    required String url,
    int? folderId,
  }) async {
    var path = '/apps/news/api/v1-3/feeds';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['url'] = url.toString();
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListFeeds.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future deleteFeed({required int feedId}) async {
    var path = '/apps/news/api/v1-3/feeds/{feedId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/apps/news/api/v1-3/feeds/{feedId}/move';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/apps/news/api/v1-3/feeds/{feedId}/rename';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['feedTitle'] = feedTitle.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/apps/news/api/v1-3/feeds/{feedId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{feedId}', Uri.encodeQueryComponent(feedId.toString()));
    queryParameters['newestItemId'] = newestItemId.toString();
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
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
    var path = '/apps/news/api/v1-3/items';
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
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NewsListArticles> listUpdatedArticles({
    int type = 3,
    int id = 0,
    int lastModified = 0,
  }) async {
    var path = '/apps/news/api/v1-3/items/updated';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['type'] = type.toString();
    queryParameters['id'] = id.toString();
    queryParameters['lastModified'] = lastModified.toString();
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NewsListArticles.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsRead({required int itemId}) async {
    var path = '/apps/news/api/v1-3/items/{itemId}/read';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future markArticleAsUnread({required int itemId}) async {
    var path = '/apps/news/api/v1-3/items/{itemId}/unread';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future starArticle({required int itemId}) async {
    var path = '/apps/news/api/v1-3/items/{itemId}/star';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future unstarArticle({required int itemId}) async {
    var path = '/apps/news/api/v1-3/items/{itemId}/unstar';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{itemId}', Uri.encodeQueryComponent(itemId.toString()));
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
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
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
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

  final String notesPath;

  final String fileSuffix;

  final NotesSettings_NoteMode noteMode;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotesSettingsToJson(this);
  // coverage:ignore-end
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
    final response = await rootClient.doRequest(
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
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
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
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesNote.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteNote({required int id}) async {
    var path = '/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> getSettings() async {
    var path = '/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> updateSettings({required NotesSettings notesSettings}) async {
    var path = '/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    headers['Content-Type'] = 'application/json';
    body = Uint8List.fromList(utf8.encode(json.encode((notesSettings as NotesSettings).toJson())));
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotesSettings.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsNotification_SubjectRichParameters {
  NotificationsNotification_SubjectRichParameters(
    this._data, {
    this.mapStringDynamic,
  });

  factory NotificationsNotification_SubjectRichParameters.fromJson(dynamic data) {
    Map<String, dynamic>? mapStringDynamic;
    try {
      mapStringDynamic = data as Map<String, dynamic>;
    } catch (_) {}
    return NotificationsNotification_SubjectRichParameters(
      data,
      mapStringDynamic: mapStringDynamic,
    );
  }

  final dynamic _data;

  final Map<String, dynamic>? mapStringDynamic;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
}

class NotificationsNotification_MessageRichParameters {
  NotificationsNotification_MessageRichParameters(
    this._data, {
    this.mapStringDynamic,
  });

  factory NotificationsNotification_MessageRichParameters.fromJson(dynamic data) {
    Map<String, dynamic>? mapStringDynamic;
    try {
      mapStringDynamic = data as Map<String, dynamic>;
    } catch (_) {}
    return NotificationsNotification_MessageRichParameters(
      data,
      mapStringDynamic: mapStringDynamic,
    );
  }

  final dynamic _data;

  final Map<String, dynamic>? mapStringDynamic;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
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

  final String label;

  final String link;

  final String type;

  final bool? primary;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsNotificationActionToJson(this);
  // coverage:ignore-end
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
}

@JsonSerializable()
class NotificationsListNotifications_Ocs {
  NotificationsListNotifications_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsListNotifications_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotifications_OcsFromJson(json);

  final OCSMeta meta;

  final List<NotificationsNotification> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsListNotifications_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsListNotifications {
  NotificationsListNotifications({required this.ocs});

  factory NotificationsListNotifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListNotificationsFromJson(json);

  final NotificationsListNotifications_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsListNotificationsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsGetNotification_Ocs {
  NotificationsGetNotification_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsGetNotification_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotification_OcsFromJson(json);

  final OCSMeta meta;

  final NotificationsNotification data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsGetNotification_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsGetNotification {
  NotificationsGetNotification({required this.ocs});

  factory NotificationsGetNotification.fromJson(Map<String, dynamic> json) =>
      _$NotificationsGetNotificationFromJson(json);

  final NotificationsGetNotification_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsGetNotificationToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsEmpty_Ocs {
  NotificationsEmpty_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsEmpty_Ocs.fromJson(Map<String, dynamic> json) => _$NotificationsEmpty_OcsFromJson(json);

  final OCSMeta meta;

  final List<String> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsEmpty_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsEmpty {
  NotificationsEmpty({required this.ocs});

  factory NotificationsEmpty.fromJson(Map<String, dynamic> json) => _$NotificationsEmptyFromJson(json);

  final NotificationsEmpty_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsEmptyToJson(this);
  // coverage:ignore-end
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

  final String publicKey;

  final String deviceIdentifier;

  final String signature;

  final String? message;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerSubscriptionToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsPushServerRegistration_Ocs {
  NotificationsPushServerRegistration_Ocs({
    required this.meta,
    required this.data,
  });

  factory NotificationsPushServerRegistration_Ocs.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistration_OcsFromJson(json);

  final OCSMeta meta;

  final NotificationsPushServerSubscription data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistration_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class NotificationsPushServerRegistration {
  NotificationsPushServerRegistration({required this.ocs});

  factory NotificationsPushServerRegistration.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPushServerRegistrationFromJson(json);

  final NotificationsPushServerRegistration_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushServerRegistrationToJson(this);
  // coverage:ignore-end
}

class NotificationsClient {
  NotificationsClient(this.rootClient);

  final Client rootClient;

  Future<NotificationsListNotifications> listNotifications() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsListNotifications.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteAllNotifications() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsGetNotification> getNotification({required int id}) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsGetNotification.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotificationsEmpty> deleteNotification({required int id}) async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsEmpty.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsPushServerRegistration.fromJson(
          json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> removeDevice() async {
    var path = '/ocs/v1.php/apps/notifications/api/v2/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return utf8.decode(response.body) as String;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsEmpty.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
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

  final int free;

  final int used;

  final int total;

  final num relative;

  final int quota;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetails_QuotaToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class ProvisioningApiUserDetails_BackendCapabilities {
  ProvisioningApiUserDetails_BackendCapabilities({
    required this.setDisplayName,
    required this.setPassword,
  });

  factory ProvisioningApiUserDetails_BackendCapabilities.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningApiUserDetails_BackendCapabilitiesFromJson(json);

  final bool setDisplayName;

  final bool setPassword;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserDetails_BackendCapabilitiesToJson(this);
  // coverage:ignore-end
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
}

@JsonSerializable()
class ProvisioningApiUser_Ocs {
  ProvisioningApiUser_Ocs({
    required this.meta,
    required this.data,
  });

  factory ProvisioningApiUser_Ocs.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUser_OcsFromJson(json);

  final OCSMeta meta;

  final ProvisioningApiUserDetails data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUser_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class ProvisioningApiUser {
  ProvisioningApiUser({required this.ocs});

  factory ProvisioningApiUser.fromJson(Map<String, dynamic> json) => _$ProvisioningApiUserFromJson(json);

  final ProvisioningApiUser_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$ProvisioningApiUserToJson(this);
  // coverage:ignore-end
}

class ProvisioningApiClient {
  ProvisioningApiClient(this.rootClient);

  final Client rootClient;

  Future<ProvisioningApiUser> getCurrentUser() async {
    var path = '/ocs/v1.php/cloud/user';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<ProvisioningApiUser> getUser({required String userId}) async {
    var path = '/ocs/v1.php/cloud/users/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return ProvisioningApiUser.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }
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
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
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
        throw Exception('Can not parse UserStatusClearAtTime0 from "$value"');
    }
  }
}

class UserStatusClearAt_Time {
  UserStatusClearAt_Time(
    this._data, {
    this.userStatusClearAtTime0,
    this.int_,
  });

  factory UserStatusClearAt_Time.fromJson(dynamic data) {
    UserStatusClearAt_Time0? userStatusClearAtTime0;
    try {
      userStatusClearAtTime0 = UserStatusClearAt_Time0.fromValue(data as String);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    assert([userStatusClearAtTime0, int_].where((final x) => x != null).length == 1, 'Need oneOf');
    return UserStatusClearAt_Time(
      data,
      userStatusClearAtTime0: userStatusClearAtTime0,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAt_Time0? userStatusClearAtTime0;

  /// Time offset in seconds
  final int? int_;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
}

@JsonSerializable(disallowUnrecognizedKeys: true)
class UserStatusClearAt {
  UserStatusClearAt({
    required this.type,
    required this.time,
  });

  factory UserStatusClearAt.fromJson(Map<String, dynamic> json) => _$UserStatusClearAtFromJson(json);

  final UserStatusClearAt_Type type;

  final UserStatusClearAt_Time time;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusClearAtToJson(this);
  // coverage:ignore-end
}

class UserStatusPublicUserStatus_ClearAt {
  UserStatusPublicUserStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.int_,
  });

  factory UserStatusPublicUserStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    return UserStatusPublicUserStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? int_;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
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
    required this.userId,
    this.message,
    this.icon,
    required this.clearAt,
    required this.status,
  });

  factory UserStatusPublicUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusPublicUserStatusFromJson(json);

  final String userId;

  final String? message;

  final String? icon;

  final UserStatusPublicUserStatus_ClearAt clearAt;

  final UserStatusType status;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPublicUserStatusToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusFindAllStatuses_Ocs {
  UserStatusFindAllStatuses_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusFindAllStatuses_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusFindAllStatuses_OcsFromJson(json);

  final OCSMeta meta;

  final List<UserStatusPublicUserStatus> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindAllStatuses_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusFindAllStatuses {
  UserStatusFindAllStatuses({required this.ocs});

  factory UserStatusFindAllStatuses.fromJson(Map<String, dynamic> json) => _$UserStatusFindAllStatusesFromJson(json);

  final UserStatusFindAllStatuses_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindAllStatusesToJson(this);
  // coverage:ignore-end
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

  final dynamic _data;

  final UserStatusPublicUserStatus? userStatusPublicUserStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusFindStatus_Ocs {
  UserStatusFindStatus_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusFindStatus_Ocs.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatus_OcsFromJson(json);

  final OCSMeta meta;

  final UserStatusFindStatus_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindStatus_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusFindStatus {
  UserStatusFindStatus({required this.ocs});

  factory UserStatusFindStatus.fromJson(Map<String, dynamic> json) => _$UserStatusFindStatusFromJson(json);

  final UserStatusFindStatus_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusFindStatusToJson(this);
  // coverage:ignore-end
}

class UserStatus_ClearAt {
  UserStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.int_,
  });

  factory UserStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    return UserStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? int_;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
}

@JsonSerializable(disallowUnrecognizedKeys: true)
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

  final dynamic _data;

  final UserStatus? userStatus;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusGetUserStatus_Ocs {
  UserStatusGetUserStatus_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusGetUserStatus_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusGetUserStatus_OcsFromJson(json);

  final OCSMeta meta;

  final UserStatusGetUserStatus_Ocs_Data data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusGetUserStatus_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusGetUserStatus {
  UserStatusGetUserStatus({required this.ocs});

  factory UserStatusGetUserStatus.fromJson(Map<String, dynamic> json) => _$UserStatusGetUserStatusFromJson(json);

  final UserStatusGetUserStatus_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusGetUserStatusToJson(this);
  // coverage:ignore-end
}

class UserStatusPredefinedStatus_ClearAt {
  UserStatusPredefinedStatus_ClearAt(
    this._data, {
    this.userStatusClearAt,
    this.int_,
  });

  factory UserStatusPredefinedStatus_ClearAt.fromJson(dynamic data) {
    UserStatusClearAt? userStatusClearAt;
    try {
      userStatusClearAt = UserStatusClearAt.fromJson(data as Map<String, dynamic>);
    } catch (_) {}
    int? int_;
    try {
      int_ = data as int;
    } catch (_) {}
    return UserStatusPredefinedStatus_ClearAt(
      data,
      userStatusClearAt: userStatusClearAt,
      int_: int_,
    );
  }

  final dynamic _data;

  final UserStatusClearAt? userStatusClearAt;

  /// Time as unix timestamp
  final int? int_;

  // coverage:ignore-start
  dynamic toJson() => _data;
  // coverage:ignore-end
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

  final String id;

  final String icon;

  final String message;

  final UserStatusPredefinedStatus_ClearAt clearAt;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusPredefinedStatuses_Ocs {
  UserStatusPredefinedStatuses_Ocs({
    required this.meta,
    required this.data,
  });

  factory UserStatusPredefinedStatuses_Ocs.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatuses_OcsFromJson(json);

  final OCSMeta meta;

  final List<UserStatusPredefinedStatus> data;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatuses_OcsToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class UserStatusPredefinedStatuses {
  UserStatusPredefinedStatuses({required this.ocs});

  factory UserStatusPredefinedStatuses.fromJson(Map<String, dynamic> json) =>
      _$UserStatusPredefinedStatusesFromJson(json);

  final UserStatusPredefinedStatuses_Ocs ocs;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$UserStatusPredefinedStatusesToJson(this);
  // coverage:ignore-end
}

class UserStatusClient {
  UserStatusClient(this.rootClient);

  final Client rootClient;

  Future<UserStatusFindAllStatuses> findAllStatuses() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindAllStatuses.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusFindStatus> findStatus({required String userId}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/statuses/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId.toString()));
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusFindStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> getStatus() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusGetUserStatus> setStatus({required UserStatusType statusType}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/status';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['statusType'] = statusType.value.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusGetUserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future clearMessage() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/user_status/message';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatusPredefinedStatuses> findAllPredefinedStatuses() async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/predefined_statuses';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatusPredefinedStatuses.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<UserStatus> heartbeat({required UserStatusType status}) async {
    var path = '/ocs/v1.php/apps/user_status/api/v1/heartbeat';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    queryParameters['status'] = status.value.toString();
    final response = await rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return UserStatus.fromJson(json.decode(utf8.decode(response.body)) as Map<String, dynamic>);
    }
    throw ApiException.fromResponse(response); // coverage:ignore-line
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

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushNotificationDecryptedSubjectToJson(this);
  // coverage:ignore-end
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

  final String accountID;

  final String priority;

  final String type;

  final NotificationsPushNotificationDecryptedSubject subject;

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$NotificationsPushNotificationToJson(this);
  // coverage:ignore-end
}

// coverage:ignore-start
final _deserializers = <Type, dynamic Function(dynamic)>{
  CoreServerStatus: (final data) => CoreServerStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerStatus>: (final data) =>
      (data as List).map<CoreServerStatus>((final e) => CoreServerStatus.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities: (final data) => CoreServerCapabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities>: (final data) => (data as List)
      .map<CoreServerCapabilities>((final e) => CoreServerCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs: (final data) => CoreServerCapabilities_Ocs.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs>((final e) => CoreServerCapabilities_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  OCSMeta: (final data) => OCSMeta.fromJson(data as Map<String, dynamic>),
  List<OCSMeta>: (final data) =>
      (data as List).map<OCSMeta>((final e) => OCSMeta.fromJson(e as Map<String, dynamic>)).toList(),
  CoreServerCapabilities_Ocs_Data: (final data) =>
      CoreServerCapabilities_Ocs_Data.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data>(
          (final e) => CoreServerCapabilities_Ocs_Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Version: (final data) =>
      CoreServerCapabilities_Ocs_Data_Version.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Version>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Version>(
          (final e) => CoreServerCapabilities_Ocs_Data_Version.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Core: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Core>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Core>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Files>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>: (final data) =>
      (data as List)
          .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>((final e) =>
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>: (final data) =>
      (data as List)
          .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>((final e) =>
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>: (final data) =>
      (data as List)
          .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>((final e) =>
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>: (final data) =>
      (data as List)
          .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>((final e) =>
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
          data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
              e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>((final e) =>
          CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus: (final data) =>
      CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(data as Map<String, dynamic>),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>: (final data) => (data as List)
      .map<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>(
          (final e) => CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationApps: (final data) => CoreNavigationApps.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps>: (final data) => (data as List)
      .map<CoreNavigationApps>((final e) => CoreNavigationApps.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationApps_Ocs: (final data) => CoreNavigationApps_Ocs.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps_Ocs>: (final data) => (data as List)
      .map<CoreNavigationApps_Ocs>((final e) => CoreNavigationApps_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreNavigationApps_Ocs_Data: (final data) => CoreNavigationApps_Ocs_Data.fromJson(data as Map<String, dynamic>),
  List<CoreNavigationApps_Ocs_Data>: (final data) => (data as List)
      .map<CoreNavigationApps_Ocs_Data>((final e) => CoreNavigationApps_Ocs_Data.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowInit: (final data) => CoreLoginFlowInit.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInit>: (final data) => (data as List)
      .map<CoreLoginFlowInit>((final e) => CoreLoginFlowInit.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowInit_Poll: (final data) => CoreLoginFlowInit_Poll.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowInit_Poll>: (final data) => (data as List)
      .map<CoreLoginFlowInit_Poll>((final e) => CoreLoginFlowInit_Poll.fromJson(e as Map<String, dynamic>))
      .toList(),
  CoreLoginFlowResult: (final data) => CoreLoginFlowResult.fromJson(data as Map<String, dynamic>),
  List<CoreLoginFlowResult>: (final data) => (data as List)
      .map<CoreLoginFlowResult>((final e) => CoreLoginFlowResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  GetSupportedApiVersions: (final data) => GetSupportedApiVersions.fromJson(data as Map<String, dynamic>),
  List<GetSupportedApiVersions>: (final data) => (data as List)
      .map<GetSupportedApiVersions>((final e) => GetSupportedApiVersions.fromJson(e as Map<String, dynamic>))
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
  NotificationsListNotifications_Ocs: (final data) =>
      NotificationsListNotifications_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsListNotifications_Ocs>: (final data) => (data as List)
      .map<NotificationsListNotifications_Ocs>(
          (final e) => NotificationsListNotifications_Ocs.fromJson(e as Map<String, dynamic>))
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
  NotificationsGetNotification_Ocs: (final data) =>
      NotificationsGetNotification_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsGetNotification_Ocs>: (final data) => (data as List)
      .map<NotificationsGetNotification_Ocs>(
          (final e) => NotificationsGetNotification_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsEmpty: (final data) => NotificationsEmpty.fromJson(data as Map<String, dynamic>),
  List<NotificationsEmpty>: (final data) => (data as List)
      .map<NotificationsEmpty>((final e) => NotificationsEmpty.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsEmpty_Ocs: (final data) => NotificationsEmpty_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsEmpty_Ocs>: (final data) => (data as List)
      .map<NotificationsEmpty_Ocs>((final e) => NotificationsEmpty_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerRegistration: (final data) =>
      NotificationsPushServerRegistration.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistration>: (final data) => (data as List)
      .map<NotificationsPushServerRegistration>(
          (final e) => NotificationsPushServerRegistration.fromJson(e as Map<String, dynamic>))
      .toList(),
  NotificationsPushServerRegistration_Ocs: (final data) =>
      NotificationsPushServerRegistration_Ocs.fromJson(data as Map<String, dynamic>),
  List<NotificationsPushServerRegistration_Ocs>: (final data) => (data as List)
      .map<NotificationsPushServerRegistration_Ocs>(
          (final e) => NotificationsPushServerRegistration_Ocs.fromJson(e as Map<String, dynamic>))
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
  ProvisioningApiUser_Ocs: (final data) => ProvisioningApiUser_Ocs.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUser_Ocs>: (final data) => (data as List)
      .map<ProvisioningApiUser_Ocs>((final e) => ProvisioningApiUser_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetails: (final data) => ProvisioningApiUserDetails.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails>: (final data) => (data as List)
      .map<ProvisioningApiUserDetails>((final e) => ProvisioningApiUserDetails.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetails_Quota: (final data) =>
      ProvisioningApiUserDetails_Quota.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails_Quota>: (final data) => (data as List)
      .map<ProvisioningApiUserDetails_Quota>(
          (final e) => ProvisioningApiUserDetails_Quota.fromJson(e as Map<String, dynamic>))
      .toList(),
  ProvisioningApiUserDetails_BackendCapabilities: (final data) =>
      ProvisioningApiUserDetails_BackendCapabilities.fromJson(data as Map<String, dynamic>),
  List<ProvisioningApiUserDetails_BackendCapabilities>: (final data) => (data as List)
      .map<ProvisioningApiUserDetails_BackendCapabilities>(
          (final e) => ProvisioningApiUserDetails_BackendCapabilities.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindAllStatuses: (final data) => UserStatusFindAllStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatuses>: (final data) => (data as List)
      .map<UserStatusFindAllStatuses>((final e) => UserStatusFindAllStatuses.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusFindAllStatuses_Ocs: (final data) => UserStatusFindAllStatuses_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindAllStatuses_Ocs>: (final data) => (data as List)
      .map<UserStatusFindAllStatuses_Ocs>(
          (final e) => UserStatusFindAllStatuses_Ocs.fromJson(e as Map<String, dynamic>))
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
  UserStatusFindStatus_Ocs: (final data) => UserStatusFindStatus_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusFindStatus_Ocs>: (final data) => (data as List)
      .map<UserStatusFindStatus_Ocs>((final e) => UserStatusFindStatus_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusGetUserStatus: (final data) => UserStatusGetUserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatus>: (final data) => (data as List)
      .map<UserStatusGetUserStatus>((final e) => UserStatusGetUserStatus.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusGetUserStatus_Ocs: (final data) => UserStatusGetUserStatus_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusGetUserStatus_Ocs>: (final data) => (data as List)
      .map<UserStatusGetUserStatus_Ocs>((final e) => UserStatusGetUserStatus_Ocs.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatus: (final data) => UserStatus.fromJson(data as Map<String, dynamic>),
  List<UserStatus>: (final data) =>
      (data as List).map<UserStatus>((final e) => UserStatus.fromJson(e as Map<String, dynamic>)).toList(),
  UserStatusPredefinedStatuses: (final data) => UserStatusPredefinedStatuses.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatuses>: (final data) => (data as List)
      .map<UserStatusPredefinedStatuses>((final e) => UserStatusPredefinedStatuses.fromJson(e as Map<String, dynamic>))
      .toList(),
  UserStatusPredefinedStatuses_Ocs: (final data) =>
      UserStatusPredefinedStatuses_Ocs.fromJson(data as Map<String, dynamic>),
  List<UserStatusPredefinedStatuses_Ocs>: (final data) => (data as List)
      .map<UserStatusPredefinedStatuses_Ocs>(
          (final e) => UserStatusPredefinedStatuses_Ocs.fromJson(e as Map<String, dynamic>))
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
  CoreServerCapabilities_Ocs: (final data) => (data as CoreServerCapabilities_Ocs).toJson(),
  List<CoreServerCapabilities_Ocs>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs>).map((final e) => (e as CoreServerCapabilities_Ocs).toJson()).toList(),
  OCSMeta: (final data) => (data as OCSMeta).toJson(),
  List<OCSMeta>: (final data) => (data as List<OCSMeta>).map((final e) => (e as OCSMeta).toJson()).toList(),
  CoreServerCapabilities_Ocs_Data: (final data) => (data as CoreServerCapabilities_Ocs_Data).toJson(),
  List<CoreServerCapabilities_Ocs_Data>: (final data) => (data as List<CoreServerCapabilities_Ocs_Data>)
      .map((final e) => (e as CoreServerCapabilities_Ocs_Data).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Version: (final data) => (data as CoreServerCapabilities_Ocs_Data_Version).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Version>: (final data) => (data as List<CoreServerCapabilities_Ocs_Data_Version>)
      .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Version).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Core: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Core).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Core>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Core>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Core).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Files).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Files>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Files).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Activity: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Activity).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Activity>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Activity).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>: (final data) => (data
          as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>)
      .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Dav: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Dav).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Dav>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Dav).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>)
          .map((final e) =>
              (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>)
          .map((final e) =>
              (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>: (final data) => (data
          as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>)
      .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>)
          .map((final e) =>
              (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>)
          .map((final e) =>
              (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>: (final data) => (data
          as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>)
      .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>: (final data) => (data
          as List<CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>)
      .map(
          (final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate).toJson())
      .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notes: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Notes).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Notes>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Notes).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Notifications: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Notifications).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Notifications>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Notifications).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_Theming: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_Theming).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_Theming>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_Theming).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus).toJson())
          .toList(),
  CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus: (final data) =>
      (data as CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus).toJson(),
  List<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>: (final data) =>
      (data as List<CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>)
          .map((final e) => (e as CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus).toJson())
          .toList(),
  CoreNavigationApps: (final data) => (data as CoreNavigationApps).toJson(),
  List<CoreNavigationApps>: (final data) =>
      (data as List<CoreNavigationApps>).map((final e) => (e as CoreNavigationApps).toJson()).toList(),
  CoreNavigationApps_Ocs: (final data) => (data as CoreNavigationApps_Ocs).toJson(),
  List<CoreNavigationApps_Ocs>: (final data) =>
      (data as List<CoreNavigationApps_Ocs>).map((final e) => (e as CoreNavigationApps_Ocs).toJson()).toList(),
  CoreNavigationApps_Ocs_Data: (final data) => (data as CoreNavigationApps_Ocs_Data).toJson(),
  List<CoreNavigationApps_Ocs_Data>: (final data) => (data as List<CoreNavigationApps_Ocs_Data>)
      .map((final e) => (e as CoreNavigationApps_Ocs_Data).toJson())
      .toList(),
  CoreLoginFlowInit: (final data) => (data as CoreLoginFlowInit).toJson(),
  List<CoreLoginFlowInit>: (final data) =>
      (data as List<CoreLoginFlowInit>).map((final e) => (e as CoreLoginFlowInit).toJson()).toList(),
  CoreLoginFlowInit_Poll: (final data) => (data as CoreLoginFlowInit_Poll).toJson(),
  List<CoreLoginFlowInit_Poll>: (final data) =>
      (data as List<CoreLoginFlowInit_Poll>).map((final e) => (e as CoreLoginFlowInit_Poll).toJson()).toList(),
  CoreLoginFlowResult: (final data) => (data as CoreLoginFlowResult).toJson(),
  List<CoreLoginFlowResult>: (final data) =>
      (data as List<CoreLoginFlowResult>).map((final e) => (e as CoreLoginFlowResult).toJson()).toList(),
  GetSupportedApiVersions: (final data) => (data as GetSupportedApiVersions).toJson(),
  List<GetSupportedApiVersions>: (final data) =>
      (data as List<GetSupportedApiVersions>).map((final e) => (e as GetSupportedApiVersions).toJson()).toList(),
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
  NotificationsListNotifications_Ocs: (final data) => (data as NotificationsListNotifications_Ocs).toJson(),
  List<NotificationsListNotifications_Ocs>: (final data) => (data as List<NotificationsListNotifications_Ocs>)
      .map((final e) => (e as NotificationsListNotifications_Ocs).toJson())
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
  NotificationsGetNotification_Ocs: (final data) => (data as NotificationsGetNotification_Ocs).toJson(),
  List<NotificationsGetNotification_Ocs>: (final data) => (data as List<NotificationsGetNotification_Ocs>)
      .map((final e) => (e as NotificationsGetNotification_Ocs).toJson())
      .toList(),
  NotificationsEmpty: (final data) => (data as NotificationsEmpty).toJson(),
  List<NotificationsEmpty>: (final data) =>
      (data as List<NotificationsEmpty>).map((final e) => (e as NotificationsEmpty).toJson()).toList(),
  NotificationsEmpty_Ocs: (final data) => (data as NotificationsEmpty_Ocs).toJson(),
  List<NotificationsEmpty_Ocs>: (final data) =>
      (data as List<NotificationsEmpty_Ocs>).map((final e) => (e as NotificationsEmpty_Ocs).toJson()).toList(),
  NotificationsPushServerRegistration: (final data) => (data as NotificationsPushServerRegistration).toJson(),
  List<NotificationsPushServerRegistration>: (final data) => (data as List<NotificationsPushServerRegistration>)
      .map((final e) => (e as NotificationsPushServerRegistration).toJson())
      .toList(),
  NotificationsPushServerRegistration_Ocs: (final data) => (data as NotificationsPushServerRegistration_Ocs).toJson(),
  List<NotificationsPushServerRegistration_Ocs>: (final data) => (data as List<NotificationsPushServerRegistration_Ocs>)
      .map((final e) => (e as NotificationsPushServerRegistration_Ocs).toJson())
      .toList(),
  NotificationsPushServerSubscription: (final data) => (data as NotificationsPushServerSubscription).toJson(),
  List<NotificationsPushServerSubscription>: (final data) => (data as List<NotificationsPushServerSubscription>)
      .map((final e) => (e as NotificationsPushServerSubscription).toJson())
      .toList(),
  ProvisioningApiUser: (final data) => (data as ProvisioningApiUser).toJson(),
  List<ProvisioningApiUser>: (final data) =>
      (data as List<ProvisioningApiUser>).map((final e) => (e as ProvisioningApiUser).toJson()).toList(),
  ProvisioningApiUser_Ocs: (final data) => (data as ProvisioningApiUser_Ocs).toJson(),
  List<ProvisioningApiUser_Ocs>: (final data) =>
      (data as List<ProvisioningApiUser_Ocs>).map((final e) => (e as ProvisioningApiUser_Ocs).toJson()).toList(),
  ProvisioningApiUserDetails: (final data) => (data as ProvisioningApiUserDetails).toJson(),
  List<ProvisioningApiUserDetails>: (final data) =>
      (data as List<ProvisioningApiUserDetails>).map((final e) => (e as ProvisioningApiUserDetails).toJson()).toList(),
  ProvisioningApiUserDetails_Quota: (final data) => (data as ProvisioningApiUserDetails_Quota).toJson(),
  List<ProvisioningApiUserDetails_Quota>: (final data) => (data as List<ProvisioningApiUserDetails_Quota>)
      .map((final e) => (e as ProvisioningApiUserDetails_Quota).toJson())
      .toList(),
  ProvisioningApiUserDetails_BackendCapabilities: (final data) =>
      (data as ProvisioningApiUserDetails_BackendCapabilities).toJson(),
  List<ProvisioningApiUserDetails_BackendCapabilities>: (final data) =>
      (data as List<ProvisioningApiUserDetails_BackendCapabilities>)
          .map((final e) => (e as ProvisioningApiUserDetails_BackendCapabilities).toJson())
          .toList(),
  UserStatusFindAllStatuses: (final data) => (data as UserStatusFindAllStatuses).toJson(),
  List<UserStatusFindAllStatuses>: (final data) =>
      (data as List<UserStatusFindAllStatuses>).map((final e) => (e as UserStatusFindAllStatuses).toJson()).toList(),
  UserStatusFindAllStatuses_Ocs: (final data) => (data as UserStatusFindAllStatuses_Ocs).toJson(),
  List<UserStatusFindAllStatuses_Ocs>: (final data) => (data as List<UserStatusFindAllStatuses_Ocs>)
      .map((final e) => (e as UserStatusFindAllStatuses_Ocs).toJson())
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
  UserStatusFindStatus_Ocs: (final data) => (data as UserStatusFindStatus_Ocs).toJson(),
  List<UserStatusFindStatus_Ocs>: (final data) =>
      (data as List<UserStatusFindStatus_Ocs>).map((final e) => (e as UserStatusFindStatus_Ocs).toJson()).toList(),
  UserStatusGetUserStatus: (final data) => (data as UserStatusGetUserStatus).toJson(),
  List<UserStatusGetUserStatus>: (final data) =>
      (data as List<UserStatusGetUserStatus>).map((final e) => (e as UserStatusGetUserStatus).toJson()).toList(),
  UserStatusGetUserStatus_Ocs: (final data) => (data as UserStatusGetUserStatus_Ocs).toJson(),
  List<UserStatusGetUserStatus_Ocs>: (final data) => (data as List<UserStatusGetUserStatus_Ocs>)
      .map((final e) => (e as UserStatusGetUserStatus_Ocs).toJson())
      .toList(),
  UserStatus: (final data) => (data as UserStatus).toJson(),
  List<UserStatus>: (final data) => (data as List<UserStatus>).map((final e) => (e as UserStatus).toJson()).toList(),
  UserStatusPredefinedStatuses: (final data) => (data as UserStatusPredefinedStatuses).toJson(),
  List<UserStatusPredefinedStatuses>: (final data) => (data as List<UserStatusPredefinedStatuses>)
      .map((final e) => (e as UserStatusPredefinedStatuses).toJson())
      .toList(),
  UserStatusPredefinedStatuses_Ocs: (final data) => (data as UserStatusPredefinedStatuses_Ocs).toJson(),
  List<UserStatusPredefinedStatuses_Ocs>: (final data) => (data as List<UserStatusPredefinedStatuses_Ocs>)
      .map((final e) => (e as UserStatusPredefinedStatuses_Ocs).toJson())
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
// coverage:ignore-end
