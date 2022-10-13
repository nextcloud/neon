// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.openapi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreServerStatus _$CoreServerStatusFromJson(Map<String, dynamic> json) => CoreServerStatus(
      installed: json['installed'] as bool?,
      maintenance: json['maintenance'] as bool?,
      needsDbUpgrade: json['needsDbUpgrade'] as bool?,
      version: json['version'] as String?,
      versionstring: json['versionstring'] as String?,
      edition: json['edition'] as String?,
      productname: json['productname'] as String?,
      extendedSupport: json['extendedSupport'] as bool?,
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
      status: json['status'] as String?,
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      totalitems: json['totalitems'] as String?,
      itemsperpage: json['itemsperpage'] as String?,
    );

Map<String, dynamic> _$OCSMetaToJson(OCSMeta instance) => <String, dynamic>{
      'status': instance.status,
      'statuscode': instance.statuscode,
      'message': instance.message,
      'totalitems': instance.totalitems,
      'itemsperpage': instance.itemsperpage,
    };

CoreServerCapabilitiesOcsDataVersion _$CoreServerCapabilitiesOcsDataVersionFromJson(Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataVersion(
      major: json['major'] as int?,
      minor: json['minor'] as int?,
      micro: json['micro'] as int?,
      string: json['string'] as String?,
      edition: json['edition'] as String?,
      extendedSupport: json['extendedSupport'] as bool?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataVersionToJson(CoreServerCapabilitiesOcsDataVersion instance) =>
    <String, dynamic>{
      'major': instance.major,
      'minor': instance.minor,
      'micro': instance.micro,
      'string': instance.string,
      'edition': instance.edition,
      'extendedSupport': instance.extendedSupport,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCore _$CoreServerCapabilitiesOcsDataCapabilitiesCoreFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesCore(
      pollinterval: json['pollinterval'] as int?,
      webdavRoot: json['webdav-root'] as String?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCoreToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCore instance) =>
    <String, dynamic>{
      'pollinterval': instance.pollinterval,
      'webdav-root': instance.webdavRoot,
    };

CoreServerCapabilitiesOcsDataCapabilitiesBruteforce _$CoreServerCapabilitiesOcsDataCapabilitiesBruteforceFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesBruteforce(
      delay: json['delay'] as int?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesBruteforceToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesBruteforce instance) =>
    <String, dynamic>{
      'delay': instance.delay,
    };

CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable
    _$CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable(
          size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable instance) =>
    <String, dynamic>{
      'size': instance.size,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing(
          url: json['url'] as String?,
          etag: json['etag'] as String?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing instance) =>
    <String, dynamic>{
      'url': instance.url,
      'etag': instance.etag,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFiles _$CoreServerCapabilitiesOcsDataCapabilitiesFilesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesFiles(
      bigfilechunking: json['bigfilechunking'] as bool?,
      blacklistedFiles: (json['blacklisted_files'] as List<dynamic>?)?.map((e) => e as String).toList(),
      directEditing: json['directEditing'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditing.fromJson(
              json['directEditing'] as Map<String, dynamic>),
      comments: json['comments'] as bool?,
      undelete: json['undelete'] as bool?,
      versioning: json['versioning'] as bool?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFiles instance) =>
    <String, dynamic>{
      'bigfilechunking': instance.bigfilechunking,
      'blacklisted_files': instance.blacklistedFiles,
      'directEditing': instance.directEditing?.toJson(),
      'comments': instance.comments,
      'undelete': instance.undelete,
      'versioning': instance.versioning,
    };

CoreServerCapabilitiesOcsDataCapabilitiesActivity _$CoreServerCapabilitiesOcsDataCapabilitiesActivityFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesActivity(
      apiv2: (json['apiv2'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesActivityToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesActivity instance) =>
    <String, dynamic>{
      'apiv2': instance.apiv2,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus(
      globalScale: json['globalScale'] as bool?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus instance) =>
    <String, dynamic>{
      'globalScale': instance.globalScale,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings
    _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings(
          frontendEnabled: json['frontendEnabled'] as bool?,
          allowedCircles: json['allowedCircles'] as int?,
          allowedUserTypes: json['allowedUserTypes'] as int?,
          membersLimit: json['membersLimit'] as int?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings instance) =>
    <String, dynamic>{
      'frontendEnabled': instance.frontendEnabled,
      'allowedCircles': instance.allowedCircles,
      'allowedUserTypes': instance.allowedUserTypes,
      'membersLimit': instance.membersLimit,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource
    _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource(
          core: json['core'],
          extra: json['extra'],
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource instance) =>
    <String, dynamic>{
      'core': instance.core,
      'extra': instance.extra,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants
    _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants(
          flags: json['flags'],
          source: json['source'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSource.fromJson(
                  json['source'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'source': instance.source?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig
    _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig(
          coreFlags: (json['coreFlags'] as List<dynamic>?)?.map((e) => e as int).toList(),
          systemFlags: (json['systemFlags'] as List<dynamic>?)?.map((e) => e as int).toList(),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig instance) =>
    <String, dynamic>{
      'coreFlags': instance.coreFlags,
      'systemFlags': instance.systemFlags,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle(
      constants: json['constants'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstants.fromJson(
              json['constants'] as Map<String, dynamic>),
      config: json['config'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfig.fromJson(
              json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle instance) =>
    <String, dynamic>{
      'constants': instance.constants?.toJson(),
      'config': instance.config?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants
    _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants(
          level: json['level'],
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants instance) =>
    <String, dynamic>{
      'level': instance.level,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember(
      constants: json['constants'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstants.fromJson(
              json['constants'] as Map<String, dynamic>),
      type: json['type'],
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember instance) =>
    <String, dynamic>{
      'constants': instance.constants?.toJson(),
      'type': instance.type,
    };

CoreServerCapabilitiesOcsDataCapabilitiesCircles _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesCircles(
      version: json['version'] as String?,
      status: json['status'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesStatus.fromJson(json['status'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesSettings.fromJson(json['settings'] as Map<String, dynamic>),
      circle: json['circle'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesCircle.fromJson(json['circle'] as Map<String, dynamic>),
      member: json['member'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCirclesMember.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesCirclesToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesCircles instance) =>
    <String, dynamic>{
      'version': instance.version,
      'status': instance.status?.toJson(),
      'settings': instance.settings?.toJson(),
      'circle': instance.circle?.toJson(),
      'member': instance.member?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols
    _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols(
          webdav: json['webdav'] as String?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols instance) =>
    <String, dynamic>{
      'webdav': instance.webdav,
    };

CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes
    _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes(
          name: json['name'] as String?,
          shareTypes: (json['shareTypes'] as List<dynamic>?)?.map((e) => e as String).toList(),
          protocols: json['protocols'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocols.fromJson(
                  json['protocols'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shareTypes': instance.shareTypes,
      'protocols': instance.protocols?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesOcm _$CoreServerCapabilitiesOcsDataCapabilitiesOcmFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesOcm(
      enabled: json['enabled'] as bool?,
      apiVersion: json['apiVersion'] as String?,
      endPoint: json['endPoint'] as String?,
      resourceTypes: (json['resourceTypes'] as List<dynamic>?)
          ?.map((e) => CoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesOcmToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesOcm instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'apiVersion': instance.apiVersion,
      'endPoint': instance.endPoint,
      'resourceTypes': instance.resourceTypes?.map((e) => e.toJson()).toList(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesDav _$CoreServerCapabilitiesOcsDataCapabilitiesDavFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesDav(
      chunking: json['chunking'] as String?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesDavToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesDav instance) =>
    <String, dynamic>{
      'chunking': instance.chunking,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword(
          enforced: json['enforced'] as bool?,
          askForOptionalPassword: json['askForOptionalPassword'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword instance) =>
    <String, dynamic>{
      'enforced': instance.enforced,
      'askForOptionalPassword': instance.askForOptionalPassword,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic(
          enabled: json['enabled'] as bool?,
          password: json['password'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPassword.fromJson(
                  json['password'] as Map<String, dynamic>),
          expireDate: json['expire_date'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
          multipleLinks: json['multiple_links'] as bool?,
          expireDateInternal: json['expire_date_internal'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternal.fromJson(
                  json['expire_date_internal'] as Map<String, dynamic>),
          expireDateRemote: json['expire_date_remote'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemote.fromJson(
                  json['expire_date_remote'] as Map<String, dynamic>),
          sendMail: json['send_mail'] as bool?,
          upload: json['upload'] as bool?,
          uploadFilesDrop: json['upload_files_drop'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic instance) =>
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

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser(
          sendMail: json['send_mail'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser instance) =>
    <String, dynamic>{
      'send_mail': instance.sendMail,
      'expire_date': instance.expireDate?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup(
          enabled: json['enabled'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'expire_date': instance.expireDate?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation(
          outgoing: json['outgoing'] as bool?,
          incoming: json['incoming'] as bool?,
          expireDate: json['expire_date'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
          expireDateSupported: json['expire_date_supported'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupported.fromJson(
                  json['expire_date_supported'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation instance) =>
    <String, dynamic>{
      'outgoing': instance.outgoing,
      'incoming': instance.incoming,
      'expire_date': instance.expireDate?.toJson(),
      'expire_date_supported': instance.expireDateSupported?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee(
          queryLookupDefault: json['query_lookup_default'] as bool?,
          alwaysShowUnique: json['always_show_unique'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee instance) =>
    <String, dynamic>{
      'query_lookup_default': instance.queryLookupDefault,
      'always_show_unique': instance.alwaysShowUnique,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropFromJson(
            Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop(
          enabled: json['enabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword(
          enabled: json['enabled'] as bool?,
          enforced: json['enforced'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate(
          enabled: json['enabled'] as bool?,
          enforced: json['enforced'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'enforced': instance.enforced,
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail
    _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail(
          enabled: json['enabled'] as bool?,
          sendPasswordByMail: json['send_password_by_mail'] as bool?,
          uploadFilesDrop: json['upload_files_drop'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDrop.fromJson(
                  json['upload_files_drop'] as Map<String, dynamic>),
          password: json['password'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPassword.fromJson(
                  json['password'] as Map<String, dynamic>),
          expireDate: json['expire_date'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDate.fromJson(
                  json['expire_date'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'send_password_by_mail': instance.sendPasswordByMail,
      'upload_files_drop': instance.uploadFilesDrop?.toJson(),
      'password': instance.password?.toJson(),
      'expire_date': instance.expireDate?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing(
      apiEnabled: json['api_enabled'] as bool?,
      public: json['public'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublic.fromJson(
              json['public'] as Map<String, dynamic>),
      resharing: json['resharing'] as bool?,
      user: json['user'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUser.fromJson(json['user'] as Map<String, dynamic>),
      groupSharing: json['group_sharing'] as bool?,
      group: json['group'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroup.fromJson(json['group'] as Map<String, dynamic>),
      defaultPermissions: json['default_permissions'] as int?,
      federation: json['federation'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederation.fromJson(
              json['federation'] as Map<String, dynamic>),
      sharee: json['sharee'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharee.fromJson(
              json['sharee'] as Map<String, dynamic>),
      sharebymail: json['sharebymail'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymail.fromJson(
              json['sharebymail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesFilesSharingToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing instance) =>
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

CoreServerCapabilitiesOcsDataCapabilitiesNotes _$CoreServerCapabilitiesOcsDataCapabilitiesNotesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesNotes(
      apiVersion: (json['api_version'] as List<dynamic>?)?.map((e) => e as String).toList(),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesNotesToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesNotes instance) =>
    <String, dynamic>{
      'api_version': instance.apiVersion,
      'version': instance.version,
    };

CoreServerCapabilitiesOcsDataCapabilitiesNotifications _$CoreServerCapabilitiesOcsDataCapabilitiesNotificationsFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesNotifications(
      ocsEndpoints: (json['ocs-endpoints'] as List<dynamic>?)?.map((e) => e as String).toList(),
      push: (json['push'] as List<dynamic>?)?.map((e) => e as String).toList(),
      adminNotifications: (json['admin-notifications'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesNotificationsToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesNotifications instance) =>
    <String, dynamic>{
      'ocs-endpoints': instance.ocsEndpoints,
      'push': instance.push,
      'admin-notifications': instance.adminNotifications,
    };

CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi
    _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi(
          generate: json['generate'] as String?,
          validate: json['validate'] as String?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi instance) =>
    <String, dynamic>{
      'generate': instance.generate,
      'validate': instance.validate,
    };

CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy
    _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy(
          minLength: json['minLength'] as int?,
          enforceNonCommonPassword: json['enforceNonCommonPassword'] as bool?,
          enforceNumericCharacters: json['enforceNumericCharacters'] as bool?,
          enforceSpecialCharacters: json['enforceSpecialCharacters'] as bool?,
          enforceUpperLowerCase: json['enforceUpperLowerCase'] as bool?,
          api: json['api'] == null
              ? null
              : CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApi.fromJson(
                  json['api'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy instance) =>
    <String, dynamic>{
      'minLength': instance.minLength,
      'enforceNonCommonPassword': instance.enforceNonCommonPassword,
      'enforceNumericCharacters': instance.enforceNumericCharacters,
      'enforceSpecialCharacters': instance.enforceSpecialCharacters,
      'enforceUpperLowerCase': instance.enforceUpperLowerCase,
      'api': instance.api?.toJson(),
    };

CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi
    _$CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiFromJson(Map<String, dynamic> json) =>
        CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi(
          version: json['version'] as String?,
          accountPropertyScopesVersion: json['AccountPropertyScopesVersion'] as int?,
          accountPropertyScopesFederatedEnabled: json['AccountPropertyScopesFederatedEnabled'] as bool?,
          accountPropertyScopesPublishedEnabled: json['AccountPropertyScopesPublishedEnabled'] as bool?,
        );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi instance) =>
    <String, dynamic>{
      'version': instance.version,
      'AccountPropertyScopesVersion': instance.accountPropertyScopesVersion,
      'AccountPropertyScopesFederatedEnabled': instance.accountPropertyScopesFederatedEnabled,
      'AccountPropertyScopesPublishedEnabled': instance.accountPropertyScopesPublishedEnabled,
    };

CoreServerCapabilitiesOcsDataCapabilitiesTheming _$CoreServerCapabilitiesOcsDataCapabilitiesThemingFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesTheming(
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

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesThemingToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesTheming instance) =>
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

CoreServerCapabilitiesOcsDataCapabilitiesUserStatus _$CoreServerCapabilitiesOcsDataCapabilitiesUserStatusFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesUserStatus(
      enabled: json['enabled'] as bool?,
      supportsEmoji: json['supports_emoji'] as bool?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesUserStatusToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesUserStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'supports_emoji': instance.supportsEmoji,
    };

CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus _$CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus(
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusToJson(
        CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

CoreServerCapabilitiesOcsDataCapabilities _$CoreServerCapabilitiesOcsDataCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsDataCapabilities(
      core: json['core'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCore.fromJson(json['core'] as Map<String, dynamic>),
      bruteforce: json['bruteforce'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesBruteforce.fromJson(json['bruteforce'] as Map<String, dynamic>),
      metadataAvailable: json['metadataAvailable'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailable.fromJson(
              json['metadataAvailable'] as Map<String, dynamic>),
      files: json['files'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFiles.fromJson(json['files'] as Map<String, dynamic>),
      activity: json['activity'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesActivity.fromJson(json['activity'] as Map<String, dynamic>),
      circles: json['circles'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesCircles.fromJson(json['circles'] as Map<String, dynamic>),
      ocm: json['ocm'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesOcm.fromJson(json['ocm'] as Map<String, dynamic>),
      dav: json['dav'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesDav.fromJson(json['dav'] as Map<String, dynamic>),
      filesSharing: json['files_sharing'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesFilesSharing.fromJson(
              json['files_sharing'] as Map<String, dynamic>),
      notes: json['notes'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesNotes.fromJson(json['notes'] as Map<String, dynamic>),
      notifications: json['notifications'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesNotifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
      passwordPolicy: json['password_policy'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicy.fromJson(
              json['password_policy'] as Map<String, dynamic>),
      provisioningApi: json['provisioning_api'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesProvisioningApi.fromJson(
              json['provisioning_api'] as Map<String, dynamic>),
      theming: json['theming'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesTheming.fromJson(json['theming'] as Map<String, dynamic>),
      userStatus: json['user_status'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesUserStatus.fromJson(json['user_status'] as Map<String, dynamic>),
      weatherStatus: json['weather_status'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilitiesWeatherStatus.fromJson(
              json['weather_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataCapabilitiesToJson(
        CoreServerCapabilitiesOcsDataCapabilities instance) =>
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

CoreServerCapabilitiesOcsData _$CoreServerCapabilitiesOcsDataFromJson(Map<String, dynamic> json) =>
    CoreServerCapabilitiesOcsData(
      version: json['version'] == null
          ? null
          : CoreServerCapabilitiesOcsDataVersion.fromJson(json['version'] as Map<String, dynamic>),
      capabilities: json['capabilities'] == null
          ? null
          : CoreServerCapabilitiesOcsDataCapabilities.fromJson(json['capabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsDataToJson(CoreServerCapabilitiesOcsData instance) => <String, dynamic>{
      'version': instance.version?.toJson(),
      'capabilities': instance.capabilities?.toJson(),
    };

CoreServerCapabilitiesOcs _$CoreServerCapabilitiesOcsFromJson(Map<String, dynamic> json) => CoreServerCapabilitiesOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null ? null : CoreServerCapabilitiesOcsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesOcsToJson(CoreServerCapabilitiesOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

CoreServerCapabilities _$CoreServerCapabilitiesFromJson(Map<String, dynamic> json) => CoreServerCapabilities(
      ocs: json['ocs'] == null ? null : CoreServerCapabilitiesOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreServerCapabilitiesToJson(CoreServerCapabilities instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

CoreNavigationAppsOcsData _$CoreNavigationAppsOcsDataFromJson(Map<String, dynamic> json) => CoreNavigationAppsOcsData(
      id: json['id'] as String?,
      order: json['order'] == null ? null : CoreNavigationAppsOcsDataOrder.fromJson(json['order']),
      href: json['href'] as String?,
      icon: json['icon'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      classes: json['classes'] as String?,
      unread: json['unread'] as int?,
    );

Map<String, dynamic> _$CoreNavigationAppsOcsDataToJson(CoreNavigationAppsOcsData instance) => <String, dynamic>{
      'id': instance.id,
      'order': instance.order?.toJson(),
      'href': instance.href,
      'icon': instance.icon,
      'type': instance.type,
      'name': instance.name,
      'active': instance.active,
      'classes': instance.classes,
      'unread': instance.unread,
    };

CoreNavigationAppsOcs _$CoreNavigationAppsOcsFromJson(Map<String, dynamic> json) => CoreNavigationAppsOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CoreNavigationAppsOcsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoreNavigationAppsOcsToJson(CoreNavigationAppsOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

CoreNavigationApps _$CoreNavigationAppsFromJson(Map<String, dynamic> json) => CoreNavigationApps(
      ocs: json['ocs'] == null ? null : CoreNavigationAppsOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoreNavigationAppsToJson(CoreNavigationApps instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

CoreLoginFlowInitPoll _$CoreLoginFlowInitPollFromJson(Map<String, dynamic> json) => CoreLoginFlowInitPoll(
      token: json['token'] as String?,
      endpoint: json['endpoint'] as String?,
    );

Map<String, dynamic> _$CoreLoginFlowInitPollToJson(CoreLoginFlowInitPoll instance) => <String, dynamic>{
      'token': instance.token,
      'endpoint': instance.endpoint,
    };

CoreLoginFlowInit _$CoreLoginFlowInitFromJson(Map<String, dynamic> json) => CoreLoginFlowInit(
      poll: json['poll'] == null ? null : CoreLoginFlowInitPoll.fromJson(json['poll'] as Map<String, dynamic>),
      login: json['login'] as String?,
    );

Map<String, dynamic> _$CoreLoginFlowInitToJson(CoreLoginFlowInit instance) => <String, dynamic>{
      'poll': instance.poll?.toJson(),
      'login': instance.login,
    };

CoreLoginFlowResult _$CoreLoginFlowResultFromJson(Map<String, dynamic> json) => CoreLoginFlowResult(
      server: json['server'] as String?,
      loginName: json['loginName'] as String?,
      appPassword: json['appPassword'] as String?,
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
      id: json['id'] as int?,
      guid: json['guid'] as String?,
      guidHash: json['guidHash'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      pubDate: json['pubDate'] as int?,
      updatedDate: json['updatedDate'] as int?,
      body: json['body'] as String?,
      enclosureMime: json['enclosureMime'] as String?,
      enclosureLink: json['enclosureLink'] as String?,
      mediaThumbnail: json['mediaThumbnail'] as String?,
      mediaDescription: json['mediaDescription'] as String?,
      feedId: json['feedId'] as int?,
      unread: json['unread'] as bool?,
      starred: json['starred'] as bool?,
      lastModified: json['lastModified'] as int?,
      rtl: json['rtl'] as bool?,
      fingerprint: json['fingerprint'] as String?,
      contentHash: json['contentHash'] as String?,
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
      id: json['id'] as int?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      faviconLink: json['faviconLink'] as String?,
      added: json['added'] as int?,
      folderId: json['folderId'] as int?,
      unreadCount: json['unreadCount'] as int?,
      ordering: json['ordering'] as int?,
      link: json['link'] as String?,
      pinned: json['pinned'] as bool?,
      updateErrorCount: json['updateErrorCount'] as int?,
      lastUpdateError: json['lastUpdateError'] as String?,
      items: (json['items'] as List<dynamic>?)?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
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
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

NewsFolder _$NewsFolderFromJson(Map<String, dynamic> json) => NewsFolder(
      id: json['id'] as int?,
      name: json['name'] as String?,
      opened: json['opened'] as bool?,
      feeds: (json['feeds'] as List<dynamic>?)?.map((e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsFolderToJson(NewsFolder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'opened': instance.opened,
      'feeds': instance.feeds?.map((e) => e.toJson()).toList(),
    };

NewsListFolders _$NewsListFoldersFromJson(Map<String, dynamic> json) => NewsListFolders(
      folders: (json['folders'] as List<dynamic>?)?.map((e) => NewsFolder.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListFoldersToJson(NewsListFolders instance) => <String, dynamic>{
      'folders': instance.folders?.map((e) => e.toJson()).toList(),
    };

NewsListFeeds _$NewsListFeedsFromJson(Map<String, dynamic> json) => NewsListFeeds(
      starredCount: json['starredCount'] as int?,
      newestItemId: json['newestItemId'] as int?,
      feeds: (json['feeds'] as List<dynamic>?)?.map((e) => NewsFeed.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListFeedsToJson(NewsListFeeds instance) => <String, dynamic>{
      'starredCount': instance.starredCount,
      'newestItemId': instance.newestItemId,
      'feeds': instance.feeds?.map((e) => e.toJson()).toList(),
    };

NewsListArticles _$NewsListArticlesFromJson(Map<String, dynamic> json) => NewsListArticles(
      items: (json['items'] as List<dynamic>?)?.map((e) => NewsArticle.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NewsListArticlesToJson(NewsListArticles instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

NotesNote _$NotesNoteFromJson(Map<String, dynamic> json) => NotesNote(
      id: json['id'] as int?,
      etag: json['etag'] as String?,
      readonly: json['readonly'] as bool?,
      content: json['content'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      favorite: json['favorite'] as bool?,
      modified: json['modified'] as int?,
      error: json['error'] as bool?,
      errorType: json['errorType'] as String?,
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
      notesPath: json['notesPath'] as String?,
      fileSuffix: json['fileSuffix'] as String?,
      noteMode: $enumDecodeNullable(_$NotesSettingsNoteModeEnumMap, json['noteMode']),
    );

Map<String, dynamic> _$NotesSettingsToJson(NotesSettings instance) => <String, dynamic>{
      'notesPath': instance.notesPath,
      'fileSuffix': instance.fileSuffix,
      'noteMode': _$NotesSettingsNoteModeEnumMap[instance.noteMode],
    };

const _$NotesSettingsNoteModeEnumMap = {
  NotesSettingsNoteMode.edit: 'edit',
  NotesSettingsNoteMode.preview: 'preview',
};

NotificationsNotificationAction _$NotificationsNotificationActionFromJson(Map<String, dynamic> json) =>
    NotificationsNotificationAction(
      label: json['label'] as String?,
      link: json['link'] as String?,
      type: json['type'] as String?,
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
      notificationId: json['notification_id'] as int?,
      app: json['app'] as String?,
      user: json['user'] as String?,
      datetime: json['datetime'] as String?,
      objectType: json['object_type'] as String?,
      objectId: json['object_id'] as String?,
      subject: json['subject'] as String?,
      message: json['message'] as String?,
      link: json['link'] as String?,
      subjectRich: json['subjectRich'] as String?,
      subjectRichParameters: json['subjectRichParameters'] == null
          ? null
          : NotificationsNotificationSubjectRichParameters.fromJson(json['subjectRichParameters']),
      messageRich: json['messageRich'] as String?,
      messageRichParameters: json['messageRichParameters'] == null
          ? null
          : NotificationsNotificationMessageRichParameters.fromJson(json['messageRichParameters']),
      icon: json['icon'] as String?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => NotificationsNotificationAction.fromJson(e as Map<String, dynamic>))
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
      'subjectRichParameters': instance.subjectRichParameters?.toJson(),
      'messageRich': instance.messageRich,
      'messageRichParameters': instance.messageRichParameters?.toJson(),
      'icon': instance.icon,
      'actions': instance.actions?.map((e) => e.toJson()).toList(),
    };

NotificationsListNotificationsOcs _$NotificationsListNotificationsOcsFromJson(Map<String, dynamic> json) =>
    NotificationsListNotificationsOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationsNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsListNotificationsOcsToJson(NotificationsListNotificationsOcs instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

NotificationsListNotifications _$NotificationsListNotificationsFromJson(Map<String, dynamic> json) =>
    NotificationsListNotifications(
      ocs: json['ocs'] == null ? null : NotificationsListNotificationsOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsListNotificationsToJson(NotificationsListNotifications instance) =>
    <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

NotificationsGetNotificationOcs _$NotificationsGetNotificationOcsFromJson(Map<String, dynamic> json) =>
    NotificationsGetNotificationOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null ? null : NotificationsNotification.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsGetNotificationOcsToJson(NotificationsGetNotificationOcs instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

NotificationsGetNotification _$NotificationsGetNotificationFromJson(Map<String, dynamic> json) =>
    NotificationsGetNotification(
      ocs: json['ocs'] == null ? null : NotificationsGetNotificationOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsGetNotificationToJson(NotificationsGetNotification instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

NotificationsEmptyOcs _$NotificationsEmptyOcsFromJson(Map<String, dynamic> json) => NotificationsEmptyOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NotificationsEmptyOcsToJson(NotificationsEmptyOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data,
    };

NotificationsEmpty _$NotificationsEmptyFromJson(Map<String, dynamic> json) => NotificationsEmpty(
      ocs: json['ocs'] == null ? null : NotificationsEmptyOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsEmptyToJson(NotificationsEmpty instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

NotificationsPushServerSubscription _$NotificationsPushServerSubscriptionFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerSubscription(
      publicKey: json['publicKey'] as String?,
      deviceIdentifier: json['deviceIdentifier'] as String?,
      signature: json['signature'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotificationsPushServerSubscriptionToJson(NotificationsPushServerSubscription instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'deviceIdentifier': instance.deviceIdentifier,
      'signature': instance.signature,
      'message': instance.message,
    };

NotificationsPushServerRegistrationOcs _$NotificationsPushServerRegistrationOcsFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerRegistrationOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : NotificationsPushServerSubscription.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushServerRegistrationOcsToJson(NotificationsPushServerRegistrationOcs instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

NotificationsPushServerRegistration _$NotificationsPushServerRegistrationFromJson(Map<String, dynamic> json) =>
    NotificationsPushServerRegistration(
      ocs: json['ocs'] == null
          ? null
          : NotificationsPushServerRegistrationOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushServerRegistrationToJson(NotificationsPushServerRegistration instance) =>
    <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

ProvisioningApiUserDetailsQuota _$ProvisioningApiUserDetailsQuotaFromJson(Map<String, dynamic> json) =>
    ProvisioningApiUserDetailsQuota(
      free: json['free'] as int?,
      used: json['used'] as int?,
      total: json['total'] as int?,
      relative: json['relative'] as num?,
      quota: json['quota'] as int?,
    );

Map<String, dynamic> _$ProvisioningApiUserDetailsQuotaToJson(ProvisioningApiUserDetailsQuota instance) =>
    <String, dynamic>{
      'free': instance.free,
      'used': instance.used,
      'total': instance.total,
      'relative': instance.relative,
      'quota': instance.quota,
    };

ProvisioningApiUserDetailsBackendCapabilities _$ProvisioningApiUserDetailsBackendCapabilitiesFromJson(
        Map<String, dynamic> json) =>
    ProvisioningApiUserDetailsBackendCapabilities(
      setDisplayName: json['setDisplayName'] as bool?,
      setPassword: json['setPassword'] as bool?,
    );

Map<String, dynamic> _$ProvisioningApiUserDetailsBackendCapabilitiesToJson(
        ProvisioningApiUserDetailsBackendCapabilities instance) =>
    <String, dynamic>{
      'setDisplayName': instance.setDisplayName,
      'setPassword': instance.setPassword,
    };

ProvisioningApiUserDetails _$ProvisioningApiUserDetailsFromJson(Map<String, dynamic> json) =>
    ProvisioningApiUserDetails(
      enabled: json['enabled'] as bool?,
      storageLocation: json['storageLocation'] as String?,
      id: json['id'] as String?,
      lastLogin: json['lastLogin'] as int?,
      backend: json['backend'] as String?,
      subadmin: (json['subadmin'] as List<dynamic>?)?.map((e) => e as String).toList(),
      quota: json['quota'] == null
          ? null
          : ProvisioningApiUserDetailsQuota.fromJson(json['quota'] as Map<String, dynamic>),
      avatarScope: json['avatarScope'] as String?,
      email: json['email'] as String?,
      emailScope: json['emailScope'] as String?,
      additionalMail: (json['additional_mail'] as List<dynamic>?)?.map((e) => e as String).toList(),
      additionalMailScope: (json['additional_mailScope'] as List<dynamic>?)?.map((e) => e as String).toList(),
      displayname: json['displayname'] as String?,
      displaynameScope: json['displaynameScope'] as String?,
      phone: json['phone'] as String?,
      phoneScope: json['phoneScope'] as String?,
      address: json['address'] as String?,
      addressScope: json['addressScope'] as String?,
      website: json['website'] as String?,
      websiteScope: json['websiteScope'] as String?,
      twitter: json['twitter'] as String?,
      twitterScope: json['twitterScope'] as String?,
      organisation: json['organisation'] as String?,
      organisationScope: json['organisationScope'] as String?,
      role: json['role'] as String?,
      roleScope: json['roleScope'] as String?,
      headline: json['headline'] as String?,
      headlineScope: json['headlineScope'] as String?,
      biography: json['biography'] as String?,
      biographyScope: json['biographyScope'] as String?,
      profileEnabled: json['profile_enabled'] as String?,
      profileEnabledScope: json['profile_enabledScope'] as String?,
      groups: (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
      locale: json['locale'] as String?,
      notifyEmail: json['notify_email'] as String?,
      backendCapabilities: json['backendCapabilities'] == null
          ? null
          : ProvisioningApiUserDetailsBackendCapabilities.fromJson(json['backendCapabilities'] as Map<String, dynamic>),
      displayName: json['display-name'] as String?,
    );

Map<String, dynamic> _$ProvisioningApiUserDetailsToJson(ProvisioningApiUserDetails instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'storageLocation': instance.storageLocation,
      'id': instance.id,
      'lastLogin': instance.lastLogin,
      'backend': instance.backend,
      'subadmin': instance.subadmin,
      'quota': instance.quota?.toJson(),
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
      'backendCapabilities': instance.backendCapabilities?.toJson(),
      'display-name': instance.displayName,
    };

ProvisioningApiUserOcs _$ProvisioningApiUserOcsFromJson(Map<String, dynamic> json) => ProvisioningApiUserOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null ? null : ProvisioningApiUserDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvisioningApiUserOcsToJson(ProvisioningApiUserOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

ProvisioningApiUser _$ProvisioningApiUserFromJson(Map<String, dynamic> json) => ProvisioningApiUser(
      ocs: json['ocs'] == null ? null : ProvisioningApiUserOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvisioningApiUserToJson(ProvisioningApiUser instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

UserStatusClearAt _$UserStatusClearAtFromJson(Map<String, dynamic> json) => UserStatusClearAt(
      type: $enumDecodeNullable(_$UserStatusClearAtTypeEnumMap, json['type']),
      time: json['time'] == null ? null : UserStatusClearAtTime.fromJson(json['time']),
    );

Map<String, dynamic> _$UserStatusClearAtToJson(UserStatusClearAt instance) => <String, dynamic>{
      'type': _$UserStatusClearAtTypeEnumMap[instance.type],
      'time': instance.time?.toJson(),
    };

const _$UserStatusClearAtTypeEnumMap = {
  UserStatusClearAtType.period: 'period',
  UserStatusClearAtType.endOf: 'end-of',
};

UserStatusPublicUserStatus _$UserStatusPublicUserStatusFromJson(Map<String, dynamic> json) =>
    UserStatusPublicUserStatus(
      userId: json['userId'] as String?,
      message: json['message'] as String?,
      icon: json['icon'] as String?,
      clearAt: json['clearAt'] == null ? null : UserStatusClearAtWrap.fromJson(json['clearAt']),
      status: $enumDecodeNullable(_$UserStatusTypeEnumMap, json['status']),
    );

Map<String, dynamic> _$UserStatusPublicUserStatusToJson(UserStatusPublicUserStatus instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'icon': instance.icon,
      'clearAt': instance.clearAt?.toJson(),
      'status': _$UserStatusTypeEnumMap[instance.status],
    };

const _$UserStatusTypeEnumMap = {
  UserStatusType.online: 'online',
  UserStatusType.offline: 'offline',
  UserStatusType.dnd: 'dnd',
  UserStatusType.away: 'away',
  UserStatusType.invisible: 'invisible',
};

UserStatusFindAllStatusesOcs _$UserStatusFindAllStatusesOcsFromJson(Map<String, dynamic> json) =>
    UserStatusFindAllStatusesOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserStatusPublicUserStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatusFindAllStatusesOcsToJson(UserStatusFindAllStatusesOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

UserStatusFindAllStatuses _$UserStatusFindAllStatusesFromJson(Map<String, dynamic> json) => UserStatusFindAllStatuses(
      ocs: json['ocs'] == null ? null : UserStatusFindAllStatusesOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusFindAllStatusesToJson(UserStatusFindAllStatuses instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

UserStatusFindStatusOcs _$UserStatusFindStatusOcsFromJson(Map<String, dynamic> json) => UserStatusFindStatusOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null ? null : UserStatusFindStatusOcsData.fromJson(json['data']),
    );

Map<String, dynamic> _$UserStatusFindStatusOcsToJson(UserStatusFindStatusOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

UserStatusFindStatus _$UserStatusFindStatusFromJson(Map<String, dynamic> json) => UserStatusFindStatus(
      ocs: json['ocs'] == null ? null : UserStatusFindStatusOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusFindStatusToJson(UserStatusFindStatus instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) => UserStatus(
      userId: json['userId'] as String?,
      message: json['message'] as String?,
      messageId: json['messageId'] as String?,
      messageIsPredefined: json['messageIsPredefined'] as bool?,
      icon: json['icon'] as String?,
      clearAt: json['clearAt'] == null ? null : UserStatusClearAtWrap.fromJson(json['clearAt']),
      status: $enumDecodeNullable(_$UserStatusTypeEnumMap, json['status']),
      statusIsUserDefined: json['statusIsUserDefined'] as bool?,
    );

Map<String, dynamic> _$UserStatusToJson(UserStatus instance) => <String, dynamic>{
      'userId': instance.userId,
      'message': instance.message,
      'messageId': instance.messageId,
      'messageIsPredefined': instance.messageIsPredefined,
      'icon': instance.icon,
      'clearAt': instance.clearAt?.toJson(),
      'status': _$UserStatusTypeEnumMap[instance.status],
      'statusIsUserDefined': instance.statusIsUserDefined,
    };

UserStatusGetUserStatusOcs _$UserStatusGetUserStatusOcsFromJson(Map<String, dynamic> json) =>
    UserStatusGetUserStatusOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null ? null : UserStatusGetUserStatusOcsData.fromJson(json['data']),
    );

Map<String, dynamic> _$UserStatusGetUserStatusOcsToJson(UserStatusGetUserStatusOcs instance) => <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.toJson(),
    };

UserStatusGetUserStatus _$UserStatusGetUserStatusFromJson(Map<String, dynamic> json) => UserStatusGetUserStatus(
      ocs: json['ocs'] == null ? null : UserStatusGetUserStatusOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusGetUserStatusToJson(UserStatusGetUserStatus instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
    };

UserStatusPredefinedStatus _$UserStatusPredefinedStatusFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatus(
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      message: json['message'] as String?,
      clearAt: json['clearAt'] == null ? null : UserStatusClearAtWrap.fromJson(json['clearAt']),
    );

Map<String, dynamic> _$UserStatusPredefinedStatusToJson(UserStatusPredefinedStatus instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'message': instance.message,
      'clearAt': instance.clearAt?.toJson(),
    };

UserStatusPredefinedStatusesOcs _$UserStatusPredefinedStatusesOcsFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatusesOcs(
      meta: json['meta'] == null ? null : OCSMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserStatusPredefinedStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStatusPredefinedStatusesOcsToJson(UserStatusPredefinedStatusesOcs instance) =>
    <String, dynamic>{
      'meta': instance.meta?.toJson(),
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

UserStatusPredefinedStatuses _$UserStatusPredefinedStatusesFromJson(Map<String, dynamic> json) =>
    UserStatusPredefinedStatuses(
      ocs: json['ocs'] == null ? null : UserStatusPredefinedStatusesOcs.fromJson(json['ocs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserStatusPredefinedStatusesToJson(UserStatusPredefinedStatuses instance) => <String, dynamic>{
      'ocs': instance.ocs?.toJson(),
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
      accountID: json['accountID'] as String?,
      priority: json['priority'] as String?,
      type: json['type'] as String?,
      subject: json['subject'] == null
          ? null
          : NotificationsPushNotificationDecryptedSubject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsPushNotificationToJson(NotificationsPushNotification instance) => <String, dynamic>{
      'accountID': instance.accountID,
      'priority': instance.priority,
      'type': instance.type,
      'subject': instance.subject?.toJson(),
    };
