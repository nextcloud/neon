// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.openapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreServerStatus _$CoreServerStatusFromJson(Map<String, dynamic> json) => CoreServerStatus(
      installed: json['installed'] as bool,
      maintenance: json['maintenance'] as bool,
      needsDbUpgrade: json['needsDbUpgrade'] as bool,
      version: json['version'] as String,
      versionstring: json['versionstring'] as String,
      edition: json['edition'] as String,
      productname: json['productname'] as String,
      extendedSupport: json['extendedSupport'] as bool,
    );

Map<String, dynamic> _$CoreServerStatusToJson(CoreServerStatus instance) => <String, dynamic>{
      'installed': instance.installed,
      'maintenance': instance.maintenance,
      'needsDbUpgrade': instance.needsDbUpgrade,
      'version': instance.version,
      'versionstring': instance.versionstring,
      'edition': instance.edition,
      'productname': instance.productname,
      'extendedSupport': instance.extendedSupport,
    };

OCSMeta _$OCSMetaFromJson(Map<String, dynamic> json) => OCSMeta(
      status: json['status'] as String,
      statuscode: json['statuscode'] as int,
      message: json['message'] as String?,
      totalitems: json['totalitems'] as String,
      itemsperpage: json['itemsperpage'] as String,
    );

Map<String, dynamic> _$OCSMetaToJson(OCSMeta instance) => <String, dynamic>{
      'status': instance.status,
      'statuscode': instance.statuscode,
      'message': instance.message,
      'totalitems': instance.totalitems,
      'itemsperpage': instance.itemsperpage,
    };

