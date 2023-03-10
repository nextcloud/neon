// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.openapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextcloudCoreServerStatus _$NextcloudCoreServerStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'installed',
      'maintenance',
      'needsDbUpgrade',
      'version',
      'versionstring',
      'edition',
      'productname',
      'extendedSupport'
    ],
  );
  return NextcloudCoreServerStatus(
    installed: json['installed'] as bool,
    maintenance: json['maintenance'] as bool,
    needsDbUpgrade: json['needsDbUpgrade'] as bool,
    version: json['version'] as String,
    versionstring: json['versionstring'] as String,
    edition: json['edition'] as String,
    productname: json['productname'] as String,
    extendedSupport: json['extendedSupport'] as bool,
  );
}

Map<String, dynamic> _$NextcloudCoreServerStatusToJson(NextcloudCoreServerStatus instance) => <String, dynamic>{
      'installed': instance.installed,
      'maintenance': instance.maintenance,
      'needsDbUpgrade': instance.needsDbUpgrade,
      'version': instance.version,
      'versionstring': instance.versionstring,
      'edition': instance.edition,
      'productname': instance.productname,
      'extendedSupport': instance.extendedSupport,
    };

NextcloudOCSMeta _$NextcloudOCSMetaFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['status', 'statuscode', 'message', 'totalitems', 'itemsperpage'],
  );
  return NextcloudOCSMeta(
    status: json['status'] as String,
    statuscode: json['statuscode'] as int,
    message: json['message'] as String?,
    totalitems: json['totalitems'] as String?,
    itemsperpage: json['itemsperpage'] as String?,
  );
}