CoreServerCapabilities_Ocs_Data_Version _$CoreServerCapabilities_Ocs_Data_VersionFromJson(Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Version(
      major: json['major'] as int,
      minor: json['minor'] as int,
      micro: json['micro'] as int,
      string: json['string'] as String,
      edition: json['edition'] as String,
      extendedSupport: json['extendedSupport'] as bool,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_VersionToJson(
        CoreServerCapabilities_Ocs_Data_Version instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'micro': instance.micro,
      'string': instance.string,
      'edition': instance.edition,
      'extendedSupport': instance.extendedSupport,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Core _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Core(
      pollinterval: json['pollinterval'] as int,
      webdavRoot: json['webdav-root'] as String,
      referenceApi: json['reference-api'] as bool,
      referenceRegex: json['reference-regex'] as String,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_CoreToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Core instance) =>
    <String, dynamic>{
      'pollinterval': instance.pollinterval,
      'webdav-root': instance.webdavRoot,
      'reference-api': instance.referenceApi,
      'reference-regex': instance.referenceRegex,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
    _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce(
          delay: json['delay'] as int,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_BruteforceToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce instance) =>
    <String, dynamic>{
      'delay': instance.delay,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable(
          size: (json['size'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable instance) =>
    <String, dynamic>{
      'size': instance.size,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing(
          url: json['url'] as String,
          etag: json['etag'] as String,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing instance) =>
    <String, dynamic>{
      'url': instance.url,
      'etag': instance.etag,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Files _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Files(
      bigfilechunking: json['bigfilechunking'] as bool,
      blacklistedFiles: (json['blacklisted_files'] as List<dynamic>).map((e) => e as String).toList(),
      directEditing: CoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.fromJson(
          json['directEditing'] as Map<String, dynamic>),
      comments: json['comments'] as bool,
      undelete: json['undelete'] as bool,
      versioning: json['versioning'] as bool,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Files instance) =>
    <String, dynamic>{
      'bigfilechunking': instance.bigfilechunking,
      'blacklisted_files': instance.blacklistedFiles,
      'directEditing': instance.directEditing.toJson(),
      'comments': instance.comments,
      'undelete': instance.undelete,
      'versioning': instance.versioning,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Activity _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Activity(
      apiv2: (json['apiv2'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_ActivityToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Activity instance) =>
    <String, dynamic>{
      'apiv2': instance.apiv2,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status(
          globalScale: json['globalScale'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status instance) =>
    <String, dynamic>{
      'globalScale': instance.globalScale,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings(
          frontendEnabled: json['frontendEnabled'] as bool,
          allowedCircles: json['allowedCircles'] as int,
          allowedUserTypes: json['allowedUserTypes'] as int,
          membersLimit: json['membersLimit'] as int,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings instance) =>
    <String, dynamic>{
      'frontendEnabled': instance.frontendEnabled,
      'allowedCircles': instance.allowedCircles,
      'allowedUserTypes': instance.allowedUserTypes,
      'membersLimit': instance.membersLimit,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source(
          core: json['core'],
          extra: json['extra'],
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source instance) =>
    <String, dynamic>{
      'core': instance.core,
      'extra': instance.extra,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants(
          flags: json['flags'],
          source: CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.fromJson(
              json['source'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'source': instance.source.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config(
          coreFlags: (json['coreFlags'] as List<dynamic>).map((e) => e as int).toList(),
          systemFlags: (json['systemFlags'] as List<dynamic>).map((e) => e as int).toList(),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config instance) =>
    <String, dynamic>{
      'coreFlags': instance.coreFlags,
      'systemFlags': instance.systemFlags,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle(
          constants: CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.fromJson(
              json['constants'] as Map<String, dynamic>),
          config: CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.fromJson(
              json['config'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle instance) =>
    <String, dynamic>{
      'constants': instance.constants.toJson(),
      'config': instance.config.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants(
          level: json['level'],
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants instance) =>
    <String, dynamic>{
      'level': instance.level,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member(
          constants: CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.fromJson(
              json['constants'] as Map<String, dynamic>),
          type: json['type'],
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member instance) =>
    <String, dynamic>{
      'constants': instance.constants.toJson(),
      'type': instance.type,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Circles _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Circles(
      version: json['version'] as String,
      status:
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.fromJson(json['status'] as Map<String, dynamic>),
      settings: CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.fromJson(
          json['settings'] as Map<String, dynamic>),
      circle:
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.fromJson(json['circle'] as Map<String, dynamic>),
      member:
          CoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_CirclesToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Circles instance) =>
    <String, dynamic>{
      'version': instance.version,
      'status': instance.status.toJson(),
      'settings': instance.settings.toJson(),
      'circle': instance.circle.toJson(),
      'member': instance.member.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols(
          webdav: json['webdav'] as String,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols instance) =>
    <String, dynamic>{
      'webdav': instance.webdav,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes(
          name: json['name'] as String,
          shareTypes: (json['shareTypes'] as List<dynamic>).map((e) => e as String).toList(),
          protocols: CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.fromJson(
              json['protocols'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shareTypes': instance.shareTypes,
      'protocols': instance.protocols.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Ocm _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Ocm(
      enabled: json['enabled'] as bool,
      apiVersion: json['apiVersion'] as String,
      endPoint: json['endPoint'] as String,
      resourceTypes: (json['resourceTypes'] as List<dynamic>)
          .map(
              (e) => CoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_OcmToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Ocm instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'apiVersion': instance.apiVersion,
      'endPoint': instance.endPoint,
      'resourceTypes': instance.resourceTypes.map((e) => e.toJson()).toList(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Dav _$CoreServerCapabilities_Ocs_Data_Capabilities_DavFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Dav(
      bulkupload: json['bulkupload'] as String?,
      chunking: json['chunking'] as String,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_DavToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Dav instance) =>
    <String, dynamic>{
      'bulkupload': instance.bulkupload,
      'chunking': instance.chunking,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password(
          enforced: json['enforced'] as bool,
          askForOptionalPassword: json['askForOptionalPassword'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password instance) =>
    <String, dynamic>{
      'enforced': instance.enforced,
      'askForOptionalPassword': instance.askForOptionalPassword,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public(
          enabled: json['enabled'] as bool,
          password: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.fromJson(
              json['password'] as Map<String, dynamic>),
          expireDate: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.fromJson(
              json['expire_date'] as Map<String, dynamic>),
          multipleLinks: json['multiple_links'] as bool,
          expireDateInternal:
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.fromJson(
                  json['expire_date_internal'] as Map<String, dynamic>),
          expireDateRemote: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.fromJson(
              json['expire_date_remote'] as Map<String, dynamic>),
          sendMail: json['send_mail'] as bool,
          upload: json['upload'] as bool,
          uploadFilesDrop: json['upload_files_drop'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'password': instance.password.toJson(),
      'expire_date': instance.expireDate.toJson(),
      'multiple_links': instance.multipleLinks,
      'expire_date_internal': instance.expireDateInternal.toJson(),
      'expire_date_remote': instance.expireDateRemote.toJson(),
      'send_mail': instance.sendMail,
      'upload': instance.upload,
      'upload_files_drop': instance.uploadFilesDrop,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User(
          sendMail: json['send_mail'] as bool,
          expireDate: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.fromJson(
              json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User instance) =>
    <String, dynamic>{
      'send_mail': instance.sendMail,
      'expire_date': instance.expireDate.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group(
          enabled: json['enabled'] as bool,
          expireDate: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.fromJson(
              json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'expire_date': instance.expireDate.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation(
          outgoing: json['outgoing'] as bool,
          incoming: json['incoming'] as bool,
          expireDate: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.fromJson(
              json['expire_date'] as Map<String, dynamic>),
          expireDateSupported:
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.fromJson(
                  json['expire_date_supported'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation instance) =>
    <String, dynamic>{
      'outgoing': instance.outgoing,
      'incoming': instance.incoming,
      'expire_date': instance.expireDate.toJson(),
      'expire_date_supported': instance.expireDateSupported.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee(
          queryLookupDefault: json['query_lookup_default'] as bool,
          alwaysShowUnique: json['always_show_unique'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee instance) =>
    <String, dynamic>{
      'query_lookup_default': instance.queryLookupDefault,
      'always_show_unique': instance.alwaysShowUnique,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password(
          enabled: json['enabled'] as bool,
          enforced: json['enforced'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate(
          enabled: json['enabled'] as bool,
          enforced: json['enforced'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail(
          enabled: json['enabled'] as bool,
          sendPasswordByMail: json['send_password_by_mail'] as bool,
          uploadFilesDrop:
              CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.fromJson(
                  json['upload_files_drop'] as Map<String, dynamic>),
          password: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.fromJson(
              json['password'] as Map<String, dynamic>),
          expireDate: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.fromJson(
              json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'send_password_by_mail': instance.sendPasswordByMail,
      'upload_files_drop': instance.uploadFilesDrop.toJson(),
      'password': instance.password.toJson(),
      'expire_date': instance.expireDate.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
    _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing(
          apiEnabled: json['api_enabled'] as bool,
          public: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.fromJson(
              json['public'] as Map<String, dynamic>),
          resharing: json['resharing'] as bool,
          user: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.fromJson(
              json['user'] as Map<String, dynamic>),
          groupSharing: json['group_sharing'] as bool,
          group: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.fromJson(
              json['group'] as Map<String, dynamic>),
          defaultPermissions: json['default_permissions'] as int,
          federation: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.fromJson(
              json['federation'] as Map<String, dynamic>),
          sharee: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.fromJson(
              json['sharee'] as Map<String, dynamic>),
          sharebymail: CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.fromJson(
              json['sharebymail'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing instance) =>
    <String, dynamic>{
      'api_enabled': instance.apiEnabled,
      'public': instance.public.toJson(),
      'resharing': instance.resharing,
      'user': instance.user.toJson(),
      'group_sharing': instance.groupSharing,
      'group': instance.group.toJson(),
      'default_permissions': instance.defaultPermissions,
      'federation': instance.federation.toJson(),
      'sharee': instance.sharee.toJson(),
      'sharebymail': instance.sharebymail.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Notes _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Notes(
      apiVersion: (json['api_version'] as List<dynamic>).map((e) => e as String).toList(),
      version: json['version'] as String,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_NotesToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Notes instance) =>
    <String, dynamic>{
      'api_version': instance.apiVersion,
      'version': instance.version,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Notifications
    _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_Notifications(
          ocsEndpoints: (json['ocs-endpoints'] as List<dynamic>).map((e) => e as String).toList(),
          push: (json['push'] as List<dynamic>).map((e) => e as String).toList(),
          adminNotifications: (json['admin-notifications'] as List<dynamic>).map((e) => e as String).toList(),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_NotificationsToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Notifications instance) =>
    <String, dynamic>{
      'ocs-endpoints': instance.ocsEndpoints,
      'push': instance.push,
      'admin-notifications': instance.adminNotifications,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
    _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api(
          generate: json['generate'] as String,
          validate: json['validate'] as String,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api instance) =>
    <String, dynamic>{
      'generate': instance.generate,
      'validate': instance.validate,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy(
          minLength: json['minLength'] as int,
          enforceNonCommonPassword: json['enforceNonCommonPassword'] as bool,
          enforceNumericCharacters: json['enforceNumericCharacters'] as bool,
          enforceSpecialCharacters: json['enforceSpecialCharacters'] as bool,
          enforceUpperLowerCase: json['enforceUpperLowerCase'] as bool,
          api: CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.fromJson(
              json['api'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy instance) =>
    <String, dynamic>{
      'minLength': instance.minLength,
      'enforceNonCommonPassword': instance.enforceNonCommonPassword,
      'enforceNumericCharacters': instance.enforceNumericCharacters,
      'enforceSpecialCharacters': instance.enforceSpecialCharacters,
      'enforceUpperLowerCase': instance.enforceUpperLowerCase,
      'api': instance.api.toJson(),
    };

CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
    _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi(
          version: json['version'] as String,
          accountPropertyScopesVersion: json['AccountPropertyScopesVersion'] as int,
          accountPropertyScopesFederatedEnabled: json['AccountPropertyScopesFederatedEnabled'] as bool,
          accountPropertyScopesPublishedEnabled: json['AccountPropertyScopesPublishedEnabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi instance) =>
    <String, dynamic>{
      'version': instance.version,
      'AccountPropertyScopesVersion': instance.accountPropertyScopesVersion,
      'AccountPropertyScopesFederatedEnabled': instance.accountPropertyScopesFederatedEnabled,
      'AccountPropertyScopesPublishedEnabled': instance.accountPropertyScopesPublishedEnabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_Theming _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities_Theming(
      name: json['name'] as String,
      url: json['url'] as String,
      slogan: json['slogan'] as String,
      color: json['color'] as String,
      colorText: json['color-text'] as String,
      colorElement: json['color-element'] as String,
      colorElementBright: json['color-element-bright'] as String,
      colorElementDark: json['color-element-dark'] as String,
      logo: json['logo'] as String,
      background: json['background'] as String,
      backgroundPlain: json['background-plain'] as bool,
      backgroundDefault: json['background-default'] as bool,
      logoheader: json['logoheader'] as String,
      favicon: json['favicon'] as String,
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_ThemingToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_Theming instance) =>
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

CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
    _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus(
          enabled: json['enabled'] as bool,
          supportsEmoji: json['supports_emoji'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_UserStatusToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'supports_emoji': instance.supportsEmoji,
    };

CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
    _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus(
          enabled: json['enabled'] as bool,
        );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilities_Ocs_Data_Capabilities _$CoreServerCapabilities_Ocs_Data_CapabilitiesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data_Capabilities(
      core: CoreServerCapabilities_Ocs_Data_Capabilities_Core.fromJson(json['core'] as Map<String, dynamic>),
      bruteforce:
          CoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.fromJson(json['bruteforce'] as Map<String, dynamic>),
      metadataAvailable: CoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.fromJson(
          json['metadataAvailable'] as Map<String, dynamic>),
      files: CoreServerCapabilities_Ocs_Data_Capabilities_Files.fromJson(json['files'] as Map<String, dynamic>),
      activity: json['activity'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_Activity.fromJson(json['activity'] as Map<String, dynamic>),
      circles: json['circles'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_Circles.fromJson(json['circles'] as Map<String, dynamic>),
      ocm: CoreServerCapabilities_Ocs_Data_Capabilities_Ocm.fromJson(json['ocm'] as Map<String, dynamic>),
      dav: CoreServerCapabilities_Ocs_Data_Capabilities_Dav.fromJson(json['dav'] as Map<String, dynamic>),
      filesSharing: json['files_sharing'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.fromJson(
              json['files_sharing'] as Map<String, dynamic>),
      notes: json['notes'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_Notes.fromJson(json['notes'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
      passwordPolicy: json['password_policy'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.fromJson(
              json['password_policy'] as Map<String, dynamic>),
      provisioningApi: json['provisioning_api'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.fromJson(
              json['provisioning_api'] as Map<String, dynamic>),
      theming: json['theming'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_Theming.fromJson(json['theming'] as Map<String, dynamic>),
      userStatus: json['user_status'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.fromJson(
              json['user_status'] as Map<String, dynamic>),
      weatherStatus: json['weather_status'] == null
          ? null
          : CoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.fromJson(
              json['weather_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_Data_CapabilitiesToJson(
        CoreServerCapabilities_Ocs_Data_Capabilities instance) =>
    <String, dynamic>{
      'core': instance.core.toJson(),
      'bruteforce': instance.bruteforce.toJson(),
      'metadataAvailable': instance.metadataAvailable.toJson(),
      'files': instance.files.toJson(),
      'activity': instance.activity?.toJson(),
      'circles': instance.circles?.toJson(),
      'ocm': instance.ocm.toJson(),
      'dav': instance.dav.toJson(),
      'files_sharing': instance.filesSharing?.toJson(),
      'notes': instance.notes?.toJson(),
      'notifications': instance.notifications?.toJson(),
      'password_policy': instance.passwordPolicy?.toJson(),
      'provisioning_api': instance.provisioningApi?.toJson(),
      'theming': instance.theming?.toJson(),
      'user_status': instance.userStatus?.toJson(),
      'weather_status': instance.weatherStatus?.toJson(),
    };

CoreServerCapabilities_Ocs_Data _$CoreServerCapabilities_Ocs_DataFromJson(Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs_Data(
      version: CoreServerCapabilities_Ocs_Data_Version.fromJson(json['version'] as Map<String, dynamic>),
      capabilities: CoreServerCapabilities_Ocs_Data_Capabilities.fromJson(json['capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilities_Ocs_DataToJson(CoreServerCapabilities_Ocs_Data instance) =>
    <String, dynamic>{
      'version': instance.version.toJson(),
      'capabilities': instance.capabilities.toJson(),
    };

CoreServerCapabilities_Ocs _$CoreServerCapabilities_OcsFromJson(Map<String, dynamic> json) =>
    CoreServerCapabilities_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: CoreServerCapabilities_Ocs_Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilities_OcsToJson(CoreServerCapabilities_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

CoreServerCapabilities _$CoreServerCapabilitiesFromJson(Map<String, dynamic> json) => CoreServerCapabilities(
      ocs: CoreServerCapabilities_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesToJson(CoreServerCapabilities instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

CoreNavigationApps_Ocs_Data _$CoreNavigationApps_Ocs_DataFromJson(Map<String, dynamic> json) =>
    CoreNavigationApps_Ocs_Data(
      id: json['id'] as String,
      order: CoreNavigationApps_Ocs_Data_Order.fromJson(json['order']),
      href: json['href'] as String,
      icon: json['icon'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
      classes: json['classes'] as String,
      unread: json['unread'] as int,
    );

Map<String, dynamic> _$CoreNavigationApps_Ocs_DataToJson(CoreNavigationApps_Ocs_Data instance) => <String, dynamic>{
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

CoreNavigationApps_Ocs _$CoreNavigationApps_OcsFromJson(Map<String, dynamic> json) => CoreNavigationApps_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CoreNavigationApps_Ocs_Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreNavigationApps_OcsToJson(CoreNavigationApps_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

CoreNavigationApps _$CoreNavigationAppsFromJson(Map<String, dynamic> json) => CoreNavigationApps(
      ocs: CoreNavigationApps_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreNavigationAppsToJson(CoreNavigationApps instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

CoreLoginFlowInit_Poll _$CoreLoginFlowInit_PollFromJson(Map<String, dynamic> json) => CoreLoginFlowInit_Poll(
      token: json['token'] as String,
      endpoint: json['endpoint'] as String,
    );

Map<String, dynamic> _$CoreLoginFlowInit_PollToJson(CoreLoginFlowInit_Poll instance) => <String, dynamic>{
      'token': instance.token,
      'endpoint': instance.endpoint,
    };

CoreLoginFlowInit _$CoreLoginFlowInitFromJson(Map<String, dynamic> json) => CoreLoginFlowInit(
      poll: CoreLoginFlowInit_Poll.fromJson(json['poll'] as Map<String, dynamic>),
      login: json['login'] as String,
    );

Map<String, dynamic> _$CoreLoginFlowInitToJson(CoreLoginFlowInit instance) => <String, dynamic>{
      'poll': instance.poll.toJson(),
      'login': instance.login,
    };

CoreLoginFlowResult _$CoreLoginFlowResultFromJson(Map<String, dynamic> json) => CoreLoginFlowResult(
      server: json['server'] as String,
      loginName: json['loginName'] as String,
      appPassword: json['appPassword'] as String,
    );

Map<String, dynamic> _$CoreLoginFlowResultToJson(CoreLoginFlowResult instance) => <String, dynamic>{
      'server': instance.server,
      'loginName': instance.loginName,
      'appPassword': instance.appPassword,
    };

GetSupportedApiVersions _$GetSupportedApiVersionsFromJson(Map<String, dynamic> json) => GetSupportedApiVersions(
      apiLevels: (json['apiLevels'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetSupportedApiVersionsToJson(GetSupportedApiVersions instance) => <String, dynamic>{
      'apiLevels': instance.apiLevels,
    };

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) => NewsArticle(
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

Map<String, dynamic> _$NewsArticleToJson(NewsArticle instance) => <String, dynamic>{
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

NewsFeed _$NewsFeedFromJson(Map<String, dynamic> json) => NewsFeed(
      id: json['id'] as int,
      url: json['url'] as String,
      title: json['title'] as String,
      faviconLink: json['faviconLink'] as String,
      added: json['added'] as int,
      folderId: json['folderId'] as int?,
      unreadCount: json['unreadCount'] as int?,
      ordering: json['ordering'] as int,
      link: json['link'] as String?,
      pinned: json['pinned'] as bool,
      updateErrorCount: json['updateErrorCount'] as int,
      lastUpdateError: json['lastUpdateError'] as String?,
      items: (json['items'] as List<dynamic>).map((e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsFeedToJson(NewsFeed instance) => <String, dynamic>{
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

NewsFolder _$NewsFolderFromJson(Map<String, dynamic> json) => NewsFolder(
      id: json['id'] as int,
      name: json['name'] as String,
      opened: json['opened'] as bool,
      feeds: (json['feeds'] as List<dynamic>).map((e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsFolderToJson(NewsFolder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'opened': instance.opened,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
    };

NewsListFolders _$NewsListFoldersFromJson(Map<String, dynamic> json) => NewsListFolders(
      folders: (json['folders'] as List<dynamic>).map((e) => NewsFolder.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListFoldersToJson(NewsListFolders instance) => <String, dynamic>{
      'folders': instance.folders.map((e) => e.toJson()).toList(),
    };

NewsListFeeds _$NewsListFeedsFromJson(Map<String, dynamic> json) => NewsListFeeds(
      starredCount: json['starredCount'] as int?,
      newestItemId: json['newestItemId'] as int?,
      feeds: (json['feeds'] as List<dynamic>).map((e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListFeedsToJson(NewsListFeeds instance) => <String, dynamic>{
      'starredCount': instance.starredCount,
      'newestItemId': instance.newestItemId,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
    };

NewsListArticles _$NewsListArticlesFromJson(Map<String, dynamic> json) => NewsListArticles(
      items: (json['items'] as List<dynamic>).map((e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListArticlesToJson(NewsListArticles instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

NotesNote _$NotesNoteFromJson(Map<String, dynamic> json) => NotesNote(
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

Map<String, dynamic> _$NotesNoteToJson(NotesNote instance) => <String, dynamic>{
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

NotesSettings _$NotesSettingsFromJson(Map<String, dynamic> json) => NotesSettings(
      notesPath: json['notesPath'] as String,
      fileSuffix: json['fileSuffix'] as String,
      noteMode: $enumDecode(_$NotesSettings_NoteModeEnumMap, json['noteMode']),
    );

Map<String, dynamic> _$NotesSettingsToJson(NotesSettings instance) => <String, dynamic>{
      'notesPath': instance.notesPath,
      'fileSuffix': instance.fileSuffix,
      'noteMode': _$NotesSettings_NoteModeEnumMap[instance.noteMode]!,
    };

const _$NotesSettings_NoteModeEnumMap = {
  NotesSettings_NoteMode.edit: 'edit',
  NotesSettings_NoteMode.preview: 'preview',
};

NotificationsNotificationAction _$NotificationsNotificationActionFromJson(Map<String, dynamic> json) =>
    NotificationsNotificationAction(
      label: json['label'] as String,
      link: json['link'] as String,
      type: json['type'] as String,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$NotificationsNotificationActionToJson(NotificationsNotificationAction instance) =>
    <String, dynamic>{
      'label': instance.label,
      'link': instance.link,
      'type': instance.type,
      'primary': instance.primary,
    };

NotificationsNotification _$NotificationsNotificationFromJson(Map<String, dynamic> json) => NotificationsNotification(
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
      subjectRichParameters: NotificationsNotification_SubjectRichParameters.fromJson(json['subjectRichParameters']),
      messageRich: json['messageRich'] as String,
      messageRichParameters: NotificationsNotification_MessageRichParameters.fromJson(json['messageRichParameters']),
      icon: json['icon'] as String,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => NotificationsNotificationAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsNotificationToJson(NotificationsNotification instance) => <String, dynamic>{
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

NotificationsListNotifications_Ocs _$NotificationsListNotifications_OcsFromJson(Map<String, dynamic> json) =>
    NotificationsListNotifications_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NotificationsNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsListNotifications_OcsToJson(NotificationsListNotifications_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

NotificationsListNotifications _$NotificationsListNotificationsFromJson(Map<String, dynamic> json) =>
    NotificationsListNotifications(
      ocs: NotificationsListNotifications_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsListNotificationsToJson(NotificationsListNotifications instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NotificationsGetNotification_Ocs _$NotificationsGetNotification_OcsFromJson(Map<String, dynamic> json) =>
    NotificationsGetNotification_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: NotificationsNotification.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsGetNotification_OcsToJson(NotificationsGetNotification_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NotificationsGetNotification _$NotificationsGetNotificationFromJson(Map<String, dynamic> json) =>
    NotificationsGetNotification(
      ocs: NotificationsGetNotification_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsGetNotificationToJson(NotificationsGetNotification instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NotificationsEmpty_Ocs _$NotificationsEmpty_OcsFromJson(Map<String, dynamic> json) => NotificationsEmpty_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NotificationsEmpty_OcsToJson(NotificationsEmpty_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data,
    };

NotificationsEmpty _$NotificationsEmptyFromJson(Map<String, dynamic> json) => NotificationsEmpty(
      ocs: NotificationsEmpty_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsEmptyToJson(NotificationsEmpty instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NotificationsPushServerSubscription _$NotificationsPushServerSubscriptionFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerSubscription(
      publicKey: json['publicKey'] as String,
      deviceIdentifier: json['deviceIdentifier'] as String,
      signature: json['signature'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotificationsPushServerSubscriptionToJson(NotificationsPushServerSubscription instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'deviceIdentifier': instance.deviceIdentifier,
      'signature': instance.signature,
      'message': instance.message,
    };

NotificationsPushServerRegistration_Ocs _$NotificationsPushServerRegistration_OcsFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerRegistration_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: NotificationsPushServerSubscription.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushServerRegistration_OcsToJson(
        NotificationsPushServerRegistration_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

NotificationsPushServerRegistration _$NotificationsPushServerRegistrationFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerRegistration(
      ocs: NotificationsPushServerRegistration_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushServerRegistrationToJson(NotificationsPushServerRegistration instance) =>
    <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

ProvisioningApiUserDetails_Quota _$ProvisioningApiUserDetails_QuotaFromJson(Map<String, dynamic> json) =>
    ProvisioningApiUserDetails_Quota(
      free: json['free'] as int,
      used: json['used'] as int,
      total: json['total'] as int,
      relative: json['relative'] as num,
      quota: json['quota'] as int,
    );

Map<String, dynamic> _$ProvisioningApiUserDetails_QuotaToJson(ProvisioningApiUserDetails_Quota instance) =>
    <String, dynamic>{
      'free': instance.free,
      'used': instance.used,
      'total': instance.total,
      'relative': instance.relative,
      'quota': instance.quota,
    };

ProvisioningApiUserDetails_BackendCapabilities _$ProvisioningApiUserDetails_BackendCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    ProvisioningApiUserDetails_BackendCapabilities(
      setDisplayName: json['setDisplayName'] as bool,
      setPassword: json['setPassword'] as bool,
    );

Map<String, dynamic> _$ProvisioningApiUserDetails_BackendCapabilitiesToJson(
        ProvisioningApiUserDetails_BackendCapabilities instance) =>
    <String, dynamic>{
      'setDisplayName': instance.setDisplayName,
      'setPassword': instance.setPassword,
    };

ProvisioningApiUserDetails _$ProvisioningApiUserDetailsFromJson(Map<String, dynamic> json) =>
    ProvisioningApiUserDetails(
      enabled: json['enabled'] as bool?,
      storageLocation: json['storageLocation'] as String,
      id: json['id'] as String,
      lastLogin: json['lastLogin'] as int,
      backend: json['backend'] as String,
      subadmin: (json['subadmin'] as List<dynamic>).map((e) => e as String).toList(),
      quota: ProvisioningApiUserDetails_Quota.fromJson(json['quota'] as Map<String, dynamic>),
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
      backendCapabilities:
          ProvisioningApiUserDetails_BackendCapabilities.fromJson(json['backendCapabilities'] as Map<String, dynamic>),
      displayName: json['display-name'] as String?,
    );

Map<String, dynamic> _$ProvisioningApiUserDetailsToJson(ProvisioningApiUserDetails instance) => <String, dynamic>{
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

ProvisioningApiUser_Ocs _$ProvisioningApiUser_OcsFromJson(Map<String, dynamic> json) => ProvisioningApiUser_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: ProvisioningApiUserDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvisioningApiUser_OcsToJson(ProvisioningApiUser_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

ProvisioningApiUser _$ProvisioningApiUserFromJson(Map<String, dynamic> json) => ProvisioningApiUser(
      ocs: ProvisioningApiUser_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvisioningApiUserToJson(ProvisioningApiUser instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

UserStatusClearAt _$UserStatusClearAtFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['type', 'time'],
  );
  return UserStatusClearAt(
    type: $enumDecode(_$UserStatusClearAt_TypeEnumMap, json['type']),
    time: UserStatusClearAt_Time.fromJson(json['time']),
  );
}

Map<String, dynamic> _$UserStatusClearAtToJson(UserStatusClearAt instance) => <String, dynamic>{
      'type': _$UserStatusClearAt_TypeEnumMap[instance.type]!,
      'time': instance.time.toJson(),
    };

const _$UserStatusClearAt_TypeEnumMap = {
  UserStatusClearAt_Type.period: 'period',
  UserStatusClearAt_Type.endOf: 'end-of',
};

UserStatusPublicUserStatus _$UserStatusPublicUserStatusFromJson(Map<String, dynamic> json) =>
    UserStatusPublicUserStatus(
      userId: json['userId'] as String,
      message: json['message'] as String?,
      icon: json['icon'] as String?,
      clearAt: UserStatusPublicUserStatus_ClearAt.fromJson(json['clearAt']),
      status: $enumDecode(_$UserStatusTypeEnumMap, json['status']),
    );

Map<String, dynamic> _$UserStatusPublicUserStatusToJson(UserStatusPublicUserStatus instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'icon': instance.icon,
      'clearAt': instance.clearAt.toJson(),
      'status': _$UserStatusTypeEnumMap[instance.status]!,
    };

const _$UserStatusTypeEnumMap = {
  UserStatusType.online: 'online',
  UserStatusType.offline: 'offline',
  UserStatusType.dnd: 'dnd',
  UserStatusType.away: 'away',
  UserStatusType.invisible: 'invisible',
};

UserStatusFindAllStatuses_Ocs _$UserStatusFindAllStatuses_OcsFromJson(Map<String, dynamic> json) =>
    UserStatusFindAllStatuses_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => UserStatusPublicUserStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatusFindAllStatuses_OcsToJson(UserStatusFindAllStatuses_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

UserStatusFindAllStatuses _$UserStatusFindAllStatusesFromJson(Map<String, dynamic> json) => UserStatusFindAllStatuses(
      ocs: UserStatusFindAllStatuses_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusFindAllStatusesToJson(UserStatusFindAllStatuses instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

UserStatusFindStatus_Ocs _$UserStatusFindStatus_OcsFromJson(Map<String, dynamic> json) => UserStatusFindStatus_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: UserStatusFindStatus_Ocs_Data.fromJson(json['data']),
    );

Map<String, dynamic> _$UserStatusFindStatus_OcsToJson(UserStatusFindStatus_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

UserStatusFindStatus _$UserStatusFindStatusFromJson(Map<String, dynamic> json) => UserStatusFindStatus(
      ocs: UserStatusFindStatus_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusFindStatusToJson(UserStatusFindStatus instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) {
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
  return UserStatus(
    userId: json['userId'] as String,
    message: json['message'] as String?,
    messageId: json['messageId'] as String?,
    messageIsPredefined: json['messageIsPredefined'] as bool,
    icon: json['icon'] as String?,
    clearAt: UserStatus_ClearAt.fromJson(json['clearAt']),
    status: $enumDecode(_$UserStatusTypeEnumMap, json['status']),
    statusIsUserDefined: json['statusIsUserDefined'] as bool,
  );
}

Map<String, dynamic> _$UserStatusToJson(UserStatus instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'messageId': instance.messageId,
      'messageIsPredefined': instance.messageIsPredefined,
      'icon': instance.icon,
      'clearAt': instance.clearAt.toJson(),
      'status': _$UserStatusTypeEnumMap[instance.status]!,
      'statusIsUserDefined': instance.statusIsUserDefined,
    };

UserStatusGetUserStatus_Ocs _$UserStatusGetUserStatus_OcsFromJson(Map<String, dynamic> json) =>
    UserStatusGetUserStatus_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: UserStatusGetUserStatus_Ocs_Data.fromJson(json['data']),
    );

Map<String, dynamic> _$UserStatusGetUserStatus_OcsToJson(UserStatusGetUserStatus_Ocs instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

UserStatusGetUserStatus _$UserStatusGetUserStatusFromJson(Map<String, dynamic> json) => UserStatusGetUserStatus(
      ocs: UserStatusGetUserStatus_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusGetUserStatusToJson(UserStatusGetUserStatus instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

UserStatusPredefinedStatus _$UserStatusPredefinedStatusFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatus(
      id: json['id'] as String,
      icon: json['icon'] as String,
      message: json['message'] as String,
      clearAt: UserStatusPredefinedStatus_ClearAt.fromJson(json['clearAt']),
    );

Map<String, dynamic> _$UserStatusPredefinedStatusToJson(UserStatusPredefinedStatus instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'message': instance.message,
      'clearAt': instance.clearAt.toJson(),
    };

UserStatusPredefinedStatuses_Ocs _$UserStatusPredefinedStatuses_OcsFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatuses_Ocs(
      meta: OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => UserStatusPredefinedStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatusPredefinedStatuses_OcsToJson(UserStatusPredefinedStatuses_Ocs instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

UserStatusPredefinedStatuses _$UserStatusPredefinedStatusesFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatuses(
      ocs: UserStatusPredefinedStatuses_Ocs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusPredefinedStatusesToJson(UserStatusPredefinedStatuses instance) => <String, dynamic>{
      'ocs': instance.ocs.toJson(),
    };

NotificationsPushNotificationDecryptedSubject _$NotificationsPushNotificationDecryptedSubjectFromJson(
        Map<String, dynamic> json) =>
    NotificationsPushNotificationDecryptedSubject(
      nid: json['nid'] as int?,
      app: json['app'] as String?,
      subject: json['subject'] as String?,
      type: json['type'] as String?,
      id: json['id'] as String?,
      delete: json['delete'] as bool?,
      deleteAll: json['delete-all'] as bool?,
    );

Map<String, dynamic> _$NotificationsPushNotificationDecryptedSubjectToJson(
        NotificationsPushNotificationDecryptedSubject instance) =>
    <String, dynamic>{
      'nid': instance.nid,
      'app': instance.app,
      'subject': instance.subject,
      'type': instance.type,
      'id': instance.id,
      'delete': instance.delete,
      'delete-all': instance.deleteAll,
    };

NotificationsPushNotification _$NotificationsPushNotificationFromJson(Map<String, dynamic> json) =>
    NotificationsPushNotification(
      accountID: json['accountID'] as String,
      priority: json['priority'] as String,
      type: json['type'] as String,
      subject: NotificationsPushNotificationDecryptedSubject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushNotificationToJson(NotificationsPushNotification instance) => <String, dynamic>{
      'accountID': instance.accountID,
      'priority': instance.priority,
      'type': instance.type,
      'subject': instance.subject.toJson(),
    };