Map<String, dynamic> _$NextcloudOCSMetaToJson(NextcloudOCSMeta instance) => <String, dynamic>{
      'status': instance.status,
      'statuscode': instance.statuscode,
      'message': instance.message,
      'totalitems': instance.totalitems,
      'itemsperpage': instance.itemsperpage,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Version _$NextcloudCoreServerCapabilities_Ocs_Data_VersionFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['major', 'minor', 'micro', 'string', 'edition', 'extendedSupport'],
  );
  return NextcloudCoreServerCapabilities_Ocs_Data_Version(
    major: json['major'] as int?,
    minor: json['minor'] as int?,
    micro: json['micro'] as int?,
    string: json['string'] as String?,
    edition: json['edition'] as String?,
    extendedSupport: json['extendedSupport'] as bool?,
  );
}

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_VersionToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Version instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'micro': instance.micro,
      'string': instance.string,
      'edition': instance.edition,
      'extendedSupport': instance.extendedSupport,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core(
          pollinterval: json['pollinterval'] as int?,
          webdavRoot: json['webdav-root'] as String?,
          referenceApi: json['reference-api'] as bool?,
          referenceRegex: json['reference-regex'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core instance) =>
    <String, dynamic>{
      'pollinterval': instance.pollinterval,
      'webdav-root': instance.webdavRoot,
      'reference-api': instance.referenceApi,
      'reference-regex': instance.referenceRegex,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce(
          delay: json['delay'] as int?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce instance) =>
    <String, dynamic>{
      'delay': instance.delay,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable(
          size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
          gps: (json['gps'] as List<dynamic>?)?.map((e) => e as String).toList(),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable instance) =>
    <String, dynamic>{
      'size': instance.size,
      'gps': instance.gps,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing(
          url: json['url'] as String?,
          etag: json['etag'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing instance) =>
    <String, dynamic>{
      'url': instance.url,
      'etag': instance.etag,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files(
          bigfilechunking: json['bigfilechunking'] as bool?,
          blacklistedFiles: (json['blacklisted_files'] as List<dynamic>?)?.map((e) => e as String).toList(),
          directEditing: json['directEditing'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(
                  json['directEditing'] as Map<String, dynamic>),
          comments: json['comments'] as bool?,
          undelete: json['undelete'] as bool?,
          versioning: json['versioning'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files instance) =>
    <String, dynamic>{
      'bigfilechunking': instance.bigfilechunking,
      'blacklisted_files': instance.blacklistedFiles,
      'directEditing': instance.directEditing?.toJson(),
      'comments': instance.comments,
      'undelete': instance.undelete,
      'versioning': instance.versioning,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity(
          apiv2: (json['apiv2'] as List<dynamic>?)?.map((e) => e as String).toList(),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity instance) =>
    <String, dynamic>{
      'apiv2': instance.apiv2,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status(
          globalScale: json['globalScale'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status instance) =>
    <String, dynamic>{
      'globalScale': instance.globalScale,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings(
          frontendEnabled: json['frontendEnabled'] as bool?,
          allowedCircles: json['allowedCircles'] as int?,
          allowedUserTypes: json['allowedUserTypes'] as int?,
          membersLimit: json['membersLimit'] as int?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings instance) =>
    <String, dynamic>{
      'frontendEnabled': instance.frontendEnabled,
      'allowedCircles': instance.allowedCircles,
      'allowedUserTypes': instance.allowedUserTypes,
      'membersLimit': instance.membersLimit,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source(
          core: json['core'],
          extra: json['extra'],
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source instance) =>
    <String, dynamic>{
      'core': instance.core,
      'extra': instance.extra,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants(
          flags: json['flags'],
          source: json['source'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
                  json['source'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'source': instance.source?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config(
          coreFlags: (json['coreFlags'] as List<dynamic>?)?.map((e) => e as int).toList(),
          systemFlags: (json['systemFlags'] as List<dynamic>?)?.map((e) => e as int).toList(),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config instance) =>
    <String, dynamic>{
      'coreFlags': instance.coreFlags,
      'systemFlags': instance.systemFlags,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle(
          constants: json['constants'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(
                  json['constants'] as Map<String, dynamic>),
          config: json['config'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(
                  json['config'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle instance) =>
    <String, dynamic>{
      'constants': instance.constants?.toJson(),
      'config': instance.config?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants(
          level: json['level'],
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants instance) =>
    <String, dynamic>{
      'level': instance.level,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member(
          constants: json['constants'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(
                  json['constants'] as Map<String, dynamic>),
          type: json['type'],
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member instance) =>
    <String, dynamic>{
      'constants': instance.constants?.toJson(),
      'type': instance.type,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles(
          version: json['version'] as String?,
          status: json['status'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(
                  json['status'] as Map<String, dynamic>),
          settings: json['settings'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(
                  json['settings'] as Map<String, dynamic>),
          circle: json['circle'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(
                  json['circle'] as Map<String, dynamic>),
          member: json['member'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(
                  json['member'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles instance) =>
    <String, dynamic>{
      'version': instance.version,
      'status': instance.status?.toJson(),
      'settings': instance.settings?.toJson(),
      'circle': instance.circle?.toJson(),
      'member': instance.member?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols(
          webdav: json['webdav'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols instance) =>
    <String, dynamic>{
      'webdav': instance.webdav,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes(
          name: json['name'] as String?,
          shareTypes: (json['shareTypes'] as List<dynamic>?)?.map((e) => e as String).toList(),
          protocols: json['protocols'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
                  json['protocols'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shareTypes': instance.shareTypes,
      'protocols': instance.protocols?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm(
          enabled: json['enabled'] as bool?,
          apiVersion: json['apiVersion'] as String?,
          endPoint: json['endPoint'] as String?,
          resourceTypes: (json['resourceTypes'] as List<dynamic>?)
              ?.map((e) => NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'apiVersion': instance.apiVersion,
      'endPoint': instance.endPoint,
      'resourceTypes': instance.resourceTypes?.map((e) => e.toJson()).toList(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav(
          bulkupload: json['bulkupload'] as String?,
          chunking: json['chunking'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav instance) =>
    <String, dynamic>{
      'bulkupload': instance.bulkupload,
      'chunking': instance.chunking,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password(
          enforced: json['enforced'] as bool?,
          askForOptionalPassword: json['askForOptionalPassword'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password instance) =>
    <String, dynamic>{
      'enforced': instance.enforced,
      'askForOptionalPassword': instance.askForOptionalPassword,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic>
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalToJson(
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal instance) =>
        <String, dynamic>{
          'enabled': instance.enabled,
        };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public(
          enabled: json['enabled'] as bool?,
          password: json['password'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
                  json['password'] as Map<String, dynamic>),
          expireDate: json['expire_date'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
          multipleLinks: json['multiple_links'] as bool?,
          expireDateInternal: json['expire_date_internal'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
                  json['expire_date_internal'] as Map<String, dynamic>),
          expireDateRemote: json['expire_date_remote'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
                  json['expire_date_remote'] as Map<String, dynamic>),
          sendMail: json['send_mail'] as bool?,
          upload: json['upload'] as bool?,
          uploadFilesDrop: json['upload_files_drop'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'password': instance.password?.toJson(),
      'expire_date': instance.expireDate?.toJson(),
      'multiple_links': instance.multipleLinks,
      'expire_date_internal': instance.expireDateInternal?.toJson(),
      'expire_date_remote': instance.expireDateRemote?.toJson(),
      'send_mail': instance.sendMail,
      'upload': instance.upload,
      'upload_files_drop': instance.uploadFilesDrop,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User(
          sendMail: json['send_mail'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User instance) =>
    <String, dynamic>{
      'send_mail': instance.sendMail,
      'expire_date': instance.expireDate?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group(
          enabled: json['enabled'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'expire_date': instance.expireDate?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported(
          enabled: json['enabled'] as bool?,
        );

Map<String,
    dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation(
          outgoing: json['outgoing'] as bool?,
          incoming: json['incoming'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
          expireDateSupported: json['expire_date_supported'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
                  .fromJson(json['expire_date_supported'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation instance) =>
    <String, dynamic>{
      'outgoing': instance.outgoing,
      'incoming': instance.incoming,
      'expire_date': instance.expireDate?.toJson(),
      'expire_date_supported': instance.expireDateSupported?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee(
          queryLookupDefault: json['query_lookup_default'] as bool?,
          alwaysShowUnique: json['always_show_unique'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee instance) =>
    <String, dynamic>{
      'query_lookup_default': instance.queryLookupDefault,
      'always_show_unique': instance.alwaysShowUnique,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic>
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropToJson(
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop instance) =>
        <String, dynamic>{
          'enabled': instance.enabled,
        };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password(
          enabled: json['enabled'] as bool?,
          enforced: json['enforced'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate(
          enabled: json['enabled'] as bool?,
          enforced: json['enforced'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailFromJson(
            Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail(
          enabled: json['enabled'] as bool?,
          sendPasswordByMail: json['send_password_by_mail'] as bool?,
          uploadFilesDrop: json['upload_files_drop'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
                  json['upload_files_drop'] as Map<String, dynamic>),
          password: json['password'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
                  json['password'] as Map<String, dynamic>),
          expireDate: json['expire_date'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'send_password_by_mail': instance.sendPasswordByMail,
      'upload_files_drop': instance.uploadFilesDrop?.toJson(),
      'password': instance.password?.toJson(),
      'expire_date': instance.expireDate?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing(
          apiEnabled: json['api_enabled'] as bool?,
          public: json['public'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(
                  json['public'] as Map<String, dynamic>),
          resharing: json['resharing'] as bool?,
          user: json['user'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(
                  json['user'] as Map<String, dynamic>),
          groupSharing: json['group_sharing'] as bool?,
          group: json['group'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(
                  json['group'] as Map<String, dynamic>),
          defaultPermissions: json['default_permissions'] as int?,
          federation: json['federation'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(
                  json['federation'] as Map<String, dynamic>),
          sharee: json['sharee'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(
                  json['sharee'] as Map<String, dynamic>),
          sharebymail: json['sharebymail'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(
                  json['sharebymail'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing instance) =>
    <String, dynamic>{
      'api_enabled': instance.apiEnabled,
      'public': instance.public?.toJson(),
      'resharing': instance.resharing,
      'user': instance.user?.toJson(),
      'group_sharing': instance.groupSharing,
      'group': instance.group?.toJson(),
      'default_permissions': instance.defaultPermissions,
      'federation': instance.federation?.toJson(),
      'sharee': instance.sharee?.toJson(),
      'sharebymail': instance.sharebymail?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes(
          apiVersion: (json['api_version'] as List<dynamic>?)?.map((e) => e as String).toList(),
          version: json['version'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes instance) =>
    <String, dynamic>{
      'api_version': instance.apiVersion,
      'version': instance.version,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications(
          ocsEndpoints: (json['ocs-endpoints'] as List<dynamic>?)?.map((e) => e as String).toList(),
          push: (json['push'] as List<dynamic>?)?.map((e) => e as String).toList(),
          adminNotifications: (json['admin-notifications'] as List<dynamic>?)?.map((e) => e as String).toList(),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications instance) =>
    <String, dynamic>{
      'ocs-endpoints': instance.ocsEndpoints,
      'push': instance.push,
      'admin-notifications': instance.adminNotifications,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api(
          generate: json['generate'] as String?,
          validate: json['validate'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api instance) =>
    <String, dynamic>{
      'generate': instance.generate,
      'validate': instance.validate,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy(
          minLength: json['minLength'] as int?,
          enforceNonCommonPassword: json['enforceNonCommonPassword'] as bool?,
          enforceNumericCharacters: json['enforceNumericCharacters'] as bool?,
          enforceSpecialCharacters: json['enforceSpecialCharacters'] as bool?,
          enforceUpperLowerCase: json['enforceUpperLowerCase'] as bool?,
          api: json['api'] == null
              ? null
              : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(
                  json['api'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy instance) =>
    <String, dynamic>{
      'minLength': instance.minLength,
      'enforceNonCommonPassword': instance.enforceNonCommonPassword,
      'enforceNumericCharacters': instance.enforceNumericCharacters,
      'enforceSpecialCharacters': instance.enforceSpecialCharacters,
      'enforceUpperLowerCase': instance.enforceUpperLowerCase,
      'api': instance.api?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi(
          version: json['version'] as String?,
          accountPropertyScopesVersion: json['AccountPropertyScopesVersion'] as int?,
          accountPropertyScopesFederatedEnabled: json['AccountPropertyScopesFederatedEnabled'] as bool?,
          accountPropertyScopesPublishedEnabled: json['AccountPropertyScopesPublishedEnabled'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi instance) =>
    <String, dynamic>{
      'version': instance.version,
      'AccountPropertyScopesVersion': instance.accountPropertyScopesVersion,
      'AccountPropertyScopesFederatedEnabled': instance.accountPropertyScopesFederatedEnabled,
      'AccountPropertyScopesPublishedEnabled': instance.accountPropertyScopesPublishedEnabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming(
          name: json['name'] as String?,
          url: json['url'] as String?,
          slogan: json['slogan'] as String?,
          color: json['color'] as String?,
          colorText: json['color-text'] as String?,
          colorElement: json['color-element'] as String?,
          colorElementBright: json['color-element-bright'] as String?,
          colorElementDark: json['color-element-dark'] as String?,
          logo: json['logo'] as String?,
          background: json['background'] as String?,
          backgroundPlain: json['background-plain'] as bool?,
          backgroundDefault: json['background-default'] as bool?,
          logoheader: json['logoheader'] as String?,
          favicon: json['favicon'] as String?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'slogan': instance.slogan,
      'color': instance.color,
      'color-text': instance.colorText,
      'color-element': instance.colorElement,
      'color-element-bright': instance.colorElementBright,
      'color-element-dark': instance.colorElementDark,
      'logo': instance.logo,
      'background': instance.background,
      'background-plain': instance.backgroundPlain,
      'background-default': instance.backgroundDefault,
      'logoheader': instance.logoheader,
      'favicon': instance.favicon,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusFromJson(Map<String, dynamic> json) =>
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus(
          enabled: json['enabled'] as bool?,
          supportsEmoji: json['supports_emoji'] as bool?,
        );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'supports_emoji': instance.supportsEmoji,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['enabled'],
  );
  return NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus(
    enabled: json['enabled'] as bool?,
  );
}

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

NextcloudCoreServerCapabilities_Ocs_Data_Capabilities _$NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesFromJson(
        Map<String, dynamic> json) =>
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities(
      core: json['core'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(json['core'] as Map<String, dynamic>),
      bruteforce: json['bruteforce'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(
              json['bruteforce'] as Map<String, dynamic>),
      metadataAvailable: json['metadataAvailable'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(
              json['metadataAvailable'] as Map<String, dynamic>),
      files: json['files'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(json['files'] as Map<String, dynamic>),
      activity: json['activity'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(
              json['activity'] as Map<String, dynamic>),
      circles: json['circles'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(
              json['circles'] as Map<String, dynamic>),
      ocm: json['ocm'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(json['ocm'] as Map<String, dynamic>),
      dav: json['dav'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(json['dav'] as Map<String, dynamic>),
      filesSharing: json['files_sharing'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(
              json['files_sharing'] as Map<String, dynamic>),
      notes: json['notes'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(json['notes'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
      passwordPolicy: json['password_policy'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(
              json['password_policy'] as Map<String, dynamic>),
      provisioningApi: json['provisioning_api'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(
              json['provisioning_api'] as Map<String, dynamic>),
      theming: json['theming'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(
              json['theming'] as Map<String, dynamic>),
      userStatus: json['user_status'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(
              json['user_status'] as Map<String, dynamic>),
      weatherStatus: json['weather_status'] == null
          ? null
          : NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(
              json['weather_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesToJson(
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities instance) =>
    <String, dynamic>{
      'core': instance.core?.toJson(),
      'bruteforce': instance.bruteforce?.toJson(),
      'metadataAvailable': instance.metadataAvailable?.toJson(),
      'files': instance.files?.toJson(),
      'activity': instance.activity?.toJson(),
      'circles': instance.circles?.toJson(),
      'ocm': instance.ocm?.toJson(),
      'dav': instance.dav?.toJson(),
      'files_sharing': instance.filesSharing?.toJson(),
      'notes': instance.notes?.toJson(),
      'notifications': instance.notifications?.toJson(),
      'password_policy': instance.passwordPolicy?.toJson(),
      'provisioning_api': instance.provisioningApi?.toJson(),
      'theming': instance.theming?.toJson(),
      'user_status': instance.userStatus?.toJson(),
      'weather_status': instance.weatherStatus?.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs_Data _$NextcloudCoreServerCapabilities_Ocs_DataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['version', 'capabilities'],
  );
  return NextcloudCoreServerCapabilities_Ocs_Data(
    version: NextcloudCoreServerCapabilities_Ocs_Data_Version.fromJson(json['version'] as Map<String, dynamic>),
    capabilities:
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities.fromJson(json['capabilities'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudCoreServerCapabilities_Ocs_DataToJson(
        NextcloudCoreServerCapabilities_Ocs_Data instance) =>
    <String, dynamic>{
      'version': instance.version.toJson(),
      'capabilities': instance.capabilities.toJson(),
    };

NextcloudCoreServerCapabilities_Ocs _$NextcloudCoreServerCapabilities_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudCoreServerCapabilities_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudCoreServerCapabilities_Ocs_Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudCoreServerCapabilities_OcsToJson(NextcloudCoreServerCapabilities_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudCoreServerCapabilities _$NextcloudCoreServerCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudCoreServerCapabilities(
    ocs: NextcloudCoreServerCapabilities_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudCoreServerCapabilitiesToJson(NextcloudCoreServerCapabilities instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudCoreNavigationApps_Ocs_Data _$NextcloudCoreNavigationApps_Ocs_DataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'order', 'href', 'icon', 'type', 'name', 'active', 'classes', 'unread'],
  );
  return NextcloudCoreNavigationApps_Ocs_Data(
    id: json['id'] as String,
    order: NextcloudCoreNavigationApps_Ocs_Data_Order.fromJson(json['order']),
    href: json['href'] as String,
    icon: json['icon'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    active: json['active'] as bool,
    classes: json['classes'] as String,
    unread: json['unread'] as int,
  );
}

Map<String, dynamic> _$NextcloudCoreNavigationApps_Ocs_DataToJson(NextcloudCoreNavigationApps_Ocs_Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order.toJson(),
      'href': instance.href,
      'icon': instance.icon,
      'type': instance.type,
      'name': instance.name,
      'active': instance.active,
      'classes': instance.classes,
      'unread': instance.unread,
    };

NextcloudCoreNavigationApps_Ocs _$NextcloudCoreNavigationApps_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudCoreNavigationApps_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>)
        .map((e) => NextcloudCoreNavigationApps_Ocs_Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudCoreNavigationApps_OcsToJson(NextcloudCoreNavigationApps_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NextcloudCoreNavigationApps _$NextcloudCoreNavigationAppsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudCoreNavigationApps(
    ocs: NextcloudCoreNavigationApps_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudCoreNavigationAppsToJson(NextcloudCoreNavigationApps instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudCoreLoginFlowInit_Poll _$NextcloudCoreLoginFlowInit_PollFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['token', 'endpoint'],
  );
  return NextcloudCoreLoginFlowInit_Poll(
    token: json['token'] as String,
    endpoint: json['endpoint'] as String,
  );
}

Map<String, dynamic> _$NextcloudCoreLoginFlowInit_PollToJson(NextcloudCoreLoginFlowInit_Poll instance) =>
    <String, dynamic>{
      'token': instance.token,
      'endpoint': instance.endpoint,
    };

NextcloudCoreLoginFlowInit _$NextcloudCoreLoginFlowInitFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['poll', 'login'],
  );
  return NextcloudCoreLoginFlowInit(
    poll: NextcloudCoreLoginFlowInit_Poll.fromJson(json['poll'] as Map<String, dynamic>),
    login: json['login'] as String,
  );
}

Map<String, dynamic> _$NextcloudCoreLoginFlowInitToJson(NextcloudCoreLoginFlowInit instance) => <String, dynamic>{
      'poll': instance.poll.toJson(),
      'login': instance.login,
    };

NextcloudCoreLoginFlowResult _$NextcloudCoreLoginFlowResultFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['server', 'loginName', 'appPassword'],
  );
  return NextcloudCoreLoginFlowResult(
    server: json['server'] as String,
    loginName: json['loginName'] as String,
    appPassword: json['appPassword'] as String,
  );
}

Map<String, dynamic> _$NextcloudCoreLoginFlowResultToJson(NextcloudCoreLoginFlowResult instance) => <String, dynamic>{
      'server': instance.server,
      'loginName': instance.loginName,
      'appPassword': instance.appPassword,
    };

NextcloudCoreAutocompleteResult_Ocs_Data _$NextcloudCoreAutocompleteResult_Ocs_DataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'label', 'icon', 'source', 'status', 'subline', 'shareWithDisplayNameUnique'],
  );
  return NextcloudCoreAutocompleteResult_Ocs_Data(
    id: json['id'] as String,
    label: json['label'] as String,
    icon: json['icon'] as String,
    source: json['source'] as String,
    status: NextcloudCoreAutocompleteResult_Ocs_Data_Status.fromJson(json['status']),
    subline: json['subline'] as String,
    shareWithDisplayNameUnique: json['shareWithDisplayNameUnique'] as String,
  );
}

Map<String, dynamic> _$NextcloudCoreAutocompleteResult_Ocs_DataToJson(
        NextcloudCoreAutocompleteResult_Ocs_Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'icon': instance.icon,
      'source': instance.source,
      'status': instance.status.toJson(),
      'subline': instance.subline,
      'shareWithDisplayNameUnique': instance.shareWithDisplayNameUnique,
    };

NextcloudCoreAutocompleteResult_Ocs _$NextcloudCoreAutocompleteResult_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudCoreAutocompleteResult_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>)
        .map((e) => NextcloudCoreAutocompleteResult_Ocs_Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudCoreAutocompleteResult_OcsToJson(NextcloudCoreAutocompleteResult_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NextcloudCoreAutocompleteResult _$NextcloudCoreAutocompleteResultFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudCoreAutocompleteResult(
    ocs: NextcloudCoreAutocompleteResult_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudCoreAutocompleteResultToJson(NextcloudCoreAutocompleteResult instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudNewsSupportedAPIVersions _$NextcloudNewsSupportedAPIVersionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['apiLevels'],
  );
  return NextcloudNewsSupportedAPIVersions(
    apiLevels: (json['apiLevels'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsSupportedAPIVersionsToJson(NextcloudNewsSupportedAPIVersions instance) =>
    <String, dynamic>{
      'apiLevels': instance.apiLevels,
    };

NextcloudNewsArticle _$NextcloudNewsArticleFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'guid',
      'guidHash',
      'url',
      'title',
      'author',
      'pubDate',
      'updatedDate',
      'body',
      'enclosureMime',
      'enclosureLink',
      'mediaThumbnail',
      'mediaDescription',
      'feedId',
      'unread',
      'starred',
      'lastModified',
      'rtl',
      'fingerprint',
      'contentHash'
    ],
  );
  return NextcloudNewsArticle(
    id: json['id'] as int,
    guid: json['guid'] as String,
    guidHash: json['guidHash'] as String,
    url: json['url'] as String?,
    title: json['title'] as String,
    author: json['author'] as String?,
    pubDate: json['pubDate'] as int,
    updatedDate: json['updatedDate'] as int?,
    body: json['body'] as String,
    enclosureMime: json['enclosureMime'] as String?,
    enclosureLink: json['enclosureLink'] as String?,
    mediaThumbnail: json['mediaThumbnail'] as String?,
    mediaDescription: json['mediaDescription'] as String?,
    feedId: json['feedId'] as int,
    unread: json['unread'] as bool,
    starred: json['starred'] as bool,
    lastModified: json['lastModified'] as int,
    rtl: json['rtl'] as bool,
    fingerprint: json['fingerprint'] as String,
    contentHash: json['contentHash'] as String,
  );
}

Map<String, dynamic> _$NextcloudNewsArticleToJson(NextcloudNewsArticle instance) => <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'guidHash': instance.guidHash,
      'url': instance.url,
      'title': instance.title,
      'author': instance.author,
      'pubDate': instance.pubDate,
      'updatedDate': instance.updatedDate,
      'body': instance.body,
      'enclosureMime': instance.enclosureMime,
      'enclosureLink': instance.enclosureLink,
      'mediaThumbnail': instance.mediaThumbnail,
      'mediaDescription': instance.mediaDescription,
      'feedId': instance.feedId,
      'unread': instance.unread,
      'starred': instance.starred,
      'lastModified': instance.lastModified,
      'rtl': instance.rtl,
      'fingerprint': instance.fingerprint,
      'contentHash': instance.contentHash,
    };

NextcloudNewsFeed _$NextcloudNewsFeedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'url',
      'title',
      'faviconLink',
      'added',
      'folderId',
      'unreadCount',
      'ordering',
      'link',
      'pinned',
      'updateErrorCount',
      'lastUpdateError',
      'items'
    ],
  );
  return NextcloudNewsFeed(
    id: json['id'] as int,
    url: json['url'] as String,
    title: json['title'] as String,
    faviconLink: json['faviconLink'] as String?,
    added: json['added'] as int,
    folderId: json['folderId'] as int?,
    unreadCount: json['unreadCount'] as int?,
    ordering: json['ordering'] as int,
    link: json['link'] as String?,
    pinned: json['pinned'] as bool,
    updateErrorCount: json['updateErrorCount'] as int,
    lastUpdateError: json['lastUpdateError'] as String?,
    items:
        (json['items'] as List<dynamic>).map((e) => NextcloudNewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsFeedToJson(NextcloudNewsFeed instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'faviconLink': instance.faviconLink,
      'added': instance.added,
      'folderId': instance.folderId,
      'unreadCount': instance.unreadCount,
      'ordering': instance.ordering,
      'link': instance.link,
      'pinned': instance.pinned,
      'updateErrorCount': instance.updateErrorCount,
      'lastUpdateError': instance.lastUpdateError,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

NextcloudNewsFolder _$NextcloudNewsFolderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'name', 'opened', 'feeds'],
  );
  return NextcloudNewsFolder(
    id: json['id'] as int,
    name: json['name'] as String,
    opened: json['opened'] as bool,
    feeds: (json['feeds'] as List<dynamic>).map((e) => NextcloudNewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsFolderToJson(NextcloudNewsFolder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'opened': instance.opened,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
    };

NextcloudNewsListFolders _$NextcloudNewsListFoldersFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['folders'],
  );
  return NextcloudNewsListFolders(
    folders:
        (json['folders'] as List<dynamic>).map((e) => NextcloudNewsFolder.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsListFoldersToJson(NextcloudNewsListFolders instance) => <String, dynamic>{
      'folders': instance.folders.map((e) => e.toJson()).toList(),
    };

NextcloudNewsListFeeds _$NextcloudNewsListFeedsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['starredCount', 'newestItemId', 'feeds'],
  );
  return NextcloudNewsListFeeds(
    starredCount: json['starredCount'] as int?,
    newestItemId: json['newestItemId'] as int?,
    feeds: (json['feeds'] as List<dynamic>).map((e) => NextcloudNewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsListFeedsToJson(NextcloudNewsListFeeds instance) => <String, dynamic>{
      'starredCount': instance.starredCount,
      'newestItemId': instance.newestItemId,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
    };

NextcloudNewsListArticles _$NextcloudNewsListArticlesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['items'],
  );
  return NextcloudNewsListArticles(
    items:
        (json['items'] as List<dynamic>).map((e) => NextcloudNewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$NextcloudNewsListArticlesToJson(NextcloudNewsListArticles instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

NextcloudNotesNote _$NextcloudNotesNoteFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'id',
      'etag',
      'readonly',
      'content',
      'title',
      'category',
      'favorite',
      'modified',
      'error',
      'errorType'
    ],
  );
  return NextcloudNotesNote(
    id: json['id'] as int,
    etag: json['etag'] as String,
    readonly: json['readonly'] as bool,
    content: json['content'] as String,
    title: json['title'] as String,
    category: json['category'] as String,
    favorite: json['favorite'] as bool,
    modified: json['modified'] as int,
    error: json['error'] as bool,
    errorType: json['errorType'] as String,
  );
}

Map<String, dynamic> _$NextcloudNotesNoteToJson(NextcloudNotesNote instance) => <String, dynamic>{
      'id': instance.id,
      'etag': instance.etag,
      'readonly': instance.readonly,
      'content': instance.content,
      'title': instance.title,
      'category': instance.category,
      'favorite': instance.favorite,
      'modified': instance.modified,
      'error': instance.error,
      'errorType': instance.errorType,
    };

NextcloudNotesSettings _$NextcloudNotesSettingsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['notesPath', 'fileSuffix', 'noteMode'],
  );
  return NextcloudNotesSettings(
    notesPath: json['notesPath'] as String,
    fileSuffix: json['fileSuffix'] as String,
    noteMode: $enumDecode(_$NextcloudNotesSettings_NoteModeEnumMap, json['noteMode']),
  );
}

Map<String, dynamic> _$NextcloudNotesSettingsToJson(NextcloudNotesSettings instance) => <String, dynamic>{
      'notesPath': instance.notesPath,
      'fileSuffix': instance.fileSuffix,
      'noteMode': _$NextcloudNotesSettings_NoteModeEnumMap[instance.noteMode]!,
    };

const _$NextcloudNotesSettings_NoteModeEnumMap = {
  NextcloudNotesSettings_NoteMode.edit: 'edit',
  NextcloudNotesSettings_NoteMode.preview: 'preview',
};

NextcloudNotificationsNotificationAction _$NextcloudNotificationsNotificationActionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['label', 'link', 'type', 'primary'],
  );
  return NextcloudNotificationsNotificationAction(
    label: json['label'] as String,
    link: json['link'] as String,
    type: json['type'] as String,
    primary: json['primary'] as bool?,
  );
}

Map<String, dynamic> _$NextcloudNotificationsNotificationActionToJson(
        NextcloudNotificationsNotificationAction instance) =>
    <String, dynamic>{
      'label': instance.label,
      'link': instance.link,
      'type': instance.type,
      'primary': instance.primary,
    };

NextcloudNotificationsNotification _$NextcloudNotificationsNotificationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'notification_id',
      'app',
      'user',
      'datetime',
      'object_type',
      'object_id',
      'subject',
      'message',
      'link',
      'subjectRich',
      'subjectRichParameters',
      'messageRich',
      'messageRichParameters',
      'icon',
      'actions'
    ],
  );
  return NextcloudNotificationsNotification(
    notificationId: json['notification_id'] as int,
    app: json['app'] as String,
    user: json['user'] as String,
    datetime: json['datetime'] as String,
    objectType: json['object_type'] as String,
    objectId: json['object_id'] as String,
    subject: json['subject'] as String,
    message: json['message'] as String,
    link: json['link'] as String,
    subjectRich: json['subjectRich'] as String,
    subjectRichParameters:
        NextcloudNotificationsNotification_SubjectRichParameters.fromJson(json['subjectRichParameters']),
    messageRich: json['messageRich'] as String,
    messageRichParameters:
        NextcloudNotificationsNotification_MessageRichParameters.fromJson(json['messageRichParameters']),
    icon: json['icon'] as String,
    actions: (json['actions'] as List<dynamic>)
        .map((e) => NextcloudNotificationsNotificationAction.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudNotificationsNotificationToJson(NextcloudNotificationsNotification instance) =>
    <String, dynamic>{
      'notification_id': instance.notificationId,
      'app': instance.app,
      'user': instance.user,
      'datetime': instance.datetime,
      'object_type': instance.objectType,
      'object_id': instance.objectId,
      'subject': instance.subject,
      'message': instance.message,
      'link': instance.link,
      'subjectRich': instance.subjectRich,
      'subjectRichParameters': instance.subjectRichParameters.toJson(),
      'messageRich': instance.messageRich,
      'messageRichParameters': instance.messageRichParameters.toJson(),
      'icon': instance.icon,
      'actions': instance.actions.map((e) => e.toJson()).toList(),
    };

NextcloudNotificationsListNotifications_Ocs _$NextcloudNotificationsListNotifications_OcsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudNotificationsListNotifications_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>)
        .map((e) => NextcloudNotificationsNotification.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudNotificationsListNotifications_OcsToJson(
        NextcloudNotificationsListNotifications_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NextcloudNotificationsListNotifications _$NextcloudNotificationsListNotificationsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudNotificationsListNotifications(
    ocs: NextcloudNotificationsListNotifications_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudNotificationsListNotificationsToJson(
        NextcloudNotificationsListNotifications instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudNotificationsGetNotification_Ocs _$NextcloudNotificationsGetNotification_OcsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudNotificationsGetNotification_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudNotificationsNotification.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudNotificationsGetNotification_OcsToJson(
        NextcloudNotificationsGetNotification_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudNotificationsGetNotification _$NextcloudNotificationsGetNotificationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudNotificationsGetNotification(
    ocs: NextcloudNotificationsGetNotification_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudNotificationsGetNotificationToJson(NextcloudNotificationsGetNotification instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudEmptyOCS_Ocs _$NextcloudEmptyOCS_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudEmptyOCS_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: json['data'] as List<dynamic>,
  );
}

Map<String, dynamic> _$NextcloudEmptyOCS_OcsToJson(NextcloudEmptyOCS_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data,
    };

NextcloudEmptyOCS _$NextcloudEmptyOCSFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudEmptyOCS(
    ocs: NextcloudEmptyOCS_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudEmptyOCSToJson(NextcloudEmptyOCS instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudNotificationsPushServerSubscription _$NextcloudNotificationsPushServerSubscriptionFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['publicKey', 'deviceIdentifier', 'signature', 'message'],
  );
  return NextcloudNotificationsPushServerSubscription(
    publicKey: json['publicKey'] as String,
    deviceIdentifier: json['deviceIdentifier'] as String,
    signature: json['signature'] as String,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$NextcloudNotificationsPushServerSubscriptionToJson(
        NextcloudNotificationsPushServerSubscription instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'deviceIdentifier': instance.deviceIdentifier,
      'signature': instance.signature,
      'message': instance.message,
    };

NextcloudNotificationsPushServerRegistration_Ocs _$NextcloudNotificationsPushServerRegistration_OcsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudNotificationsPushServerRegistration_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudNotificationsPushServerSubscription.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudNotificationsPushServerRegistration_OcsToJson(
        NextcloudNotificationsPushServerRegistration_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudNotificationsPushServerRegistration _$NextcloudNotificationsPushServerRegistrationFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudNotificationsPushServerRegistration(
    ocs: NextcloudNotificationsPushServerRegistration_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudNotificationsPushServerRegistrationToJson(
        NextcloudNotificationsPushServerRegistration instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudProvisioningApiUserDetails_Quota _$NextcloudProvisioningApiUserDetails_QuotaFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['free', 'used', 'total', 'relative', 'quota'],
  );
  return NextcloudProvisioningApiUserDetails_Quota(
    free: json['free'] as int,
    used: json['used'] as int,
    total: json['total'] as int,
    relative: json['relative'] as num,
    quota: json['quota'] as int,
  );
}

Map<String, dynamic> _$NextcloudProvisioningApiUserDetails_QuotaToJson(
        NextcloudProvisioningApiUserDetails_Quota instance) =>
    <String, dynamic>{
      'free': instance.free,
      'used': instance.used,
      'total': instance.total,
      'relative': instance.relative,
      'quota': instance.quota,
    };

NextcloudProvisioningApiUserDetails_BackendCapabilities
    _$NextcloudProvisioningApiUserDetails_BackendCapabilitiesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['setDisplayName', 'setPassword'],
  );
  return NextcloudProvisioningApiUserDetails_BackendCapabilities(
    setDisplayName: json['setDisplayName'] as bool,
    setPassword: json['setPassword'] as bool,
  );
}

Map<String, dynamic> _$NextcloudProvisioningApiUserDetails_BackendCapabilitiesToJson(
        NextcloudProvisioningApiUserDetails_BackendCapabilities instance) =>
    <String, dynamic>{
      'setDisplayName': instance.setDisplayName,
      'setPassword': instance.setPassword,
    };

NextcloudProvisioningApiUserDetails _$NextcloudProvisioningApiUserDetailsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'enabled',
      'storageLocation',
      'id',
      'lastLogin',
      'backend',
      'subadmin',
      'quota',
      'avatarScope',
      'email',
      'emailScope',
      'additional_mail',
      'additional_mailScope',
      'displayname',
      'displaynameScope',
      'phone',
      'phoneScope',
      'address',
      'addressScope',
      'website',
      'websiteScope',
      'twitter',
      'twitterScope',
      'organisation',
      'organisationScope',
      'role',
      'roleScope',
      'headline',
      'headlineScope',
      'biography',
      'biographyScope',
      'profile_enabled',
      'profile_enabledScope',
      'groups',
      'language',
      'locale',
      'notify_email',
      'backendCapabilities',
      'display-name'
    ],
  );
  return NextcloudProvisioningApiUserDetails(
    enabled: json['enabled'] as bool?,
    storageLocation: json['storageLocation'] as String?,
    id: json['id'] as String,
    lastLogin: json['lastLogin'] as int,
    backend: json['backend'] as String,
    subadmin: (json['subadmin'] as List<dynamic>).map((e) => e as String).toList(),
    quota: NextcloudProvisioningApiUserDetails_Quota.fromJson(json['quota'] as Map<String, dynamic>),
    avatarScope: json['avatarScope'] as String,
    email: json['email'] as String?,
    emailScope: json['emailScope'] as String,
    additionalMail: (json['additional_mail'] as List<dynamic>).map((e) => e as String).toList(),
    additionalMailScope: (json['additional_mailScope'] as List<dynamic>).map((e) => e as String).toList(),
    displayname: json['displayname'] as String?,
    displaynameScope: json['displaynameScope'] as String,
    phone: json['phone'] as String,
    phoneScope: json['phoneScope'] as String,
    address: json['address'] as String,
    addressScope: json['addressScope'] as String,
    website: json['website'] as String,
    websiteScope: json['websiteScope'] as String,
    twitter: json['twitter'] as String,
    twitterScope: json['twitterScope'] as String,
    organisation: json['organisation'] as String,
    organisationScope: json['organisationScope'] as String,
    role: json['role'] as String,
    roleScope: json['roleScope'] as String,
    headline: json['headline'] as String,
    headlineScope: json['headlineScope'] as String,
    biography: json['biography'] as String,
    biographyScope: json['biographyScope'] as String,
    profileEnabled: json['profile_enabled'] as String,
    profileEnabledScope: json['profile_enabledScope'] as String,
    groups: (json['groups'] as List<dynamic>).map((e) => e as String).toList(),
    language: json['language'] as String,
    locale: json['locale'] as String,
    notifyEmail: json['notify_email'] as String?,
    backendCapabilities: NextcloudProvisioningApiUserDetails_BackendCapabilities.fromJson(
        json['backendCapabilities'] as Map<String, dynamic>),
    displayName: json['display-name'] as String?,
  );
}

Map<String, dynamic> _$NextcloudProvisioningApiUserDetailsToJson(NextcloudProvisioningApiUserDetails instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'storageLocation': instance.storageLocation,
      'id': instance.id,
      'lastLogin': instance.lastLogin,
      'backend': instance.backend,
      'subadmin': instance.subadmin,
      'quota': instance.quota.toJson(),
      'avatarScope': instance.avatarScope,
      'email': instance.email,
      'emailScope': instance.emailScope,
      'additional_mail': instance.additionalMail,
      'additional_mailScope': instance.additionalMailScope,
      'displayname': instance.displayname,
      'displaynameScope': instance.displaynameScope,
      'phone': instance.phone,
      'phoneScope': instance.phoneScope,
      'address': instance.address,
      'addressScope': instance.addressScope,
      'website': instance.website,
      'websiteScope': instance.websiteScope,
      'twitter': instance.twitter,
      'twitterScope': instance.twitterScope,
      'organisation': instance.organisation,
      'organisationScope': instance.organisationScope,
      'role': instance.role,
      'roleScope': instance.roleScope,
      'headline': instance.headline,
      'headlineScope': instance.headlineScope,
      'biography': instance.biography,
      'biographyScope': instance.biographyScope,
      'profile_enabled': instance.profileEnabled,
      'profile_enabledScope': instance.profileEnabledScope,
      'groups': instance.groups,
      'language': instance.language,
      'locale': instance.locale,
      'notify_email': instance.notifyEmail,
      'backendCapabilities': instance.backendCapabilities.toJson(),
      'display-name': instance.displayName,
    };

NextcloudProvisioningApiUser_Ocs _$NextcloudProvisioningApiUser_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudProvisioningApiUser_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudProvisioningApiUserDetails.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudProvisioningApiUser_OcsToJson(NextcloudProvisioningApiUser_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudProvisioningApiUser _$NextcloudProvisioningApiUserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudProvisioningApiUser(
    ocs: NextcloudProvisioningApiUser_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudProvisioningApiUserToJson(NextcloudProvisioningApiUser instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudUnifiedPushProviderCheckResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderCheckResponse200ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderCheckResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success', 'deviceId'],
  );
  return NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson(
    success: json['success'] as bool,
    deviceId: json['deviceId'] as String,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
      'deviceId': instance.deviceId,
    };

NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson
    _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonToJson(
        NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success', 'token'],
  );
  return NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson(
    success: json['success'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };

NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushFromJson(
        Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['version'],
  );
  return NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush(
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushToJson(
        NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['unifiedpush'],
  );
  return NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson(
    unifiedpush: NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(
        json['unifiedpush'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'unifiedpush': instance.unifiedpush.toJson(),
    };

NextcloudUnifiedPushProviderPushResponse201ApplicationJson
    _$NextcloudUnifiedPushProviderPushResponse201ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['success'],
  );
  return NextcloudUnifiedPushProviderPushResponse201ApplicationJson(
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderPushResponse201ApplicationJsonToJson(
        NextcloudUnifiedPushProviderPushResponse201ApplicationJson instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushFromJson(
        Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['gateway'],
  );
  return NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush(
    gateway: json['gateway'] as String,
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushToJson(
        NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush instance) =>
    <String, dynamic>{
      'gateway': instance.gateway,
    };

NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['unifiedpush'],
  );
  return NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson(
    unifiedpush: NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.fromJson(
        json['unifiedpush'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'unifiedpush': instance.unifiedpush.toJson(),
    };

NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson
    _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['rejected'],
  );
  return NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson(
    rejected: (json['rejected'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonToJson(
        NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson instance) =>
    <String, dynamic>{
      'rejected': instance.rejected,
    };

NextcloudUserStatusClearAt _$NextcloudUserStatusClearAtFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['type', 'time'],
  );
  return NextcloudUserStatusClearAt(
    type: $enumDecode(_$NextcloudUserStatusClearAt_TypeEnumMap, json['type']),
    time: NextcloudUserStatusClearAt_Time.fromJson(json['time']),
  );
}

Map<String, dynamic> _$NextcloudUserStatusClearAtToJson(NextcloudUserStatusClearAt instance) => <String, dynamic>{
      'type': _$NextcloudUserStatusClearAt_TypeEnumMap[instance.type]!,
      'time': instance.time.toJson(),
    };

const _$NextcloudUserStatusClearAt_TypeEnumMap = {
  NextcloudUserStatusClearAt_Type.period: 'period',
  NextcloudUserStatusClearAt_Type.endOf: 'end-of',
};

NextcloudUserStatusPublicStatus _$NextcloudUserStatusPublicStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['userId', 'message', 'icon', 'clearAt', 'status'],
  );
  return NextcloudUserStatusPublicStatus(
    userId: json['userId'] as String,
    message: json['message'] as String?,
    icon: json['icon'] as String?,
    clearAt: NextcloudUserStatusPublicStatus_ClearAt.fromJson(json['clearAt']),
    status: $enumDecode(_$NextcloudUserStatusTypeEnumMap, json['status']),
  );
}

Map<String, dynamic> _$NextcloudUserStatusPublicStatusToJson(NextcloudUserStatusPublicStatus instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'icon': instance.icon,
      'clearAt': instance.clearAt.toJson(),
      'status': _$NextcloudUserStatusTypeEnumMap[instance.status]!,
    };

const _$NextcloudUserStatusTypeEnumMap = {
  NextcloudUserStatusType.online: 'online',
  NextcloudUserStatusType.offline: 'offline',
  NextcloudUserStatusType.dnd: 'dnd',
  NextcloudUserStatusType.away: 'away',
  NextcloudUserStatusType.invisible: 'invisible',
};

NextcloudUserStatusGetPublicStatuses_Ocs _$NextcloudUserStatusGetPublicStatuses_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudUserStatusGetPublicStatuses_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>)
        .map((e) => NextcloudUserStatusPublicStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetPublicStatuses_OcsToJson(
        NextcloudUserStatusGetPublicStatuses_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NextcloudUserStatusGetPublicStatuses _$NextcloudUserStatusGetPublicStatusesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudUserStatusGetPublicStatuses(
    ocs: NextcloudUserStatusGetPublicStatuses_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetPublicStatusesToJson(NextcloudUserStatusGetPublicStatuses instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudUserStatusGetPublicStatus_Ocs _$NextcloudUserStatusGetPublicStatus_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudUserStatusGetPublicStatus_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudUserStatusGetPublicStatus_Ocs_Data.fromJson(json['data']),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetPublicStatus_OcsToJson(NextcloudUserStatusGetPublicStatus_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudUserStatusGetPublicStatus _$NextcloudUserStatusGetPublicStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudUserStatusGetPublicStatus(
    ocs: NextcloudUserStatusGetPublicStatus_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetPublicStatusToJson(NextcloudUserStatusGetPublicStatus instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudUserStatusStatus _$NextcloudUserStatusStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'userId',
      'message',
      'messageId',
      'messageIsPredefined',
      'icon',
      'clearAt',
      'status',
      'statusIsUserDefined'
    ],
  );
  return NextcloudUserStatusStatus(
    userId: json['userId'] as String,
    message: json['message'] as String?,
    messageId: json['messageId'] as String?,
    messageIsPredefined: json['messageIsPredefined'] as bool,
    icon: json['icon'] as String?,
    clearAt: NextcloudUserStatusStatus_ClearAt.fromJson(json['clearAt']),
    status: $enumDecode(_$NextcloudUserStatusTypeEnumMap, json['status']),
    statusIsUserDefined: json['statusIsUserDefined'] as bool,
  );
}

Map<String, dynamic> _$NextcloudUserStatusStatusToJson(NextcloudUserStatusStatus instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'messageId': instance.messageId,
      'messageIsPredefined': instance.messageIsPredefined,
      'icon': instance.icon,
      'clearAt': instance.clearAt.toJson(),
      'status': _$NextcloudUserStatusTypeEnumMap[instance.status]!,
      'statusIsUserDefined': instance.statusIsUserDefined,
    };

NextcloudUserStatusGetStatus_Ocs _$NextcloudUserStatusGetStatus_OcsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudUserStatusGetStatus_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: NextcloudUserStatusGetStatus_Ocs_Data.fromJson(json['data']),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetStatus_OcsToJson(NextcloudUserStatusGetStatus_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NextcloudUserStatusGetStatus _$NextcloudUserStatusGetStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudUserStatusGetStatus(
    ocs: NextcloudUserStatusGetStatus_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUserStatusGetStatusToJson(NextcloudUserStatusGetStatus instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudUserStatusPredefinedStatus _$NextcloudUserStatusPredefinedStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'icon', 'message', 'clearAt'],
  );
  return NextcloudUserStatusPredefinedStatus(
    id: json['id'] as String,
    icon: json['icon'] as String,
    message: json['message'] as String,
    clearAt: NextcloudUserStatusPredefinedStatus_ClearAt.fromJson(json['clearAt']),
  );
}

Map<String, dynamic> _$NextcloudUserStatusPredefinedStatusToJson(NextcloudUserStatusPredefinedStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'message': instance.message,
      'clearAt': instance.clearAt.toJson(),
    };

NextcloudUserStatusPredefinedStatuses_Ocs _$NextcloudUserStatusPredefinedStatuses_OcsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['meta', 'data'],
  );
  return NextcloudUserStatusPredefinedStatuses_Ocs(
    meta: NextcloudOCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
    data: (json['data'] as List<dynamic>)
        .map((e) => NextcloudUserStatusPredefinedStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NextcloudUserStatusPredefinedStatuses_OcsToJson(
        NextcloudUserStatusPredefinedStatuses_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NextcloudUserStatusPredefinedStatuses _$NextcloudUserStatusPredefinedStatusesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['ocs'],
  );
  return NextcloudUserStatusPredefinedStatuses(
    ocs: NextcloudUserStatusPredefinedStatuses_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NextcloudUserStatusPredefinedStatusesToJson(NextcloudUserStatusPredefinedStatuses instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NextcloudNotificationsNotificationDecryptedSubject _$NextcloudNotificationsNotificationDecryptedSubjectFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['nid', 'app', 'subject', 'type', 'id', 'delete', 'delete-all'],
  );
  return NextcloudNotificationsNotificationDecryptedSubject(
    nid: json['nid'] as int?,
    app: json['app'] as String?,
    subject: json['subject'] as String?,
    type: json['type'] as String?,
    id: json['id'] as String?,
    delete: json['delete'] as bool?,
    deleteAll: json['delete-all'] as bool?,
  );
}

Map<String, dynamic> _$NextcloudNotificationsNotificationDecryptedSubjectToJson(
        NextcloudNotificationsNotificationDecryptedSubject instance) =>
    <String, dynamic>{
      'nid': instance.nid,
      'app': instance.app,
      'subject': instance.subject,
      'type': instance.type,
      'id': instance.id,
      'delete': instance.delete,
      'delete-all': instance.deleteAll,
    };
