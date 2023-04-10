// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModeEdit = NextcloudNotesSettings_NoteMode._('edit');
const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModePreview =
    NextcloudNotesSettings_NoteMode._('preview');
const NextcloudNotesSettings_NoteMode _$nextcloudNotesSettingsNoteModeRich = NextcloudNotesSettings_NoteMode._('rich');

NextcloudNotesSettings_NoteMode _$valueOfNextcloudNotesSettings_NoteMode(String name) {
  switch (name) {
    case 'edit':
      return _$nextcloudNotesSettingsNoteModeEdit;
    case 'preview':
      return _$nextcloudNotesSettingsNoteModePreview;
    case 'rich':
      return _$nextcloudNotesSettingsNoteModeRich;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudNotesSettings_NoteMode> _$nextcloudNotesSettingsNoteModeValues =
    BuiltSet<NextcloudNotesSettings_NoteMode>(const <NextcloudNotesSettings_NoteMode>[
  _$nextcloudNotesSettingsNoteModeEdit,
  _$nextcloudNotesSettingsNoteModePreview,
  _$nextcloudNotesSettingsNoteModeRich,
]);

const NextcloudUserStatusClearAt_Type _$nextcloudUserStatusClearAtTypePeriod =
    NextcloudUserStatusClearAt_Type._('period');
const NextcloudUserStatusClearAt_Type _$nextcloudUserStatusClearAtTypeEndOf =
    NextcloudUserStatusClearAt_Type._('endOf');

NextcloudUserStatusClearAt_Type _$valueOfNextcloudUserStatusClearAt_Type(String name) {
  switch (name) {
    case 'period':
      return _$nextcloudUserStatusClearAtTypePeriod;
    case 'endOf':
      return _$nextcloudUserStatusClearAtTypeEndOf;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusClearAt_Type> _$nextcloudUserStatusClearAtTypeValues =
    BuiltSet<NextcloudUserStatusClearAt_Type>(const <NextcloudUserStatusClearAt_Type>[
  _$nextcloudUserStatusClearAtTypePeriod,
  _$nextcloudUserStatusClearAtTypeEndOf,
]);

const NextcloudUserStatusClearAt_Time0 _$nextcloudUserStatusClearAtTime0Day = NextcloudUserStatusClearAt_Time0._('day');
const NextcloudUserStatusClearAt_Time0 _$nextcloudUserStatusClearAtTime0Week =
    NextcloudUserStatusClearAt_Time0._('week');

NextcloudUserStatusClearAt_Time0 _$valueOfNextcloudUserStatusClearAt_Time0(String name) {
  switch (name) {
    case 'day':
      return _$nextcloudUserStatusClearAtTime0Day;
    case 'week':
      return _$nextcloudUserStatusClearAtTime0Week;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusClearAt_Time0> _$nextcloudUserStatusClearAtTime0Values =
    BuiltSet<NextcloudUserStatusClearAt_Time0>(const <NextcloudUserStatusClearAt_Time0>[
  _$nextcloudUserStatusClearAtTime0Day,
  _$nextcloudUserStatusClearAtTime0Week,
]);

const NextcloudUserStatusType _$nextcloudUserStatusTypeOnline = NextcloudUserStatusType._('online');
const NextcloudUserStatusType _$nextcloudUserStatusTypeOffline = NextcloudUserStatusType._('offline');
const NextcloudUserStatusType _$nextcloudUserStatusTypeDnd = NextcloudUserStatusType._('dnd');
const NextcloudUserStatusType _$nextcloudUserStatusTypeAway = NextcloudUserStatusType._('away');
const NextcloudUserStatusType _$nextcloudUserStatusTypeInvisible = NextcloudUserStatusType._('invisible');

NextcloudUserStatusType _$valueOfNextcloudUserStatusType(String name) {
  switch (name) {
    case 'online':
      return _$nextcloudUserStatusTypeOnline;
    case 'offline':
      return _$nextcloudUserStatusTypeOffline;
    case 'dnd':
      return _$nextcloudUserStatusTypeDnd;
    case 'away':
      return _$nextcloudUserStatusTypeAway;
    case 'invisible':
      return _$nextcloudUserStatusTypeInvisible;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NextcloudUserStatusType> _$nextcloudUserStatusTypeValues =
    BuiltSet<NextcloudUserStatusType>(const <NextcloudUserStatusType>[
  _$nextcloudUserStatusTypeOnline,
  _$nextcloudUserStatusTypeOffline,
  _$nextcloudUserStatusTypeDnd,
  _$nextcloudUserStatusTypeAway,
  _$nextcloudUserStatusTypeInvisible,
]);

Serializers _$serializers = (Serializers().toBuilder()
      ..add(NextcloudCoreAutocompleteResult.serializer)
      ..add(NextcloudCoreAutocompleteResult_Ocs.serializer)
      ..add(NextcloudCoreAutocompleteResult_Ocs_Data.serializer)
      ..add(NextcloudCoreAutocompleteResult_Ocs_Data_Status.serializer)
      ..add(NextcloudCoreLoginFlowInit.serializer)
      ..add(NextcloudCoreLoginFlowInit_Poll.serializer)
      ..add(NextcloudCoreLoginFlowResult.serializer)
      ..add(NextcloudCoreNavigationApps.serializer)
      ..add(NextcloudCoreNavigationApps_Ocs.serializer)
      ..add(NextcloudCoreNavigationApps_Ocs_Data.serializer)
      ..add(NextcloudCoreNavigationApps_Ocs_Data_Order.serializer)
      ..add(NextcloudCoreServerCapabilities.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate.serializer)
      ..add(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus.serializer)
      ..add(NextcloudCoreServerCapabilities_Ocs_Data_Version.serializer)
      ..add(NextcloudCoreServerStatus.serializer)
      ..add(NextcloudEmptyOCS.serializer)
      ..add(NextcloudEmptyOCS_Ocs.serializer)
      ..add(NextcloudNewsArticle.serializer)
      ..add(NextcloudNewsFeed.serializer)
      ..add(NextcloudNewsFolder.serializer)
      ..add(NextcloudNewsListArticles.serializer)
      ..add(NextcloudNewsListFeeds.serializer)
      ..add(NextcloudNewsListFolders.serializer)
      ..add(NextcloudNewsSupportedAPIVersions.serializer)
      ..add(NextcloudNotesNote.serializer)
      ..add(NextcloudNotesSettings.serializer)
      ..add(NextcloudNotesSettings_NoteMode.serializer)
      ..add(NextcloudNotificationsGetNotification.serializer)
      ..add(NextcloudNotificationsGetNotification_Ocs.serializer)
      ..add(NextcloudNotificationsListNotifications.serializer)
      ..add(NextcloudNotificationsListNotifications_Ocs.serializer)
      ..add(NextcloudNotificationsNotification.serializer)
      ..add(NextcloudNotificationsNotificationAction.serializer)
      ..add(NextcloudNotificationsNotificationDecryptedSubject.serializer)
      ..add(NextcloudNotificationsPushServerRegistration.serializer)
      ..add(NextcloudNotificationsPushServerRegistration_Ocs.serializer)
      ..add(NextcloudNotificationsPushServerSubscription.serializer)
      ..add(NextcloudOCSMeta.serializer)
      ..add(NextcloudProvisioningApiUser.serializer)
      ..add(NextcloudProvisioningApiUserDetails.serializer)
      ..add(NextcloudProvisioningApiUserDetails_BackendCapabilities.serializer)
      ..add(NextcloudProvisioningApiUserDetails_Quota.serializer)
      ..add(NextcloudProvisioningApiUser_Ocs.serializer)
      ..add(NextcloudUnifiedPushProviderCheckResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush.serializer)
      ..add(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderPushResponse201ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson.serializer)
      ..add(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush.serializer)
      ..add(NextcloudUserStatusClearAt.serializer)
      ..add(NextcloudUserStatusClearAt_Time.serializer)
      ..add(NextcloudUserStatusClearAt_Time0.serializer)
      ..add(NextcloudUserStatusClearAt_Type.serializer)
      ..add(NextcloudUserStatusGetPublicStatus.serializer)
      ..add(NextcloudUserStatusGetPublicStatus_Ocs.serializer)
      ..add(NextcloudUserStatusGetPublicStatus_Ocs_Data.serializer)
      ..add(NextcloudUserStatusGetPublicStatuses.serializer)
      ..add(NextcloudUserStatusGetPublicStatuses_Ocs.serializer)
      ..add(NextcloudUserStatusGetStatus.serializer)
      ..add(NextcloudUserStatusGetStatus_Ocs.serializer)
      ..add(NextcloudUserStatusGetStatus_Ocs_Data.serializer)
      ..add(NextcloudUserStatusHeartbeat.serializer)
      ..add(NextcloudUserStatusHeartbeat_Ocs.serializer)
      ..add(NextcloudUserStatusPredefinedStatus.serializer)
      ..add(NextcloudUserStatusPredefinedStatus_ClearAt.serializer)
      ..add(NextcloudUserStatusPredefinedStatuses.serializer)
      ..add(NextcloudUserStatusPredefinedStatuses_Ocs.serializer)
      ..add(NextcloudUserStatusPublicStatus.serializer)
      ..add(NextcloudUserStatusPublicStatus_ClearAt.serializer)
      ..add(NextcloudUserStatusStatus.serializer)
      ..add(NextcloudUserStatusStatus_ClearAt.serializer)
      ..add(NextcloudUserStatusType.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), () => ListBuilder<JsonObject>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudCoreAutocompleteResult_Ocs_Data)]),
          () => ListBuilder<NextcloudCoreAutocompleteResult_Ocs_Data>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudCoreNavigationApps_Ocs_Data)]),
          () => ListBuilder<NextcloudCoreNavigationApps_Ocs_Data>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes)]),
          () => ListBuilder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(NextcloudNewsArticle)]), () => ListBuilder<NextcloudNewsArticle>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(NextcloudNewsArticle)]), () => ListBuilder<NextcloudNewsArticle>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(NextcloudNewsFeed)]), () => ListBuilder<NextcloudNewsFeed>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(NextcloudNewsFeed)]), () => ListBuilder<NextcloudNewsFeed>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(NextcloudNewsFolder)]), () => ListBuilder<NextcloudNewsFolder>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudNotificationsNotification)]),
          () => ListBuilder<NextcloudNotificationsNotification>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudNotificationsNotificationAction)]),
          () => ListBuilder<NextcloudNotificationsNotificationAction>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudUserStatusPredefinedStatus)]),
          () => ListBuilder<NextcloudUserStatusPredefinedStatus>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NextcloudUserStatusPublicStatus)]),
          () => ListBuilder<NextcloudUserStatusPublicStatus>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), () => ListBuilder<int>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), () => ListBuilder<int>()))
    .build();
Serializer<NextcloudCoreServerStatus> _$nextcloudCoreServerStatusSerializer = _$NextcloudCoreServerStatusSerializer();
Serializer<NextcloudOCSMeta> _$nextcloudOCSMetaSerializer = _$NextcloudOCSMetaSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Version> _$nextcloudCoreServerCapabilitiesOcsDataVersionSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_VersionSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCoreSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesBruteforceSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesMetadataAvailableSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesDirectEditingSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesActivitySerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivitySerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesStatusSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesSettingsSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSourceSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConstantsSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleConfigSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesCircleSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberConstantsSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesMemberSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesCirclesSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesProtocolsSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmResourceTypesSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesOcmSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesDavSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicPasswordSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateInternalSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicExpireDateRemoteSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingPublicSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserExpireDateSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingUserSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupExpireDateSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingGroupSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationExpireDateSupportedSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingFederationSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingShareeSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailUploadFilesDropSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailPasswordSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailExpireDateSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSharebymailSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesFilesSharingSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesNotesSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesNotificationsSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicyApiSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesPasswordPolicySerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicySerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesProvisioningApiSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesThemingSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesUserStatusSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesWeatherStatusSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities>
    _$nextcloudCoreServerCapabilitiesOcsDataCapabilitiesSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs_Data> _$nextcloudCoreServerCapabilitiesOcsDataSerializer =
    _$NextcloudCoreServerCapabilities_Ocs_DataSerializer();
Serializer<NextcloudCoreServerCapabilities_Ocs> _$nextcloudCoreServerCapabilitiesOcsSerializer =
    _$NextcloudCoreServerCapabilities_OcsSerializer();
Serializer<NextcloudCoreServerCapabilities> _$nextcloudCoreServerCapabilitiesSerializer =
    _$NextcloudCoreServerCapabilitiesSerializer();
Serializer<NextcloudCoreNavigationApps_Ocs_Data> _$nextcloudCoreNavigationAppsOcsDataSerializer =
    _$NextcloudCoreNavigationApps_Ocs_DataSerializer();
Serializer<NextcloudCoreNavigationApps_Ocs> _$nextcloudCoreNavigationAppsOcsSerializer =
    _$NextcloudCoreNavigationApps_OcsSerializer();
Serializer<NextcloudCoreNavigationApps> _$nextcloudCoreNavigationAppsSerializer =
    _$NextcloudCoreNavigationAppsSerializer();
Serializer<NextcloudCoreLoginFlowInit_Poll> _$nextcloudCoreLoginFlowInitPollSerializer =
    _$NextcloudCoreLoginFlowInit_PollSerializer();
Serializer<NextcloudCoreLoginFlowInit> _$nextcloudCoreLoginFlowInitSerializer =
    _$NextcloudCoreLoginFlowInitSerializer();
Serializer<NextcloudCoreLoginFlowResult> _$nextcloudCoreLoginFlowResultSerializer =
    _$NextcloudCoreLoginFlowResultSerializer();
Serializer<NextcloudCoreAutocompleteResult_Ocs_Data> _$nextcloudCoreAutocompleteResultOcsDataSerializer =
    _$NextcloudCoreAutocompleteResult_Ocs_DataSerializer();
Serializer<NextcloudCoreAutocompleteResult_Ocs> _$nextcloudCoreAutocompleteResultOcsSerializer =
    _$NextcloudCoreAutocompleteResult_OcsSerializer();
Serializer<NextcloudCoreAutocompleteResult> _$nextcloudCoreAutocompleteResultSerializer =
    _$NextcloudCoreAutocompleteResultSerializer();
Serializer<NextcloudNewsSupportedAPIVersions> _$nextcloudNewsSupportedAPIVersionsSerializer =
    _$NextcloudNewsSupportedAPIVersionsSerializer();
Serializer<NextcloudNewsArticle> _$nextcloudNewsArticleSerializer = _$NextcloudNewsArticleSerializer();
Serializer<NextcloudNewsFeed> _$nextcloudNewsFeedSerializer = _$NextcloudNewsFeedSerializer();
Serializer<NextcloudNewsFolder> _$nextcloudNewsFolderSerializer = _$NextcloudNewsFolderSerializer();
Serializer<NextcloudNewsListFolders> _$nextcloudNewsListFoldersSerializer = _$NextcloudNewsListFoldersSerializer();
Serializer<NextcloudNewsListFeeds> _$nextcloudNewsListFeedsSerializer = _$NextcloudNewsListFeedsSerializer();
Serializer<NextcloudNewsListArticles> _$nextcloudNewsListArticlesSerializer = _$NextcloudNewsListArticlesSerializer();
Serializer<NextcloudNotesNote> _$nextcloudNotesNoteSerializer = _$NextcloudNotesNoteSerializer();
Serializer<NextcloudNotesSettings_NoteMode> _$nextcloudNotesSettingsNoteModeSerializer =
    _$NextcloudNotesSettings_NoteModeSerializer();
Serializer<NextcloudNotesSettings> _$nextcloudNotesSettingsSerializer = _$NextcloudNotesSettingsSerializer();
Serializer<NextcloudNotificationsNotificationAction> _$nextcloudNotificationsNotificationActionSerializer =
    _$NextcloudNotificationsNotificationActionSerializer();
Serializer<NextcloudNotificationsNotification> _$nextcloudNotificationsNotificationSerializer =
    _$NextcloudNotificationsNotificationSerializer();
Serializer<NextcloudNotificationsListNotifications_Ocs> _$nextcloudNotificationsListNotificationsOcsSerializer =
    _$NextcloudNotificationsListNotifications_OcsSerializer();
Serializer<NextcloudNotificationsListNotifications> _$nextcloudNotificationsListNotificationsSerializer =
    _$NextcloudNotificationsListNotificationsSerializer();
Serializer<NextcloudNotificationsGetNotification_Ocs> _$nextcloudNotificationsGetNotificationOcsSerializer =
    _$NextcloudNotificationsGetNotification_OcsSerializer();
Serializer<NextcloudNotificationsGetNotification> _$nextcloudNotificationsGetNotificationSerializer =
    _$NextcloudNotificationsGetNotificationSerializer();
Serializer<NextcloudEmptyOCS_Ocs> _$nextcloudEmptyOCSOcsSerializer = _$NextcloudEmptyOCS_OcsSerializer();
Serializer<NextcloudEmptyOCS> _$nextcloudEmptyOCSSerializer = _$NextcloudEmptyOCSSerializer();
Serializer<NextcloudNotificationsPushServerSubscription> _$nextcloudNotificationsPushServerSubscriptionSerializer =
    _$NextcloudNotificationsPushServerSubscriptionSerializer();
Serializer<NextcloudNotificationsPushServerRegistration_Ocs>
    _$nextcloudNotificationsPushServerRegistrationOcsSerializer =
    _$NextcloudNotificationsPushServerRegistration_OcsSerializer();
Serializer<NextcloudNotificationsPushServerRegistration> _$nextcloudNotificationsPushServerRegistrationSerializer =
    _$NextcloudNotificationsPushServerRegistrationSerializer();
Serializer<NextcloudProvisioningApiUserDetails_Quota> _$nextcloudProvisioningApiUserDetailsQuotaSerializer =
    _$NextcloudProvisioningApiUserDetails_QuotaSerializer();
Serializer<NextcloudProvisioningApiUserDetails_BackendCapabilities>
    _$nextcloudProvisioningApiUserDetailsBackendCapabilitiesSerializer =
    _$NextcloudProvisioningApiUserDetails_BackendCapabilitiesSerializer();
Serializer<NextcloudProvisioningApiUserDetails> _$nextcloudProvisioningApiUserDetailsSerializer =
    _$NextcloudProvisioningApiUserDetailsSerializer();
Serializer<NextcloudProvisioningApiUser_Ocs> _$nextcloudProvisioningApiUserOcsSerializer =
    _$NextcloudProvisioningApiUser_OcsSerializer();
Serializer<NextcloudProvisioningApiUser> _$nextcloudProvisioningApiUserSerializer =
    _$NextcloudProvisioningApiUserSerializer();
Serializer<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderCheckResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson>
    _$nextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush>
    _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonUnifiedpushSerializer =
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushSerializer();
Serializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderPushResponse201ApplicationJson>
    _$nextcloudUnifiedPushProviderPushResponse201ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderPushResponse201ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush>
    _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonUnifiedpushSerializer =
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushSerializer();
Serializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer();
Serializer<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson>
    _$nextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonSerializer =
    _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonSerializer();
Serializer<NextcloudUserStatusClearAt_Type> _$nextcloudUserStatusClearAtTypeSerializer =
    _$NextcloudUserStatusClearAt_TypeSerializer();
Serializer<NextcloudUserStatusClearAt_Time0> _$nextcloudUserStatusClearAtTime0Serializer =
    _$NextcloudUserStatusClearAt_Time0Serializer();
Serializer<NextcloudUserStatusClearAt> _$nextcloudUserStatusClearAtSerializer =
    _$NextcloudUserStatusClearAtSerializer();
Serializer<NextcloudUserStatusType> _$nextcloudUserStatusTypeSerializer = _$NextcloudUserStatusTypeSerializer();
Serializer<NextcloudUserStatusPublicStatus> _$nextcloudUserStatusPublicStatusSerializer =
    _$NextcloudUserStatusPublicStatusSerializer();
Serializer<NextcloudUserStatusGetPublicStatuses_Ocs> _$nextcloudUserStatusGetPublicStatusesOcsSerializer =
    _$NextcloudUserStatusGetPublicStatuses_OcsSerializer();
Serializer<NextcloudUserStatusGetPublicStatuses> _$nextcloudUserStatusGetPublicStatusesSerializer =
    _$NextcloudUserStatusGetPublicStatusesSerializer();
Serializer<NextcloudUserStatusGetPublicStatus_Ocs> _$nextcloudUserStatusGetPublicStatusOcsSerializer =
    _$NextcloudUserStatusGetPublicStatus_OcsSerializer();
Serializer<NextcloudUserStatusGetPublicStatus> _$nextcloudUserStatusGetPublicStatusSerializer =
    _$NextcloudUserStatusGetPublicStatusSerializer();
Serializer<NextcloudUserStatusStatus> _$nextcloudUserStatusStatusSerializer = _$NextcloudUserStatusStatusSerializer();
Serializer<NextcloudUserStatusGetStatus_Ocs> _$nextcloudUserStatusGetStatusOcsSerializer =
    _$NextcloudUserStatusGetStatus_OcsSerializer();
Serializer<NextcloudUserStatusGetStatus> _$nextcloudUserStatusGetStatusSerializer =
    _$NextcloudUserStatusGetStatusSerializer();
Serializer<NextcloudUserStatusPredefinedStatus> _$nextcloudUserStatusPredefinedStatusSerializer =
    _$NextcloudUserStatusPredefinedStatusSerializer();
Serializer<NextcloudUserStatusPredefinedStatuses_Ocs> _$nextcloudUserStatusPredefinedStatusesOcsSerializer =
    _$NextcloudUserStatusPredefinedStatuses_OcsSerializer();
Serializer<NextcloudUserStatusPredefinedStatuses> _$nextcloudUserStatusPredefinedStatusesSerializer =
    _$NextcloudUserStatusPredefinedStatusesSerializer();
Serializer<NextcloudUserStatusHeartbeat_Ocs> _$nextcloudUserStatusHeartbeatOcsSerializer =
    _$NextcloudUserStatusHeartbeat_OcsSerializer();
Serializer<NextcloudUserStatusHeartbeat> _$nextcloudUserStatusHeartbeatSerializer =
    _$NextcloudUserStatusHeartbeatSerializer();
Serializer<NextcloudNotificationsNotificationDecryptedSubject>
    _$nextcloudNotificationsNotificationDecryptedSubjectSerializer =
    _$NextcloudNotificationsNotificationDecryptedSubjectSerializer();

class _$NextcloudCoreServerStatusSerializer implements StructuredSerializer<NextcloudCoreServerStatus> {
  @override
  final Iterable<Type> types = const [NextcloudCoreServerStatus, _$NextcloudCoreServerStatus];
  @override
  final String wireName = 'NextcloudCoreServerStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'installed',
      serializers.serialize(object.installed, specifiedType: const FullType(bool)),
      'maintenance',
      serializers.serialize(object.maintenance, specifiedType: const FullType(bool)),
      'needsDbUpgrade',
      serializers.serialize(object.needsDbUpgrade, specifiedType: const FullType(bool)),
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(String)),
      'versionstring',
      serializers.serialize(object.versionstring, specifiedType: const FullType(String)),
      'edition',
      serializers.serialize(object.edition, specifiedType: const FullType(String)),
      'productname',
      serializers.serialize(object.productname, specifiedType: const FullType(String)),
      'extendedSupport',
      serializers.serialize(object.extendedSupport, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudCoreServerStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'installed':
          result.installed = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'maintenance':
          result.maintenance = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'needsDbUpgrade':
          result.needsDbUpgrade = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'versionstring':
          result.versionstring = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'edition':
          result.edition = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'productname':
          result.productname = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'extendedSupport':
          result.extendedSupport = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudOCSMetaSerializer implements StructuredSerializer<NextcloudOCSMeta> {
  @override
  final Iterable<Type> types = const [NextcloudOCSMeta, _$NextcloudOCSMeta];
  @override
  final String wireName = 'NextcloudOCSMeta';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudOCSMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudOCSMeta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudOCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_VersionSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Version> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Version,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Version
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Version';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Version object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.major;
    if (value != null) {
      result
        ..add('major')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minor;
    if (value != null) {
      result
        ..add('minor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.micro;
    if (value != null) {
      result
        ..add('micro')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.string;
    if (value != null) {
      result
        ..add('string')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.edition;
    if (value != null) {
      result
        ..add('edition')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.extendedSupport;
    if (value != null) {
      result
        ..add('extendedSupport')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Version deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'major':
          result.major = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minor':
          result.minor = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'micro':
          result.micro = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'string':
          result.string = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'edition':
          result.edition = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'extendedSupport':
          result.extendedSupport = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pollinterval;
    if (value != null) {
      result
        ..add('pollinterval')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.webdavRoot;
    if (value != null) {
      result
        ..add('webdav-root')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.referenceApi;
    if (value != null) {
      result
        ..add('reference-api')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.referenceRegex;
    if (value != null) {
      result
        ..add('reference-regex')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pollinterval':
          result.pollinterval = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'webdav-root':
          result.webdavRoot = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'reference-api':
          result.referenceApi = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'reference-regex':
          result.referenceRegex = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.delay;
    if (value != null) {
      result
        ..add('delay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'delay':
          result.delay = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.gps;
    if (value != null) {
      result
        ..add('gps')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'size':
          result.size.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'gps':
          result.gps.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.etag;
    if (value != null) {
      result
        ..add('etag')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bigfilechunking;
    if (value != null) {
      result
        ..add('bigfilechunking')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.blacklistedFiles;
    if (value != null) {
      result
        ..add('blacklisted_files')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.directEditing;
    if (value != null) {
      result
        ..add('directEditing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing)));
    }
    value = object.comments;
    if (value != null) {
      result
        ..add('comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.undelete;
    if (value != null) {
      result
        ..add('undelete')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.versioning;
    if (value != null) {
      result
        ..add('versioning')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bigfilechunking':
          result.bigfilechunking = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'blacklisted_files':
          result.blacklistedFiles.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'directEditing':
          result.directEditing.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing);
          break;
        case 'comments':
          result.comments = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'undelete':
          result.undelete = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'versioning':
          result.versioning = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivitySerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiv2;
    if (value != null) {
      result
        ..add('apiv2')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apiv2':
          result.apiv2.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.globalScale;
    if (value != null) {
      result
        ..add('globalScale')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'globalScale':
          result.globalScale = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.frontendEnabled;
    if (value != null) {
      result
        ..add('frontendEnabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.allowedCircles;
    if (value != null) {
      result
        ..add('allowedCircles')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.allowedUserTypes;
    if (value != null) {
      result
        ..add('allowedUserTypes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.membersLimit;
    if (value != null) {
      result
        ..add('membersLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'frontendEnabled':
          result.frontendEnabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'allowedCircles':
          result.allowedCircles = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'allowedUserTypes':
          result.allowedUserTypes = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'membersLimit':
          result.membersLimit = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.core;
    if (value != null) {
      result
        ..add('core')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.extra;
    if (value != null) {
      result
        ..add('extra')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'core':
          result.core = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'extra':
          result.extra = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.flags;
    if (value != null) {
      result
        ..add('flags')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.source;
    if (value != null) {
      result
        ..add('source')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'flags':
          result.flags = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'source':
          result.source.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.coreFlags;
    if (value != null) {
      result
        ..add('coreFlags')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    value = object.systemFlags;
    if (value != null) {
      result
        ..add('systemFlags')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(int)])));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'coreFlags':
          result.coreFlags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
        case 'systemFlags':
          result.systemFlags.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(int)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.constants;
    if (value != null) {
      result
        ..add('constants')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants)));
    }
    value = object.config;
    if (value != null) {
      result
        ..add('config')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'constants':
          result.constants.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants);
          break;
        case 'config':
          result.config.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.level;
    if (value != null) {
      result
        ..add('level')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'level':
          result.level = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.constants;
    if (value != null) {
      result
        ..add('constants')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'constants':
          result.constants.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants);
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status)));
    }
    value = object.settings;
    if (value != null) {
      result
        ..add('settings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings)));
    }
    value = object.circle;
    if (value != null) {
      result
        ..add('circle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle)));
    }
    value = object.member;
    if (value != null) {
      result
        ..add('member')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status);
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings);
          break;
        case 'circle':
          result.circle.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle);
          break;
        case 'member':
          result.member.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.webdav;
    if (value != null) {
      result
        ..add('webdav')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'webdav':
          result.webdav = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.shareTypes;
    if (value != null) {
      result
        ..add('shareTypes')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.protocols;
    if (value != null) {
      result
        ..add('protocols')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'shareTypes':
          result.shareTypes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'protocols':
          result.protocols.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('apiVersion')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.endPoint;
    if (value != null) {
      result
        ..add('endPoint')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.resourceTypes;
    if (value != null) {
      result
        ..add('resourceTypes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, [FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes)])));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'apiVersion':
          result.apiVersion = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'endPoint':
          result.endPoint = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'resourceTypes':
          result.resourceTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, [FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.bulkupload;
    if (value != null) {
      result
        ..add('bulkupload')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.chunking;
    if (value != null) {
      result
        ..add('chunking')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'bulkupload':
          result.bulkupload = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'chunking':
          result.chunking = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.askForOptionalPassword;
    if (value != null) {
      result
        ..add('askForOptionalPassword')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'askForOptionalPassword':
          result.askForOptionalPassword = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalSerializer
    implements
        StructuredSerializer<
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
  ];
  @override
  final String wireName =
      'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteSerializer
    implements
        StructuredSerializer<
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate)));
    }
    value = object.multipleLinks;
    if (value != null) {
      result
        ..add('multiple_links')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expireDateInternal;
    if (value != null) {
      result
        ..add('expire_date_internal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal)));
    }
    value = object.expireDateRemote;
    if (value != null) {
      result
        ..add('expire_date_remote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote)));
    }
    value = object.sendMail;
    if (value != null) {
      result
        ..add('send_mail')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.upload;
    if (value != null) {
      result
        ..add('upload')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uploadFilesDrop;
    if (value != null) {
      result
        ..add('upload_files_drop')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password);
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate);
          break;
        case 'multiple_links':
          result.multipleLinks = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expire_date_internal':
          result.expireDateInternal.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal);
          break;
        case 'expire_date_remote':
          result.expireDateRemote.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote);
          break;
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'upload':
          result.upload = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'upload_files_drop':
          result.uploadFilesDrop = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sendMail;
    if (value != null) {
      result
        ..add('send_mail')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'send_mail':
          result.sendMail = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedSerializer
    implements
        StructuredSerializer<
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
  ];
  @override
  final String wireName =
      'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.outgoing;
    if (value != null) {
      result
        ..add('outgoing')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.incoming;
    if (value != null) {
      result
        ..add('incoming')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate)));
    }
    value = object.expireDateSupported;
    if (value != null) {
      result
        ..add('expire_date_supported')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'outgoing':
          result.outgoing = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'incoming':
          result.incoming = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate);
          break;
        case 'expire_date_supported':
          result.expireDateSupported.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.queryLookupDefault;
    if (value != null) {
      result
        ..add('query_lookup_default')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.alwaysShowUnique;
    if (value != null) {
      result
        ..add('always_show_unique')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'query_lookup_default':
          result.queryLookupDefault = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'always_show_unique':
          result.alwaysShowUnique = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropSerializer
    implements
        StructuredSerializer<
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
  ];
  @override
  final String wireName =
      'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordSerializer
    implements
        StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateSerializer
    implements
        StructuredSerializer<
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enforced;
    if (value != null) {
      result
        ..add('enforced')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enforced':
          result.enforced = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sendPasswordByMail;
    if (value != null) {
      result
        ..add('send_password_by_mail')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uploadFilesDrop;
    if (value != null) {
      result
        ..add('upload_files_drop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'send_password_by_mail':
          result.sendPasswordByMail = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'upload_files_drop':
          result.uploadFilesDrop.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password);
          break;
        case 'expire_date':
          result.expireDate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiEnabled;
    if (value != null) {
      result
        ..add('api_enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.public;
    if (value != null) {
      result
        ..add('public')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public)));
    }
    value = object.resharing;
    if (value != null) {
      result
        ..add('resharing')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User)));
    }
    value = object.groupSharing;
    if (value != null) {
      result
        ..add('group_sharing')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group)));
    }
    value = object.defaultPermissions;
    if (value != null) {
      result
        ..add('default_permissions')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.federation;
    if (value != null) {
      result
        ..add('federation')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation)));
    }
    value = object.sharee;
    if (value != null) {
      result
        ..add('sharee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee)));
    }
    value = object.sharebymail;
    if (value != null) {
      result
        ..add('sharebymail')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'api_enabled':
          result.apiEnabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'public':
          result.public.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public);
          break;
        case 'resharing':
          result.resharing = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User);
          break;
        case 'group_sharing':
          result.groupSharing = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'group':
          result.group.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group);
          break;
        case 'default_permissions':
          result.defaultPermissions = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'federation':
          result.federation.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation);
          break;
        case 'sharee':
          result.sharee.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee);
          break;
        case 'sharebymail':
          result.sharebymail.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('api_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'api_version':
          result.apiVersion.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ocsEndpoints;
    if (value != null) {
      result
        ..add('ocs-endpoints')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.push;
    if (value != null) {
      result
        ..add('push')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.adminNotifications;
    if (value != null) {
      result
        ..add('admin-notifications')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs-endpoints':
          result.ocsEndpoints.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'push':
          result.push.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'admin-notifications':
          result.adminNotifications.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.generate;
    if (value != null) {
      result
        ..add('generate')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.validate;
    if (value != null) {
      result
        ..add('validate')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'generate':
          result.generate = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'validate':
          result.validate = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicySerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.minLength;
    if (value != null) {
      result
        ..add('minLength')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enforceNonCommonPassword;
    if (value != null) {
      result
        ..add('enforceNonCommonPassword')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enforceNumericCharacters;
    if (value != null) {
      result
        ..add('enforceNumericCharacters')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enforceSpecialCharacters;
    if (value != null) {
      result
        ..add('enforceSpecialCharacters')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.enforceUpperLowerCase;
    if (value != null) {
      result
        ..add('enforceUpperLowerCase')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.api;
    if (value != null) {
      result
        ..add('api')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'minLength':
          result.minLength = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'enforceNonCommonPassword':
          result.enforceNonCommonPassword =
              serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enforceNumericCharacters':
          result.enforceNumericCharacters =
              serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enforceSpecialCharacters':
          result.enforceSpecialCharacters =
              serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'enforceUpperLowerCase':
          result.enforceUpperLowerCase = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'api':
          result.api.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.accountPropertyScopesVersion;
    if (value != null) {
      result
        ..add('AccountPropertyScopesVersion')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.accountPropertyScopesFederatedEnabled;
    if (value != null) {
      result
        ..add('AccountPropertyScopesFederatedEnabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.accountPropertyScopesPublishedEnabled;
    if (value != null) {
      result
        ..add('AccountPropertyScopesPublishedEnabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'AccountPropertyScopesVersion':
          result.accountPropertyScopesVersion =
              serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'AccountPropertyScopesFederatedEnabled':
          result.accountPropertyScopesFederatedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'AccountPropertyScopesPublishedEnabled':
          result.accountPropertyScopesPublishedEnabled =
              serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.slogan;
    if (value != null) {
      result
        ..add('slogan')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.colorText;
    if (value != null) {
      result
        ..add('color-text')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.colorElement;
    if (value != null) {
      result
        ..add('color-element')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.colorElementBright;
    if (value != null) {
      result
        ..add('color-element-bright')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.colorElementDark;
    if (value != null) {
      result
        ..add('color-element-dark')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.logo;
    if (value != null) {
      result
        ..add('logo')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.background;
    if (value != null) {
      result
        ..add('background')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.backgroundPlain;
    if (value != null) {
      result
        ..add('background-plain')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.backgroundDefault;
    if (value != null) {
      result
        ..add('background-default')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.logoheader;
    if (value != null) {
      result
        ..add('logoheader')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.favicon;
    if (value != null) {
      result
        ..add('favicon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'slogan':
          result.slogan = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'color-text':
          result.colorText = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'color-element':
          result.colorElement = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'color-element-bright':
          result.colorElementBright = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'color-element-dark':
          result.colorElementDark = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'logo':
          result.logo = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'background':
          result.background = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'background-plain':
          result.backgroundPlain = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'background-default':
          result.backgroundDefault = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'logoheader':
          result.logoheader = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'favicon':
          result.favicon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.supportsEmoji;
    if (value != null) {
      result
        ..add('supports_emoji')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'supports_emoji':
          result.supportsEmoji = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data_Capabilities,
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data_Capabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.core;
    if (value != null) {
      result
        ..add('core')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core)));
    }
    value = object.bruteforce;
    if (value != null) {
      result
        ..add('bruteforce')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce)));
    }
    value = object.metadataAvailable;
    if (value != null) {
      result
        ..add('metadataAvailable')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable)));
    }
    value = object.files;
    if (value != null) {
      result
        ..add('files')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files)));
    }
    value = object.activity;
    if (value != null) {
      result
        ..add('activity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity)));
    }
    value = object.circles;
    if (value != null) {
      result
        ..add('circles')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles)));
    }
    value = object.ocm;
    if (value != null) {
      result
        ..add('ocm')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm)));
    }
    value = object.dav;
    if (value != null) {
      result
        ..add('dav')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav)));
    }
    value = object.filesSharing;
    if (value != null) {
      result
        ..add('files_sharing')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes)));
    }
    value = object.notifications;
    if (value != null) {
      result
        ..add('notifications')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications)));
    }
    value = object.passwordPolicy;
    if (value != null) {
      result
        ..add('password_policy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy)));
    }
    value = object.provisioningApi;
    if (value != null) {
      result
        ..add('provisioning_api')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi)));
    }
    value = object.theming;
    if (value != null) {
      result
        ..add('theming')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming)));
    }
    value = object.userStatus;
    if (value != null) {
      result
        ..add('user_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus)));
    }
    value = object.weatherStatus;
    if (value != null) {
      result
        ..add('weather_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus)));
    }
    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'core':
          result.core.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core);
          break;
        case 'bruteforce':
          result.bruteforce.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce);
          break;
        case 'metadataAvailable':
          result.metadataAvailable.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable);
          break;
        case 'files':
          result.files.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files);
          break;
        case 'activity':
          result.activity.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity);
          break;
        case 'circles':
          result.circles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles);
          break;
        case 'ocm':
          result.ocm.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm);
          break;
        case 'dav':
          result.dav.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav);
          break;
        case 'files_sharing':
          result.filesSharing.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing);
          break;
        case 'notes':
          result.notes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes);
          break;
        case 'notifications':
          result.notifications.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications);
          break;
        case 'password_policy':
          result.passwordPolicy.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy);
          break;
        case 'provisioning_api':
          result.provisioningApi.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi);
          break;
        case 'theming':
          result.theming.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming);
          break;
        case 'user_status':
          result.userStatus.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus);
          break;
        case 'weather_status':
          result.weatherStatus.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_DataSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreServerCapabilities_Ocs_Data,
    _$NextcloudCoreServerCapabilities_Ocs_Data
  ];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version,
          specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Version)),
      'capabilities',
      serializers.serialize(object.capabilities,
          specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities)),
    ];

    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Version))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Version);
          break;
        case 'capabilities':
          result.capabilities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities))!
              as NextcloudCoreServerCapabilities_Ocs_Data_Capabilities);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilities_OcsSerializer
    implements StructuredSerializer<NextcloudCoreServerCapabilities_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudCoreServerCapabilities_Ocs, _$NextcloudCoreServerCapabilities_Ocs];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data)),
    ];

    return result;
  }

  @override
  NextcloudCoreServerCapabilities_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilities_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs_Data))!
                  as NextcloudCoreServerCapabilities_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerCapabilitiesSerializer implements StructuredSerializer<NextcloudCoreServerCapabilities> {
  @override
  final Iterable<Type> types = const [NextcloudCoreServerCapabilities, _$NextcloudCoreServerCapabilities];
  @override
  final String wireName = 'NextcloudCoreServerCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreServerCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudCoreServerCapabilities deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreServerCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudCoreServerCapabilities_Ocs))!
                  as NextcloudCoreServerCapabilities_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreNavigationApps_Ocs_DataSerializer
    implements StructuredSerializer<NextcloudCoreNavigationApps_Ocs_Data> {
  @override
  final Iterable<Type> types = const [NextcloudCoreNavigationApps_Ocs_Data, _$NextcloudCoreNavigationApps_Ocs_Data];
  @override
  final String wireName = 'NextcloudCoreNavigationApps_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreNavigationApps_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(NextcloudCoreNavigationApps_Ocs_Data_Order)),
      'href',
      serializers.serialize(object.href, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
      'classes',
      serializers.serialize(object.classes, specifiedType: const FullType(String)),
      'unread',
      serializers.serialize(object.unread, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NextcloudCoreNavigationApps_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreNavigationApps_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'order':
          result.order.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudCoreNavigationApps_Ocs_Data_Order))!
                  as NextcloudCoreNavigationApps_Ocs_Data_Order);
          break;
        case 'href':
          result.href = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'classes':
          result.classes = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'unread':
          result.unread = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreNavigationApps_OcsSerializer implements StructuredSerializer<NextcloudCoreNavigationApps_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudCoreNavigationApps_Ocs, _$NextcloudCoreNavigationApps_Ocs];
  @override
  final String wireName = 'NextcloudCoreNavigationApps_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreNavigationApps_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudCoreNavigationApps_Ocs_Data)])),
    ];

    return result;
  }

  @override
  NextcloudCoreNavigationApps_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreNavigationApps_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudCoreNavigationApps_Ocs_Data)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreNavigationAppsSerializer implements StructuredSerializer<NextcloudCoreNavigationApps> {
  @override
  final Iterable<Type> types = const [NextcloudCoreNavigationApps, _$NextcloudCoreNavigationApps];
  @override
  final String wireName = 'NextcloudCoreNavigationApps';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreNavigationApps object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudCoreNavigationApps_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudCoreNavigationApps deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreNavigationAppsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudCoreNavigationApps_Ocs))! as NextcloudCoreNavigationApps_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreLoginFlowInit_PollSerializer implements StructuredSerializer<NextcloudCoreLoginFlowInit_Poll> {
  @override
  final Iterable<Type> types = const [NextcloudCoreLoginFlowInit_Poll, _$NextcloudCoreLoginFlowInit_Poll];
  @override
  final String wireName = 'NextcloudCoreLoginFlowInit_Poll';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreLoginFlowInit_Poll object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
      'endpoint',
      serializers.serialize(object.endpoint, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudCoreLoginFlowInit_Poll deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreLoginFlowInit_PollBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'endpoint':
          result.endpoint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreLoginFlowInitSerializer implements StructuredSerializer<NextcloudCoreLoginFlowInit> {
  @override
  final Iterable<Type> types = const [NextcloudCoreLoginFlowInit, _$NextcloudCoreLoginFlowInit];
  @override
  final String wireName = 'NextcloudCoreLoginFlowInit';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreLoginFlowInit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'poll',
      serializers.serialize(object.poll, specifiedType: const FullType(NextcloudCoreLoginFlowInit_Poll)),
      'login',
      serializers.serialize(object.login, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudCoreLoginFlowInit deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreLoginFlowInitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'poll':
          result.poll.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudCoreLoginFlowInit_Poll))! as NextcloudCoreLoginFlowInit_Poll);
          break;
        case 'login':
          result.login = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreLoginFlowResultSerializer implements StructuredSerializer<NextcloudCoreLoginFlowResult> {
  @override
  final Iterable<Type> types = const [NextcloudCoreLoginFlowResult, _$NextcloudCoreLoginFlowResult];
  @override
  final String wireName = 'NextcloudCoreLoginFlowResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreLoginFlowResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'server',
      serializers.serialize(object.server, specifiedType: const FullType(String)),
      'loginName',
      serializers.serialize(object.loginName, specifiedType: const FullType(String)),
      'appPassword',
      serializers.serialize(object.appPassword, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudCoreLoginFlowResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreLoginFlowResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'server':
          result.server = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'loginName':
          result.loginName = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'appPassword':
          result.appPassword = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreAutocompleteResult_Ocs_DataSerializer
    implements StructuredSerializer<NextcloudCoreAutocompleteResult_Ocs_Data> {
  @override
  final Iterable<Type> types = const [
    NextcloudCoreAutocompleteResult_Ocs_Data,
    _$NextcloudCoreAutocompleteResult_Ocs_Data
  ];
  @override
  final String wireName = 'NextcloudCoreAutocompleteResult_Ocs_Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreAutocompleteResult_Ocs_Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'source',
      serializers.serialize(object.source, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(NextcloudCoreAutocompleteResult_Ocs_Data_Status)),
      'subline',
      serializers.serialize(object.subline, specifiedType: const FullType(String)),
      'shareWithDisplayNameUnique',
      serializers.serialize(object.shareWithDisplayNameUnique, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreAutocompleteResult_Ocs_DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'source':
          result.source = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'status':
          result.status.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudCoreAutocompleteResult_Ocs_Data_Status))!
              as NextcloudCoreAutocompleteResult_Ocs_Data_Status);
          break;
        case 'subline':
          result.subline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'shareWithDisplayNameUnique':
          result.shareWithDisplayNameUnique =
              serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreAutocompleteResult_OcsSerializer
    implements StructuredSerializer<NextcloudCoreAutocompleteResult_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudCoreAutocompleteResult_Ocs, _$NextcloudCoreAutocompleteResult_Ocs];
  @override
  final String wireName = 'NextcloudCoreAutocompleteResult_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreAutocompleteResult_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudCoreAutocompleteResult_Ocs_Data)])),
    ];

    return result;
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreAutocompleteResult_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudCoreAutocompleteResult_Ocs_Data)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreAutocompleteResultSerializer implements StructuredSerializer<NextcloudCoreAutocompleteResult> {
  @override
  final Iterable<Type> types = const [NextcloudCoreAutocompleteResult, _$NextcloudCoreAutocompleteResult];
  @override
  final String wireName = 'NextcloudCoreAutocompleteResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudCoreAutocompleteResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudCoreAutocompleteResult_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudCoreAutocompleteResult deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudCoreAutocompleteResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudCoreAutocompleteResult_Ocs))!
                  as NextcloudCoreAutocompleteResult_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsSupportedAPIVersionsSerializer implements StructuredSerializer<NextcloudNewsSupportedAPIVersions> {
  @override
  final Iterable<Type> types = const [NextcloudNewsSupportedAPIVersions, _$NextcloudNewsSupportedAPIVersions];
  @override
  final String wireName = 'NextcloudNewsSupportedAPIVersions';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsSupportedAPIVersions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.apiLevels;
    if (value != null) {
      result
        ..add('apiLevels')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  NextcloudNewsSupportedAPIVersions deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsSupportedAPIVersionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'apiLevels':
          result.apiLevels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsArticleSerializer implements StructuredSerializer<NextcloudNewsArticle> {
  @override
  final Iterable<Type> types = const [NextcloudNewsArticle, _$NextcloudNewsArticle];
  @override
  final String wireName = 'NextcloudNewsArticle';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsArticle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'guid',
      serializers.serialize(object.guid, specifiedType: const FullType(String)),
      'guidHash',
      serializers.serialize(object.guidHash, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'pubDate',
      serializers.serialize(object.pubDate, specifiedType: const FullType(int)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'feedId',
      serializers.serialize(object.feedId, specifiedType: const FullType(int)),
      'unread',
      serializers.serialize(object.unread, specifiedType: const FullType(bool)),
      'starred',
      serializers.serialize(object.starred, specifiedType: const FullType(bool)),
      'lastModified',
      serializers.serialize(object.lastModified, specifiedType: const FullType(int)),
      'rtl',
      serializers.serialize(object.rtl, specifiedType: const FullType(bool)),
      'fingerprint',
      serializers.serialize(object.fingerprint, specifiedType: const FullType(String)),
      'contentHash',
      serializers.serialize(object.contentHash, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updatedDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.enclosureMime;
    if (value != null) {
      result
        ..add('enclosureMime')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.enclosureLink;
    if (value != null) {
      result
        ..add('enclosureLink')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.mediaThumbnail;
    if (value != null) {
      result
        ..add('mediaThumbnail')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.mediaDescription;
    if (value != null) {
      result
        ..add('mediaDescription')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudNewsArticle deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'guid':
          result.guid = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'guidHash':
          result.guidHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'author':
          result.author = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'pubDate':
          result.pubDate = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'updatedDate':
          result.updatedDate = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'body':
          result.body = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'enclosureMime':
          result.enclosureMime = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'enclosureLink':
          result.enclosureLink = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'mediaThumbnail':
          result.mediaThumbnail = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'mediaDescription':
          result.mediaDescription = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'feedId':
          result.feedId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'unread':
          result.unread = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'starred':
          result.starred = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'rtl':
          result.rtl = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'fingerprint':
          result.fingerprint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'contentHash':
          result.contentHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsFeedSerializer implements StructuredSerializer<NextcloudNewsFeed> {
  @override
  final Iterable<Type> types = const [NextcloudNewsFeed, _$NextcloudNewsFeed];
  @override
  final String wireName = 'NextcloudNewsFeed';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsFeed object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'added',
      serializers.serialize(object.added, specifiedType: const FullType(int)),
      'ordering',
      serializers.serialize(object.ordering, specifiedType: const FullType(int)),
      'pinned',
      serializers.serialize(object.pinned, specifiedType: const FullType(bool)),
      'updateErrorCount',
      serializers.serialize(object.updateErrorCount, specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsArticle)])),
    ];
    Object? value;
    value = object.faviconLink;
    if (value != null) {
      result
        ..add('faviconLink')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.folderId;
    if (value != null) {
      result
        ..add('folderId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.unreadCount;
    if (value != null) {
      result
        ..add('unreadCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.lastUpdateError;
    if (value != null) {
      result
        ..add('lastUpdateError')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudNewsFeed deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsFeedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'faviconLink':
          result.faviconLink = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'added':
          result.added = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'folderId':
          result.folderId = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'unreadCount':
          result.unreadCount = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'ordering':
          result.ordering = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'pinned':
          result.pinned = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'updateErrorCount':
          result.updateErrorCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'lastUpdateError':
          result.lastUpdateError = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsArticle)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsFolderSerializer implements StructuredSerializer<NextcloudNewsFolder> {
  @override
  final Iterable<Type> types = const [NextcloudNewsFolder, _$NextcloudNewsFolder];
  @override
  final String wireName = 'NextcloudNewsFolder';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsFolder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'opened',
      serializers.serialize(object.opened, specifiedType: const FullType(bool)),
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFeed)])),
    ];

    return result;
  }

  @override
  NextcloudNewsFolder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsFolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'opened':
          result.opened = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'feeds':
          result.feeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFeed)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsListFoldersSerializer implements StructuredSerializer<NextcloudNewsListFolders> {
  @override
  final Iterable<Type> types = const [NextcloudNewsListFolders, _$NextcloudNewsListFolders];
  @override
  final String wireName = 'NextcloudNewsListFolders';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsListFolders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'folders',
      serializers.serialize(object.folders, specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFolder)])),
    ];

    return result;
  }

  @override
  NextcloudNewsListFolders deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsListFoldersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'folders':
          result.folders.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFolder)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsListFeedsSerializer implements StructuredSerializer<NextcloudNewsListFeeds> {
  @override
  final Iterable<Type> types = const [NextcloudNewsListFeeds, _$NextcloudNewsListFeeds];
  @override
  final String wireName = 'NextcloudNewsListFeeds';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsListFeeds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFeed)])),
    ];
    Object? value;
    value = object.starredCount;
    if (value != null) {
      result
        ..add('starredCount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.newestItemId;
    if (value != null) {
      result
        ..add('newestItemId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NextcloudNewsListFeeds deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsListFeedsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'starredCount':
          result.starredCount = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'newestItemId':
          result.newestItemId = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'feeds':
          result.feeds.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsFeed)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNewsListArticlesSerializer implements StructuredSerializer<NextcloudNewsListArticles> {
  @override
  final Iterable<Type> types = const [NextcloudNewsListArticles, _$NextcloudNewsListArticles];
  @override
  final String wireName = 'NextcloudNewsListArticles';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNewsListArticles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsArticle)])),
    ];

    return result;
  }

  @override
  NextcloudNewsListArticles deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNewsListArticlesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(NextcloudNewsArticle)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotesNoteSerializer implements StructuredSerializer<NextcloudNotesNote> {
  @override
  final Iterable<Type> types = const [NextcloudNotesNote, _$NextcloudNotesNote];
  @override
  final String wireName = 'NextcloudNotesNote';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotesNote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'readonly',
      serializers.serialize(object.readonly, specifiedType: const FullType(bool)),
      'content',
      serializers.serialize(object.content, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category, specifiedType: const FullType(String)),
      'favorite',
      serializers.serialize(object.favorite, specifiedType: const FullType(bool)),
      'modified',
      serializers.serialize(object.modified, specifiedType: const FullType(int)),
      'error',
      serializers.serialize(object.error, specifiedType: const FullType(bool)),
      'errorType',
      serializers.serialize(object.errorType, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudNotesNote deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotesNoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'readonly':
          result.readonly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'content':
          result.content = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'modified':
          result.modified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'errorType':
          result.errorType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotesSettings_NoteModeSerializer implements PrimitiveSerializer<NextcloudNotesSettings_NoteMode> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudNotesSettings_NoteMode];
  @override
  final String wireName = 'NextcloudNotesSettings_NoteMode';

  @override
  Object serialize(Serializers serializers, NextcloudNotesSettings_NoteMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudNotesSettings_NoteMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudNotesSettings_NoteMode.valueOf(serialized as String);
}

class _$NextcloudNotesSettingsSerializer implements StructuredSerializer<NextcloudNotesSettings> {
  @override
  final Iterable<Type> types = const [NextcloudNotesSettings, _$NextcloudNotesSettings];
  @override
  final String wireName = 'NextcloudNotesSettings';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotesSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notesPath',
      serializers.serialize(object.notesPath, specifiedType: const FullType(String)),
      'fileSuffix',
      serializers.serialize(object.fileSuffix, specifiedType: const FullType(String)),
      'noteMode',
      serializers.serialize(object.noteMode, specifiedType: const FullType(NextcloudNotesSettings_NoteMode)),
    ];

    return result;
  }

  @override
  NextcloudNotesSettings deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotesSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notesPath':
          result.notesPath = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fileSuffix':
          result.fileSuffix = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'noteMode':
          result.noteMode = serializers.deserialize(value,
              specifiedType: const FullType(NextcloudNotesSettings_NoteMode))! as NextcloudNotesSettings_NoteMode;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsNotificationActionSerializer
    implements StructuredSerializer<NextcloudNotificationsNotificationAction> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsNotificationAction,
    _$NextcloudNotificationsNotificationAction
  ];
  @override
  final String wireName = 'NextcloudNotificationsNotificationAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsNotificationAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'label',
      serializers.serialize(object.label, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primary;
    if (value != null) {
      result
        ..add('primary')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudNotificationsNotificationAction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsNotificationActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'label':
          result.label = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'primary':
          result.primary = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsNotificationSerializer
    implements StructuredSerializer<NextcloudNotificationsNotification> {
  @override
  final Iterable<Type> types = const [NextcloudNotificationsNotification, _$NextcloudNotificationsNotification];
  @override
  final String wireName = 'NextcloudNotificationsNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'notification_id',
      serializers.serialize(object.notificationId, specifiedType: const FullType(int)),
      'app',
      serializers.serialize(object.app, specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'datetime',
      serializers.serialize(object.datetime, specifiedType: const FullType(String)),
      'object_type',
      serializers.serialize(object.objectType, specifiedType: const FullType(String)),
      'object_id',
      serializers.serialize(object.objectId, specifiedType: const FullType(String)),
      'subject',
      serializers.serialize(object.subject, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'subjectRich',
      serializers.serialize(object.subjectRich, specifiedType: const FullType(String)),
      'subjectRichParameters',
      serializers.serialize(object.subjectRichParameters, specifiedType: const FullType(JsonObject)),
      'messageRich',
      serializers.serialize(object.messageRich, specifiedType: const FullType(String)),
      'messageRichParameters',
      serializers.serialize(object.messageRichParameters, specifiedType: const FullType(JsonObject)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'actions',
      serializers.serialize(object.actions,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudNotificationsNotificationAction)])),
    ];

    return result;
  }

  @override
  NextcloudNotificationsNotification deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notification_id':
          result.notificationId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'object_type':
          result.objectType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'object_id':
          result.objectId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subjectRich':
          result.subjectRich = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subjectRichParameters':
          result.subjectRichParameters =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'messageRich':
          result.messageRich = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'messageRichParameters':
          result.messageRichParameters =
              serializers.deserialize(value, specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'actions':
          result.actions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudNotificationsNotificationAction)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsListNotifications_OcsSerializer
    implements StructuredSerializer<NextcloudNotificationsListNotifications_Ocs> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsListNotifications_Ocs,
    _$NextcloudNotificationsListNotifications_Ocs
  ];
  @override
  final String wireName = 'NextcloudNotificationsListNotifications_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsListNotifications_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudNotificationsNotification)])),
    ];

    return result;
  }

  @override
  NextcloudNotificationsListNotifications_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsListNotifications_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudNotificationsNotification)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsListNotificationsSerializer
    implements StructuredSerializer<NextcloudNotificationsListNotifications> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsListNotifications,
    _$NextcloudNotificationsListNotifications
  ];
  @override
  final String wireName = 'NextcloudNotificationsListNotifications';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsListNotifications object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudNotificationsListNotifications_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudNotificationsListNotifications deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsListNotificationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudNotificationsListNotifications_Ocs))!
              as NextcloudNotificationsListNotifications_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsGetNotification_OcsSerializer
    implements StructuredSerializer<NextcloudNotificationsGetNotification_Ocs> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsGetNotification_Ocs,
    _$NextcloudNotificationsGetNotification_Ocs
  ];
  @override
  final String wireName = 'NextcloudNotificationsGetNotification_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsGetNotification_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudNotificationsNotification)),
    ];

    return result;
  }

  @override
  NextcloudNotificationsGetNotification_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsGetNotification_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudNotificationsNotification))!
                  as NextcloudNotificationsNotification);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsGetNotificationSerializer
    implements StructuredSerializer<NextcloudNotificationsGetNotification> {
  @override
  final Iterable<Type> types = const [NextcloudNotificationsGetNotification, _$NextcloudNotificationsGetNotification];
  @override
  final String wireName = 'NextcloudNotificationsGetNotification';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsGetNotification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudNotificationsGetNotification_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudNotificationsGetNotification deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsGetNotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudNotificationsGetNotification_Ocs))!
                  as NextcloudNotificationsGetNotification_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudEmptyOCS_OcsSerializer implements StructuredSerializer<NextcloudEmptyOCS_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudEmptyOCS_Ocs, _$NextcloudEmptyOCS_Ocs];
  @override
  final String wireName = 'NextcloudEmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudEmptyOCS_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];

    return result;
  }

  @override
  NextcloudEmptyOCS_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudEmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudEmptyOCSSerializer implements StructuredSerializer<NextcloudEmptyOCS> {
  @override
  final Iterable<Type> types = const [NextcloudEmptyOCS, _$NextcloudEmptyOCS];
  @override
  final String wireName = 'NextcloudEmptyOCS';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudEmptyOCS object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudEmptyOCS_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudEmptyOCS deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudEmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value, specifiedType: const FullType(NextcloudEmptyOCS_Ocs))!
              as NextcloudEmptyOCS_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsPushServerSubscriptionSerializer
    implements StructuredSerializer<NextcloudNotificationsPushServerSubscription> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsPushServerSubscription,
    _$NextcloudNotificationsPushServerSubscription
  ];
  @override
  final String wireName = 'NextcloudNotificationsPushServerSubscription';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsPushServerSubscription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'publicKey',
      serializers.serialize(object.publicKey, specifiedType: const FullType(String)),
      'deviceIdentifier',
      serializers.serialize(object.deviceIdentifier, specifiedType: const FullType(String)),
      'signature',
      serializers.serialize(object.signature, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudNotificationsPushServerSubscription deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsPushServerSubscriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'publicKey':
          result.publicKey = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'deviceIdentifier':
          result.deviceIdentifier = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsPushServerRegistration_OcsSerializer
    implements StructuredSerializer<NextcloudNotificationsPushServerRegistration_Ocs> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsPushServerRegistration_Ocs,
    _$NextcloudNotificationsPushServerRegistration_Ocs
  ];
  @override
  final String wireName = 'NextcloudNotificationsPushServerRegistration_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsPushServerRegistration_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudNotificationsPushServerSubscription)),
    ];

    return result;
  }

  @override
  NextcloudNotificationsPushServerRegistration_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsPushServerRegistration_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudNotificationsPushServerSubscription))!
              as NextcloudNotificationsPushServerSubscription);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsPushServerRegistrationSerializer
    implements StructuredSerializer<NextcloudNotificationsPushServerRegistration> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsPushServerRegistration,
    _$NextcloudNotificationsPushServerRegistration
  ];
  @override
  final String wireName = 'NextcloudNotificationsPushServerRegistration';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsPushServerRegistration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs,
          specifiedType: const FullType(NextcloudNotificationsPushServerRegistration_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudNotificationsPushServerRegistration deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsPushServerRegistrationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudNotificationsPushServerRegistration_Ocs))!
              as NextcloudNotificationsPushServerRegistration_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudProvisioningApiUserDetails_QuotaSerializer
    implements StructuredSerializer<NextcloudProvisioningApiUserDetails_Quota> {
  @override
  final Iterable<Type> types = const [
    NextcloudProvisioningApiUserDetails_Quota,
    _$NextcloudProvisioningApiUserDetails_Quota
  ];
  @override
  final String wireName = 'NextcloudProvisioningApiUserDetails_Quota';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudProvisioningApiUserDetails_Quota object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'free',
      serializers.serialize(object.free, specifiedType: const FullType(int)),
      'used',
      serializers.serialize(object.used, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'relative',
      serializers.serialize(object.relative, specifiedType: const FullType(num)),
      'quota',
      serializers.serialize(object.quota, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NextcloudProvisioningApiUserDetails_Quota deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudProvisioningApiUserDetails_QuotaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'free':
          result.free = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'used':
          result.used = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'relative':
          result.relative = serializers.deserialize(value, specifiedType: const FullType(num))! as num;
          break;
        case 'quota':
          result.quota = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudProvisioningApiUserDetails_BackendCapabilitiesSerializer
    implements StructuredSerializer<NextcloudProvisioningApiUserDetails_BackendCapabilities> {
  @override
  final Iterable<Type> types = const [
    NextcloudProvisioningApiUserDetails_BackendCapabilities,
    _$NextcloudProvisioningApiUserDetails_BackendCapabilities
  ];
  @override
  final String wireName = 'NextcloudProvisioningApiUserDetails_BackendCapabilities';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudProvisioningApiUserDetails_BackendCapabilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'setDisplayName',
      serializers.serialize(object.setDisplayName, specifiedType: const FullType(bool)),
      'setPassword',
      serializers.serialize(object.setPassword, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudProvisioningApiUserDetails_BackendCapabilities deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'setDisplayName':
          result.setDisplayName = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'setPassword':
          result.setPassword = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudProvisioningApiUserDetailsSerializer
    implements StructuredSerializer<NextcloudProvisioningApiUserDetails> {
  @override
  final Iterable<Type> types = const [NextcloudProvisioningApiUserDetails, _$NextcloudProvisioningApiUserDetails];
  @override
  final String wireName = 'NextcloudProvisioningApiUserDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudProvisioningApiUserDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'lastLogin',
      serializers.serialize(object.lastLogin, specifiedType: const FullType(int)),
      'backend',
      serializers.serialize(object.backend, specifiedType: const FullType(String)),
      'subadmin',
      serializers.serialize(object.subadmin, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'quota',
      serializers.serialize(object.quota, specifiedType: const FullType(NextcloudProvisioningApiUserDetails_Quota)),
      'avatarScope',
      serializers.serialize(object.avatarScope, specifiedType: const FullType(String)),
      'emailScope',
      serializers.serialize(object.emailScope, specifiedType: const FullType(String)),
      'additional_mail',
      serializers.serialize(object.additionalMail, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'additional_mailScope',
      serializers.serialize(object.additionalMailScope, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'displaynameScope',
      serializers.serialize(object.displaynameScope, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone, specifiedType: const FullType(String)),
      'phoneScope',
      serializers.serialize(object.phoneScope, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address, specifiedType: const FullType(String)),
      'addressScope',
      serializers.serialize(object.addressScope, specifiedType: const FullType(String)),
      'website',
      serializers.serialize(object.website, specifiedType: const FullType(String)),
      'websiteScope',
      serializers.serialize(object.websiteScope, specifiedType: const FullType(String)),
      'twitter',
      serializers.serialize(object.twitter, specifiedType: const FullType(String)),
      'twitterScope',
      serializers.serialize(object.twitterScope, specifiedType: const FullType(String)),
      'organisation',
      serializers.serialize(object.organisation, specifiedType: const FullType(String)),
      'organisationScope',
      serializers.serialize(object.organisationScope, specifiedType: const FullType(String)),
      'role',
      serializers.serialize(object.role, specifiedType: const FullType(String)),
      'roleScope',
      serializers.serialize(object.roleScope, specifiedType: const FullType(String)),
      'headline',
      serializers.serialize(object.headline, specifiedType: const FullType(String)),
      'headlineScope',
      serializers.serialize(object.headlineScope, specifiedType: const FullType(String)),
      'biography',
      serializers.serialize(object.biography, specifiedType: const FullType(String)),
      'biographyScope',
      serializers.serialize(object.biographyScope, specifiedType: const FullType(String)),
      'profile_enabled',
      serializers.serialize(object.profileEnabled, specifiedType: const FullType(String)),
      'profile_enabledScope',
      serializers.serialize(object.profileEnabledScope, specifiedType: const FullType(String)),
      'fediverse',
      serializers.serialize(object.fediverse, specifiedType: const FullType(String)),
      'fediverseScope',
      serializers.serialize(object.fediverseScope, specifiedType: const FullType(String)),
      'groups',
      serializers.serialize(object.groups, specifiedType: const FullType(BuiltList, [FullType(String)])),
      'language',
      serializers.serialize(object.language, specifiedType: const FullType(String)),
      'locale',
      serializers.serialize(object.locale, specifiedType: const FullType(String)),
      'backendCapabilities',
      serializers.serialize(object.backendCapabilities,
          specifiedType: const FullType(NextcloudProvisioningApiUserDetails_BackendCapabilities)),
    ];
    Object? value;
    value = object.enabled;
    if (value != null) {
      result
        ..add('enabled')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.storageLocation;
    if (value != null) {
      result
        ..add('storageLocation')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.displayname;
    if (value != null) {
      result
        ..add('displayname')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.notifyEmail;
    if (value != null) {
      result
        ..add('notify_email')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display-name')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NextcloudProvisioningApiUserDetails deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudProvisioningApiUserDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'enabled':
          result.enabled = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'storageLocation':
          result.storageLocation = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'lastLogin':
          result.lastLogin = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
        case 'backend':
          result.backend = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'subadmin':
          result.subadmin.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'quota':
          result.quota.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudProvisioningApiUserDetails_Quota))!
                  as NextcloudProvisioningApiUserDetails_Quota);
          break;
        case 'avatarScope':
          result.avatarScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'emailScope':
          result.emailScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'additional_mail':
          result.additionalMail.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'additional_mailScope':
          result.additionalMailScope.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'displayname':
          result.displayname = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'displaynameScope':
          result.displaynameScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'phoneScope':
          result.phoneScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'addressScope':
          result.addressScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'websiteScope':
          result.websiteScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'twitterScope':
          result.twitterScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'organisation':
          result.organisation = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'organisationScope':
          result.organisationScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'roleScope':
          result.roleScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'headline':
          result.headline = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'headlineScope':
          result.headlineScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'biography':
          result.biography = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'biographyScope':
          result.biographyScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'profile_enabled':
          result.profileEnabled = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'profile_enabledScope':
          result.profileEnabledScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fediverse':
          result.fediverse = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'fediverseScope':
          result.fediverseScope = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
        case 'language':
          result.language = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'locale':
          result.locale = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'notify_email':
          result.notifyEmail = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'backendCapabilities':
          result.backendCapabilities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudProvisioningApiUserDetails_BackendCapabilities))!
              as NextcloudProvisioningApiUserDetails_BackendCapabilities);
          break;
        case 'display-name':
          result.displayName = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudProvisioningApiUser_OcsSerializer implements StructuredSerializer<NextcloudProvisioningApiUser_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudProvisioningApiUser_Ocs, _$NextcloudProvisioningApiUser_Ocs];
  @override
  final String wireName = 'NextcloudProvisioningApiUser_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudProvisioningApiUser_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudProvisioningApiUserDetails)),
    ];

    return result;
  }

  @override
  NextcloudProvisioningApiUser_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudProvisioningApiUser_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudProvisioningApiUserDetails))!
                  as NextcloudProvisioningApiUserDetails);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudProvisioningApiUserSerializer implements StructuredSerializer<NextcloudProvisioningApiUser> {
  @override
  final Iterable<Type> types = const [NextcloudProvisioningApiUser, _$NextcloudProvisioningApiUser];
  @override
  final String wireName = 'NextcloudProvisioningApiUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudProvisioningApiUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudProvisioningApiUser_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudProvisioningApiUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudProvisioningApiUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudProvisioningApiUser_Ocs))! as NextcloudProvisioningApiUser_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderCheckResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderCheckResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderCheckResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderCheckResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'deviceId',
      serializers.serialize(object.deviceId, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'deviceId':
          result.deviceId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson,
    _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
      'token',
      serializers.serialize(object.token, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'token':
          result.token = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushSerializer
    implements
        StructuredSerializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'version',
      serializers.serialize(object.version, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType:
              const FullType(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush))!
              as NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderPushResponse201ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderPushResponse201ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderPushResponse201ApplicationJson,
    _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderPushResponse201ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderPushResponse201ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderPushResponse201ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushSerializer
    implements
        StructuredSerializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'gateway',
      serializers.serialize(object.gateway, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gateway':
          result.gateway = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'unifiedpush',
      serializers.serialize(object.unifiedpush,
          specifiedType:
              const FullType(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush)),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'unifiedpush':
          result.unifiedpush.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush))!
              as NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonSerializer
    implements StructuredSerializer<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson> {
  @override
  final Iterable<Type> types = const [
    NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson,
    _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson
  ];
  @override
  final String wireName = 'NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'rejected',
      serializers.serialize(object.rejected, specifiedType: const FullType(BuiltList, [FullType(String)])),
    ];

    return result;
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rejected':
          result.rejected.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(String)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusClearAt_TypeSerializer implements PrimitiveSerializer<NextcloudUserStatusClearAt_Type> {
  static const Map<String, Object> _toWire = <String, Object>{
    'endOf': 'end-of',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'end-of': 'endOf',
  };

  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusClearAt_Type];
  @override
  final String wireName = 'NextcloudUserStatusClearAt_Type';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusClearAt_Type object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NextcloudUserStatusClearAt_Type deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusClearAt_Type.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$NextcloudUserStatusClearAt_Time0Serializer implements PrimitiveSerializer<NextcloudUserStatusClearAt_Time0> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusClearAt_Time0];
  @override
  final String wireName = 'NextcloudUserStatusClearAt_Time0';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusClearAt_Time0 object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudUserStatusClearAt_Time0 deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusClearAt_Time0.valueOf(serialized as String);
}

class _$NextcloudUserStatusClearAtSerializer implements StructuredSerializer<NextcloudUserStatusClearAt> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusClearAt, _$NextcloudUserStatusClearAt];
  @override
  final String wireName = 'NextcloudUserStatusClearAt';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusClearAt object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(NextcloudUserStatusClearAt_Type)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(NextcloudUserStatusClearAt_Time)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusClearAt deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusClearAtBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusClearAt_Type))!
              as NextcloudUserStatusClearAt_Type;
          break;
        case 'time':
          result.time.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudUserStatusClearAt_Time))! as NextcloudUserStatusClearAt_Time);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusTypeSerializer implements PrimitiveSerializer<NextcloudUserStatusType> {
  @override
  final Iterable<Type> types = const <Type>[NextcloudUserStatusType];
  @override
  final String wireName = 'NextcloudUserStatusType';

  @override
  Object serialize(Serializers serializers, NextcloudUserStatusType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  NextcloudUserStatusType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NextcloudUserStatusType.valueOf(serialized as String);
}

class _$NextcloudUserStatusPublicStatusSerializer implements StructuredSerializer<NextcloudUserStatusPublicStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusPublicStatus, _$NextcloudUserStatusPublicStatus];
  @override
  final String wireName = 'NextcloudUserStatusPublicStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusPublicStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(NextcloudUserStatusType)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(NextcloudUserStatusPublicStatus_ClearAt)));
    }
    return result;
  }

  @override
  NextcloudUserStatusPublicStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusPublicStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'clearAt':
          result.clearAt.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusPublicStatus_ClearAt))!
                  as NextcloudUserStatusPublicStatus_ClearAt);
          break;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusType))!
              as NextcloudUserStatusType;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetPublicStatuses_OcsSerializer
    implements StructuredSerializer<NextcloudUserStatusGetPublicStatuses_Ocs> {
  @override
  final Iterable<Type> types = const [
    NextcloudUserStatusGetPublicStatuses_Ocs,
    _$NextcloudUserStatusGetPublicStatuses_Ocs
  ];
  @override
  final String wireName = 'NextcloudUserStatusGetPublicStatuses_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetPublicStatuses_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudUserStatusPublicStatus)])),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetPublicStatuses_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetPublicStatuses_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudUserStatusPublicStatus)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetPublicStatusesSerializer
    implements StructuredSerializer<NextcloudUserStatusGetPublicStatuses> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetPublicStatuses, _$NextcloudUserStatusGetPublicStatuses];
  @override
  final String wireName = 'NextcloudUserStatusGetPublicStatuses';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetPublicStatuses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudUserStatusGetPublicStatuses_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetPublicStatuses deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetPublicStatusesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusGetPublicStatuses_Ocs))!
                  as NextcloudUserStatusGetPublicStatuses_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetPublicStatus_OcsSerializer
    implements StructuredSerializer<NextcloudUserStatusGetPublicStatus_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetPublicStatus_Ocs, _$NextcloudUserStatusGetPublicStatus_Ocs];
  @override
  final String wireName = 'NextcloudUserStatusGetPublicStatus_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetPublicStatus_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudUserStatusGetPublicStatus_Ocs_Data)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetPublicStatus_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetPublicStatus_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudUserStatusGetPublicStatus_Ocs_Data))!
              as NextcloudUserStatusGetPublicStatus_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetPublicStatusSerializer
    implements StructuredSerializer<NextcloudUserStatusGetPublicStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetPublicStatus, _$NextcloudUserStatusGetPublicStatus];
  @override
  final String wireName = 'NextcloudUserStatusGetPublicStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetPublicStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudUserStatusGetPublicStatus_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetPublicStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetPublicStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusGetPublicStatus_Ocs))!
                  as NextcloudUserStatusGetPublicStatus_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusStatusSerializer implements StructuredSerializer<NextcloudUserStatusStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusStatus, _$NextcloudUserStatusStatus];
  @override
  final String wireName = 'NextcloudUserStatusStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(String)),
      'messageIsPredefined',
      serializers.serialize(object.messageIsPredefined, specifiedType: const FullType(bool)),
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(NextcloudUserStatusType)),
      'statusIsUserDefined',
      serializers.serialize(object.statusIsUserDefined, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.messageId;
    if (value != null) {
      result
        ..add('messageId')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(NextcloudUserStatusStatus_ClearAt)));
    }
    return result;
  }

  @override
  NextcloudUserStatusStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'messageId':
          result.messageId = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'messageIsPredefined':
          result.messageIsPredefined = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'clearAt':
          result.clearAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudUserStatusStatus_ClearAt))! as NextcloudUserStatusStatus_ClearAt);
          break;
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusType))!
              as NextcloudUserStatusType;
          break;
        case 'statusIsUserDefined':
          result.statusIsUserDefined = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetStatus_OcsSerializer implements StructuredSerializer<NextcloudUserStatusGetStatus_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetStatus_Ocs, _$NextcloudUserStatusGetStatus_Ocs];
  @override
  final String wireName = 'NextcloudUserStatusGetStatus_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetStatus_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudUserStatusGetStatus_Ocs_Data)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetStatus_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetStatus_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusGetStatus_Ocs_Data))!
                  as NextcloudUserStatusGetStatus_Ocs_Data);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusGetStatusSerializer implements StructuredSerializer<NextcloudUserStatusGetStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusGetStatus, _$NextcloudUserStatusGetStatus];
  @override
  final String wireName = 'NextcloudUserStatusGetStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusGetStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudUserStatusGetStatus_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusGetStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusGetStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudUserStatusGetStatus_Ocs))! as NextcloudUserStatusGetStatus_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusPredefinedStatusSerializer
    implements StructuredSerializer<NextcloudUserStatusPredefinedStatus> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusPredefinedStatus, _$NextcloudUserStatusPredefinedStatus];
  @override
  final String wireName = 'NextcloudUserStatusPredefinedStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusPredefinedStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.clearAt;
    if (value != null) {
      result
        ..add('clearAt')
        ..add(serializers.serialize(value, specifiedType: const FullType(NextcloudUserStatusPredefinedStatus_ClearAt)));
    }
    return result;
  }

  @override
  NextcloudUserStatusPredefinedStatus deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusPredefinedStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
          break;
        case 'clearAt':
          result.clearAt.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NextcloudUserStatusPredefinedStatus_ClearAt))!
              as NextcloudUserStatusPredefinedStatus_ClearAt);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusPredefinedStatuses_OcsSerializer
    implements StructuredSerializer<NextcloudUserStatusPredefinedStatuses_Ocs> {
  @override
  final Iterable<Type> types = const [
    NextcloudUserStatusPredefinedStatuses_Ocs,
    _$NextcloudUserStatusPredefinedStatuses_Ocs
  ];
  @override
  final String wireName = 'NextcloudUserStatusPredefinedStatuses_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusPredefinedStatuses_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(BuiltList, [FullType(NextcloudUserStatusPredefinedStatus)])),
    ];

    return result;
  }

  @override
  NextcloudUserStatusPredefinedStatuses_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusPredefinedStatuses_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(NextcloudUserStatusPredefinedStatus)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusPredefinedStatusesSerializer
    implements StructuredSerializer<NextcloudUserStatusPredefinedStatuses> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusPredefinedStatuses, _$NextcloudUserStatusPredefinedStatuses];
  @override
  final String wireName = 'NextcloudUserStatusPredefinedStatuses';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusPredefinedStatuses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudUserStatusPredefinedStatuses_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusPredefinedStatuses deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusPredefinedStatusesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusPredefinedStatuses_Ocs))!
                  as NextcloudUserStatusPredefinedStatuses_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusHeartbeat_OcsSerializer implements StructuredSerializer<NextcloudUserStatusHeartbeat_Ocs> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusHeartbeat_Ocs, _$NextcloudUserStatusHeartbeat_Ocs];
  @override
  final String wireName = 'NextcloudUserStatusHeartbeat_Ocs';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusHeartbeat_Ocs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(NextcloudOCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(NextcloudUserStatusStatus)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusHeartbeat_Ocs deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusHeartbeat_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
              serializers.deserialize(value, specifiedType: const FullType(NextcloudOCSMeta))! as NextcloudOCSMeta);
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value, specifiedType: const FullType(NextcloudUserStatusStatus))!
              as NextcloudUserStatusStatus);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudUserStatusHeartbeatSerializer implements StructuredSerializer<NextcloudUserStatusHeartbeat> {
  @override
  final Iterable<Type> types = const [NextcloudUserStatusHeartbeat, _$NextcloudUserStatusHeartbeat];
  @override
  final String wireName = 'NextcloudUserStatusHeartbeat';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudUserStatusHeartbeat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(NextcloudUserStatusHeartbeat_Ocs)),
    ];

    return result;
  }

  @override
  NextcloudUserStatusHeartbeat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudUserStatusHeartbeatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(serializers.deserialize(value,
              specifiedType: const FullType(NextcloudUserStatusHeartbeat_Ocs))! as NextcloudUserStatusHeartbeat_Ocs);
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudNotificationsNotificationDecryptedSubjectSerializer
    implements StructuredSerializer<NextcloudNotificationsNotificationDecryptedSubject> {
  @override
  final Iterable<Type> types = const [
    NextcloudNotificationsNotificationDecryptedSubject,
    _$NextcloudNotificationsNotificationDecryptedSubject
  ];
  @override
  final String wireName = 'NextcloudNotificationsNotificationDecryptedSubject';

  @override
  Iterable<Object?> serialize(Serializers serializers, NextcloudNotificationsNotificationDecryptedSubject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nid;
    if (value != null) {
      result
        ..add('nid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.app;
    if (value != null) {
      result
        ..add('app')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.subject;
    if (value != null) {
      result
        ..add('subject')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.delete;
    if (value != null) {
      result
        ..add('delete')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteAll;
    if (value != null) {
      result
        ..add('delete-all')
        ..add(serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NextcloudNotificationsNotificationDecryptedSubject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NextcloudNotificationsNotificationDecryptedSubjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nid':
          result.nid = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'app':
          result.app = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'subject':
          result.subject = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'delete':
          result.delete = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete-all':
          result.deleteAll = serializers.deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$NextcloudCoreServerStatus extends NextcloudCoreServerStatus {
  @override
  final bool installed;
  @override
  final bool maintenance;
  @override
  final bool needsDbUpgrade;
  @override
  final String version;
  @override
  final String versionstring;
  @override
  final String edition;
  @override
  final String productname;
  @override
  final bool extendedSupport;

  factory _$NextcloudCoreServerStatus([void Function(NextcloudCoreServerStatusBuilder)? updates]) =>
      (NextcloudCoreServerStatusBuilder()..update(updates))._build();

  _$NextcloudCoreServerStatus._(
      {required this.installed,
      required this.maintenance,
      required this.needsDbUpgrade,
      required this.version,
      required this.versionstring,
      required this.edition,
      required this.productname,
      required this.extendedSupport})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(installed, r'NextcloudCoreServerStatus', 'installed');
    BuiltValueNullFieldError.checkNotNull(maintenance, r'NextcloudCoreServerStatus', 'maintenance');
    BuiltValueNullFieldError.checkNotNull(needsDbUpgrade, r'NextcloudCoreServerStatus', 'needsDbUpgrade');
    BuiltValueNullFieldError.checkNotNull(version, r'NextcloudCoreServerStatus', 'version');
    BuiltValueNullFieldError.checkNotNull(versionstring, r'NextcloudCoreServerStatus', 'versionstring');
    BuiltValueNullFieldError.checkNotNull(edition, r'NextcloudCoreServerStatus', 'edition');
    BuiltValueNullFieldError.checkNotNull(productname, r'NextcloudCoreServerStatus', 'productname');
    BuiltValueNullFieldError.checkNotNull(extendedSupport, r'NextcloudCoreServerStatus', 'extendedSupport');
  }

  @override
  NextcloudCoreServerStatus rebuild(void Function(NextcloudCoreServerStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerStatusBuilder toBuilder() => NextcloudCoreServerStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerStatus &&
        installed == other.installed &&
        maintenance == other.maintenance &&
        needsDbUpgrade == other.needsDbUpgrade &&
        version == other.version &&
        versionstring == other.versionstring &&
        edition == other.edition &&
        productname == other.productname &&
        extendedSupport == other.extendedSupport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, installed.hashCode);
    _$hash = $jc(_$hash, maintenance.hashCode);
    _$hash = $jc(_$hash, needsDbUpgrade.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, versionstring.hashCode);
    _$hash = $jc(_$hash, edition.hashCode);
    _$hash = $jc(_$hash, productname.hashCode);
    _$hash = $jc(_$hash, extendedSupport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerStatus')
          ..add('installed', installed)
          ..add('maintenance', maintenance)
          ..add('needsDbUpgrade', needsDbUpgrade)
          ..add('version', version)
          ..add('versionstring', versionstring)
          ..add('edition', edition)
          ..add('productname', productname)
          ..add('extendedSupport', extendedSupport))
        .toString();
  }
}

class NextcloudCoreServerStatusBuilder implements Builder<NextcloudCoreServerStatus, NextcloudCoreServerStatusBuilder> {
  _$NextcloudCoreServerStatus? _$v;

  bool? _installed;
  bool? get installed => _$this._installed;
  set installed(bool? installed) => _$this._installed = installed;

  bool? _maintenance;
  bool? get maintenance => _$this._maintenance;
  set maintenance(bool? maintenance) => _$this._maintenance = maintenance;

  bool? _needsDbUpgrade;
  bool? get needsDbUpgrade => _$this._needsDbUpgrade;
  set needsDbUpgrade(bool? needsDbUpgrade) => _$this._needsDbUpgrade = needsDbUpgrade;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  String? _versionstring;
  String? get versionstring => _$this._versionstring;
  set versionstring(String? versionstring) => _$this._versionstring = versionstring;

  String? _edition;
  String? get edition => _$this._edition;
  set edition(String? edition) => _$this._edition = edition;

  String? _productname;
  String? get productname => _$this._productname;
  set productname(String? productname) => _$this._productname = productname;

  bool? _extendedSupport;
  bool? get extendedSupport => _$this._extendedSupport;
  set extendedSupport(bool? extendedSupport) => _$this._extendedSupport = extendedSupport;

  NextcloudCoreServerStatusBuilder();

  NextcloudCoreServerStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _installed = $v.installed;
      _maintenance = $v.maintenance;
      _needsDbUpgrade = $v.needsDbUpgrade;
      _version = $v.version;
      _versionstring = $v.versionstring;
      _edition = $v.edition;
      _productname = $v.productname;
      _extendedSupport = $v.extendedSupport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerStatus;
  }

  @override
  void update(void Function(NextcloudCoreServerStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerStatus build() => _build();

  _$NextcloudCoreServerStatus _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerStatus._(
            installed: BuiltValueNullFieldError.checkNotNull(installed, r'NextcloudCoreServerStatus', 'installed'),
            maintenance:
                BuiltValueNullFieldError.checkNotNull(maintenance, r'NextcloudCoreServerStatus', 'maintenance'),
            needsDbUpgrade:
                BuiltValueNullFieldError.checkNotNull(needsDbUpgrade, r'NextcloudCoreServerStatus', 'needsDbUpgrade'),
            version: BuiltValueNullFieldError.checkNotNull(version, r'NextcloudCoreServerStatus', 'version'),
            versionstring:
                BuiltValueNullFieldError.checkNotNull(versionstring, r'NextcloudCoreServerStatus', 'versionstring'),
            edition: BuiltValueNullFieldError.checkNotNull(edition, r'NextcloudCoreServerStatus', 'edition'),
            productname:
                BuiltValueNullFieldError.checkNotNull(productname, r'NextcloudCoreServerStatus', 'productname'),
            extendedSupport: BuiltValueNullFieldError.checkNotNull(
                extendedSupport, r'NextcloudCoreServerStatus', 'extendedSupport'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudOCSMeta extends NextcloudOCSMeta {
  @override
  final String status;
  @override
  final int statuscode;
  @override
  final String? message;
  @override
  final String? totalitems;
  @override
  final String? itemsperpage;

  factory _$NextcloudOCSMeta([void Function(NextcloudOCSMetaBuilder)? updates]) =>
      (NextcloudOCSMetaBuilder()..update(updates))._build();

  _$NextcloudOCSMeta._(
      {required this.status, required this.statuscode, this.message, this.totalitems, this.itemsperpage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'NextcloudOCSMeta', 'status');
    BuiltValueNullFieldError.checkNotNull(statuscode, r'NextcloudOCSMeta', 'statuscode');
  }

  @override
  NextcloudOCSMeta rebuild(void Function(NextcloudOCSMetaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NextcloudOCSMetaBuilder toBuilder() => NextcloudOCSMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudOCSMeta &&
        status == other.status &&
        statuscode == other.statuscode &&
        message == other.message &&
        totalitems == other.totalitems &&
        itemsperpage == other.itemsperpage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statuscode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, totalitems.hashCode);
    _$hash = $jc(_$hash, itemsperpage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudOCSMeta')
          ..add('status', status)
          ..add('statuscode', statuscode)
          ..add('message', message)
          ..add('totalitems', totalitems)
          ..add('itemsperpage', itemsperpage))
        .toString();
  }
}

class NextcloudOCSMetaBuilder implements Builder<NextcloudOCSMeta, NextcloudOCSMetaBuilder> {
  _$NextcloudOCSMeta? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  int? _statuscode;
  int? get statuscode => _$this._statuscode;
  set statuscode(int? statuscode) => _$this._statuscode = statuscode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _totalitems;
  String? get totalitems => _$this._totalitems;
  set totalitems(String? totalitems) => _$this._totalitems = totalitems;

  String? _itemsperpage;
  String? get itemsperpage => _$this._itemsperpage;
  set itemsperpage(String? itemsperpage) => _$this._itemsperpage = itemsperpage;

  NextcloudOCSMetaBuilder();

  NextcloudOCSMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _statuscode = $v.statuscode;
      _message = $v.message;
      _totalitems = $v.totalitems;
      _itemsperpage = $v.itemsperpage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudOCSMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudOCSMeta;
  }

  @override
  void update(void Function(NextcloudOCSMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudOCSMeta build() => _build();

  _$NextcloudOCSMeta _build() {
    final _$result = _$v ??
        _$NextcloudOCSMeta._(
            status: BuiltValueNullFieldError.checkNotNull(status, r'NextcloudOCSMeta', 'status'),
            statuscode: BuiltValueNullFieldError.checkNotNull(statuscode, r'NextcloudOCSMeta', 'statuscode'),
            message: message,
            totalitems: totalitems,
            itemsperpage: itemsperpage);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Version extends NextcloudCoreServerCapabilities_Ocs_Data_Version {
  @override
  final int? major;
  @override
  final int? minor;
  @override
  final int? micro;
  @override
  final String? string;
  @override
  final String? edition;
  @override
  final bool? extendedSupport;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Version(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Version._(
      {this.major, this.minor, this.micro, this.string, this.edition, this.extendedSupport})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Version rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Version &&
        major == other.major &&
        minor == other.minor &&
        micro == other.micro &&
        string == other.string &&
        edition == other.edition &&
        extendedSupport == other.extendedSupport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, major.hashCode);
    _$hash = $jc(_$hash, minor.hashCode);
    _$hash = $jc(_$hash, micro.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, edition.hashCode);
    _$hash = $jc(_$hash, extendedSupport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Version')
          ..add('major', major)
          ..add('minor', minor)
          ..add('micro', micro)
          ..add('string', string)
          ..add('edition', edition)
          ..add('extendedSupport', extendedSupport))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Version,
            NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Version? _$v;

  int? _major;
  int? get major => _$this._major;
  set major(int? major) => _$this._major = major;

  int? _minor;
  int? get minor => _$this._minor;
  set minor(int? minor) => _$this._minor = minor;

  int? _micro;
  int? get micro => _$this._micro;
  set micro(int? micro) => _$this._micro = micro;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  String? _edition;
  String? get edition => _$this._edition;
  set edition(String? edition) => _$this._edition = edition;

  bool? _extendedSupport;
  bool? get extendedSupport => _$this._extendedSupport;
  set extendedSupport(bool? extendedSupport) => _$this._extendedSupport = extendedSupport;

  NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _major = $v.major;
      _minor = $v.minor;
      _micro = $v.micro;
      _string = $v.string;
      _edition = $v.edition;
      _extendedSupport = $v.extendedSupport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Version other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Version;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Version build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Version _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Version._(
            major: major,
            minor: minor,
            micro: micro,
            string: string,
            edition: edition,
            extendedSupport: extendedSupport);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core {
  @override
  final int? pollinterval;
  @override
  final String? webdavRoot;
  @override
  final bool? referenceApi;
  @override
  final String? referenceRegex;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core._(
      {this.pollinterval, this.webdavRoot, this.referenceApi, this.referenceRegex})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core &&
        pollinterval == other.pollinterval &&
        webdavRoot == other.webdavRoot &&
        referenceApi == other.referenceApi &&
        referenceRegex == other.referenceRegex;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pollinterval.hashCode);
    _$hash = $jc(_$hash, webdavRoot.hashCode);
    _$hash = $jc(_$hash, referenceApi.hashCode);
    _$hash = $jc(_$hash, referenceRegex.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core')
          ..add('pollinterval', pollinterval)
          ..add('webdavRoot', webdavRoot)
          ..add('referenceApi', referenceApi)
          ..add('referenceRegex', referenceRegex))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core? _$v;

  int? _pollinterval;
  int? get pollinterval => _$this._pollinterval;
  set pollinterval(int? pollinterval) => _$this._pollinterval = pollinterval;

  String? _webdavRoot;
  String? get webdavRoot => _$this._webdavRoot;
  set webdavRoot(String? webdavRoot) => _$this._webdavRoot = webdavRoot;

  bool? _referenceApi;
  bool? get referenceApi => _$this._referenceApi;
  set referenceApi(bool? referenceApi) => _$this._referenceApi = referenceApi;

  String? _referenceRegex;
  String? get referenceRegex => _$this._referenceRegex;
  set referenceRegex(String? referenceRegex) => _$this._referenceRegex = referenceRegex;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pollinterval = $v.pollinterval;
      _webdavRoot = $v.webdavRoot;
      _referenceApi = $v.referenceApi;
      _referenceRegex = $v.referenceRegex;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core._(
            pollinterval: pollinterval,
            webdavRoot: webdavRoot,
            referenceApi: referenceApi,
            referenceRegex: referenceRegex);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce {
  @override
  final int? delay;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce._({this.delay}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce && delay == other.delay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, delay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce')
          ..add('delay', delay))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? _$v;

  int? _delay;
  int? get delay => _$this._delay;
  set delay(int? delay) => _$this._delay = delay;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _delay = $v.delay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce _build() {
    final _$result = _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce._(delay: delay);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable {
  @override
  final BuiltList<String>? size;
  @override
  final BuiltList<String>? gps;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable._({this.size, this.gps}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable &&
        size == other.size &&
        gps == other.gps;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jc(_$hash, gps.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable')
          ..add('size', size)
          ..add('gps', gps))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? _$v;

  ListBuilder<String>? _size;
  ListBuilder<String> get size => _$this._size ??= ListBuilder<String>();
  set size(ListBuilder<String>? size) => _$this._size = size;

  ListBuilder<String>? _gps;
  ListBuilder<String> get gps => _$this._gps ??= ListBuilder<String>();
  set gps(ListBuilder<String>? gps) => _$this._gps = gps;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _size = $v.size?.toBuilder();
      _gps = $v.gps?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable._(
              size: _size?.build(), gps: _gps?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'size';
        _size?.build();
        _$failedField = 'gps';
        _gps?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing {
  @override
  final String? url;
  @override
  final String? etag;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing._({this.url, this.etag}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing &&
        url == other.url &&
        etag == other.etag;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing')
          ..add('url', url)
          ..add('etag', etag))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(String? etag) => _$this._etag = etag;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _etag = $v.etag;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing _build() {
    final _$result =
        _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing._(url: url, etag: etag);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files {
  @override
  final bool? bigfilechunking;
  @override
  final BuiltList<String>? blacklistedFiles;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditing? directEditing;
  @override
  final bool? comments;
  @override
  final bool? undelete;
  @override
  final bool? versioning;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files._(
      {this.bigfilechunking, this.blacklistedFiles, this.directEditing, this.comments, this.undelete, this.versioning})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files &&
        bigfilechunking == other.bigfilechunking &&
        blacklistedFiles == other.blacklistedFiles &&
        directEditing == other.directEditing &&
        comments == other.comments &&
        undelete == other.undelete &&
        versioning == other.versioning;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bigfilechunking.hashCode);
    _$hash = $jc(_$hash, blacklistedFiles.hashCode);
    _$hash = $jc(_$hash, directEditing.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, undelete.hashCode);
    _$hash = $jc(_$hash, versioning.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files')
          ..add('bigfilechunking', bigfilechunking)
          ..add('blacklistedFiles', blacklistedFiles)
          ..add('directEditing', directEditing)
          ..add('comments', comments)
          ..add('undelete', undelete)
          ..add('versioning', versioning))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files? _$v;

  bool? _bigfilechunking;
  bool? get bigfilechunking => _$this._bigfilechunking;
  set bigfilechunking(bool? bigfilechunking) => _$this._bigfilechunking = bigfilechunking;

  ListBuilder<String>? _blacklistedFiles;
  ListBuilder<String> get blacklistedFiles => _$this._blacklistedFiles ??= ListBuilder<String>();
  set blacklistedFiles(ListBuilder<String>? blacklistedFiles) => _$this._blacklistedFiles = blacklistedFiles;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder? _directEditing;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder get directEditing =>
      _$this._directEditing ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder();
  set directEditing(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files_DirectEditingBuilder? directEditing) =>
      _$this._directEditing = directEditing;

  bool? _comments;
  bool? get comments => _$this._comments;
  set comments(bool? comments) => _$this._comments = comments;

  bool? _undelete;
  bool? get undelete => _$this._undelete;
  set undelete(bool? undelete) => _$this._undelete = undelete;

  bool? _versioning;
  bool? get versioning => _$this._versioning;
  set versioning(bool? versioning) => _$this._versioning = versioning;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bigfilechunking = $v.bigfilechunking;
      _blacklistedFiles = $v.blacklistedFiles?.toBuilder();
      _directEditing = $v.directEditing?.toBuilder();
      _comments = $v.comments;
      _undelete = $v.undelete;
      _versioning = $v.versioning;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files._(
              bigfilechunking: bigfilechunking,
              blacklistedFiles: _blacklistedFiles?.build(),
              directEditing: _directEditing?.build(),
              comments: comments,
              undelete: undelete,
              versioning: versioning);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blacklistedFiles';
        _blacklistedFiles?.build();
        _$failedField = 'directEditing';
        _directEditing?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity {
  @override
  final BuiltList<String>? apiv2;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity._({this.apiv2}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity && apiv2 == other.apiv2;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiv2.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity')
          ..add('apiv2', apiv2))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity? _$v;

  ListBuilder<String>? _apiv2;
  ListBuilder<String> get apiv2 => _$this._apiv2 ??= ListBuilder<String>();
  set apiv2(ListBuilder<String>? apiv2) => _$this._apiv2 = apiv2;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiv2 = $v.apiv2?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity._(apiv2: _apiv2?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiv2';
        _apiv2?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status {
  @override
  final bool? globalScale;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status._({this.globalScale}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status &&
        globalScale == other.globalScale;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, globalScale.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status')
          ..add('globalScale', globalScale))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? _$v;

  bool? _globalScale;
  bool? get globalScale => _$this._globalScale;
  set globalScale(bool? globalScale) => _$this._globalScale = globalScale;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _globalScale = $v.globalScale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status _build() {
    final _$result =
        _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status._(globalScale: globalScale);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings {
  @override
  final bool? frontendEnabled;
  @override
  final int? allowedCircles;
  @override
  final int? allowedUserTypes;
  @override
  final int? membersLimit;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings._(
      {this.frontendEnabled, this.allowedCircles, this.allowedUserTypes, this.membersLimit})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings &&
        frontendEnabled == other.frontendEnabled &&
        allowedCircles == other.allowedCircles &&
        allowedUserTypes == other.allowedUserTypes &&
        membersLimit == other.membersLimit;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, frontendEnabled.hashCode);
    _$hash = $jc(_$hash, allowedCircles.hashCode);
    _$hash = $jc(_$hash, allowedUserTypes.hashCode);
    _$hash = $jc(_$hash, membersLimit.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings')
          ..add('frontendEnabled', frontendEnabled)
          ..add('allowedCircles', allowedCircles)
          ..add('allowedUserTypes', allowedUserTypes)
          ..add('membersLimit', membersLimit))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? _$v;

  bool? _frontendEnabled;
  bool? get frontendEnabled => _$this._frontendEnabled;
  set frontendEnabled(bool? frontendEnabled) => _$this._frontendEnabled = frontendEnabled;

  int? _allowedCircles;
  int? get allowedCircles => _$this._allowedCircles;
  set allowedCircles(int? allowedCircles) => _$this._allowedCircles = allowedCircles;

  int? _allowedUserTypes;
  int? get allowedUserTypes => _$this._allowedUserTypes;
  set allowedUserTypes(int? allowedUserTypes) => _$this._allowedUserTypes = allowedUserTypes;

  int? _membersLimit;
  int? get membersLimit => _$this._membersLimit;
  set membersLimit(int? membersLimit) => _$this._membersLimit = membersLimit;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _frontendEnabled = $v.frontendEnabled;
      _allowedCircles = $v.allowedCircles;
      _allowedUserTypes = $v.allowedUserTypes;
      _membersLimit = $v.membersLimit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings._(
            frontendEnabled: frontendEnabled,
            allowedCircles: allowedCircles,
            allowedUserTypes: allowedUserTypes,
            membersLimit: membersLimit);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source {
  @override
  final JsonObject? core;
  @override
  final JsonObject? extra;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source._({this.core, this.extra})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source &&
        core == other.core &&
        extra == other.extra;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, core.hashCode);
    _$hash = $jc(_$hash, extra.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source')
          ..add('core', core)
          ..add('extra', extra))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? _$v;

  JsonObject? _core;
  JsonObject? get core => _$this._core;
  set core(JsonObject? core) => _$this._core = core;

  JsonObject? _extra;
  JsonObject? get extra => _$this._extra;
  set extra(JsonObject? extra) => _$this._extra = extra;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _core = $v.core;
      _extra = $v.extra;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source._(
            core: core, extra: extra);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants {
  @override
  final JsonObject? flags;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_Source? source;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants._({this.flags, this.source})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants &&
        flags == other.flags &&
        source == other.source;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants')
          ..add('flags', flags)
          ..add('source', source))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? _$v;

  JsonObject? _flags;
  JsonObject? get flags => _$this._flags;
  set flags(JsonObject? flags) => _$this._flags = flags;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder? _source;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder get source =>
      _$this._source ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder();
  set source(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants_SourceBuilder? source) =>
      _$this._source = source;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _flags = $v.flags;
      _source = $v.source?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants._(
              flags: flags, source: _source?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'source';
        _source?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config {
  @override
  final BuiltList<int>? coreFlags;
  @override
  final BuiltList<int>? systemFlags;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config._({this.coreFlags, this.systemFlags})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config &&
        coreFlags == other.coreFlags &&
        systemFlags == other.systemFlags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, coreFlags.hashCode);
    _$hash = $jc(_$hash, systemFlags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config')
          ..add('coreFlags', coreFlags)
          ..add('systemFlags', systemFlags))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? _$v;

  ListBuilder<int>? _coreFlags;
  ListBuilder<int> get coreFlags => _$this._coreFlags ??= ListBuilder<int>();
  set coreFlags(ListBuilder<int>? coreFlags) => _$this._coreFlags = coreFlags;

  ListBuilder<int>? _systemFlags;
  ListBuilder<int> get systemFlags => _$this._systemFlags ??= ListBuilder<int>();
  set systemFlags(ListBuilder<int>? systemFlags) => _$this._systemFlags = systemFlags;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _coreFlags = $v.coreFlags?.toBuilder();
      _systemFlags = $v.systemFlags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config._(
              coreFlags: _coreFlags?.build(), systemFlags: _systemFlags?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'coreFlags';
        _coreFlags?.build();
        _$failedField = 'systemFlags';
        _systemFlags?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config',
            _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle {
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Constants? constants;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_Config? config;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle._({this.constants, this.config}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle &&
        constants == other.constants &&
        config == other.config;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, constants.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle')
          ..add('constants', constants)
          ..add('config', config))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? _$v;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder? _constants;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder get constants =>
      _$this._constants ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder();
  set constants(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConstantsBuilder? constants) =>
      _$this._constants = constants;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder? _config;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder get config =>
      _$this._config ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder();
  set config(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle_ConfigBuilder? config) =>
      _$this._config = config;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _constants = $v.constants?.toBuilder();
      _config = $v.config?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle._(
              constants: _constants?.build(), config: _config?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'constants';
        _constants?.build();
        _$failedField = 'config';
        _config?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants {
  @override
  final JsonObject? level;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants._({this.level}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants &&
        level == other.level;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants')
          ..add('level', level))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? _$v;

  JsonObject? _level;
  JsonObject? get level => _$this._level;
  set level(JsonObject? level) => _$this._level = level;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _level = $v.level;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants _build() {
    final _$result =
        _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants._(level: level);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member {
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_Constants? constants;
  @override
  final JsonObject? type;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member._({this.constants, this.type}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member &&
        constants == other.constants &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, constants.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member')
          ..add('constants', constants)
          ..add('type', type))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? _$v;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder? _constants;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder get constants =>
      _$this._constants ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder();
  set constants(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member_ConstantsBuilder? constants) =>
      _$this._constants = constants;

  JsonObject? _type;
  JsonObject? get type => _$this._type;
  set type(JsonObject? type) => _$this._type = type;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _constants = $v.constants?.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member._(
              constants: _constants?.build(), type: type);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'constants';
        _constants?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles {
  @override
  final String? version;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Status? status;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Settings? settings;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Circle? circle;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_Member? member;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles._(
      {this.version, this.status, this.settings, this.circle, this.member})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles &&
        version == other.version &&
        status == other.status &&
        settings == other.settings &&
        circle == other.circle &&
        member == other.member;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, circle.hashCode);
    _$hash = $jc(_$hash, member.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles')
          ..add('version', version)
          ..add('status', status)
          ..add('settings', settings)
          ..add('circle', circle)
          ..add('member', member))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder? _status;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder get status =>
      _$this._status ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder();
  set status(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_StatusBuilder? status) =>
      _$this._status = status;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder? _settings;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder get settings =>
      _$this._settings ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder();
  set settings(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_SettingsBuilder? settings) =>
      _$this._settings = settings;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder? _circle;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder get circle =>
      _$this._circle ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder();
  set circle(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_CircleBuilder? circle) =>
      _$this._circle = circle;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder? _member;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder get member =>
      _$this._member ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder();
  set member(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles_MemberBuilder? member) =>
      _$this._member = member;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _status = $v.status?.toBuilder();
      _settings = $v.settings?.toBuilder();
      _circle = $v.circle?.toBuilder();
      _member = $v.member?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles._(
              version: version,
              status: _status?.build(),
              settings: _settings?.build(),
              circle: _circle?.build(),
              member: _member?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'status';
        _status?.build();
        _$failedField = 'settings';
        _settings?.build();
        _$failedField = 'circle';
        _circle?.build();
        _$failedField = 'member';
        _member?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols {
  @override
  final String? webdav;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols._({this.webdav}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols &&
        webdav == other.webdav;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, webdav.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols')
          ..add('webdav', webdav))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? _$v;

  String? _webdav;
  String? get webdav => _$this._webdav;
  set webdav(String? webdav) => _$this._webdav = webdav;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _webdav = $v.webdav;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols _build() {
    final _$result =
        _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols._(webdav: webdav);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes {
  @override
  final String? name;
  @override
  final BuiltList<String>? shareTypes;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_Protocols? protocols;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes._(
      {this.name, this.shareTypes, this.protocols})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes &&
        name == other.name &&
        shareTypes == other.shareTypes &&
        protocols == other.protocols;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shareTypes.hashCode);
    _$hash = $jc(_$hash, protocols.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes')
          ..add('name', name)
          ..add('shareTypes', shareTypes)
          ..add('protocols', protocols))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _shareTypes;
  ListBuilder<String> get shareTypes => _$this._shareTypes ??= ListBuilder<String>();
  set shareTypes(ListBuilder<String>? shareTypes) => _$this._shareTypes = shareTypes;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder? _protocols;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder get protocols =>
      _$this._protocols ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder();
  set protocols(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes_ProtocolsBuilder? protocols) =>
      _$this._protocols = protocols;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _shareTypes = $v.shareTypes?.toBuilder();
      _protocols = $v.protocols?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes._(
              name: name, shareTypes: _shareTypes?.build(), protocols: _protocols?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shareTypes';
        _shareTypes?.build();
        _$failedField = 'protocols';
        _protocols?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm {
  @override
  final bool? enabled;
  @override
  final String? apiVersion;
  @override
  final String? endPoint;
  @override
  final BuiltList<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? resourceTypes;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm._(
      {this.enabled, this.apiVersion, this.endPoint, this.resourceTypes})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm &&
        enabled == other.enabled &&
        apiVersion == other.apiVersion &&
        endPoint == other.endPoint &&
        resourceTypes == other.resourceTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, endPoint.hashCode);
    _$hash = $jc(_$hash, resourceTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm')
          ..add('enabled', enabled)
          ..add('apiVersion', apiVersion)
          ..add('endPoint', endPoint)
          ..add('resourceTypes', resourceTypes))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _apiVersion;
  String? get apiVersion => _$this._apiVersion;
  set apiVersion(String? apiVersion) => _$this._apiVersion = apiVersion;

  String? _endPoint;
  String? get endPoint => _$this._endPoint;
  set endPoint(String? endPoint) => _$this._endPoint = endPoint;

  ListBuilder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? _resourceTypes;
  ListBuilder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes> get resourceTypes =>
      _$this._resourceTypes ??= ListBuilder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>();
  set resourceTypes(
          ListBuilder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm_ResourceTypes>? resourceTypes) =>
      _$this._resourceTypes = resourceTypes;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _apiVersion = $v.apiVersion;
      _endPoint = $v.endPoint;
      _resourceTypes = $v.resourceTypes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm._(
              enabled: enabled, apiVersion: apiVersion, endPoint: endPoint, resourceTypes: _resourceTypes?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'resourceTypes';
        _resourceTypes?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav {
  @override
  final String? bulkupload;
  @override
  final String? chunking;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav._({this.bulkupload, this.chunking}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav &&
        bulkupload == other.bulkupload &&
        chunking == other.chunking;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bulkupload.hashCode);
    _$hash = $jc(_$hash, chunking.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav')
          ..add('bulkupload', bulkupload)
          ..add('chunking', chunking))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav? _$v;

  String? _bulkupload;
  String? get bulkupload => _$this._bulkupload;
  set bulkupload(String? bulkupload) => _$this._bulkupload = bulkupload;

  String? _chunking;
  String? get chunking => _$this._chunking;
  set chunking(String? chunking) => _$this._chunking = chunking;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bulkupload = $v.bulkupload;
      _chunking = $v.chunking;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav._(bulkupload: bulkupload, chunking: chunking);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password {
  @override
  final bool? enforced;
  @override
  final bool? askForOptionalPassword;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password._(
      {this.enforced, this.askForOptionalPassword})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password &&
        enforced == other.enforced &&
        askForOptionalPassword == other.askForOptionalPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jc(_$hash, askForOptionalPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password')
          ..add('enforced', enforced)
          ..add('askForOptionalPassword', askForOptionalPassword))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? _$v;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(bool? enforced) => _$this._enforced = enforced;

  bool? _askForOptionalPassword;
  bool? get askForOptionalPassword => _$this._askForOptionalPassword;
  set askForOptionalPassword(bool? askForOptionalPassword) => _$this._askForOptionalPassword = askForOptionalPassword;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enforced = $v.enforced;
      _askForOptionalPassword = $v.askForOptionalPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password._(
            enforced: enforced, askForOptionalPassword: askForOptionalPassword);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate._({this.enabled}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate._(enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal._({this.enabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal rebuild(
          void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal;
  }

  @override
  void update(
      void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal._(
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote._({this.enabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote rebuild(
          void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote._(
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public {
  @override
  final bool? enabled;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_Password? password;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDate? expireDate;
  @override
  final bool? multipleLinks;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternal?
      expireDateInternal;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemote? expireDateRemote;
  @override
  final bool? sendMail;
  @override
  final bool? upload;
  @override
  final bool? uploadFilesDrop;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public._(
      {this.enabled,
      this.password,
      this.expireDate,
      this.multipleLinks,
      this.expireDateInternal,
      this.expireDateRemote,
      this.sendMail,
      this.upload,
      this.uploadFilesDrop})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public &&
        enabled == other.enabled &&
        password == other.password &&
        expireDate == other.expireDate &&
        multipleLinks == other.multipleLinks &&
        expireDateInternal == other.expireDateInternal &&
        expireDateRemote == other.expireDateRemote &&
        sendMail == other.sendMail &&
        upload == other.upload &&
        uploadFilesDrop == other.uploadFilesDrop;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jc(_$hash, multipleLinks.hashCode);
    _$hash = $jc(_$hash, expireDateInternal.hashCode);
    _$hash = $jc(_$hash, expireDateRemote.hashCode);
    _$hash = $jc(_$hash, sendMail.hashCode);
    _$hash = $jc(_$hash, upload.hashCode);
    _$hash = $jc(_$hash, uploadFilesDrop.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public')
          ..add('enabled', enabled)
          ..add('password', password)
          ..add('expireDate', expireDate)
          ..add('multipleLinks', multipleLinks)
          ..add('expireDateInternal', expireDateInternal)
          ..add('expireDateRemote', expireDateRemote)
          ..add('sendMail', sendMail)
          ..add('upload', upload)
          ..add('uploadFilesDrop', uploadFilesDrop))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder? _password;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder get password =>
      _$this._password ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder();
  set password(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_PasswordBuilder? password) =>
      _$this._password = password;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder? _expireDate;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder();
  set expireDate(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  bool? _multipleLinks;
  bool? get multipleLinks => _$this._multipleLinks;
  set multipleLinks(bool? multipleLinks) => _$this._multipleLinks = multipleLinks;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder?
      _expireDateInternal;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder
      get expireDateInternal => _$this._expireDateInternal ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder();
  set expireDateInternal(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateInternalBuilder?
              expireDateInternal) =>
      _$this._expireDateInternal = expireDateInternal;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder? _expireDateRemote;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder
      get expireDateRemote => _$this._expireDateRemote ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder();
  set expireDateRemote(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public_ExpireDateRemoteBuilder?
              expireDateRemote) =>
      _$this._expireDateRemote = expireDateRemote;

  bool? _sendMail;
  bool? get sendMail => _$this._sendMail;
  set sendMail(bool? sendMail) => _$this._sendMail = sendMail;

  bool? _upload;
  bool? get upload => _$this._upload;
  set upload(bool? upload) => _$this._upload = upload;

  bool? _uploadFilesDrop;
  bool? get uploadFilesDrop => _$this._uploadFilesDrop;
  set uploadFilesDrop(bool? uploadFilesDrop) => _$this._uploadFilesDrop = uploadFilesDrop;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _password = $v.password?.toBuilder();
      _expireDate = $v.expireDate?.toBuilder();
      _multipleLinks = $v.multipleLinks;
      _expireDateInternal = $v.expireDateInternal?.toBuilder();
      _expireDateRemote = $v.expireDateRemote?.toBuilder();
      _sendMail = $v.sendMail;
      _upload = $v.upload;
      _uploadFilesDrop = $v.uploadFilesDrop;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public._(
              enabled: enabled,
              password: _password?.build(),
              expireDate: _expireDate?.build(),
              multipleLinks: multipleLinks,
              expireDateInternal: _expireDateInternal?.build(),
              expireDateRemote: _expireDateRemote?.build(),
              sendMail: sendMail,
              upload: upload,
              uploadFilesDrop: uploadFilesDrop);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'expireDate';
        _expireDate?.build();

        _$failedField = 'expireDateInternal';
        _expireDateInternal?.build();
        _$failedField = 'expireDateRemote';
        _expireDateRemote?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate._({this.enabled}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate _build() {
    final _$result =
        _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate._(enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User {
  @override
  final bool? sendMail;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDate? expireDate;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User._({this.sendMail, this.expireDate})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User &&
        sendMail == other.sendMail &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sendMail.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User')
          ..add('sendMail', sendMail)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? _$v;

  bool? _sendMail;
  bool? get sendMail => _$this._sendMail;
  set sendMail(bool? sendMail) => _$this._sendMail = sendMail;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder? _expireDate;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder();
  set expireDate(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sendMail = $v.sendMail;
      _expireDate = $v.expireDate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User._(
              sendMail: sendMail, expireDate: _expireDate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        _expireDate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate._({this.enabled}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate._(enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group {
  @override
  final bool? enabled;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDate? expireDate;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group._({this.enabled, this.expireDate})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group &&
        enabled == other.enabled &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group')
          ..add('enabled', enabled)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder? _expireDate;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder();
  set expireDate(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group_ExpireDateBuilder? expireDate) =>
      _$this._expireDate = expireDate;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _expireDate = $v.expireDate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group._(
              enabled: enabled, expireDate: _expireDate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        _expireDate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate._({this.enabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate._(enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported._({this.enabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported rebuild(
          void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder
      toBuilder() =>
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported;
  }

  @override
  void update(
      void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported._(
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation {
  @override
  final bool? outgoing;
  @override
  final bool? incoming;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDate? expireDate;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupported?
      expireDateSupported;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation._(
      {this.outgoing, this.incoming, this.expireDate, this.expireDateSupported})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation &&
        outgoing == other.outgoing &&
        incoming == other.incoming &&
        expireDate == other.expireDate &&
        expireDateSupported == other.expireDateSupported;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, outgoing.hashCode);
    _$hash = $jc(_$hash, incoming.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jc(_$hash, expireDateSupported.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation')
          ..add('outgoing', outgoing)
          ..add('incoming', incoming)
          ..add('expireDate', expireDate)
          ..add('expireDateSupported', expireDateSupported))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? _$v;

  bool? _outgoing;
  bool? get outgoing => _$this._outgoing;
  set outgoing(bool? outgoing) => _$this._outgoing = outgoing;

  bool? _incoming;
  bool? get incoming => _$this._incoming;
  set incoming(bool? incoming) => _$this._incoming = incoming;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder? _expireDate;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder();
  set expireDate(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateBuilder?
              expireDate) =>
      _$this._expireDate = expireDate;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder?
      _expireDateSupported;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder
      get expireDateSupported => _$this._expireDateSupported ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder();
  set expireDateSupported(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation_ExpireDateSupportedBuilder?
              expireDateSupported) =>
      _$this._expireDateSupported = expireDateSupported;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _outgoing = $v.outgoing;
      _incoming = $v.incoming;
      _expireDate = $v.expireDate?.toBuilder();
      _expireDateSupported = $v.expireDateSupported?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation._(
              outgoing: outgoing,
              incoming: incoming,
              expireDate: _expireDate?.build(),
              expireDateSupported: _expireDateSupported?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'expireDate';
        _expireDate?.build();
        _$failedField = 'expireDateSupported';
        _expireDateSupported?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee {
  @override
  final bool? queryLookupDefault;
  @override
  final bool? alwaysShowUnique;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee._(
      {this.queryLookupDefault, this.alwaysShowUnique})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee &&
        queryLookupDefault == other.queryLookupDefault &&
        alwaysShowUnique == other.alwaysShowUnique;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, queryLookupDefault.hashCode);
    _$hash = $jc(_$hash, alwaysShowUnique.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee')
          ..add('queryLookupDefault', queryLookupDefault)
          ..add('alwaysShowUnique', alwaysShowUnique))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? _$v;

  bool? _queryLookupDefault;
  bool? get queryLookupDefault => _$this._queryLookupDefault;
  set queryLookupDefault(bool? queryLookupDefault) => _$this._queryLookupDefault = queryLookupDefault;

  bool? _alwaysShowUnique;
  bool? get alwaysShowUnique => _$this._alwaysShowUnique;
  set alwaysShowUnique(bool? alwaysShowUnique) => _$this._alwaysShowUnique = alwaysShowUnique;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _queryLookupDefault = $v.queryLookupDefault;
      _alwaysShowUnique = $v.alwaysShowUnique;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee._(
            queryLookupDefault: queryLookupDefault, alwaysShowUnique: alwaysShowUnique);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._({this.enabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop rebuild(
          void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop &&
        enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop;
  }

  @override
  void update(
      void Function(
              NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop._(
            enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password {
  @override
  final bool? enabled;
  @override
  final bool? enforced;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password._(
      {this.enabled, this.enforced})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(bool? enforced) => _$this._enforced = enforced;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password._(
            enabled: enabled, enforced: enforced);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate {
  @override
  final bool? enabled;
  @override
  final bool? enforced;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate(
          [void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder()
            ..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate._(
      {this.enabled, this.enforced})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate rebuild(
          void Function(
                  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate &&
        enabled == other.enabled &&
        enforced == other.enforced;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, enforced.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate')
          ..add('enabled', enabled)
          ..add('enforced', enforced))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _enforced;
  bool? get enforced => _$this._enforced;
  set enforced(bool? enforced) => _$this._enforced = enforced;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _enforced = $v.enforced;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate._(
            enabled: enabled, enforced: enforced);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail {
  @override
  final bool? enabled;
  @override
  final bool? sendPasswordByMail;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDrop? uploadFilesDrop;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_Password? password;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDate? expireDate;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)?
              updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder()..update(updates))
          ._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail._(
      {this.enabled, this.sendPasswordByMail, this.uploadFilesDrop, this.password, this.expireDate})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail &&
        enabled == other.enabled &&
        sendPasswordByMail == other.sendPasswordByMail &&
        uploadFilesDrop == other.uploadFilesDrop &&
        password == other.password &&
        expireDate == other.expireDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, sendPasswordByMail.hashCode);
    _$hash = $jc(_$hash, uploadFilesDrop.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, expireDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail')
          ..add('enabled', enabled)
          ..add('sendPasswordByMail', sendPasswordByMail)
          ..add('uploadFilesDrop', uploadFilesDrop)
          ..add('password', password)
          ..add('expireDate', expireDate))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _sendPasswordByMail;
  bool? get sendPasswordByMail => _$this._sendPasswordByMail;
  set sendPasswordByMail(bool? sendPasswordByMail) => _$this._sendPasswordByMail = sendPasswordByMail;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder?
      _uploadFilesDrop;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder
      get uploadFilesDrop => _$this._uploadFilesDrop ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder();
  set uploadFilesDrop(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_UploadFilesDropBuilder?
              uploadFilesDrop) =>
      _$this._uploadFilesDrop = uploadFilesDrop;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder? _password;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder get password =>
      _$this._password ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder();
  set password(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_PasswordBuilder? password) =>
      _$this._password = password;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder? _expireDate;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder get expireDate =>
      _$this._expireDate ??=
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder();
  set expireDate(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail_ExpireDateBuilder?
              expireDate) =>
      _$this._expireDate = expireDate;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _sendPasswordByMail = $v.sendPasswordByMail;
      _uploadFilesDrop = $v.uploadFilesDrop?.toBuilder();
      _password = $v.password?.toBuilder();
      _expireDate = $v.expireDate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail;
  }

  @override
  void update(
      void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail._(
              enabled: enabled,
              sendPasswordByMail: sendPasswordByMail,
              uploadFilesDrop: _uploadFilesDrop?.build(),
              password: _password?.build(),
              expireDate: _expireDate?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'uploadFilesDrop';
        _uploadFilesDrop?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'expireDate';
        _expireDate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing {
  @override
  final bool? apiEnabled;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Public? public;
  @override
  final bool? resharing;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_User? user;
  @override
  final bool? groupSharing;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Group? group;
  @override
  final int? defaultPermissions;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Federation? federation;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharee? sharee;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_Sharebymail? sharebymail;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing._(
      {this.apiEnabled,
      this.public,
      this.resharing,
      this.user,
      this.groupSharing,
      this.group,
      this.defaultPermissions,
      this.federation,
      this.sharee,
      this.sharebymail})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing &&
        apiEnabled == other.apiEnabled &&
        public == other.public &&
        resharing == other.resharing &&
        user == other.user &&
        groupSharing == other.groupSharing &&
        group == other.group &&
        defaultPermissions == other.defaultPermissions &&
        federation == other.federation &&
        sharee == other.sharee &&
        sharebymail == other.sharebymail;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiEnabled.hashCode);
    _$hash = $jc(_$hash, public.hashCode);
    _$hash = $jc(_$hash, resharing.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, groupSharing.hashCode);
    _$hash = $jc(_$hash, group.hashCode);
    _$hash = $jc(_$hash, defaultPermissions.hashCode);
    _$hash = $jc(_$hash, federation.hashCode);
    _$hash = $jc(_$hash, sharee.hashCode);
    _$hash = $jc(_$hash, sharebymail.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing')
          ..add('apiEnabled', apiEnabled)
          ..add('public', public)
          ..add('resharing', resharing)
          ..add('user', user)
          ..add('groupSharing', groupSharing)
          ..add('group', group)
          ..add('defaultPermissions', defaultPermissions)
          ..add('federation', federation)
          ..add('sharee', sharee)
          ..add('sharebymail', sharebymail))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? _$v;

  bool? _apiEnabled;
  bool? get apiEnabled => _$this._apiEnabled;
  set apiEnabled(bool? apiEnabled) => _$this._apiEnabled = apiEnabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder? _public;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder get public =>
      _$this._public ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder();
  set public(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_PublicBuilder? public) =>
      _$this._public = public;

  bool? _resharing;
  bool? get resharing => _$this._resharing;
  set resharing(bool? resharing) => _$this._resharing = resharing;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder? _user;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder get user =>
      _$this._user ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder();
  set user(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_UserBuilder? user) => _$this._user = user;

  bool? _groupSharing;
  bool? get groupSharing => _$this._groupSharing;
  set groupSharing(bool? groupSharing) => _$this._groupSharing = groupSharing;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder? _group;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder get group =>
      _$this._group ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder();
  set group(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_GroupBuilder? group) =>
      _$this._group = group;

  int? _defaultPermissions;
  int? get defaultPermissions => _$this._defaultPermissions;
  set defaultPermissions(int? defaultPermissions) => _$this._defaultPermissions = defaultPermissions;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder? _federation;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder get federation =>
      _$this._federation ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder();
  set federation(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_FederationBuilder? federation) =>
      _$this._federation = federation;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder? _sharee;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder get sharee =>
      _$this._sharee ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder();
  set sharee(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_ShareeBuilder? sharee) =>
      _$this._sharee = sharee;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder? _sharebymail;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder get sharebymail =>
      _$this._sharebymail ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder();
  set sharebymail(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing_SharebymailBuilder? sharebymail) =>
      _$this._sharebymail = sharebymail;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiEnabled = $v.apiEnabled;
      _public = $v.public?.toBuilder();
      _resharing = $v.resharing;
      _user = $v.user?.toBuilder();
      _groupSharing = $v.groupSharing;
      _group = $v.group?.toBuilder();
      _defaultPermissions = $v.defaultPermissions;
      _federation = $v.federation?.toBuilder();
      _sharee = $v.sharee?.toBuilder();
      _sharebymail = $v.sharebymail?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing._(
              apiEnabled: apiEnabled,
              public: _public?.build(),
              resharing: resharing,
              user: _user?.build(),
              groupSharing: groupSharing,
              group: _group?.build(),
              defaultPermissions: defaultPermissions,
              federation: _federation?.build(),
              sharee: _sharee?.build(),
              sharebymail: _sharebymail?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'public';
        _public?.build();

        _$failedField = 'user';
        _user?.build();

        _$failedField = 'group';
        _group?.build();

        _$failedField = 'federation';
        _federation?.build();
        _$failedField = 'sharee';
        _sharee?.build();
        _$failedField = 'sharebymail';
        _sharebymail?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes {
  @override
  final BuiltList<String>? apiVersion;
  @override
  final String? version;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes._({this.apiVersion, this.version}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes &&
        apiVersion == other.apiVersion &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiVersion.hashCode);
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes')
          ..add('apiVersion', apiVersion)
          ..add('version', version))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes? _$v;

  ListBuilder<String>? _apiVersion;
  ListBuilder<String> get apiVersion => _$this._apiVersion ??= ListBuilder<String>();
  set apiVersion(ListBuilder<String>? apiVersion) => _$this._apiVersion = apiVersion;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiVersion = $v.apiVersion?.toBuilder();
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes._(
              apiVersion: _apiVersion?.build(), version: version);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiVersion';
        _apiVersion?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications {
  @override
  final BuiltList<String>? ocsEndpoints;
  @override
  final BuiltList<String>? push;
  @override
  final BuiltList<String>? adminNotifications;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications._(
      {this.ocsEndpoints, this.push, this.adminNotifications})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications &&
        ocsEndpoints == other.ocsEndpoints &&
        push == other.push &&
        adminNotifications == other.adminNotifications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocsEndpoints.hashCode);
    _$hash = $jc(_$hash, push.hashCode);
    _$hash = $jc(_$hash, adminNotifications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications')
          ..add('ocsEndpoints', ocsEndpoints)
          ..add('push', push)
          ..add('adminNotifications', adminNotifications))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications? _$v;

  ListBuilder<String>? _ocsEndpoints;
  ListBuilder<String> get ocsEndpoints => _$this._ocsEndpoints ??= ListBuilder<String>();
  set ocsEndpoints(ListBuilder<String>? ocsEndpoints) => _$this._ocsEndpoints = ocsEndpoints;

  ListBuilder<String>? _push;
  ListBuilder<String> get push => _$this._push ??= ListBuilder<String>();
  set push(ListBuilder<String>? push) => _$this._push = push;

  ListBuilder<String>? _adminNotifications;
  ListBuilder<String> get adminNotifications => _$this._adminNotifications ??= ListBuilder<String>();
  set adminNotifications(ListBuilder<String>? adminNotifications) => _$this._adminNotifications = adminNotifications;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocsEndpoints = $v.ocsEndpoints?.toBuilder();
      _push = $v.push?.toBuilder();
      _adminNotifications = $v.adminNotifications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications._(
              ocsEndpoints: _ocsEndpoints?.build(),
              push: _push?.build(),
              adminNotifications: _adminNotifications?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocsEndpoints';
        _ocsEndpoints?.build();
        _$failedField = 'push';
        _push?.build();
        _$failedField = 'adminNotifications';
        _adminNotifications?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api {
  @override
  final String? generate;
  @override
  final String? validate;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api._({this.generate, this.validate})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api &&
        generate == other.generate &&
        validate == other.validate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, generate.hashCode);
    _$hash = $jc(_$hash, validate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api')
          ..add('generate', generate)
          ..add('validate', validate))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? _$v;

  String? _generate;
  String? get generate => _$this._generate;
  set generate(String? generate) => _$this._generate = generate;

  String? _validate;
  String? get validate => _$this._validate;
  set validate(String? validate) => _$this._validate = validate;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _generate = $v.generate;
      _validate = $v.validate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api._(
            generate: generate, validate: validate);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy {
  @override
  final int? minLength;
  @override
  final bool? enforceNonCommonPassword;
  @override
  final bool? enforceNumericCharacters;
  @override
  final bool? enforceSpecialCharacters;
  @override
  final bool? enforceUpperLowerCase;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_Api? api;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy._(
      {this.minLength,
      this.enforceNonCommonPassword,
      this.enforceNumericCharacters,
      this.enforceSpecialCharacters,
      this.enforceUpperLowerCase,
      this.api})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy &&
        minLength == other.minLength &&
        enforceNonCommonPassword == other.enforceNonCommonPassword &&
        enforceNumericCharacters == other.enforceNumericCharacters &&
        enforceSpecialCharacters == other.enforceSpecialCharacters &&
        enforceUpperLowerCase == other.enforceUpperLowerCase &&
        api == other.api;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, enforceNonCommonPassword.hashCode);
    _$hash = $jc(_$hash, enforceNumericCharacters.hashCode);
    _$hash = $jc(_$hash, enforceSpecialCharacters.hashCode);
    _$hash = $jc(_$hash, enforceUpperLowerCase.hashCode);
    _$hash = $jc(_$hash, api.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy')
          ..add('minLength', minLength)
          ..add('enforceNonCommonPassword', enforceNonCommonPassword)
          ..add('enforceNumericCharacters', enforceNumericCharacters)
          ..add('enforceSpecialCharacters', enforceSpecialCharacters)
          ..add('enforceUpperLowerCase', enforceUpperLowerCase)
          ..add('api', api))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? _$v;

  int? _minLength;
  int? get minLength => _$this._minLength;
  set minLength(int? minLength) => _$this._minLength = minLength;

  bool? _enforceNonCommonPassword;
  bool? get enforceNonCommonPassword => _$this._enforceNonCommonPassword;
  set enforceNonCommonPassword(bool? enforceNonCommonPassword) =>
      _$this._enforceNonCommonPassword = enforceNonCommonPassword;

  bool? _enforceNumericCharacters;
  bool? get enforceNumericCharacters => _$this._enforceNumericCharacters;
  set enforceNumericCharacters(bool? enforceNumericCharacters) =>
      _$this._enforceNumericCharacters = enforceNumericCharacters;

  bool? _enforceSpecialCharacters;
  bool? get enforceSpecialCharacters => _$this._enforceSpecialCharacters;
  set enforceSpecialCharacters(bool? enforceSpecialCharacters) =>
      _$this._enforceSpecialCharacters = enforceSpecialCharacters;

  bool? _enforceUpperLowerCase;
  bool? get enforceUpperLowerCase => _$this._enforceUpperLowerCase;
  set enforceUpperLowerCase(bool? enforceUpperLowerCase) => _$this._enforceUpperLowerCase = enforceUpperLowerCase;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder? _api;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder get api =>
      _$this._api ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder();
  set api(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy_ApiBuilder? api) => _$this._api = api;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _minLength = $v.minLength;
      _enforceNonCommonPassword = $v.enforceNonCommonPassword;
      _enforceNumericCharacters = $v.enforceNumericCharacters;
      _enforceSpecialCharacters = $v.enforceSpecialCharacters;
      _enforceUpperLowerCase = $v.enforceUpperLowerCase;
      _api = $v.api?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy._(
              minLength: minLength,
              enforceNonCommonPassword: enforceNonCommonPassword,
              enforceNumericCharacters: enforceNumericCharacters,
              enforceSpecialCharacters: enforceSpecialCharacters,
              enforceUpperLowerCase: enforceUpperLowerCase,
              api: _api?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'api';
        _api?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi {
  @override
  final String? version;
  @override
  final int? accountPropertyScopesVersion;
  @override
  final bool? accountPropertyScopesFederatedEnabled;
  @override
  final bool? accountPropertyScopesPublishedEnabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi._(
      {this.version,
      this.accountPropertyScopesVersion,
      this.accountPropertyScopesFederatedEnabled,
      this.accountPropertyScopesPublishedEnabled})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi &&
        version == other.version &&
        accountPropertyScopesVersion == other.accountPropertyScopesVersion &&
        accountPropertyScopesFederatedEnabled == other.accountPropertyScopesFederatedEnabled &&
        accountPropertyScopesPublishedEnabled == other.accountPropertyScopesPublishedEnabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesVersion.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesFederatedEnabled.hashCode);
    _$hash = $jc(_$hash, accountPropertyScopesPublishedEnabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi')
          ..add('version', version)
          ..add('accountPropertyScopesVersion', accountPropertyScopesVersion)
          ..add('accountPropertyScopesFederatedEnabled', accountPropertyScopesFederatedEnabled)
          ..add('accountPropertyScopesPublishedEnabled', accountPropertyScopesPublishedEnabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? _$v;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  int? _accountPropertyScopesVersion;
  int? get accountPropertyScopesVersion => _$this._accountPropertyScopesVersion;
  set accountPropertyScopesVersion(int? accountPropertyScopesVersion) =>
      _$this._accountPropertyScopesVersion = accountPropertyScopesVersion;

  bool? _accountPropertyScopesFederatedEnabled;
  bool? get accountPropertyScopesFederatedEnabled => _$this._accountPropertyScopesFederatedEnabled;
  set accountPropertyScopesFederatedEnabled(bool? accountPropertyScopesFederatedEnabled) =>
      _$this._accountPropertyScopesFederatedEnabled = accountPropertyScopesFederatedEnabled;

  bool? _accountPropertyScopesPublishedEnabled;
  bool? get accountPropertyScopesPublishedEnabled => _$this._accountPropertyScopesPublishedEnabled;
  set accountPropertyScopesPublishedEnabled(bool? accountPropertyScopesPublishedEnabled) =>
      _$this._accountPropertyScopesPublishedEnabled = accountPropertyScopesPublishedEnabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _accountPropertyScopesVersion = $v.accountPropertyScopesVersion;
      _accountPropertyScopesFederatedEnabled = $v.accountPropertyScopesFederatedEnabled;
      _accountPropertyScopesPublishedEnabled = $v.accountPropertyScopesPublishedEnabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi._(
            version: version,
            accountPropertyScopesVersion: accountPropertyScopesVersion,
            accountPropertyScopesFederatedEnabled: accountPropertyScopesFederatedEnabled,
            accountPropertyScopesPublishedEnabled: accountPropertyScopesPublishedEnabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming {
  @override
  final String? name;
  @override
  final String? url;
  @override
  final String? slogan;
  @override
  final String? color;
  @override
  final String? colorText;
  @override
  final String? colorElement;
  @override
  final String? colorElementBright;
  @override
  final String? colorElementDark;
  @override
  final String? logo;
  @override
  final String? background;
  @override
  final bool? backgroundPlain;
  @override
  final bool? backgroundDefault;
  @override
  final String? logoheader;
  @override
  final String? favicon;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming._(
      {this.name,
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
      this.favicon})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming &&
        name == other.name &&
        url == other.url &&
        slogan == other.slogan &&
        color == other.color &&
        colorText == other.colorText &&
        colorElement == other.colorElement &&
        colorElementBright == other.colorElementBright &&
        colorElementDark == other.colorElementDark &&
        logo == other.logo &&
        background == other.background &&
        backgroundPlain == other.backgroundPlain &&
        backgroundDefault == other.backgroundDefault &&
        logoheader == other.logoheader &&
        favicon == other.favicon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, slogan.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, colorText.hashCode);
    _$hash = $jc(_$hash, colorElement.hashCode);
    _$hash = $jc(_$hash, colorElementBright.hashCode);
    _$hash = $jc(_$hash, colorElementDark.hashCode);
    _$hash = $jc(_$hash, logo.hashCode);
    _$hash = $jc(_$hash, background.hashCode);
    _$hash = $jc(_$hash, backgroundPlain.hashCode);
    _$hash = $jc(_$hash, backgroundDefault.hashCode);
    _$hash = $jc(_$hash, logoheader.hashCode);
    _$hash = $jc(_$hash, favicon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming')
          ..add('name', name)
          ..add('url', url)
          ..add('slogan', slogan)
          ..add('color', color)
          ..add('colorText', colorText)
          ..add('colorElement', colorElement)
          ..add('colorElementBright', colorElementBright)
          ..add('colorElementDark', colorElementDark)
          ..add('logo', logo)
          ..add('background', background)
          ..add('backgroundPlain', backgroundPlain)
          ..add('backgroundDefault', backgroundDefault)
          ..add('logoheader', logoheader)
          ..add('favicon', favicon))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _slogan;
  String? get slogan => _$this._slogan;
  set slogan(String? slogan) => _$this._slogan = slogan;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  String? _colorText;
  String? get colorText => _$this._colorText;
  set colorText(String? colorText) => _$this._colorText = colorText;

  String? _colorElement;
  String? get colorElement => _$this._colorElement;
  set colorElement(String? colorElement) => _$this._colorElement = colorElement;

  String? _colorElementBright;
  String? get colorElementBright => _$this._colorElementBright;
  set colorElementBright(String? colorElementBright) => _$this._colorElementBright = colorElementBright;

  String? _colorElementDark;
  String? get colorElementDark => _$this._colorElementDark;
  set colorElementDark(String? colorElementDark) => _$this._colorElementDark = colorElementDark;

  String? _logo;
  String? get logo => _$this._logo;
  set logo(String? logo) => _$this._logo = logo;

  String? _background;
  String? get background => _$this._background;
  set background(String? background) => _$this._background = background;

  bool? _backgroundPlain;
  bool? get backgroundPlain => _$this._backgroundPlain;
  set backgroundPlain(bool? backgroundPlain) => _$this._backgroundPlain = backgroundPlain;

  bool? _backgroundDefault;
  bool? get backgroundDefault => _$this._backgroundDefault;
  set backgroundDefault(bool? backgroundDefault) => _$this._backgroundDefault = backgroundDefault;

  String? _logoheader;
  String? get logoheader => _$this._logoheader;
  set logoheader(String? logoheader) => _$this._logoheader = logoheader;

  String? _favicon;
  String? get favicon => _$this._favicon;
  set favicon(String? favicon) => _$this._favicon = favicon;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _url = $v.url;
      _slogan = $v.slogan;
      _color = $v.color;
      _colorText = $v.colorText;
      _colorElement = $v.colorElement;
      _colorElementBright = $v.colorElementBright;
      _colorElementDark = $v.colorElementDark;
      _logo = $v.logo;
      _background = $v.background;
      _backgroundPlain = $v.backgroundPlain;
      _backgroundDefault = $v.backgroundDefault;
      _logoheader = $v.logoheader;
      _favicon = $v.favicon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming._(
            name: name,
            url: url,
            slogan: slogan,
            color: color,
            colorText: colorText,
            colorElement: colorElement,
            colorElementBright: colorElementBright,
            colorElementDark: colorElementDark,
            logo: logo,
            background: background,
            backgroundPlain: backgroundPlain,
            backgroundDefault: backgroundDefault,
            logoheader: logoheader,
            favicon: favicon);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus {
  @override
  final bool? enabled;
  @override
  final bool? supportsEmoji;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus._({this.enabled, this.supportsEmoji}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus &&
        enabled == other.enabled &&
        supportsEmoji == other.supportsEmoji;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, supportsEmoji.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus')
          ..add('enabled', enabled)
          ..add('supportsEmoji', supportsEmoji))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  bool? _supportsEmoji;
  bool? get supportsEmoji => _$this._supportsEmoji;
  set supportsEmoji(bool? supportsEmoji) => _$this._supportsEmoji = supportsEmoji;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _supportsEmoji = $v.supportsEmoji;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus _build() {
    final _$result = _$v ??
        _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus._(
            enabled: enabled, supportsEmoji: supportsEmoji);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus {
  @override
  final bool? enabled;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus._({this.enabled}) : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus && enabled == other.enabled;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus')
          ..add('enabled', enabled))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus,
            NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus _build() {
    final _$result = _$v ?? _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus._(enabled: enabled);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities
    extends NextcloudCoreServerCapabilities_Ocs_Data_Capabilities {
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Core? core;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Bruteforce? bruteforce;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailable? metadataAvailable;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Files? files;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Activity? activity;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Circles? circles;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Ocm? ocm;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Dav? dav;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharing? filesSharing;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notes? notes;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Notifications? notifications;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicy? passwordPolicy;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApi? provisioningApi;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? theming;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatus? userStatus;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatus? weatherStatus;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities(
          [void Function(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities._(
      {this.core,
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
      this.weatherStatus})
      : super._();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data_Capabilities &&
        core == other.core &&
        bruteforce == other.bruteforce &&
        metadataAvailable == other.metadataAvailable &&
        files == other.files &&
        activity == other.activity &&
        circles == other.circles &&
        ocm == other.ocm &&
        dav == other.dav &&
        filesSharing == other.filesSharing &&
        notes == other.notes &&
        notifications == other.notifications &&
        passwordPolicy == other.passwordPolicy &&
        provisioningApi == other.provisioningApi &&
        theming == other.theming &&
        userStatus == other.userStatus &&
        weatherStatus == other.weatherStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, core.hashCode);
    _$hash = $jc(_$hash, bruteforce.hashCode);
    _$hash = $jc(_$hash, metadataAvailable.hashCode);
    _$hash = $jc(_$hash, files.hashCode);
    _$hash = $jc(_$hash, activity.hashCode);
    _$hash = $jc(_$hash, circles.hashCode);
    _$hash = $jc(_$hash, ocm.hashCode);
    _$hash = $jc(_$hash, dav.hashCode);
    _$hash = $jc(_$hash, filesSharing.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jc(_$hash, passwordPolicy.hashCode);
    _$hash = $jc(_$hash, provisioningApi.hashCode);
    _$hash = $jc(_$hash, theming.hashCode);
    _$hash = $jc(_$hash, userStatus.hashCode);
    _$hash = $jc(_$hash, weatherStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities')
          ..add('core', core)
          ..add('bruteforce', bruteforce)
          ..add('metadataAvailable', metadataAvailable)
          ..add('files', files)
          ..add('activity', activity)
          ..add('circles', circles)
          ..add('ocm', ocm)
          ..add('dav', dav)
          ..add('filesSharing', filesSharing)
          ..add('notes', notes)
          ..add('notifications', notifications)
          ..add('passwordPolicy', passwordPolicy)
          ..add('provisioningApi', provisioningApi)
          ..add('theming', theming)
          ..add('userStatus', userStatus)
          ..add('weatherStatus', weatherStatus))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder
    implements
        Builder<NextcloudCoreServerCapabilities_Ocs_Data_Capabilities,
            NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities? _$v;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder? _core;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder get core =>
      _$this._core ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder();
  set core(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CoreBuilder? core) => _$this._core = core;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder? _bruteforce;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder get bruteforce =>
      _$this._bruteforce ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder();
  set bruteforce(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_BruteforceBuilder? bruteforce) =>
      _$this._bruteforce = bruteforce;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder? _metadataAvailable;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder get metadataAvailable =>
      _$this._metadataAvailable ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder();
  set metadataAvailable(
          NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_MetadataAvailableBuilder? metadataAvailable) =>
      _$this._metadataAvailable = metadataAvailable;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder? _files;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder get files =>
      _$this._files ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder();
  set files(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesBuilder? files) => _$this._files = files;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder? _activity;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder get activity =>
      _$this._activity ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder();
  set activity(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ActivityBuilder? activity) =>
      _$this._activity = activity;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder? _circles;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder get circles =>
      _$this._circles ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder();
  set circles(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_CirclesBuilder? circles) =>
      _$this._circles = circles;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder? _ocm;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder get ocm =>
      _$this._ocm ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder();
  set ocm(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_OcmBuilder? ocm) => _$this._ocm = ocm;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder? _dav;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder get dav =>
      _$this._dav ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder();
  set dav(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_DavBuilder? dav) => _$this._dav = dav;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder? _filesSharing;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder get filesSharing =>
      _$this._filesSharing ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder();
  set filesSharing(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_FilesSharingBuilder? filesSharing) =>
      _$this._filesSharing = filesSharing;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder? _notes;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder get notes =>
      _$this._notes ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder();
  set notes(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotesBuilder? notes) => _$this._notes = notes;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder? _notifications;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder get notifications =>
      _$this._notifications ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder();
  set notifications(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_NotificationsBuilder? notifications) =>
      _$this._notifications = notifications;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder? _passwordPolicy;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder get passwordPolicy =>
      _$this._passwordPolicy ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder();
  set passwordPolicy(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_PasswordPolicyBuilder? passwordPolicy) =>
      _$this._passwordPolicy = passwordPolicy;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder? _provisioningApi;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder get provisioningApi =>
      _$this._provisioningApi ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder();
  set provisioningApi(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ProvisioningApiBuilder? provisioningApi) =>
      _$this._provisioningApi = provisioningApi;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder? _theming;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder get theming =>
      _$this._theming ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder();
  set theming(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_ThemingBuilder? theming) =>
      _$this._theming = theming;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder? _userStatus;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder get userStatus =>
      _$this._userStatus ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder();
  set userStatus(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_UserStatusBuilder? userStatus) =>
      _$this._userStatus = userStatus;

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder? _weatherStatus;
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder get weatherStatus =>
      _$this._weatherStatus ??= NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder();
  set weatherStatus(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_WeatherStatusBuilder? weatherStatus) =>
      _$this._weatherStatus = weatherStatus;

  NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder();

  NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _core = $v.core?.toBuilder();
      _bruteforce = $v.bruteforce?.toBuilder();
      _metadataAvailable = $v.metadataAvailable?.toBuilder();
      _files = $v.files?.toBuilder();
      _activity = $v.activity?.toBuilder();
      _circles = $v.circles?.toBuilder();
      _ocm = $v.ocm?.toBuilder();
      _dav = $v.dav?.toBuilder();
      _filesSharing = $v.filesSharing?.toBuilder();
      _notes = $v.notes?.toBuilder();
      _notifications = $v.notifications?.toBuilder();
      _passwordPolicy = $v.passwordPolicy?.toBuilder();
      _provisioningApi = $v.provisioningApi?.toBuilder();
      _theming = $v.theming?.toBuilder();
      _userStatus = $v.userStatus?.toBuilder();
      _weatherStatus = $v.weatherStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data_Capabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data_Capabilities._(
              core: _core?.build(),
              bruteforce: _bruteforce?.build(),
              metadataAvailable: _metadataAvailable?.build(),
              files: _files?.build(),
              activity: _activity?.build(),
              circles: _circles?.build(),
              ocm: _ocm?.build(),
              dav: _dav?.build(),
              filesSharing: _filesSharing?.build(),
              notes: _notes?.build(),
              notifications: _notifications?.build(),
              passwordPolicy: _passwordPolicy?.build(),
              provisioningApi: _provisioningApi?.build(),
              theming: _theming?.build(),
              userStatus: _userStatus?.build(),
              weatherStatus: _weatherStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'core';
        _core?.build();
        _$failedField = 'bruteforce';
        _bruteforce?.build();
        _$failedField = 'metadataAvailable';
        _metadataAvailable?.build();
        _$failedField = 'files';
        _files?.build();
        _$failedField = 'activity';
        _activity?.build();
        _$failedField = 'circles';
        _circles?.build();
        _$failedField = 'ocm';
        _ocm?.build();
        _$failedField = 'dav';
        _dav?.build();
        _$failedField = 'filesSharing';
        _filesSharing?.build();
        _$failedField = 'notes';
        _notes?.build();
        _$failedField = 'notifications';
        _notifications?.build();
        _$failedField = 'passwordPolicy';
        _passwordPolicy?.build();
        _$failedField = 'provisioningApi';
        _provisioningApi?.build();
        _$failedField = 'theming';
        _theming?.build();
        _$failedField = 'userStatus';
        _userStatus?.build();
        _$failedField = 'weatherStatus';
        _weatherStatus?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreServerCapabilities_Ocs_Data_Capabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs_Data extends NextcloudCoreServerCapabilities_Ocs_Data {
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Version version;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data_Capabilities capabilities;

  factory _$NextcloudCoreServerCapabilities_Ocs_Data(
          [void Function(NextcloudCoreServerCapabilities_Ocs_DataBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_Ocs_DataBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs_Data._({required this.version, required this.capabilities}) : super._() {
    BuiltValueNullFieldError.checkNotNull(version, r'NextcloudCoreServerCapabilities_Ocs_Data', 'version');
    BuiltValueNullFieldError.checkNotNull(capabilities, r'NextcloudCoreServerCapabilities_Ocs_Data', 'capabilities');
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data rebuild(
          void Function(NextcloudCoreServerCapabilities_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_Ocs_DataBuilder toBuilder() =>
      NextcloudCoreServerCapabilities_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs_Data &&
        version == other.version &&
        capabilities == other.capabilities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, capabilities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs_Data')
          ..add('version', version)
          ..add('capabilities', capabilities))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_Ocs_DataBuilder
    implements Builder<NextcloudCoreServerCapabilities_Ocs_Data, NextcloudCoreServerCapabilities_Ocs_DataBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs_Data? _$v;

  NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder? _version;
  NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder get version =>
      _$this._version ??= NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder();
  set version(NextcloudCoreServerCapabilities_Ocs_Data_VersionBuilder? version) => _$this._version = version;

  NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder? _capabilities;
  NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder get capabilities =>
      _$this._capabilities ??= NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder();
  set capabilities(NextcloudCoreServerCapabilities_Ocs_Data_CapabilitiesBuilder? capabilities) =>
      _$this._capabilities = capabilities;

  NextcloudCoreServerCapabilities_Ocs_DataBuilder();

  NextcloudCoreServerCapabilities_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version.toBuilder();
      _capabilities = $v.capabilities.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs_Data;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs_Data build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs_Data _build() {
    _$NextcloudCoreServerCapabilities_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreServerCapabilities_Ocs_Data._(version: version.build(), capabilities: capabilities.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'version';
        version.build();
        _$failedField = 'capabilities';
        capabilities.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreServerCapabilities_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities_Ocs extends NextcloudCoreServerCapabilities_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudCoreServerCapabilities_Ocs_Data data;

  factory _$NextcloudCoreServerCapabilities_Ocs([void Function(NextcloudCoreServerCapabilities_OcsBuilder)? updates]) =>
      (NextcloudCoreServerCapabilities_OcsBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudCoreServerCapabilities_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreServerCapabilities_Ocs', 'data');
  }

  @override
  NextcloudCoreServerCapabilities_Ocs rebuild(void Function(NextcloudCoreServerCapabilities_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilities_OcsBuilder toBuilder() => NextcloudCoreServerCapabilities_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudCoreServerCapabilities_OcsBuilder
    implements Builder<NextcloudCoreServerCapabilities_Ocs, NextcloudCoreServerCapabilities_OcsBuilder> {
  _$NextcloudCoreServerCapabilities_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudCoreServerCapabilities_Ocs_DataBuilder? _data;
  NextcloudCoreServerCapabilities_Ocs_DataBuilder get data =>
      _$this._data ??= NextcloudCoreServerCapabilities_Ocs_DataBuilder();
  set data(NextcloudCoreServerCapabilities_Ocs_DataBuilder? data) => _$this._data = data;

  NextcloudCoreServerCapabilities_OcsBuilder();

  NextcloudCoreServerCapabilities_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities_Ocs;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilities_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities_Ocs build() => _build();

  _$NextcloudCoreServerCapabilities_Ocs _build() {
    _$NextcloudCoreServerCapabilities_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreServerCapabilities_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreServerCapabilities_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreServerCapabilities extends NextcloudCoreServerCapabilities {
  @override
  final NextcloudCoreServerCapabilities_Ocs ocs;

  factory _$NextcloudCoreServerCapabilities([void Function(NextcloudCoreServerCapabilitiesBuilder)? updates]) =>
      (NextcloudCoreServerCapabilitiesBuilder()..update(updates))._build();

  _$NextcloudCoreServerCapabilities._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudCoreServerCapabilities', 'ocs');
  }

  @override
  NextcloudCoreServerCapabilities rebuild(void Function(NextcloudCoreServerCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreServerCapabilitiesBuilder toBuilder() => NextcloudCoreServerCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreServerCapabilities && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreServerCapabilities')..add('ocs', ocs)).toString();
  }
}

class NextcloudCoreServerCapabilitiesBuilder
    implements Builder<NextcloudCoreServerCapabilities, NextcloudCoreServerCapabilitiesBuilder> {
  _$NextcloudCoreServerCapabilities? _$v;

  NextcloudCoreServerCapabilities_OcsBuilder? _ocs;
  NextcloudCoreServerCapabilities_OcsBuilder get ocs => _$this._ocs ??= NextcloudCoreServerCapabilities_OcsBuilder();
  set ocs(NextcloudCoreServerCapabilities_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudCoreServerCapabilitiesBuilder();

  NextcloudCoreServerCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreServerCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreServerCapabilities;
  }

  @override
  void update(void Function(NextcloudCoreServerCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreServerCapabilities build() => _build();

  _$NextcloudCoreServerCapabilities _build() {
    _$NextcloudCoreServerCapabilities _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreServerCapabilities._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreServerCapabilities', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreNavigationApps_Ocs_Data_Order extends NextcloudCoreNavigationApps_Ocs_Data_Order {
  @override
  final JsonObject data;
  @override
  final int? $int;
  @override
  final String? string;

  factory _$NextcloudCoreNavigationApps_Ocs_Data_Order(
          [void Function(NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder)? updates]) =>
      (NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder()..update(updates))._build();

  _$NextcloudCoreNavigationApps_Ocs_Data_Order._({required this.data, this.$int, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreNavigationApps_Ocs_Data_Order', 'data');
  }

  @override
  NextcloudCoreNavigationApps_Ocs_Data_Order rebuild(
          void Function(NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder toBuilder() =>
      NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreNavigationApps_Ocs_Data_Order &&
        data == other.data &&
        $int == other.$int &&
        string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreNavigationApps_Ocs_Data_Order')
          ..add('data', data)
          ..add('\$int', $int)
          ..add('string', string))
        .toString();
  }
}

class NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder
    implements Builder<NextcloudCoreNavigationApps_Ocs_Data_Order, NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder> {
  _$NextcloudCoreNavigationApps_Ocs_Data_Order? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder();

  NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$int = $v.$int;
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreNavigationApps_Ocs_Data_Order other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreNavigationApps_Ocs_Data_Order;
  }

  @override
  void update(void Function(NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreNavigationApps_Ocs_Data_Order build() => _build();

  _$NextcloudCoreNavigationApps_Ocs_Data_Order _build() {
    final _$result = _$v ??
        _$NextcloudCoreNavigationApps_Ocs_Data_Order._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreNavigationApps_Ocs_Data_Order', 'data'),
            $int: $int,
            string: string);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreNavigationApps_Ocs_Data extends NextcloudCoreNavigationApps_Ocs_Data {
  @override
  final String id;
  @override
  final NextcloudCoreNavigationApps_Ocs_Data_Order order;
  @override
  final String href;
  @override
  final String icon;
  @override
  final String type;
  @override
  final String name;
  @override
  final bool active;
  @override
  final String classes;
  @override
  final int unread;

  factory _$NextcloudCoreNavigationApps_Ocs_Data(
          [void Function(NextcloudCoreNavigationApps_Ocs_DataBuilder)? updates]) =>
      (NextcloudCoreNavigationApps_Ocs_DataBuilder()..update(updates))._build();

  _$NextcloudCoreNavigationApps_Ocs_Data._(
      {required this.id,
      required this.order,
      required this.href,
      required this.icon,
      required this.type,
      required this.name,
      required this.active,
      required this.classes,
      required this.unread})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudCoreNavigationApps_Ocs_Data', 'id');
    BuiltValueNullFieldError.checkNotNull(order, r'NextcloudCoreNavigationApps_Ocs_Data', 'order');
    BuiltValueNullFieldError.checkNotNull(href, r'NextcloudCoreNavigationApps_Ocs_Data', 'href');
    BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudCoreNavigationApps_Ocs_Data', 'icon');
    BuiltValueNullFieldError.checkNotNull(type, r'NextcloudCoreNavigationApps_Ocs_Data', 'type');
    BuiltValueNullFieldError.checkNotNull(name, r'NextcloudCoreNavigationApps_Ocs_Data', 'name');
    BuiltValueNullFieldError.checkNotNull(active, r'NextcloudCoreNavigationApps_Ocs_Data', 'active');
    BuiltValueNullFieldError.checkNotNull(classes, r'NextcloudCoreNavigationApps_Ocs_Data', 'classes');
    BuiltValueNullFieldError.checkNotNull(unread, r'NextcloudCoreNavigationApps_Ocs_Data', 'unread');
  }

  @override
  NextcloudCoreNavigationApps_Ocs_Data rebuild(void Function(NextcloudCoreNavigationApps_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreNavigationApps_Ocs_DataBuilder toBuilder() =>
      NextcloudCoreNavigationApps_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreNavigationApps_Ocs_Data &&
        id == other.id &&
        order == other.order &&
        href == other.href &&
        icon == other.icon &&
        type == other.type &&
        name == other.name &&
        active == other.active &&
        classes == other.classes &&
        unread == other.unread;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jc(_$hash, href.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, classes.hashCode);
    _$hash = $jc(_$hash, unread.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreNavigationApps_Ocs_Data')
          ..add('id', id)
          ..add('order', order)
          ..add('href', href)
          ..add('icon', icon)
          ..add('type', type)
          ..add('name', name)
          ..add('active', active)
          ..add('classes', classes)
          ..add('unread', unread))
        .toString();
  }
}

class NextcloudCoreNavigationApps_Ocs_DataBuilder
    implements Builder<NextcloudCoreNavigationApps_Ocs_Data, NextcloudCoreNavigationApps_Ocs_DataBuilder> {
  _$NextcloudCoreNavigationApps_Ocs_Data? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder? _order;
  NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder get order =>
      _$this._order ??= NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder();
  set order(NextcloudCoreNavigationApps_Ocs_Data_OrderBuilder? order) => _$this._order = order;

  String? _href;
  String? get href => _$this._href;
  set href(String? href) => _$this._href = href;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  String? _classes;
  String? get classes => _$this._classes;
  set classes(String? classes) => _$this._classes = classes;

  int? _unread;
  int? get unread => _$this._unread;
  set unread(int? unread) => _$this._unread = unread;

  NextcloudCoreNavigationApps_Ocs_DataBuilder();

  NextcloudCoreNavigationApps_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _order = $v.order.toBuilder();
      _href = $v.href;
      _icon = $v.icon;
      _type = $v.type;
      _name = $v.name;
      _active = $v.active;
      _classes = $v.classes;
      _unread = $v.unread;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreNavigationApps_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreNavigationApps_Ocs_Data;
  }

  @override
  void update(void Function(NextcloudCoreNavigationApps_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreNavigationApps_Ocs_Data build() => _build();

  _$NextcloudCoreNavigationApps_Ocs_Data _build() {
    _$NextcloudCoreNavigationApps_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreNavigationApps_Ocs_Data._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudCoreNavigationApps_Ocs_Data', 'id'),
              order: order.build(),
              href: BuiltValueNullFieldError.checkNotNull(href, r'NextcloudCoreNavigationApps_Ocs_Data', 'href'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudCoreNavigationApps_Ocs_Data', 'icon'),
              type: BuiltValueNullFieldError.checkNotNull(type, r'NextcloudCoreNavigationApps_Ocs_Data', 'type'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'NextcloudCoreNavigationApps_Ocs_Data', 'name'),
              active: BuiltValueNullFieldError.checkNotNull(active, r'NextcloudCoreNavigationApps_Ocs_Data', 'active'),
              classes:
                  BuiltValueNullFieldError.checkNotNull(classes, r'NextcloudCoreNavigationApps_Ocs_Data', 'classes'),
              unread: BuiltValueNullFieldError.checkNotNull(unread, r'NextcloudCoreNavigationApps_Ocs_Data', 'unread'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'order';
        order.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreNavigationApps_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreNavigationApps_Ocs extends NextcloudCoreNavigationApps_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<NextcloudCoreNavigationApps_Ocs_Data> data;

  factory _$NextcloudCoreNavigationApps_Ocs([void Function(NextcloudCoreNavigationApps_OcsBuilder)? updates]) =>
      (NextcloudCoreNavigationApps_OcsBuilder()..update(updates))._build();

  _$NextcloudCoreNavigationApps_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudCoreNavigationApps_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreNavigationApps_Ocs', 'data');
  }

  @override
  NextcloudCoreNavigationApps_Ocs rebuild(void Function(NextcloudCoreNavigationApps_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreNavigationApps_OcsBuilder toBuilder() => NextcloudCoreNavigationApps_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreNavigationApps_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreNavigationApps_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudCoreNavigationApps_OcsBuilder
    implements Builder<NextcloudCoreNavigationApps_Ocs, NextcloudCoreNavigationApps_OcsBuilder> {
  _$NextcloudCoreNavigationApps_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NextcloudCoreNavigationApps_Ocs_Data>? _data;
  ListBuilder<NextcloudCoreNavigationApps_Ocs_Data> get data =>
      _$this._data ??= ListBuilder<NextcloudCoreNavigationApps_Ocs_Data>();
  set data(ListBuilder<NextcloudCoreNavigationApps_Ocs_Data>? data) => _$this._data = data;

  NextcloudCoreNavigationApps_OcsBuilder();

  NextcloudCoreNavigationApps_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreNavigationApps_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreNavigationApps_Ocs;
  }

  @override
  void update(void Function(NextcloudCoreNavigationApps_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreNavigationApps_Ocs build() => _build();

  _$NextcloudCoreNavigationApps_Ocs _build() {
    _$NextcloudCoreNavigationApps_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreNavigationApps_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreNavigationApps_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreNavigationApps extends NextcloudCoreNavigationApps {
  @override
  final NextcloudCoreNavigationApps_Ocs ocs;

  factory _$NextcloudCoreNavigationApps([void Function(NextcloudCoreNavigationAppsBuilder)? updates]) =>
      (NextcloudCoreNavigationAppsBuilder()..update(updates))._build();

  _$NextcloudCoreNavigationApps._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudCoreNavigationApps', 'ocs');
  }

  @override
  NextcloudCoreNavigationApps rebuild(void Function(NextcloudCoreNavigationAppsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreNavigationAppsBuilder toBuilder() => NextcloudCoreNavigationAppsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreNavigationApps && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreNavigationApps')..add('ocs', ocs)).toString();
  }
}

class NextcloudCoreNavigationAppsBuilder
    implements Builder<NextcloudCoreNavigationApps, NextcloudCoreNavigationAppsBuilder> {
  _$NextcloudCoreNavigationApps? _$v;

  NextcloudCoreNavigationApps_OcsBuilder? _ocs;
  NextcloudCoreNavigationApps_OcsBuilder get ocs => _$this._ocs ??= NextcloudCoreNavigationApps_OcsBuilder();
  set ocs(NextcloudCoreNavigationApps_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudCoreNavigationAppsBuilder();

  NextcloudCoreNavigationAppsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreNavigationApps other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreNavigationApps;
  }

  @override
  void update(void Function(NextcloudCoreNavigationAppsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreNavigationApps build() => _build();

  _$NextcloudCoreNavigationApps _build() {
    _$NextcloudCoreNavigationApps _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreNavigationApps._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreNavigationApps', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreLoginFlowInit_Poll extends NextcloudCoreLoginFlowInit_Poll {
  @override
  final String token;
  @override
  final String endpoint;

  factory _$NextcloudCoreLoginFlowInit_Poll([void Function(NextcloudCoreLoginFlowInit_PollBuilder)? updates]) =>
      (NextcloudCoreLoginFlowInit_PollBuilder()..update(updates))._build();

  _$NextcloudCoreLoginFlowInit_Poll._({required this.token, required this.endpoint}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'NextcloudCoreLoginFlowInit_Poll', 'token');
    BuiltValueNullFieldError.checkNotNull(endpoint, r'NextcloudCoreLoginFlowInit_Poll', 'endpoint');
  }

  @override
  NextcloudCoreLoginFlowInit_Poll rebuild(void Function(NextcloudCoreLoginFlowInit_PollBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreLoginFlowInit_PollBuilder toBuilder() => NextcloudCoreLoginFlowInit_PollBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreLoginFlowInit_Poll && token == other.token && endpoint == other.endpoint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreLoginFlowInit_Poll')
          ..add('token', token)
          ..add('endpoint', endpoint))
        .toString();
  }
}

class NextcloudCoreLoginFlowInit_PollBuilder
    implements Builder<NextcloudCoreLoginFlowInit_Poll, NextcloudCoreLoginFlowInit_PollBuilder> {
  _$NextcloudCoreLoginFlowInit_Poll? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _endpoint;
  String? get endpoint => _$this._endpoint;
  set endpoint(String? endpoint) => _$this._endpoint = endpoint;

  NextcloudCoreLoginFlowInit_PollBuilder();

  NextcloudCoreLoginFlowInit_PollBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _endpoint = $v.endpoint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreLoginFlowInit_Poll other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreLoginFlowInit_Poll;
  }

  @override
  void update(void Function(NextcloudCoreLoginFlowInit_PollBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreLoginFlowInit_Poll build() => _build();

  _$NextcloudCoreLoginFlowInit_Poll _build() {
    final _$result = _$v ??
        _$NextcloudCoreLoginFlowInit_Poll._(
            token: BuiltValueNullFieldError.checkNotNull(token, r'NextcloudCoreLoginFlowInit_Poll', 'token'),
            endpoint: BuiltValueNullFieldError.checkNotNull(endpoint, r'NextcloudCoreLoginFlowInit_Poll', 'endpoint'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreLoginFlowInit extends NextcloudCoreLoginFlowInit {
  @override
  final NextcloudCoreLoginFlowInit_Poll poll;
  @override
  final String login;

  factory _$NextcloudCoreLoginFlowInit([void Function(NextcloudCoreLoginFlowInitBuilder)? updates]) =>
      (NextcloudCoreLoginFlowInitBuilder()..update(updates))._build();

  _$NextcloudCoreLoginFlowInit._({required this.poll, required this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(poll, r'NextcloudCoreLoginFlowInit', 'poll');
    BuiltValueNullFieldError.checkNotNull(login, r'NextcloudCoreLoginFlowInit', 'login');
  }

  @override
  NextcloudCoreLoginFlowInit rebuild(void Function(NextcloudCoreLoginFlowInitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreLoginFlowInitBuilder toBuilder() => NextcloudCoreLoginFlowInitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreLoginFlowInit && poll == other.poll && login == other.login;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, poll.hashCode);
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreLoginFlowInit')
          ..add('poll', poll)
          ..add('login', login))
        .toString();
  }
}

class NextcloudCoreLoginFlowInitBuilder
    implements Builder<NextcloudCoreLoginFlowInit, NextcloudCoreLoginFlowInitBuilder> {
  _$NextcloudCoreLoginFlowInit? _$v;

  NextcloudCoreLoginFlowInit_PollBuilder? _poll;
  NextcloudCoreLoginFlowInit_PollBuilder get poll => _$this._poll ??= NextcloudCoreLoginFlowInit_PollBuilder();
  set poll(NextcloudCoreLoginFlowInit_PollBuilder? poll) => _$this._poll = poll;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  NextcloudCoreLoginFlowInitBuilder();

  NextcloudCoreLoginFlowInitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _poll = $v.poll.toBuilder();
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreLoginFlowInit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreLoginFlowInit;
  }

  @override
  void update(void Function(NextcloudCoreLoginFlowInitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreLoginFlowInit build() => _build();

  _$NextcloudCoreLoginFlowInit _build() {
    _$NextcloudCoreLoginFlowInit _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreLoginFlowInit._(
              poll: poll.build(),
              login: BuiltValueNullFieldError.checkNotNull(login, r'NextcloudCoreLoginFlowInit', 'login'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'poll';
        poll.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreLoginFlowInit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreLoginFlowResult extends NextcloudCoreLoginFlowResult {
  @override
  final String server;
  @override
  final String loginName;
  @override
  final String appPassword;

  factory _$NextcloudCoreLoginFlowResult([void Function(NextcloudCoreLoginFlowResultBuilder)? updates]) =>
      (NextcloudCoreLoginFlowResultBuilder()..update(updates))._build();

  _$NextcloudCoreLoginFlowResult._({required this.server, required this.loginName, required this.appPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(server, r'NextcloudCoreLoginFlowResult', 'server');
    BuiltValueNullFieldError.checkNotNull(loginName, r'NextcloudCoreLoginFlowResult', 'loginName');
    BuiltValueNullFieldError.checkNotNull(appPassword, r'NextcloudCoreLoginFlowResult', 'appPassword');
  }

  @override
  NextcloudCoreLoginFlowResult rebuild(void Function(NextcloudCoreLoginFlowResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreLoginFlowResultBuilder toBuilder() => NextcloudCoreLoginFlowResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreLoginFlowResult &&
        server == other.server &&
        loginName == other.loginName &&
        appPassword == other.appPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, server.hashCode);
    _$hash = $jc(_$hash, loginName.hashCode);
    _$hash = $jc(_$hash, appPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreLoginFlowResult')
          ..add('server', server)
          ..add('loginName', loginName)
          ..add('appPassword', appPassword))
        .toString();
  }
}

class NextcloudCoreLoginFlowResultBuilder
    implements Builder<NextcloudCoreLoginFlowResult, NextcloudCoreLoginFlowResultBuilder> {
  _$NextcloudCoreLoginFlowResult? _$v;

  String? _server;
  String? get server => _$this._server;
  set server(String? server) => _$this._server = server;

  String? _loginName;
  String? get loginName => _$this._loginName;
  set loginName(String? loginName) => _$this._loginName = loginName;

  String? _appPassword;
  String? get appPassword => _$this._appPassword;
  set appPassword(String? appPassword) => _$this._appPassword = appPassword;

  NextcloudCoreLoginFlowResultBuilder();

  NextcloudCoreLoginFlowResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _server = $v.server;
      _loginName = $v.loginName;
      _appPassword = $v.appPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreLoginFlowResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreLoginFlowResult;
  }

  @override
  void update(void Function(NextcloudCoreLoginFlowResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreLoginFlowResult build() => _build();

  _$NextcloudCoreLoginFlowResult _build() {
    final _$result = _$v ??
        _$NextcloudCoreLoginFlowResult._(
            server: BuiltValueNullFieldError.checkNotNull(server, r'NextcloudCoreLoginFlowResult', 'server'),
            loginName: BuiltValueNullFieldError.checkNotNull(loginName, r'NextcloudCoreLoginFlowResult', 'loginName'),
            appPassword:
                BuiltValueNullFieldError.checkNotNull(appPassword, r'NextcloudCoreLoginFlowResult', 'appPassword'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreAutocompleteResult_Ocs_Data_Status extends NextcloudCoreAutocompleteResult_Ocs_Data_Status {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final String? string;

  factory _$NextcloudCoreAutocompleteResult_Ocs_Data_Status(
          [void Function(NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder)? updates]) =>
      (NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder()..update(updates))._build();

  _$NextcloudCoreAutocompleteResult_Ocs_Data_Status._({required this.data, this.builtListJsonObject, this.string})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreAutocompleteResult_Ocs_Data_Status', 'data');
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data_Status rebuild(
          void Function(NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder toBuilder() =>
      NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreAutocompleteResult_Ocs_Data_Status &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        string == other.string;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreAutocompleteResult_Ocs_Data_Status')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('string', string))
        .toString();
  }
}

class NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder
    implements
        Builder<NextcloudCoreAutocompleteResult_Ocs_Data_Status,
            NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder> {
  _$NextcloudCoreAutocompleteResult_Ocs_Data_Status? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder();

  NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreAutocompleteResult_Ocs_Data_Status other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreAutocompleteResult_Ocs_Data_Status;
  }

  @override
  void update(void Function(NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data_Status build() => _build();

  _$NextcloudCoreAutocompleteResult_Ocs_Data_Status _build() {
    _$NextcloudCoreAutocompleteResult_Ocs_Data_Status _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreAutocompleteResult_Ocs_Data_Status._(
              data: BuiltValueNullFieldError.checkNotNull(
                  data, r'NextcloudCoreAutocompleteResult_Ocs_Data_Status', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              string: string);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudCoreAutocompleteResult_Ocs_Data_Status', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreAutocompleteResult_Ocs_Data extends NextcloudCoreAutocompleteResult_Ocs_Data {
  @override
  final String id;
  @override
  final String label;
  @override
  final String icon;
  @override
  final String source;
  @override
  final NextcloudCoreAutocompleteResult_Ocs_Data_Status status;
  @override
  final String subline;
  @override
  final String shareWithDisplayNameUnique;

  factory _$NextcloudCoreAutocompleteResult_Ocs_Data(
          [void Function(NextcloudCoreAutocompleteResult_Ocs_DataBuilder)? updates]) =>
      (NextcloudCoreAutocompleteResult_Ocs_DataBuilder()..update(updates))._build();

  _$NextcloudCoreAutocompleteResult_Ocs_Data._(
      {required this.id,
      required this.label,
      required this.icon,
      required this.source,
      required this.status,
      required this.subline,
      required this.shareWithDisplayNameUnique})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'id');
    BuiltValueNullFieldError.checkNotNull(label, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'label');
    BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'icon');
    BuiltValueNullFieldError.checkNotNull(source, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'source');
    BuiltValueNullFieldError.checkNotNull(status, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'status');
    BuiltValueNullFieldError.checkNotNull(subline, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'subline');
    BuiltValueNullFieldError.checkNotNull(
        shareWithDisplayNameUnique, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'shareWithDisplayNameUnique');
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data rebuild(
          void Function(NextcloudCoreAutocompleteResult_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreAutocompleteResult_Ocs_DataBuilder toBuilder() =>
      NextcloudCoreAutocompleteResult_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreAutocompleteResult_Ocs_Data &&
        id == other.id &&
        label == other.label &&
        icon == other.icon &&
        source == other.source &&
        status == other.status &&
        subline == other.subline &&
        shareWithDisplayNameUnique == other.shareWithDisplayNameUnique;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, subline.hashCode);
    _$hash = $jc(_$hash, shareWithDisplayNameUnique.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreAutocompleteResult_Ocs_Data')
          ..add('id', id)
          ..add('label', label)
          ..add('icon', icon)
          ..add('source', source)
          ..add('status', status)
          ..add('subline', subline)
          ..add('shareWithDisplayNameUnique', shareWithDisplayNameUnique))
        .toString();
  }
}

class NextcloudCoreAutocompleteResult_Ocs_DataBuilder
    implements Builder<NextcloudCoreAutocompleteResult_Ocs_Data, NextcloudCoreAutocompleteResult_Ocs_DataBuilder> {
  _$NextcloudCoreAutocompleteResult_Ocs_Data? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _source;
  String? get source => _$this._source;
  set source(String? source) => _$this._source = source;

  NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder? _status;
  NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder get status =>
      _$this._status ??= NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder();
  set status(NextcloudCoreAutocompleteResult_Ocs_Data_StatusBuilder? status) => _$this._status = status;

  String? _subline;
  String? get subline => _$this._subline;
  set subline(String? subline) => _$this._subline = subline;

  String? _shareWithDisplayNameUnique;
  String? get shareWithDisplayNameUnique => _$this._shareWithDisplayNameUnique;
  set shareWithDisplayNameUnique(String? shareWithDisplayNameUnique) =>
      _$this._shareWithDisplayNameUnique = shareWithDisplayNameUnique;

  NextcloudCoreAutocompleteResult_Ocs_DataBuilder();

  NextcloudCoreAutocompleteResult_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _label = $v.label;
      _icon = $v.icon;
      _source = $v.source;
      _status = $v.status.toBuilder();
      _subline = $v.subline;
      _shareWithDisplayNameUnique = $v.shareWithDisplayNameUnique;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreAutocompleteResult_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreAutocompleteResult_Ocs_Data;
  }

  @override
  void update(void Function(NextcloudCoreAutocompleteResult_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs_Data build() => _build();

  _$NextcloudCoreAutocompleteResult_Ocs_Data _build() {
    _$NextcloudCoreAutocompleteResult_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$NextcloudCoreAutocompleteResult_Ocs_Data._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'id'),
              label: BuiltValueNullFieldError.checkNotNull(label, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'label'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'icon'),
              source:
                  BuiltValueNullFieldError.checkNotNull(source, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'source'),
              status: status.build(),
              subline: BuiltValueNullFieldError.checkNotNull(
                  subline, r'NextcloudCoreAutocompleteResult_Ocs_Data', 'subline'),
              shareWithDisplayNameUnique: BuiltValueNullFieldError.checkNotNull(shareWithDisplayNameUnique,
                  r'NextcloudCoreAutocompleteResult_Ocs_Data', 'shareWithDisplayNameUnique'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'status';
        status.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreAutocompleteResult_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreAutocompleteResult_Ocs extends NextcloudCoreAutocompleteResult_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<NextcloudCoreAutocompleteResult_Ocs_Data> data;

  factory _$NextcloudCoreAutocompleteResult_Ocs([void Function(NextcloudCoreAutocompleteResult_OcsBuilder)? updates]) =>
      (NextcloudCoreAutocompleteResult_OcsBuilder()..update(updates))._build();

  _$NextcloudCoreAutocompleteResult_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudCoreAutocompleteResult_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudCoreAutocompleteResult_Ocs', 'data');
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs rebuild(void Function(NextcloudCoreAutocompleteResult_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreAutocompleteResult_OcsBuilder toBuilder() => NextcloudCoreAutocompleteResult_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreAutocompleteResult_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreAutocompleteResult_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudCoreAutocompleteResult_OcsBuilder
    implements Builder<NextcloudCoreAutocompleteResult_Ocs, NextcloudCoreAutocompleteResult_OcsBuilder> {
  _$NextcloudCoreAutocompleteResult_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NextcloudCoreAutocompleteResult_Ocs_Data>? _data;
  ListBuilder<NextcloudCoreAutocompleteResult_Ocs_Data> get data =>
      _$this._data ??= ListBuilder<NextcloudCoreAutocompleteResult_Ocs_Data>();
  set data(ListBuilder<NextcloudCoreAutocompleteResult_Ocs_Data>? data) => _$this._data = data;

  NextcloudCoreAutocompleteResult_OcsBuilder();

  NextcloudCoreAutocompleteResult_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreAutocompleteResult_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreAutocompleteResult_Ocs;
  }

  @override
  void update(void Function(NextcloudCoreAutocompleteResult_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreAutocompleteResult_Ocs build() => _build();

  _$NextcloudCoreAutocompleteResult_Ocs _build() {
    _$NextcloudCoreAutocompleteResult_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreAutocompleteResult_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreAutocompleteResult_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudCoreAutocompleteResult extends NextcloudCoreAutocompleteResult {
  @override
  final NextcloudCoreAutocompleteResult_Ocs ocs;

  factory _$NextcloudCoreAutocompleteResult([void Function(NextcloudCoreAutocompleteResultBuilder)? updates]) =>
      (NextcloudCoreAutocompleteResultBuilder()..update(updates))._build();

  _$NextcloudCoreAutocompleteResult._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudCoreAutocompleteResult', 'ocs');
  }

  @override
  NextcloudCoreAutocompleteResult rebuild(void Function(NextcloudCoreAutocompleteResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudCoreAutocompleteResultBuilder toBuilder() => NextcloudCoreAutocompleteResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudCoreAutocompleteResult && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudCoreAutocompleteResult')..add('ocs', ocs)).toString();
  }
}

class NextcloudCoreAutocompleteResultBuilder
    implements Builder<NextcloudCoreAutocompleteResult, NextcloudCoreAutocompleteResultBuilder> {
  _$NextcloudCoreAutocompleteResult? _$v;

  NextcloudCoreAutocompleteResult_OcsBuilder? _ocs;
  NextcloudCoreAutocompleteResult_OcsBuilder get ocs => _$this._ocs ??= NextcloudCoreAutocompleteResult_OcsBuilder();
  set ocs(NextcloudCoreAutocompleteResult_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudCoreAutocompleteResultBuilder();

  NextcloudCoreAutocompleteResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudCoreAutocompleteResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudCoreAutocompleteResult;
  }

  @override
  void update(void Function(NextcloudCoreAutocompleteResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudCoreAutocompleteResult build() => _build();

  _$NextcloudCoreAutocompleteResult _build() {
    _$NextcloudCoreAutocompleteResult _$result;
    try {
      _$result = _$v ?? _$NextcloudCoreAutocompleteResult._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudCoreAutocompleteResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsSupportedAPIVersions extends NextcloudNewsSupportedAPIVersions {
  @override
  final BuiltList<String>? apiLevels;

  factory _$NextcloudNewsSupportedAPIVersions([void Function(NextcloudNewsSupportedAPIVersionsBuilder)? updates]) =>
      (NextcloudNewsSupportedAPIVersionsBuilder()..update(updates))._build();

  _$NextcloudNewsSupportedAPIVersions._({this.apiLevels}) : super._();

  @override
  NextcloudNewsSupportedAPIVersions rebuild(void Function(NextcloudNewsSupportedAPIVersionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsSupportedAPIVersionsBuilder toBuilder() => NextcloudNewsSupportedAPIVersionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsSupportedAPIVersions && apiLevels == other.apiLevels;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, apiLevels.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsSupportedAPIVersions')..add('apiLevels', apiLevels)).toString();
  }
}

class NextcloudNewsSupportedAPIVersionsBuilder
    implements Builder<NextcloudNewsSupportedAPIVersions, NextcloudNewsSupportedAPIVersionsBuilder> {
  _$NextcloudNewsSupportedAPIVersions? _$v;

  ListBuilder<String>? _apiLevels;
  ListBuilder<String> get apiLevels => _$this._apiLevels ??= ListBuilder<String>();
  set apiLevels(ListBuilder<String>? apiLevels) => _$this._apiLevels = apiLevels;

  NextcloudNewsSupportedAPIVersionsBuilder();

  NextcloudNewsSupportedAPIVersionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _apiLevels = $v.apiLevels?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsSupportedAPIVersions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsSupportedAPIVersions;
  }

  @override
  void update(void Function(NextcloudNewsSupportedAPIVersionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsSupportedAPIVersions build() => _build();

  _$NextcloudNewsSupportedAPIVersions _build() {
    _$NextcloudNewsSupportedAPIVersions _$result;
    try {
      _$result = _$v ?? _$NextcloudNewsSupportedAPIVersions._(apiLevels: _apiLevels?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'apiLevels';
        _apiLevels?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsSupportedAPIVersions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsArticle extends NextcloudNewsArticle {
  @override
  final int id;
  @override
  final String guid;
  @override
  final String guidHash;
  @override
  final String? url;
  @override
  final String title;
  @override
  final String? author;
  @override
  final int pubDate;
  @override
  final int? updatedDate;
  @override
  final String body;
  @override
  final String? enclosureMime;
  @override
  final String? enclosureLink;
  @override
  final String? mediaThumbnail;
  @override
  final String? mediaDescription;
  @override
  final int feedId;
  @override
  final bool unread;
  @override
  final bool starred;
  @override
  final int lastModified;
  @override
  final bool rtl;
  @override
  final String fingerprint;
  @override
  final String contentHash;

  factory _$NextcloudNewsArticle([void Function(NextcloudNewsArticleBuilder)? updates]) =>
      (NextcloudNewsArticleBuilder()..update(updates))._build();

  _$NextcloudNewsArticle._(
      {required this.id,
      required this.guid,
      required this.guidHash,
      this.url,
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
      required this.contentHash})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsArticle', 'id');
    BuiltValueNullFieldError.checkNotNull(guid, r'NextcloudNewsArticle', 'guid');
    BuiltValueNullFieldError.checkNotNull(guidHash, r'NextcloudNewsArticle', 'guidHash');
    BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNewsArticle', 'title');
    BuiltValueNullFieldError.checkNotNull(pubDate, r'NextcloudNewsArticle', 'pubDate');
    BuiltValueNullFieldError.checkNotNull(body, r'NextcloudNewsArticle', 'body');
    BuiltValueNullFieldError.checkNotNull(feedId, r'NextcloudNewsArticle', 'feedId');
    BuiltValueNullFieldError.checkNotNull(unread, r'NextcloudNewsArticle', 'unread');
    BuiltValueNullFieldError.checkNotNull(starred, r'NextcloudNewsArticle', 'starred');
    BuiltValueNullFieldError.checkNotNull(lastModified, r'NextcloudNewsArticle', 'lastModified');
    BuiltValueNullFieldError.checkNotNull(rtl, r'NextcloudNewsArticle', 'rtl');
    BuiltValueNullFieldError.checkNotNull(fingerprint, r'NextcloudNewsArticle', 'fingerprint');
    BuiltValueNullFieldError.checkNotNull(contentHash, r'NextcloudNewsArticle', 'contentHash');
  }

  @override
  NextcloudNewsArticle rebuild(void Function(NextcloudNewsArticleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsArticleBuilder toBuilder() => NextcloudNewsArticleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsArticle &&
        id == other.id &&
        guid == other.guid &&
        guidHash == other.guidHash &&
        url == other.url &&
        title == other.title &&
        author == other.author &&
        pubDate == other.pubDate &&
        updatedDate == other.updatedDate &&
        body == other.body &&
        enclosureMime == other.enclosureMime &&
        enclosureLink == other.enclosureLink &&
        mediaThumbnail == other.mediaThumbnail &&
        mediaDescription == other.mediaDescription &&
        feedId == other.feedId &&
        unread == other.unread &&
        starred == other.starred &&
        lastModified == other.lastModified &&
        rtl == other.rtl &&
        fingerprint == other.fingerprint &&
        contentHash == other.contentHash;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, guid.hashCode);
    _$hash = $jc(_$hash, guidHash.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, author.hashCode);
    _$hash = $jc(_$hash, pubDate.hashCode);
    _$hash = $jc(_$hash, updatedDate.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, enclosureMime.hashCode);
    _$hash = $jc(_$hash, enclosureLink.hashCode);
    _$hash = $jc(_$hash, mediaThumbnail.hashCode);
    _$hash = $jc(_$hash, mediaDescription.hashCode);
    _$hash = $jc(_$hash, feedId.hashCode);
    _$hash = $jc(_$hash, unread.hashCode);
    _$hash = $jc(_$hash, starred.hashCode);
    _$hash = $jc(_$hash, lastModified.hashCode);
    _$hash = $jc(_$hash, rtl.hashCode);
    _$hash = $jc(_$hash, fingerprint.hashCode);
    _$hash = $jc(_$hash, contentHash.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsArticle')
          ..add('id', id)
          ..add('guid', guid)
          ..add('guidHash', guidHash)
          ..add('url', url)
          ..add('title', title)
          ..add('author', author)
          ..add('pubDate', pubDate)
          ..add('updatedDate', updatedDate)
          ..add('body', body)
          ..add('enclosureMime', enclosureMime)
          ..add('enclosureLink', enclosureLink)
          ..add('mediaThumbnail', mediaThumbnail)
          ..add('mediaDescription', mediaDescription)
          ..add('feedId', feedId)
          ..add('unread', unread)
          ..add('starred', starred)
          ..add('lastModified', lastModified)
          ..add('rtl', rtl)
          ..add('fingerprint', fingerprint)
          ..add('contentHash', contentHash))
        .toString();
  }
}

class NextcloudNewsArticleBuilder implements Builder<NextcloudNewsArticle, NextcloudNewsArticleBuilder> {
  _$NextcloudNewsArticle? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _guid;
  String? get guid => _$this._guid;
  set guid(String? guid) => _$this._guid = guid;

  String? _guidHash;
  String? get guidHash => _$this._guidHash;
  set guidHash(String? guidHash) => _$this._guidHash = guidHash;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _author;
  String? get author => _$this._author;
  set author(String? author) => _$this._author = author;

  int? _pubDate;
  int? get pubDate => _$this._pubDate;
  set pubDate(int? pubDate) => _$this._pubDate = pubDate;

  int? _updatedDate;
  int? get updatedDate => _$this._updatedDate;
  set updatedDate(int? updatedDate) => _$this._updatedDate = updatedDate;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _enclosureMime;
  String? get enclosureMime => _$this._enclosureMime;
  set enclosureMime(String? enclosureMime) => _$this._enclosureMime = enclosureMime;

  String? _enclosureLink;
  String? get enclosureLink => _$this._enclosureLink;
  set enclosureLink(String? enclosureLink) => _$this._enclosureLink = enclosureLink;

  String? _mediaThumbnail;
  String? get mediaThumbnail => _$this._mediaThumbnail;
  set mediaThumbnail(String? mediaThumbnail) => _$this._mediaThumbnail = mediaThumbnail;

  String? _mediaDescription;
  String? get mediaDescription => _$this._mediaDescription;
  set mediaDescription(String? mediaDescription) => _$this._mediaDescription = mediaDescription;

  int? _feedId;
  int? get feedId => _$this._feedId;
  set feedId(int? feedId) => _$this._feedId = feedId;

  bool? _unread;
  bool? get unread => _$this._unread;
  set unread(bool? unread) => _$this._unread = unread;

  bool? _starred;
  bool? get starred => _$this._starred;
  set starred(bool? starred) => _$this._starred = starred;

  int? _lastModified;
  int? get lastModified => _$this._lastModified;
  set lastModified(int? lastModified) => _$this._lastModified = lastModified;

  bool? _rtl;
  bool? get rtl => _$this._rtl;
  set rtl(bool? rtl) => _$this._rtl = rtl;

  String? _fingerprint;
  String? get fingerprint => _$this._fingerprint;
  set fingerprint(String? fingerprint) => _$this._fingerprint = fingerprint;

  String? _contentHash;
  String? get contentHash => _$this._contentHash;
  set contentHash(String? contentHash) => _$this._contentHash = contentHash;

  NextcloudNewsArticleBuilder();

  NextcloudNewsArticleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _guid = $v.guid;
      _guidHash = $v.guidHash;
      _url = $v.url;
      _title = $v.title;
      _author = $v.author;
      _pubDate = $v.pubDate;
      _updatedDate = $v.updatedDate;
      _body = $v.body;
      _enclosureMime = $v.enclosureMime;
      _enclosureLink = $v.enclosureLink;
      _mediaThumbnail = $v.mediaThumbnail;
      _mediaDescription = $v.mediaDescription;
      _feedId = $v.feedId;
      _unread = $v.unread;
      _starred = $v.starred;
      _lastModified = $v.lastModified;
      _rtl = $v.rtl;
      _fingerprint = $v.fingerprint;
      _contentHash = $v.contentHash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsArticle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsArticle;
  }

  @override
  void update(void Function(NextcloudNewsArticleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsArticle build() => _build();

  _$NextcloudNewsArticle _build() {
    final _$result = _$v ??
        _$NextcloudNewsArticle._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsArticle', 'id'),
            guid: BuiltValueNullFieldError.checkNotNull(guid, r'NextcloudNewsArticle', 'guid'),
            guidHash: BuiltValueNullFieldError.checkNotNull(guidHash, r'NextcloudNewsArticle', 'guidHash'),
            url: url,
            title: BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNewsArticle', 'title'),
            author: author,
            pubDate: BuiltValueNullFieldError.checkNotNull(pubDate, r'NextcloudNewsArticle', 'pubDate'),
            updatedDate: updatedDate,
            body: BuiltValueNullFieldError.checkNotNull(body, r'NextcloudNewsArticle', 'body'),
            enclosureMime: enclosureMime,
            enclosureLink: enclosureLink,
            mediaThumbnail: mediaThumbnail,
            mediaDescription: mediaDescription,
            feedId: BuiltValueNullFieldError.checkNotNull(feedId, r'NextcloudNewsArticle', 'feedId'),
            unread: BuiltValueNullFieldError.checkNotNull(unread, r'NextcloudNewsArticle', 'unread'),
            starred: BuiltValueNullFieldError.checkNotNull(starred, r'NextcloudNewsArticle', 'starred'),
            lastModified: BuiltValueNullFieldError.checkNotNull(lastModified, r'NextcloudNewsArticle', 'lastModified'),
            rtl: BuiltValueNullFieldError.checkNotNull(rtl, r'NextcloudNewsArticle', 'rtl'),
            fingerprint: BuiltValueNullFieldError.checkNotNull(fingerprint, r'NextcloudNewsArticle', 'fingerprint'),
            contentHash: BuiltValueNullFieldError.checkNotNull(contentHash, r'NextcloudNewsArticle', 'contentHash'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsFeed extends NextcloudNewsFeed {
  @override
  final int id;
  @override
  final String url;
  @override
  final String title;
  @override
  final String? faviconLink;
  @override
  final int added;
  @override
  final int? folderId;
  @override
  final int? unreadCount;
  @override
  final int ordering;
  @override
  final String? link;
  @override
  final bool pinned;
  @override
  final int updateErrorCount;
  @override
  final String? lastUpdateError;
  @override
  final BuiltList<NextcloudNewsArticle> items;

  factory _$NextcloudNewsFeed([void Function(NextcloudNewsFeedBuilder)? updates]) =>
      (NextcloudNewsFeedBuilder()..update(updates))._build();

  _$NextcloudNewsFeed._(
      {required this.id,
      required this.url,
      required this.title,
      this.faviconLink,
      required this.added,
      this.folderId,
      this.unreadCount,
      required this.ordering,
      this.link,
      required this.pinned,
      required this.updateErrorCount,
      this.lastUpdateError,
      required this.items})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsFeed', 'id');
    BuiltValueNullFieldError.checkNotNull(url, r'NextcloudNewsFeed', 'url');
    BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNewsFeed', 'title');
    BuiltValueNullFieldError.checkNotNull(added, r'NextcloudNewsFeed', 'added');
    BuiltValueNullFieldError.checkNotNull(ordering, r'NextcloudNewsFeed', 'ordering');
    BuiltValueNullFieldError.checkNotNull(pinned, r'NextcloudNewsFeed', 'pinned');
    BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'NextcloudNewsFeed', 'updateErrorCount');
    BuiltValueNullFieldError.checkNotNull(items, r'NextcloudNewsFeed', 'items');
  }

  @override
  NextcloudNewsFeed rebuild(void Function(NextcloudNewsFeedBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsFeedBuilder toBuilder() => NextcloudNewsFeedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsFeed &&
        id == other.id &&
        url == other.url &&
        title == other.title &&
        faviconLink == other.faviconLink &&
        added == other.added &&
        folderId == other.folderId &&
        unreadCount == other.unreadCount &&
        ordering == other.ordering &&
        link == other.link &&
        pinned == other.pinned &&
        updateErrorCount == other.updateErrorCount &&
        lastUpdateError == other.lastUpdateError &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, faviconLink.hashCode);
    _$hash = $jc(_$hash, added.hashCode);
    _$hash = $jc(_$hash, folderId.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jc(_$hash, ordering.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, pinned.hashCode);
    _$hash = $jc(_$hash, updateErrorCount.hashCode);
    _$hash = $jc(_$hash, lastUpdateError.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsFeed')
          ..add('id', id)
          ..add('url', url)
          ..add('title', title)
          ..add('faviconLink', faviconLink)
          ..add('added', added)
          ..add('folderId', folderId)
          ..add('unreadCount', unreadCount)
          ..add('ordering', ordering)
          ..add('link', link)
          ..add('pinned', pinned)
          ..add('updateErrorCount', updateErrorCount)
          ..add('lastUpdateError', lastUpdateError)
          ..add('items', items))
        .toString();
  }
}

class NextcloudNewsFeedBuilder implements Builder<NextcloudNewsFeed, NextcloudNewsFeedBuilder> {
  _$NextcloudNewsFeed? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _faviconLink;
  String? get faviconLink => _$this._faviconLink;
  set faviconLink(String? faviconLink) => _$this._faviconLink = faviconLink;

  int? _added;
  int? get added => _$this._added;
  set added(int? added) => _$this._added = added;

  int? _folderId;
  int? get folderId => _$this._folderId;
  set folderId(int? folderId) => _$this._folderId = folderId;

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  int? _ordering;
  int? get ordering => _$this._ordering;
  set ordering(int? ordering) => _$this._ordering = ordering;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  bool? _pinned;
  bool? get pinned => _$this._pinned;
  set pinned(bool? pinned) => _$this._pinned = pinned;

  int? _updateErrorCount;
  int? get updateErrorCount => _$this._updateErrorCount;
  set updateErrorCount(int? updateErrorCount) => _$this._updateErrorCount = updateErrorCount;

  String? _lastUpdateError;
  String? get lastUpdateError => _$this._lastUpdateError;
  set lastUpdateError(String? lastUpdateError) => _$this._lastUpdateError = lastUpdateError;

  ListBuilder<NextcloudNewsArticle>? _items;
  ListBuilder<NextcloudNewsArticle> get items => _$this._items ??= ListBuilder<NextcloudNewsArticle>();
  set items(ListBuilder<NextcloudNewsArticle>? items) => _$this._items = items;

  NextcloudNewsFeedBuilder();

  NextcloudNewsFeedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _url = $v.url;
      _title = $v.title;
      _faviconLink = $v.faviconLink;
      _added = $v.added;
      _folderId = $v.folderId;
      _unreadCount = $v.unreadCount;
      _ordering = $v.ordering;
      _link = $v.link;
      _pinned = $v.pinned;
      _updateErrorCount = $v.updateErrorCount;
      _lastUpdateError = $v.lastUpdateError;
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsFeed other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsFeed;
  }

  @override
  void update(void Function(NextcloudNewsFeedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsFeed build() => _build();

  _$NextcloudNewsFeed _build() {
    _$NextcloudNewsFeed _$result;
    try {
      _$result = _$v ??
          _$NextcloudNewsFeed._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsFeed', 'id'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'NextcloudNewsFeed', 'url'),
              title: BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNewsFeed', 'title'),
              faviconLink: faviconLink,
              added: BuiltValueNullFieldError.checkNotNull(added, r'NextcloudNewsFeed', 'added'),
              folderId: folderId,
              unreadCount: unreadCount,
              ordering: BuiltValueNullFieldError.checkNotNull(ordering, r'NextcloudNewsFeed', 'ordering'),
              link: link,
              pinned: BuiltValueNullFieldError.checkNotNull(pinned, r'NextcloudNewsFeed', 'pinned'),
              updateErrorCount:
                  BuiltValueNullFieldError.checkNotNull(updateErrorCount, r'NextcloudNewsFeed', 'updateErrorCount'),
              lastUpdateError: lastUpdateError,
              items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsFeed', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsFolder extends NextcloudNewsFolder {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool opened;
  @override
  final BuiltList<NextcloudNewsFeed> feeds;

  factory _$NextcloudNewsFolder([void Function(NextcloudNewsFolderBuilder)? updates]) =>
      (NextcloudNewsFolderBuilder()..update(updates))._build();

  _$NextcloudNewsFolder._({required this.id, required this.name, required this.opened, required this.feeds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsFolder', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'NextcloudNewsFolder', 'name');
    BuiltValueNullFieldError.checkNotNull(opened, r'NextcloudNewsFolder', 'opened');
    BuiltValueNullFieldError.checkNotNull(feeds, r'NextcloudNewsFolder', 'feeds');
  }

  @override
  NextcloudNewsFolder rebuild(void Function(NextcloudNewsFolderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsFolderBuilder toBuilder() => NextcloudNewsFolderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsFolder &&
        id == other.id &&
        name == other.name &&
        opened == other.opened &&
        feeds == other.feeds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, opened.hashCode);
    _$hash = $jc(_$hash, feeds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsFolder')
          ..add('id', id)
          ..add('name', name)
          ..add('opened', opened)
          ..add('feeds', feeds))
        .toString();
  }
}

class NextcloudNewsFolderBuilder implements Builder<NextcloudNewsFolder, NextcloudNewsFolderBuilder> {
  _$NextcloudNewsFolder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _opened;
  bool? get opened => _$this._opened;
  set opened(bool? opened) => _$this._opened = opened;

  ListBuilder<NextcloudNewsFeed>? _feeds;
  ListBuilder<NextcloudNewsFeed> get feeds => _$this._feeds ??= ListBuilder<NextcloudNewsFeed>();
  set feeds(ListBuilder<NextcloudNewsFeed>? feeds) => _$this._feeds = feeds;

  NextcloudNewsFolderBuilder();

  NextcloudNewsFolderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _opened = $v.opened;
      _feeds = $v.feeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsFolder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsFolder;
  }

  @override
  void update(void Function(NextcloudNewsFolderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsFolder build() => _build();

  _$NextcloudNewsFolder _build() {
    _$NextcloudNewsFolder _$result;
    try {
      _$result = _$v ??
          _$NextcloudNewsFolder._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNewsFolder', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(name, r'NextcloudNewsFolder', 'name'),
              opened: BuiltValueNullFieldError.checkNotNull(opened, r'NextcloudNewsFolder', 'opened'),
              feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsFolder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsListFolders extends NextcloudNewsListFolders {
  @override
  final BuiltList<NextcloudNewsFolder> folders;

  factory _$NextcloudNewsListFolders([void Function(NextcloudNewsListFoldersBuilder)? updates]) =>
      (NextcloudNewsListFoldersBuilder()..update(updates))._build();

  _$NextcloudNewsListFolders._({required this.folders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(folders, r'NextcloudNewsListFolders', 'folders');
  }

  @override
  NextcloudNewsListFolders rebuild(void Function(NextcloudNewsListFoldersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsListFoldersBuilder toBuilder() => NextcloudNewsListFoldersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsListFolders && folders == other.folders;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, folders.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsListFolders')..add('folders', folders)).toString();
  }
}

class NextcloudNewsListFoldersBuilder implements Builder<NextcloudNewsListFolders, NextcloudNewsListFoldersBuilder> {
  _$NextcloudNewsListFolders? _$v;

  ListBuilder<NextcloudNewsFolder>? _folders;
  ListBuilder<NextcloudNewsFolder> get folders => _$this._folders ??= ListBuilder<NextcloudNewsFolder>();
  set folders(ListBuilder<NextcloudNewsFolder>? folders) => _$this._folders = folders;

  NextcloudNewsListFoldersBuilder();

  NextcloudNewsListFoldersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _folders = $v.folders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsListFolders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsListFolders;
  }

  @override
  void update(void Function(NextcloudNewsListFoldersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsListFolders build() => _build();

  _$NextcloudNewsListFolders _build() {
    _$NextcloudNewsListFolders _$result;
    try {
      _$result = _$v ?? _$NextcloudNewsListFolders._(folders: folders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'folders';
        folders.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsListFolders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsListFeeds extends NextcloudNewsListFeeds {
  @override
  final int? starredCount;
  @override
  final int? newestItemId;
  @override
  final BuiltList<NextcloudNewsFeed> feeds;

  factory _$NextcloudNewsListFeeds([void Function(NextcloudNewsListFeedsBuilder)? updates]) =>
      (NextcloudNewsListFeedsBuilder()..update(updates))._build();

  _$NextcloudNewsListFeeds._({this.starredCount, this.newestItemId, required this.feeds}) : super._() {
    BuiltValueNullFieldError.checkNotNull(feeds, r'NextcloudNewsListFeeds', 'feeds');
  }

  @override
  NextcloudNewsListFeeds rebuild(void Function(NextcloudNewsListFeedsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsListFeedsBuilder toBuilder() => NextcloudNewsListFeedsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsListFeeds &&
        starredCount == other.starredCount &&
        newestItemId == other.newestItemId &&
        feeds == other.feeds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, starredCount.hashCode);
    _$hash = $jc(_$hash, newestItemId.hashCode);
    _$hash = $jc(_$hash, feeds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsListFeeds')
          ..add('starredCount', starredCount)
          ..add('newestItemId', newestItemId)
          ..add('feeds', feeds))
        .toString();
  }
}

class NextcloudNewsListFeedsBuilder implements Builder<NextcloudNewsListFeeds, NextcloudNewsListFeedsBuilder> {
  _$NextcloudNewsListFeeds? _$v;

  int? _starredCount;
  int? get starredCount => _$this._starredCount;
  set starredCount(int? starredCount) => _$this._starredCount = starredCount;

  int? _newestItemId;
  int? get newestItemId => _$this._newestItemId;
  set newestItemId(int? newestItemId) => _$this._newestItemId = newestItemId;

  ListBuilder<NextcloudNewsFeed>? _feeds;
  ListBuilder<NextcloudNewsFeed> get feeds => _$this._feeds ??= ListBuilder<NextcloudNewsFeed>();
  set feeds(ListBuilder<NextcloudNewsFeed>? feeds) => _$this._feeds = feeds;

  NextcloudNewsListFeedsBuilder();

  NextcloudNewsListFeedsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _starredCount = $v.starredCount;
      _newestItemId = $v.newestItemId;
      _feeds = $v.feeds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsListFeeds other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsListFeeds;
  }

  @override
  void update(void Function(NextcloudNewsListFeedsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsListFeeds build() => _build();

  _$NextcloudNewsListFeeds _build() {
    _$NextcloudNewsListFeeds _$result;
    try {
      _$result = _$v ??
          _$NextcloudNewsListFeeds._(starredCount: starredCount, newestItemId: newestItemId, feeds: feeds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'feeds';
        feeds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsListFeeds', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNewsListArticles extends NextcloudNewsListArticles {
  @override
  final BuiltList<NextcloudNewsArticle> items;

  factory _$NextcloudNewsListArticles([void Function(NextcloudNewsListArticlesBuilder)? updates]) =>
      (NextcloudNewsListArticlesBuilder()..update(updates))._build();

  _$NextcloudNewsListArticles._({required this.items}) : super._() {
    BuiltValueNullFieldError.checkNotNull(items, r'NextcloudNewsListArticles', 'items');
  }

  @override
  NextcloudNewsListArticles rebuild(void Function(NextcloudNewsListArticlesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNewsListArticlesBuilder toBuilder() => NextcloudNewsListArticlesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNewsListArticles && items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNewsListArticles')..add('items', items)).toString();
  }
}

class NextcloudNewsListArticlesBuilder implements Builder<NextcloudNewsListArticles, NextcloudNewsListArticlesBuilder> {
  _$NextcloudNewsListArticles? _$v;

  ListBuilder<NextcloudNewsArticle>? _items;
  ListBuilder<NextcloudNewsArticle> get items => _$this._items ??= ListBuilder<NextcloudNewsArticle>();
  set items(ListBuilder<NextcloudNewsArticle>? items) => _$this._items = items;

  NextcloudNewsListArticlesBuilder();

  NextcloudNewsListArticlesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNewsListArticles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNewsListArticles;
  }

  @override
  void update(void Function(NextcloudNewsListArticlesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNewsListArticles build() => _build();

  _$NextcloudNewsListArticles _build() {
    _$NextcloudNewsListArticles _$result;
    try {
      _$result = _$v ?? _$NextcloudNewsListArticles._(items: items.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNewsListArticles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotesNote extends NextcloudNotesNote {
  @override
  final int id;
  @override
  final String etag;
  @override
  final bool readonly;
  @override
  final String content;
  @override
  final String title;
  @override
  final String category;
  @override
  final bool favorite;
  @override
  final int modified;
  @override
  final bool error;
  @override
  final String errorType;

  factory _$NextcloudNotesNote([void Function(NextcloudNotesNoteBuilder)? updates]) =>
      (NextcloudNotesNoteBuilder()..update(updates))._build();

  _$NextcloudNotesNote._(
      {required this.id,
      required this.etag,
      required this.readonly,
      required this.content,
      required this.title,
      required this.category,
      required this.favorite,
      required this.modified,
      required this.error,
      required this.errorType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNotesNote', 'id');
    BuiltValueNullFieldError.checkNotNull(etag, r'NextcloudNotesNote', 'etag');
    BuiltValueNullFieldError.checkNotNull(readonly, r'NextcloudNotesNote', 'readonly');
    BuiltValueNullFieldError.checkNotNull(content, r'NextcloudNotesNote', 'content');
    BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNotesNote', 'title');
    BuiltValueNullFieldError.checkNotNull(category, r'NextcloudNotesNote', 'category');
    BuiltValueNullFieldError.checkNotNull(favorite, r'NextcloudNotesNote', 'favorite');
    BuiltValueNullFieldError.checkNotNull(modified, r'NextcloudNotesNote', 'modified');
    BuiltValueNullFieldError.checkNotNull(error, r'NextcloudNotesNote', 'error');
    BuiltValueNullFieldError.checkNotNull(errorType, r'NextcloudNotesNote', 'errorType');
  }

  @override
  NextcloudNotesNote rebuild(void Function(NextcloudNotesNoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotesNoteBuilder toBuilder() => NextcloudNotesNoteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotesNote &&
        id == other.id &&
        etag == other.etag &&
        readonly == other.readonly &&
        content == other.content &&
        title == other.title &&
        category == other.category &&
        favorite == other.favorite &&
        modified == other.modified &&
        error == other.error &&
        errorType == other.errorType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, etag.hashCode);
    _$hash = $jc(_$hash, readonly.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, favorite.hashCode);
    _$hash = $jc(_$hash, modified.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, errorType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotesNote')
          ..add('id', id)
          ..add('etag', etag)
          ..add('readonly', readonly)
          ..add('content', content)
          ..add('title', title)
          ..add('category', category)
          ..add('favorite', favorite)
          ..add('modified', modified)
          ..add('error', error)
          ..add('errorType', errorType))
        .toString();
  }
}

class NextcloudNotesNoteBuilder implements Builder<NextcloudNotesNote, NextcloudNotesNoteBuilder> {
  _$NextcloudNotesNote? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _etag;
  String? get etag => _$this._etag;
  set etag(String? etag) => _$this._etag = etag;

  bool? _readonly;
  bool? get readonly => _$this._readonly;
  set readonly(bool? readonly) => _$this._readonly = readonly;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  int? _modified;
  int? get modified => _$this._modified;
  set modified(int? modified) => _$this._modified = modified;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _errorType;
  String? get errorType => _$this._errorType;
  set errorType(String? errorType) => _$this._errorType = errorType;

  NextcloudNotesNoteBuilder();

  NextcloudNotesNoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _etag = $v.etag;
      _readonly = $v.readonly;
      _content = $v.content;
      _title = $v.title;
      _category = $v.category;
      _favorite = $v.favorite;
      _modified = $v.modified;
      _error = $v.error;
      _errorType = $v.errorType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotesNote other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotesNote;
  }

  @override
  void update(void Function(NextcloudNotesNoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotesNote build() => _build();

  _$NextcloudNotesNote _build() {
    final _$result = _$v ??
        _$NextcloudNotesNote._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudNotesNote', 'id'),
            etag: BuiltValueNullFieldError.checkNotNull(etag, r'NextcloudNotesNote', 'etag'),
            readonly: BuiltValueNullFieldError.checkNotNull(readonly, r'NextcloudNotesNote', 'readonly'),
            content: BuiltValueNullFieldError.checkNotNull(content, r'NextcloudNotesNote', 'content'),
            title: BuiltValueNullFieldError.checkNotNull(title, r'NextcloudNotesNote', 'title'),
            category: BuiltValueNullFieldError.checkNotNull(category, r'NextcloudNotesNote', 'category'),
            favorite: BuiltValueNullFieldError.checkNotNull(favorite, r'NextcloudNotesNote', 'favorite'),
            modified: BuiltValueNullFieldError.checkNotNull(modified, r'NextcloudNotesNote', 'modified'),
            error: BuiltValueNullFieldError.checkNotNull(error, r'NextcloudNotesNote', 'error'),
            errorType: BuiltValueNullFieldError.checkNotNull(errorType, r'NextcloudNotesNote', 'errorType'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotesSettings extends NextcloudNotesSettings {
  @override
  final String notesPath;
  @override
  final String fileSuffix;
  @override
  final NextcloudNotesSettings_NoteMode noteMode;

  factory _$NextcloudNotesSettings([void Function(NextcloudNotesSettingsBuilder)? updates]) =>
      (NextcloudNotesSettingsBuilder()..update(updates))._build();

  _$NextcloudNotesSettings._({required this.notesPath, required this.fileSuffix, required this.noteMode}) : super._() {
    BuiltValueNullFieldError.checkNotNull(notesPath, r'NextcloudNotesSettings', 'notesPath');
    BuiltValueNullFieldError.checkNotNull(fileSuffix, r'NextcloudNotesSettings', 'fileSuffix');
    BuiltValueNullFieldError.checkNotNull(noteMode, r'NextcloudNotesSettings', 'noteMode');
  }

  @override
  NextcloudNotesSettings rebuild(void Function(NextcloudNotesSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotesSettingsBuilder toBuilder() => NextcloudNotesSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotesSettings &&
        notesPath == other.notesPath &&
        fileSuffix == other.fileSuffix &&
        noteMode == other.noteMode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notesPath.hashCode);
    _$hash = $jc(_$hash, fileSuffix.hashCode);
    _$hash = $jc(_$hash, noteMode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotesSettings')
          ..add('notesPath', notesPath)
          ..add('fileSuffix', fileSuffix)
          ..add('noteMode', noteMode))
        .toString();
  }
}

class NextcloudNotesSettingsBuilder implements Builder<NextcloudNotesSettings, NextcloudNotesSettingsBuilder> {
  _$NextcloudNotesSettings? _$v;

  String? _notesPath;
  String? get notesPath => _$this._notesPath;
  set notesPath(String? notesPath) => _$this._notesPath = notesPath;

  String? _fileSuffix;
  String? get fileSuffix => _$this._fileSuffix;
  set fileSuffix(String? fileSuffix) => _$this._fileSuffix = fileSuffix;

  NextcloudNotesSettings_NoteMode? _noteMode;
  NextcloudNotesSettings_NoteMode? get noteMode => _$this._noteMode;
  set noteMode(NextcloudNotesSettings_NoteMode? noteMode) => _$this._noteMode = noteMode;

  NextcloudNotesSettingsBuilder();

  NextcloudNotesSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notesPath = $v.notesPath;
      _fileSuffix = $v.fileSuffix;
      _noteMode = $v.noteMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotesSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotesSettings;
  }

  @override
  void update(void Function(NextcloudNotesSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotesSettings build() => _build();

  _$NextcloudNotesSettings _build() {
    final _$result = _$v ??
        _$NextcloudNotesSettings._(
            notesPath: BuiltValueNullFieldError.checkNotNull(notesPath, r'NextcloudNotesSettings', 'notesPath'),
            fileSuffix: BuiltValueNullFieldError.checkNotNull(fileSuffix, r'NextcloudNotesSettings', 'fileSuffix'),
            noteMode: BuiltValueNullFieldError.checkNotNull(noteMode, r'NextcloudNotesSettings', 'noteMode'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsNotificationAction extends NextcloudNotificationsNotificationAction {
  @override
  final String label;
  @override
  final String link;
  @override
  final String type;
  @override
  final bool? primary;

  factory _$NextcloudNotificationsNotificationAction(
          [void Function(NextcloudNotificationsNotificationActionBuilder)? updates]) =>
      (NextcloudNotificationsNotificationActionBuilder()..update(updates))._build();

  _$NextcloudNotificationsNotificationAction._(
      {required this.label, required this.link, required this.type, this.primary})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(label, r'NextcloudNotificationsNotificationAction', 'label');
    BuiltValueNullFieldError.checkNotNull(link, r'NextcloudNotificationsNotificationAction', 'link');
    BuiltValueNullFieldError.checkNotNull(type, r'NextcloudNotificationsNotificationAction', 'type');
  }

  @override
  NextcloudNotificationsNotificationAction rebuild(
          void Function(NextcloudNotificationsNotificationActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsNotificationActionBuilder toBuilder() =>
      NextcloudNotificationsNotificationActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsNotificationAction &&
        label == other.label &&
        link == other.link &&
        type == other.type &&
        primary == other.primary;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, primary.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsNotificationAction')
          ..add('label', label)
          ..add('link', link)
          ..add('type', type)
          ..add('primary', primary))
        .toString();
  }
}

class NextcloudNotificationsNotificationActionBuilder
    implements Builder<NextcloudNotificationsNotificationAction, NextcloudNotificationsNotificationActionBuilder> {
  _$NextcloudNotificationsNotificationAction? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _primary;
  bool? get primary => _$this._primary;
  set primary(bool? primary) => _$this._primary = primary;

  NextcloudNotificationsNotificationActionBuilder();

  NextcloudNotificationsNotificationActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _link = $v.link;
      _type = $v.type;
      _primary = $v.primary;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsNotificationAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsNotificationAction;
  }

  @override
  void update(void Function(NextcloudNotificationsNotificationActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsNotificationAction build() => _build();

  _$NextcloudNotificationsNotificationAction _build() {
    final _$result = _$v ??
        _$NextcloudNotificationsNotificationAction._(
            label: BuiltValueNullFieldError.checkNotNull(label, r'NextcloudNotificationsNotificationAction', 'label'),
            link: BuiltValueNullFieldError.checkNotNull(link, r'NextcloudNotificationsNotificationAction', 'link'),
            type: BuiltValueNullFieldError.checkNotNull(type, r'NextcloudNotificationsNotificationAction', 'type'),
            primary: primary);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsNotification extends NextcloudNotificationsNotification {
  @override
  final int notificationId;
  @override
  final String app;
  @override
  final String user;
  @override
  final String datetime;
  @override
  final String objectType;
  @override
  final String objectId;
  @override
  final String subject;
  @override
  final String message;
  @override
  final String link;
  @override
  final String subjectRich;
  @override
  final JsonObject subjectRichParameters;
  @override
  final String messageRich;
  @override
  final JsonObject messageRichParameters;
  @override
  final String icon;
  @override
  final BuiltList<NextcloudNotificationsNotificationAction> actions;

  factory _$NextcloudNotificationsNotification([void Function(NextcloudNotificationsNotificationBuilder)? updates]) =>
      (NextcloudNotificationsNotificationBuilder()..update(updates))._build();

  _$NextcloudNotificationsNotification._(
      {required this.notificationId,
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
      required this.actions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(notificationId, r'NextcloudNotificationsNotification', 'notificationId');
    BuiltValueNullFieldError.checkNotNull(app, r'NextcloudNotificationsNotification', 'app');
    BuiltValueNullFieldError.checkNotNull(user, r'NextcloudNotificationsNotification', 'user');
    BuiltValueNullFieldError.checkNotNull(datetime, r'NextcloudNotificationsNotification', 'datetime');
    BuiltValueNullFieldError.checkNotNull(objectType, r'NextcloudNotificationsNotification', 'objectType');
    BuiltValueNullFieldError.checkNotNull(objectId, r'NextcloudNotificationsNotification', 'objectId');
    BuiltValueNullFieldError.checkNotNull(subject, r'NextcloudNotificationsNotification', 'subject');
    BuiltValueNullFieldError.checkNotNull(message, r'NextcloudNotificationsNotification', 'message');
    BuiltValueNullFieldError.checkNotNull(link, r'NextcloudNotificationsNotification', 'link');
    BuiltValueNullFieldError.checkNotNull(subjectRich, r'NextcloudNotificationsNotification', 'subjectRich');
    BuiltValueNullFieldError.checkNotNull(
        subjectRichParameters, r'NextcloudNotificationsNotification', 'subjectRichParameters');
    BuiltValueNullFieldError.checkNotNull(messageRich, r'NextcloudNotificationsNotification', 'messageRich');
    BuiltValueNullFieldError.checkNotNull(
        messageRichParameters, r'NextcloudNotificationsNotification', 'messageRichParameters');
    BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudNotificationsNotification', 'icon');
    BuiltValueNullFieldError.checkNotNull(actions, r'NextcloudNotificationsNotification', 'actions');
  }

  @override
  NextcloudNotificationsNotification rebuild(void Function(NextcloudNotificationsNotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsNotificationBuilder toBuilder() => NextcloudNotificationsNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsNotification &&
        notificationId == other.notificationId &&
        app == other.app &&
        user == other.user &&
        datetime == other.datetime &&
        objectType == other.objectType &&
        objectId == other.objectId &&
        subject == other.subject &&
        message == other.message &&
        link == other.link &&
        subjectRich == other.subjectRich &&
        subjectRichParameters == other.subjectRichParameters &&
        messageRich == other.messageRich &&
        messageRichParameters == other.messageRichParameters &&
        icon == other.icon &&
        actions == other.actions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, notificationId.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, objectType.hashCode);
    _$hash = $jc(_$hash, objectId.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, subjectRich.hashCode);
    _$hash = $jc(_$hash, subjectRichParameters.hashCode);
    _$hash = $jc(_$hash, messageRich.hashCode);
    _$hash = $jc(_$hash, messageRichParameters.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, actions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsNotification')
          ..add('notificationId', notificationId)
          ..add('app', app)
          ..add('user', user)
          ..add('datetime', datetime)
          ..add('objectType', objectType)
          ..add('objectId', objectId)
          ..add('subject', subject)
          ..add('message', message)
          ..add('link', link)
          ..add('subjectRich', subjectRich)
          ..add('subjectRichParameters', subjectRichParameters)
          ..add('messageRich', messageRich)
          ..add('messageRichParameters', messageRichParameters)
          ..add('icon', icon)
          ..add('actions', actions))
        .toString();
  }
}

class NextcloudNotificationsNotificationBuilder
    implements Builder<NextcloudNotificationsNotification, NextcloudNotificationsNotificationBuilder> {
  _$NextcloudNotificationsNotification? _$v;

  int? _notificationId;
  int? get notificationId => _$this._notificationId;
  set notificationId(int? notificationId) => _$this._notificationId = notificationId;

  String? _app;
  String? get app => _$this._app;
  set app(String? app) => _$this._app = app;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _datetime;
  String? get datetime => _$this._datetime;
  set datetime(String? datetime) => _$this._datetime = datetime;

  String? _objectType;
  String? get objectType => _$this._objectType;
  set objectType(String? objectType) => _$this._objectType = objectType;

  String? _objectId;
  String? get objectId => _$this._objectId;
  set objectId(String? objectId) => _$this._objectId = objectId;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _subjectRich;
  String? get subjectRich => _$this._subjectRich;
  set subjectRich(String? subjectRich) => _$this._subjectRich = subjectRich;

  JsonObject? _subjectRichParameters;
  JsonObject? get subjectRichParameters => _$this._subjectRichParameters;
  set subjectRichParameters(JsonObject? subjectRichParameters) => _$this._subjectRichParameters = subjectRichParameters;

  String? _messageRich;
  String? get messageRich => _$this._messageRich;
  set messageRich(String? messageRich) => _$this._messageRich = messageRich;

  JsonObject? _messageRichParameters;
  JsonObject? get messageRichParameters => _$this._messageRichParameters;
  set messageRichParameters(JsonObject? messageRichParameters) => _$this._messageRichParameters = messageRichParameters;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<NextcloudNotificationsNotificationAction>? _actions;
  ListBuilder<NextcloudNotificationsNotificationAction> get actions =>
      _$this._actions ??= ListBuilder<NextcloudNotificationsNotificationAction>();
  set actions(ListBuilder<NextcloudNotificationsNotificationAction>? actions) => _$this._actions = actions;

  NextcloudNotificationsNotificationBuilder();

  NextcloudNotificationsNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationId = $v.notificationId;
      _app = $v.app;
      _user = $v.user;
      _datetime = $v.datetime;
      _objectType = $v.objectType;
      _objectId = $v.objectId;
      _subject = $v.subject;
      _message = $v.message;
      _link = $v.link;
      _subjectRich = $v.subjectRich;
      _subjectRichParameters = $v.subjectRichParameters;
      _messageRich = $v.messageRich;
      _messageRichParameters = $v.messageRichParameters;
      _icon = $v.icon;
      _actions = $v.actions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsNotification;
  }

  @override
  void update(void Function(NextcloudNotificationsNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsNotification build() => _build();

  _$NextcloudNotificationsNotification _build() {
    _$NextcloudNotificationsNotification _$result;
    try {
      _$result = _$v ??
          _$NextcloudNotificationsNotification._(
              notificationId: BuiltValueNullFieldError.checkNotNull(
                  notificationId, r'NextcloudNotificationsNotification', 'notificationId'),
              app: BuiltValueNullFieldError.checkNotNull(app, r'NextcloudNotificationsNotification', 'app'),
              user: BuiltValueNullFieldError.checkNotNull(user, r'NextcloudNotificationsNotification', 'user'),
              datetime:
                  BuiltValueNullFieldError.checkNotNull(datetime, r'NextcloudNotificationsNotification', 'datetime'),
              objectType: BuiltValueNullFieldError.checkNotNull(
                  objectType, r'NextcloudNotificationsNotification', 'objectType'),
              objectId:
                  BuiltValueNullFieldError.checkNotNull(objectId, r'NextcloudNotificationsNotification', 'objectId'),
              subject: BuiltValueNullFieldError.checkNotNull(subject, r'NextcloudNotificationsNotification', 'subject'),
              message: BuiltValueNullFieldError.checkNotNull(message, r'NextcloudNotificationsNotification', 'message'),
              link: BuiltValueNullFieldError.checkNotNull(link, r'NextcloudNotificationsNotification', 'link'),
              subjectRich: BuiltValueNullFieldError.checkNotNull(
                  subjectRich, r'NextcloudNotificationsNotification', 'subjectRich'),
              subjectRichParameters: BuiltValueNullFieldError.checkNotNull(
                  subjectRichParameters, r'NextcloudNotificationsNotification', 'subjectRichParameters'),
              messageRich: BuiltValueNullFieldError.checkNotNull(
                  messageRich, r'NextcloudNotificationsNotification', 'messageRich'),
              messageRichParameters: BuiltValueNullFieldError.checkNotNull(
                  messageRichParameters, r'NextcloudNotificationsNotification', 'messageRichParameters'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudNotificationsNotification', 'icon'),
              actions: actions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actions';
        actions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsNotification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsListNotifications_Ocs extends NextcloudNotificationsListNotifications_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<NextcloudNotificationsNotification> data;

  factory _$NextcloudNotificationsListNotifications_Ocs(
          [void Function(NextcloudNotificationsListNotifications_OcsBuilder)? updates]) =>
      (NextcloudNotificationsListNotifications_OcsBuilder()..update(updates))._build();

  _$NextcloudNotificationsListNotifications_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudNotificationsListNotifications_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudNotificationsListNotifications_Ocs', 'data');
  }

  @override
  NextcloudNotificationsListNotifications_Ocs rebuild(
          void Function(NextcloudNotificationsListNotifications_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsListNotifications_OcsBuilder toBuilder() =>
      NextcloudNotificationsListNotifications_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsListNotifications_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsListNotifications_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudNotificationsListNotifications_OcsBuilder
    implements
        Builder<NextcloudNotificationsListNotifications_Ocs, NextcloudNotificationsListNotifications_OcsBuilder> {
  _$NextcloudNotificationsListNotifications_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NextcloudNotificationsNotification>? _data;
  ListBuilder<NextcloudNotificationsNotification> get data =>
      _$this._data ??= ListBuilder<NextcloudNotificationsNotification>();
  set data(ListBuilder<NextcloudNotificationsNotification>? data) => _$this._data = data;

  NextcloudNotificationsListNotifications_OcsBuilder();

  NextcloudNotificationsListNotifications_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsListNotifications_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsListNotifications_Ocs;
  }

  @override
  void update(void Function(NextcloudNotificationsListNotifications_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsListNotifications_Ocs build() => _build();

  _$NextcloudNotificationsListNotifications_Ocs _build() {
    _$NextcloudNotificationsListNotifications_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsListNotifications_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsListNotifications_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsListNotifications extends NextcloudNotificationsListNotifications {
  @override
  final NextcloudNotificationsListNotifications_Ocs ocs;

  factory _$NextcloudNotificationsListNotifications(
          [void Function(NextcloudNotificationsListNotificationsBuilder)? updates]) =>
      (NextcloudNotificationsListNotificationsBuilder()..update(updates))._build();

  _$NextcloudNotificationsListNotifications._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudNotificationsListNotifications', 'ocs');
  }

  @override
  NextcloudNotificationsListNotifications rebuild(
          void Function(NextcloudNotificationsListNotificationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsListNotificationsBuilder toBuilder() =>
      NextcloudNotificationsListNotificationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsListNotifications && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsListNotifications')..add('ocs', ocs)).toString();
  }
}

class NextcloudNotificationsListNotificationsBuilder
    implements Builder<NextcloudNotificationsListNotifications, NextcloudNotificationsListNotificationsBuilder> {
  _$NextcloudNotificationsListNotifications? _$v;

  NextcloudNotificationsListNotifications_OcsBuilder? _ocs;
  NextcloudNotificationsListNotifications_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudNotificationsListNotifications_OcsBuilder();
  set ocs(NextcloudNotificationsListNotifications_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudNotificationsListNotificationsBuilder();

  NextcloudNotificationsListNotificationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsListNotifications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsListNotifications;
  }

  @override
  void update(void Function(NextcloudNotificationsListNotificationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsListNotifications build() => _build();

  _$NextcloudNotificationsListNotifications _build() {
    _$NextcloudNotificationsListNotifications _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsListNotifications._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsListNotifications', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsGetNotification_Ocs extends NextcloudNotificationsGetNotification_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudNotificationsNotification data;

  factory _$NextcloudNotificationsGetNotification_Ocs(
          [void Function(NextcloudNotificationsGetNotification_OcsBuilder)? updates]) =>
      (NextcloudNotificationsGetNotification_OcsBuilder()..update(updates))._build();

  _$NextcloudNotificationsGetNotification_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudNotificationsGetNotification_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudNotificationsGetNotification_Ocs', 'data');
  }

  @override
  NextcloudNotificationsGetNotification_Ocs rebuild(
          void Function(NextcloudNotificationsGetNotification_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsGetNotification_OcsBuilder toBuilder() =>
      NextcloudNotificationsGetNotification_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsGetNotification_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsGetNotification_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudNotificationsGetNotification_OcsBuilder
    implements Builder<NextcloudNotificationsGetNotification_Ocs, NextcloudNotificationsGetNotification_OcsBuilder> {
  _$NextcloudNotificationsGetNotification_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudNotificationsNotificationBuilder? _data;
  NextcloudNotificationsNotificationBuilder get data => _$this._data ??= NextcloudNotificationsNotificationBuilder();
  set data(NextcloudNotificationsNotificationBuilder? data) => _$this._data = data;

  NextcloudNotificationsGetNotification_OcsBuilder();

  NextcloudNotificationsGetNotification_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsGetNotification_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsGetNotification_Ocs;
  }

  @override
  void update(void Function(NextcloudNotificationsGetNotification_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsGetNotification_Ocs build() => _build();

  _$NextcloudNotificationsGetNotification_Ocs _build() {
    _$NextcloudNotificationsGetNotification_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsGetNotification_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsGetNotification_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsGetNotification extends NextcloudNotificationsGetNotification {
  @override
  final NextcloudNotificationsGetNotification_Ocs ocs;

  factory _$NextcloudNotificationsGetNotification(
          [void Function(NextcloudNotificationsGetNotificationBuilder)? updates]) =>
      (NextcloudNotificationsGetNotificationBuilder()..update(updates))._build();

  _$NextcloudNotificationsGetNotification._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudNotificationsGetNotification', 'ocs');
  }

  @override
  NextcloudNotificationsGetNotification rebuild(void Function(NextcloudNotificationsGetNotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsGetNotificationBuilder toBuilder() =>
      NextcloudNotificationsGetNotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsGetNotification && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsGetNotification')..add('ocs', ocs)).toString();
  }
}

class NextcloudNotificationsGetNotificationBuilder
    implements Builder<NextcloudNotificationsGetNotification, NextcloudNotificationsGetNotificationBuilder> {
  _$NextcloudNotificationsGetNotification? _$v;

  NextcloudNotificationsGetNotification_OcsBuilder? _ocs;
  NextcloudNotificationsGetNotification_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudNotificationsGetNotification_OcsBuilder();
  set ocs(NextcloudNotificationsGetNotification_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudNotificationsGetNotificationBuilder();

  NextcloudNotificationsGetNotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsGetNotification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsGetNotification;
  }

  @override
  void update(void Function(NextcloudNotificationsGetNotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsGetNotification build() => _build();

  _$NextcloudNotificationsGetNotification _build() {
    _$NextcloudNotificationsGetNotification _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsGetNotification._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsGetNotification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudEmptyOCS_Ocs extends NextcloudEmptyOCS_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<JsonObject> data;

  factory _$NextcloudEmptyOCS_Ocs([void Function(NextcloudEmptyOCS_OcsBuilder)? updates]) =>
      (NextcloudEmptyOCS_OcsBuilder()..update(updates))._build();

  _$NextcloudEmptyOCS_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudEmptyOCS_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudEmptyOCS_Ocs', 'data');
  }

  @override
  NextcloudEmptyOCS_Ocs rebuild(void Function(NextcloudEmptyOCS_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudEmptyOCS_OcsBuilder toBuilder() => NextcloudEmptyOCS_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudEmptyOCS_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudEmptyOCS_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudEmptyOCS_OcsBuilder implements Builder<NextcloudEmptyOCS_Ocs, NextcloudEmptyOCS_OcsBuilder> {
  _$NextcloudEmptyOCS_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<JsonObject>? _data;
  ListBuilder<JsonObject> get data => _$this._data ??= ListBuilder<JsonObject>();
  set data(ListBuilder<JsonObject>? data) => _$this._data = data;

  NextcloudEmptyOCS_OcsBuilder();

  NextcloudEmptyOCS_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudEmptyOCS_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudEmptyOCS_Ocs;
  }

  @override
  void update(void Function(NextcloudEmptyOCS_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudEmptyOCS_Ocs build() => _build();

  _$NextcloudEmptyOCS_Ocs _build() {
    _$NextcloudEmptyOCS_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudEmptyOCS_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudEmptyOCS_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudEmptyOCS extends NextcloudEmptyOCS {
  @override
  final NextcloudEmptyOCS_Ocs ocs;

  factory _$NextcloudEmptyOCS([void Function(NextcloudEmptyOCSBuilder)? updates]) =>
      (NextcloudEmptyOCSBuilder()..update(updates))._build();

  _$NextcloudEmptyOCS._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudEmptyOCS', 'ocs');
  }

  @override
  NextcloudEmptyOCS rebuild(void Function(NextcloudEmptyOCSBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NextcloudEmptyOCSBuilder toBuilder() => NextcloudEmptyOCSBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudEmptyOCS && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudEmptyOCS')..add('ocs', ocs)).toString();
  }
}

class NextcloudEmptyOCSBuilder implements Builder<NextcloudEmptyOCS, NextcloudEmptyOCSBuilder> {
  _$NextcloudEmptyOCS? _$v;

  NextcloudEmptyOCS_OcsBuilder? _ocs;
  NextcloudEmptyOCS_OcsBuilder get ocs => _$this._ocs ??= NextcloudEmptyOCS_OcsBuilder();
  set ocs(NextcloudEmptyOCS_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudEmptyOCSBuilder();

  NextcloudEmptyOCSBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudEmptyOCS other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudEmptyOCS;
  }

  @override
  void update(void Function(NextcloudEmptyOCSBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudEmptyOCS build() => _build();

  _$NextcloudEmptyOCS _build() {
    _$NextcloudEmptyOCS _$result;
    try {
      _$result = _$v ?? _$NextcloudEmptyOCS._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudEmptyOCS', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsPushServerSubscription extends NextcloudNotificationsPushServerSubscription {
  @override
  final String publicKey;
  @override
  final String deviceIdentifier;
  @override
  final String signature;
  @override
  final String? message;

  factory _$NextcloudNotificationsPushServerSubscription(
          [void Function(NextcloudNotificationsPushServerSubscriptionBuilder)? updates]) =>
      (NextcloudNotificationsPushServerSubscriptionBuilder()..update(updates))._build();

  _$NextcloudNotificationsPushServerSubscription._(
      {required this.publicKey, required this.deviceIdentifier, required this.signature, this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(publicKey, r'NextcloudNotificationsPushServerSubscription', 'publicKey');
    BuiltValueNullFieldError.checkNotNull(
        deviceIdentifier, r'NextcloudNotificationsPushServerSubscription', 'deviceIdentifier');
    BuiltValueNullFieldError.checkNotNull(signature, r'NextcloudNotificationsPushServerSubscription', 'signature');
  }

  @override
  NextcloudNotificationsPushServerSubscription rebuild(
          void Function(NextcloudNotificationsPushServerSubscriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsPushServerSubscriptionBuilder toBuilder() =>
      NextcloudNotificationsPushServerSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsPushServerSubscription &&
        publicKey == other.publicKey &&
        deviceIdentifier == other.deviceIdentifier &&
        signature == other.signature &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jc(_$hash, deviceIdentifier.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsPushServerSubscription')
          ..add('publicKey', publicKey)
          ..add('deviceIdentifier', deviceIdentifier)
          ..add('signature', signature)
          ..add('message', message))
        .toString();
  }
}

class NextcloudNotificationsPushServerSubscriptionBuilder
    implements
        Builder<NextcloudNotificationsPushServerSubscription, NextcloudNotificationsPushServerSubscriptionBuilder> {
  _$NextcloudNotificationsPushServerSubscription? _$v;

  String? _publicKey;
  String? get publicKey => _$this._publicKey;
  set publicKey(String? publicKey) => _$this._publicKey = publicKey;

  String? _deviceIdentifier;
  String? get deviceIdentifier => _$this._deviceIdentifier;
  set deviceIdentifier(String? deviceIdentifier) => _$this._deviceIdentifier = deviceIdentifier;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  NextcloudNotificationsPushServerSubscriptionBuilder();

  NextcloudNotificationsPushServerSubscriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _publicKey = $v.publicKey;
      _deviceIdentifier = $v.deviceIdentifier;
      _signature = $v.signature;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsPushServerSubscription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsPushServerSubscription;
  }

  @override
  void update(void Function(NextcloudNotificationsPushServerSubscriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsPushServerSubscription build() => _build();

  _$NextcloudNotificationsPushServerSubscription _build() {
    final _$result = _$v ??
        _$NextcloudNotificationsPushServerSubscription._(
            publicKey: BuiltValueNullFieldError.checkNotNull(
                publicKey, r'NextcloudNotificationsPushServerSubscription', 'publicKey'),
            deviceIdentifier: BuiltValueNullFieldError.checkNotNull(
                deviceIdentifier, r'NextcloudNotificationsPushServerSubscription', 'deviceIdentifier'),
            signature: BuiltValueNullFieldError.checkNotNull(
                signature, r'NextcloudNotificationsPushServerSubscription', 'signature'),
            message: message);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsPushServerRegistration_Ocs extends NextcloudNotificationsPushServerRegistration_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudNotificationsPushServerSubscription data;

  factory _$NextcloudNotificationsPushServerRegistration_Ocs(
          [void Function(NextcloudNotificationsPushServerRegistration_OcsBuilder)? updates]) =>
      (NextcloudNotificationsPushServerRegistration_OcsBuilder()..update(updates))._build();

  _$NextcloudNotificationsPushServerRegistration_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudNotificationsPushServerRegistration_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudNotificationsPushServerRegistration_Ocs', 'data');
  }

  @override
  NextcloudNotificationsPushServerRegistration_Ocs rebuild(
          void Function(NextcloudNotificationsPushServerRegistration_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsPushServerRegistration_OcsBuilder toBuilder() =>
      NextcloudNotificationsPushServerRegistration_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsPushServerRegistration_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsPushServerRegistration_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudNotificationsPushServerRegistration_OcsBuilder
    implements
        Builder<NextcloudNotificationsPushServerRegistration_Ocs,
            NextcloudNotificationsPushServerRegistration_OcsBuilder> {
  _$NextcloudNotificationsPushServerRegistration_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudNotificationsPushServerSubscriptionBuilder? _data;
  NextcloudNotificationsPushServerSubscriptionBuilder get data =>
      _$this._data ??= NextcloudNotificationsPushServerSubscriptionBuilder();
  set data(NextcloudNotificationsPushServerSubscriptionBuilder? data) => _$this._data = data;

  NextcloudNotificationsPushServerRegistration_OcsBuilder();

  NextcloudNotificationsPushServerRegistration_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsPushServerRegistration_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsPushServerRegistration_Ocs;
  }

  @override
  void update(void Function(NextcloudNotificationsPushServerRegistration_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsPushServerRegistration_Ocs build() => _build();

  _$NextcloudNotificationsPushServerRegistration_Ocs _build() {
    _$NextcloudNotificationsPushServerRegistration_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsPushServerRegistration_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudNotificationsPushServerRegistration_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsPushServerRegistration extends NextcloudNotificationsPushServerRegistration {
  @override
  final NextcloudNotificationsPushServerRegistration_Ocs ocs;

  factory _$NextcloudNotificationsPushServerRegistration(
          [void Function(NextcloudNotificationsPushServerRegistrationBuilder)? updates]) =>
      (NextcloudNotificationsPushServerRegistrationBuilder()..update(updates))._build();

  _$NextcloudNotificationsPushServerRegistration._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudNotificationsPushServerRegistration', 'ocs');
  }

  @override
  NextcloudNotificationsPushServerRegistration rebuild(
          void Function(NextcloudNotificationsPushServerRegistrationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsPushServerRegistrationBuilder toBuilder() =>
      NextcloudNotificationsPushServerRegistrationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsPushServerRegistration && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsPushServerRegistration')..add('ocs', ocs)).toString();
  }
}

class NextcloudNotificationsPushServerRegistrationBuilder
    implements
        Builder<NextcloudNotificationsPushServerRegistration, NextcloudNotificationsPushServerRegistrationBuilder> {
  _$NextcloudNotificationsPushServerRegistration? _$v;

  NextcloudNotificationsPushServerRegistration_OcsBuilder? _ocs;
  NextcloudNotificationsPushServerRegistration_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudNotificationsPushServerRegistration_OcsBuilder();
  set ocs(NextcloudNotificationsPushServerRegistration_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudNotificationsPushServerRegistrationBuilder();

  NextcloudNotificationsPushServerRegistrationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsPushServerRegistration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsPushServerRegistration;
  }

  @override
  void update(void Function(NextcloudNotificationsPushServerRegistrationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsPushServerRegistration build() => _build();

  _$NextcloudNotificationsPushServerRegistration _build() {
    _$NextcloudNotificationsPushServerRegistration _$result;
    try {
      _$result = _$v ?? _$NextcloudNotificationsPushServerRegistration._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudNotificationsPushServerRegistration', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudProvisioningApiUserDetails_Quota extends NextcloudProvisioningApiUserDetails_Quota {
  @override
  final int free;
  @override
  final int used;
  @override
  final int total;
  @override
  final num relative;
  @override
  final int quota;

  factory _$NextcloudProvisioningApiUserDetails_Quota(
          [void Function(NextcloudProvisioningApiUserDetails_QuotaBuilder)? updates]) =>
      (NextcloudProvisioningApiUserDetails_QuotaBuilder()..update(updates))._build();

  _$NextcloudProvisioningApiUserDetails_Quota._(
      {required this.free, required this.used, required this.total, required this.relative, required this.quota})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(free, r'NextcloudProvisioningApiUserDetails_Quota', 'free');
    BuiltValueNullFieldError.checkNotNull(used, r'NextcloudProvisioningApiUserDetails_Quota', 'used');
    BuiltValueNullFieldError.checkNotNull(total, r'NextcloudProvisioningApiUserDetails_Quota', 'total');
    BuiltValueNullFieldError.checkNotNull(relative, r'NextcloudProvisioningApiUserDetails_Quota', 'relative');
    BuiltValueNullFieldError.checkNotNull(quota, r'NextcloudProvisioningApiUserDetails_Quota', 'quota');
  }

  @override
  NextcloudProvisioningApiUserDetails_Quota rebuild(
          void Function(NextcloudProvisioningApiUserDetails_QuotaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudProvisioningApiUserDetails_QuotaBuilder toBuilder() =>
      NextcloudProvisioningApiUserDetails_QuotaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudProvisioningApiUserDetails_Quota &&
        free == other.free &&
        used == other.used &&
        total == other.total &&
        relative == other.relative &&
        quota == other.quota;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, free.hashCode);
    _$hash = $jc(_$hash, used.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, relative.hashCode);
    _$hash = $jc(_$hash, quota.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudProvisioningApiUserDetails_Quota')
          ..add('free', free)
          ..add('used', used)
          ..add('total', total)
          ..add('relative', relative)
          ..add('quota', quota))
        .toString();
  }
}

class NextcloudProvisioningApiUserDetails_QuotaBuilder
    implements Builder<NextcloudProvisioningApiUserDetails_Quota, NextcloudProvisioningApiUserDetails_QuotaBuilder> {
  _$NextcloudProvisioningApiUserDetails_Quota? _$v;

  int? _free;
  int? get free => _$this._free;
  set free(int? free) => _$this._free = free;

  int? _used;
  int? get used => _$this._used;
  set used(int? used) => _$this._used = used;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  num? _relative;
  num? get relative => _$this._relative;
  set relative(num? relative) => _$this._relative = relative;

  int? _quota;
  int? get quota => _$this._quota;
  set quota(int? quota) => _$this._quota = quota;

  NextcloudProvisioningApiUserDetails_QuotaBuilder();

  NextcloudProvisioningApiUserDetails_QuotaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _free = $v.free;
      _used = $v.used;
      _total = $v.total;
      _relative = $v.relative;
      _quota = $v.quota;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudProvisioningApiUserDetails_Quota other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudProvisioningApiUserDetails_Quota;
  }

  @override
  void update(void Function(NextcloudProvisioningApiUserDetails_QuotaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudProvisioningApiUserDetails_Quota build() => _build();

  _$NextcloudProvisioningApiUserDetails_Quota _build() {
    final _$result = _$v ??
        _$NextcloudProvisioningApiUserDetails_Quota._(
            free: BuiltValueNullFieldError.checkNotNull(free, r'NextcloudProvisioningApiUserDetails_Quota', 'free'),
            used: BuiltValueNullFieldError.checkNotNull(used, r'NextcloudProvisioningApiUserDetails_Quota', 'used'),
            total: BuiltValueNullFieldError.checkNotNull(total, r'NextcloudProvisioningApiUserDetails_Quota', 'total'),
            relative: BuiltValueNullFieldError.checkNotNull(
                relative, r'NextcloudProvisioningApiUserDetails_Quota', 'relative'),
            quota: BuiltValueNullFieldError.checkNotNull(quota, r'NextcloudProvisioningApiUserDetails_Quota', 'quota'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudProvisioningApiUserDetails_BackendCapabilities
    extends NextcloudProvisioningApiUserDetails_BackendCapabilities {
  @override
  final bool setDisplayName;
  @override
  final bool setPassword;

  factory _$NextcloudProvisioningApiUserDetails_BackendCapabilities(
          [void Function(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder)? updates]) =>
      (NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder()..update(updates))._build();

  _$NextcloudProvisioningApiUserDetails_BackendCapabilities._({required this.setDisplayName, required this.setPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        setDisplayName, r'NextcloudProvisioningApiUserDetails_BackendCapabilities', 'setDisplayName');
    BuiltValueNullFieldError.checkNotNull(
        setPassword, r'NextcloudProvisioningApiUserDetails_BackendCapabilities', 'setPassword');
  }

  @override
  NextcloudProvisioningApiUserDetails_BackendCapabilities rebuild(
          void Function(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder toBuilder() =>
      NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudProvisioningApiUserDetails_BackendCapabilities &&
        setDisplayName == other.setDisplayName &&
        setPassword == other.setPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, setDisplayName.hashCode);
    _$hash = $jc(_$hash, setPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudProvisioningApiUserDetails_BackendCapabilities')
          ..add('setDisplayName', setDisplayName)
          ..add('setPassword', setPassword))
        .toString();
  }
}

class NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder
    implements
        Builder<NextcloudProvisioningApiUserDetails_BackendCapabilities,
            NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder> {
  _$NextcloudProvisioningApiUserDetails_BackendCapabilities? _$v;

  bool? _setDisplayName;
  bool? get setDisplayName => _$this._setDisplayName;
  set setDisplayName(bool? setDisplayName) => _$this._setDisplayName = setDisplayName;

  bool? _setPassword;
  bool? get setPassword => _$this._setPassword;
  set setPassword(bool? setPassword) => _$this._setPassword = setPassword;

  NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder();

  NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _setDisplayName = $v.setDisplayName;
      _setPassword = $v.setPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudProvisioningApiUserDetails_BackendCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudProvisioningApiUserDetails_BackendCapabilities;
  }

  @override
  void update(void Function(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudProvisioningApiUserDetails_BackendCapabilities build() => _build();

  _$NextcloudProvisioningApiUserDetails_BackendCapabilities _build() {
    final _$result = _$v ??
        _$NextcloudProvisioningApiUserDetails_BackendCapabilities._(
            setDisplayName: BuiltValueNullFieldError.checkNotNull(
                setDisplayName, r'NextcloudProvisioningApiUserDetails_BackendCapabilities', 'setDisplayName'),
            setPassword: BuiltValueNullFieldError.checkNotNull(
                setPassword, r'NextcloudProvisioningApiUserDetails_BackendCapabilities', 'setPassword'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudProvisioningApiUserDetails extends NextcloudProvisioningApiUserDetails {
  @override
  final bool? enabled;
  @override
  final String? storageLocation;
  @override
  final String id;
  @override
  final int lastLogin;
  @override
  final String backend;
  @override
  final BuiltList<String> subadmin;
  @override
  final NextcloudProvisioningApiUserDetails_Quota quota;
  @override
  final String avatarScope;
  @override
  final String? email;
  @override
  final String emailScope;
  @override
  final BuiltList<String> additionalMail;
  @override
  final BuiltList<String> additionalMailScope;
  @override
  final String? displayname;
  @override
  final String displaynameScope;
  @override
  final String phone;
  @override
  final String phoneScope;
  @override
  final String address;
  @override
  final String addressScope;
  @override
  final String website;
  @override
  final String websiteScope;
  @override
  final String twitter;
  @override
  final String twitterScope;
  @override
  final String organisation;
  @override
  final String organisationScope;
  @override
  final String role;
  @override
  final String roleScope;
  @override
  final String headline;
  @override
  final String headlineScope;
  @override
  final String biography;
  @override
  final String biographyScope;
  @override
  final String profileEnabled;
  @override
  final String profileEnabledScope;
  @override
  final String fediverse;
  @override
  final String fediverseScope;
  @override
  final BuiltList<String> groups;
  @override
  final String language;
  @override
  final String locale;
  @override
  final String? notifyEmail;
  @override
  final NextcloudProvisioningApiUserDetails_BackendCapabilities backendCapabilities;
  @override
  final String? displayName;

  factory _$NextcloudProvisioningApiUserDetails([void Function(NextcloudProvisioningApiUserDetailsBuilder)? updates]) =>
      (NextcloudProvisioningApiUserDetailsBuilder()..update(updates))._build();

  _$NextcloudProvisioningApiUserDetails._(
      {this.enabled,
      this.storageLocation,
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
      required this.fediverse,
      required this.fediverseScope,
      required this.groups,
      required this.language,
      required this.locale,
      this.notifyEmail,
      required this.backendCapabilities,
      this.displayName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudProvisioningApiUserDetails', 'id');
    BuiltValueNullFieldError.checkNotNull(lastLogin, r'NextcloudProvisioningApiUserDetails', 'lastLogin');
    BuiltValueNullFieldError.checkNotNull(backend, r'NextcloudProvisioningApiUserDetails', 'backend');
    BuiltValueNullFieldError.checkNotNull(subadmin, r'NextcloudProvisioningApiUserDetails', 'subadmin');
    BuiltValueNullFieldError.checkNotNull(quota, r'NextcloudProvisioningApiUserDetails', 'quota');
    BuiltValueNullFieldError.checkNotNull(avatarScope, r'NextcloudProvisioningApiUserDetails', 'avatarScope');
    BuiltValueNullFieldError.checkNotNull(emailScope, r'NextcloudProvisioningApiUserDetails', 'emailScope');
    BuiltValueNullFieldError.checkNotNull(additionalMail, r'NextcloudProvisioningApiUserDetails', 'additionalMail');
    BuiltValueNullFieldError.checkNotNull(
        additionalMailScope, r'NextcloudProvisioningApiUserDetails', 'additionalMailScope');
    BuiltValueNullFieldError.checkNotNull(displaynameScope, r'NextcloudProvisioningApiUserDetails', 'displaynameScope');
    BuiltValueNullFieldError.checkNotNull(phone, r'NextcloudProvisioningApiUserDetails', 'phone');
    BuiltValueNullFieldError.checkNotNull(phoneScope, r'NextcloudProvisioningApiUserDetails', 'phoneScope');
    BuiltValueNullFieldError.checkNotNull(address, r'NextcloudProvisioningApiUserDetails', 'address');
    BuiltValueNullFieldError.checkNotNull(addressScope, r'NextcloudProvisioningApiUserDetails', 'addressScope');
    BuiltValueNullFieldError.checkNotNull(website, r'NextcloudProvisioningApiUserDetails', 'website');
    BuiltValueNullFieldError.checkNotNull(websiteScope, r'NextcloudProvisioningApiUserDetails', 'websiteScope');
    BuiltValueNullFieldError.checkNotNull(twitter, r'NextcloudProvisioningApiUserDetails', 'twitter');
    BuiltValueNullFieldError.checkNotNull(twitterScope, r'NextcloudProvisioningApiUserDetails', 'twitterScope');
    BuiltValueNullFieldError.checkNotNull(organisation, r'NextcloudProvisioningApiUserDetails', 'organisation');
    BuiltValueNullFieldError.checkNotNull(
        organisationScope, r'NextcloudProvisioningApiUserDetails', 'organisationScope');
    BuiltValueNullFieldError.checkNotNull(role, r'NextcloudProvisioningApiUserDetails', 'role');
    BuiltValueNullFieldError.checkNotNull(roleScope, r'NextcloudProvisioningApiUserDetails', 'roleScope');
    BuiltValueNullFieldError.checkNotNull(headline, r'NextcloudProvisioningApiUserDetails', 'headline');
    BuiltValueNullFieldError.checkNotNull(headlineScope, r'NextcloudProvisioningApiUserDetails', 'headlineScope');
    BuiltValueNullFieldError.checkNotNull(biography, r'NextcloudProvisioningApiUserDetails', 'biography');
    BuiltValueNullFieldError.checkNotNull(biographyScope, r'NextcloudProvisioningApiUserDetails', 'biographyScope');
    BuiltValueNullFieldError.checkNotNull(profileEnabled, r'NextcloudProvisioningApiUserDetails', 'profileEnabled');
    BuiltValueNullFieldError.checkNotNull(
        profileEnabledScope, r'NextcloudProvisioningApiUserDetails', 'profileEnabledScope');
    BuiltValueNullFieldError.checkNotNull(fediverse, r'NextcloudProvisioningApiUserDetails', 'fediverse');
    BuiltValueNullFieldError.checkNotNull(fediverseScope, r'NextcloudProvisioningApiUserDetails', 'fediverseScope');
    BuiltValueNullFieldError.checkNotNull(groups, r'NextcloudProvisioningApiUserDetails', 'groups');
    BuiltValueNullFieldError.checkNotNull(language, r'NextcloudProvisioningApiUserDetails', 'language');
    BuiltValueNullFieldError.checkNotNull(locale, r'NextcloudProvisioningApiUserDetails', 'locale');
    BuiltValueNullFieldError.checkNotNull(
        backendCapabilities, r'NextcloudProvisioningApiUserDetails', 'backendCapabilities');
  }

  @override
  NextcloudProvisioningApiUserDetails rebuild(void Function(NextcloudProvisioningApiUserDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudProvisioningApiUserDetailsBuilder toBuilder() => NextcloudProvisioningApiUserDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudProvisioningApiUserDetails &&
        enabled == other.enabled &&
        storageLocation == other.storageLocation &&
        id == other.id &&
        lastLogin == other.lastLogin &&
        backend == other.backend &&
        subadmin == other.subadmin &&
        quota == other.quota &&
        avatarScope == other.avatarScope &&
        email == other.email &&
        emailScope == other.emailScope &&
        additionalMail == other.additionalMail &&
        additionalMailScope == other.additionalMailScope &&
        displayname == other.displayname &&
        displaynameScope == other.displaynameScope &&
        phone == other.phone &&
        phoneScope == other.phoneScope &&
        address == other.address &&
        addressScope == other.addressScope &&
        website == other.website &&
        websiteScope == other.websiteScope &&
        twitter == other.twitter &&
        twitterScope == other.twitterScope &&
        organisation == other.organisation &&
        organisationScope == other.organisationScope &&
        role == other.role &&
        roleScope == other.roleScope &&
        headline == other.headline &&
        headlineScope == other.headlineScope &&
        biography == other.biography &&
        biographyScope == other.biographyScope &&
        profileEnabled == other.profileEnabled &&
        profileEnabledScope == other.profileEnabledScope &&
        fediverse == other.fediverse &&
        fediverseScope == other.fediverseScope &&
        groups == other.groups &&
        language == other.language &&
        locale == other.locale &&
        notifyEmail == other.notifyEmail &&
        backendCapabilities == other.backendCapabilities &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enabled.hashCode);
    _$hash = $jc(_$hash, storageLocation.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, lastLogin.hashCode);
    _$hash = $jc(_$hash, backend.hashCode);
    _$hash = $jc(_$hash, subadmin.hashCode);
    _$hash = $jc(_$hash, quota.hashCode);
    _$hash = $jc(_$hash, avatarScope.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, emailScope.hashCode);
    _$hash = $jc(_$hash, additionalMail.hashCode);
    _$hash = $jc(_$hash, additionalMailScope.hashCode);
    _$hash = $jc(_$hash, displayname.hashCode);
    _$hash = $jc(_$hash, displaynameScope.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, phoneScope.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, addressScope.hashCode);
    _$hash = $jc(_$hash, website.hashCode);
    _$hash = $jc(_$hash, websiteScope.hashCode);
    _$hash = $jc(_$hash, twitter.hashCode);
    _$hash = $jc(_$hash, twitterScope.hashCode);
    _$hash = $jc(_$hash, organisation.hashCode);
    _$hash = $jc(_$hash, organisationScope.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, roleScope.hashCode);
    _$hash = $jc(_$hash, headline.hashCode);
    _$hash = $jc(_$hash, headlineScope.hashCode);
    _$hash = $jc(_$hash, biography.hashCode);
    _$hash = $jc(_$hash, biographyScope.hashCode);
    _$hash = $jc(_$hash, profileEnabled.hashCode);
    _$hash = $jc(_$hash, profileEnabledScope.hashCode);
    _$hash = $jc(_$hash, fediverse.hashCode);
    _$hash = $jc(_$hash, fediverseScope.hashCode);
    _$hash = $jc(_$hash, groups.hashCode);
    _$hash = $jc(_$hash, language.hashCode);
    _$hash = $jc(_$hash, locale.hashCode);
    _$hash = $jc(_$hash, notifyEmail.hashCode);
    _$hash = $jc(_$hash, backendCapabilities.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudProvisioningApiUserDetails')
          ..add('enabled', enabled)
          ..add('storageLocation', storageLocation)
          ..add('id', id)
          ..add('lastLogin', lastLogin)
          ..add('backend', backend)
          ..add('subadmin', subadmin)
          ..add('quota', quota)
          ..add('avatarScope', avatarScope)
          ..add('email', email)
          ..add('emailScope', emailScope)
          ..add('additionalMail', additionalMail)
          ..add('additionalMailScope', additionalMailScope)
          ..add('displayname', displayname)
          ..add('displaynameScope', displaynameScope)
          ..add('phone', phone)
          ..add('phoneScope', phoneScope)
          ..add('address', address)
          ..add('addressScope', addressScope)
          ..add('website', website)
          ..add('websiteScope', websiteScope)
          ..add('twitter', twitter)
          ..add('twitterScope', twitterScope)
          ..add('organisation', organisation)
          ..add('organisationScope', organisationScope)
          ..add('role', role)
          ..add('roleScope', roleScope)
          ..add('headline', headline)
          ..add('headlineScope', headlineScope)
          ..add('biography', biography)
          ..add('biographyScope', biographyScope)
          ..add('profileEnabled', profileEnabled)
          ..add('profileEnabledScope', profileEnabledScope)
          ..add('fediverse', fediverse)
          ..add('fediverseScope', fediverseScope)
          ..add('groups', groups)
          ..add('language', language)
          ..add('locale', locale)
          ..add('notifyEmail', notifyEmail)
          ..add('backendCapabilities', backendCapabilities)
          ..add('displayName', displayName))
        .toString();
  }
}

class NextcloudProvisioningApiUserDetailsBuilder
    implements Builder<NextcloudProvisioningApiUserDetails, NextcloudProvisioningApiUserDetailsBuilder> {
  _$NextcloudProvisioningApiUserDetails? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  String? _storageLocation;
  String? get storageLocation => _$this._storageLocation;
  set storageLocation(String? storageLocation) => _$this._storageLocation = storageLocation;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _lastLogin;
  int? get lastLogin => _$this._lastLogin;
  set lastLogin(int? lastLogin) => _$this._lastLogin = lastLogin;

  String? _backend;
  String? get backend => _$this._backend;
  set backend(String? backend) => _$this._backend = backend;

  ListBuilder<String>? _subadmin;
  ListBuilder<String> get subadmin => _$this._subadmin ??= ListBuilder<String>();
  set subadmin(ListBuilder<String>? subadmin) => _$this._subadmin = subadmin;

  NextcloudProvisioningApiUserDetails_QuotaBuilder? _quota;
  NextcloudProvisioningApiUserDetails_QuotaBuilder get quota =>
      _$this._quota ??= NextcloudProvisioningApiUserDetails_QuotaBuilder();
  set quota(NextcloudProvisioningApiUserDetails_QuotaBuilder? quota) => _$this._quota = quota;

  String? _avatarScope;
  String? get avatarScope => _$this._avatarScope;
  set avatarScope(String? avatarScope) => _$this._avatarScope = avatarScope;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _emailScope;
  String? get emailScope => _$this._emailScope;
  set emailScope(String? emailScope) => _$this._emailScope = emailScope;

  ListBuilder<String>? _additionalMail;
  ListBuilder<String> get additionalMail => _$this._additionalMail ??= ListBuilder<String>();
  set additionalMail(ListBuilder<String>? additionalMail) => _$this._additionalMail = additionalMail;

  ListBuilder<String>? _additionalMailScope;
  ListBuilder<String> get additionalMailScope => _$this._additionalMailScope ??= ListBuilder<String>();
  set additionalMailScope(ListBuilder<String>? additionalMailScope) =>
      _$this._additionalMailScope = additionalMailScope;

  String? _displayname;
  String? get displayname => _$this._displayname;
  set displayname(String? displayname) => _$this._displayname = displayname;

  String? _displaynameScope;
  String? get displaynameScope => _$this._displaynameScope;
  set displaynameScope(String? displaynameScope) => _$this._displaynameScope = displaynameScope;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _phoneScope;
  String? get phoneScope => _$this._phoneScope;
  set phoneScope(String? phoneScope) => _$this._phoneScope = phoneScope;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _addressScope;
  String? get addressScope => _$this._addressScope;
  set addressScope(String? addressScope) => _$this._addressScope = addressScope;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _websiteScope;
  String? get websiteScope => _$this._websiteScope;
  set websiteScope(String? websiteScope) => _$this._websiteScope = websiteScope;

  String? _twitter;
  String? get twitter => _$this._twitter;
  set twitter(String? twitter) => _$this._twitter = twitter;

  String? _twitterScope;
  String? get twitterScope => _$this._twitterScope;
  set twitterScope(String? twitterScope) => _$this._twitterScope = twitterScope;

  String? _organisation;
  String? get organisation => _$this._organisation;
  set organisation(String? organisation) => _$this._organisation = organisation;

  String? _organisationScope;
  String? get organisationScope => _$this._organisationScope;
  set organisationScope(String? organisationScope) => _$this._organisationScope = organisationScope;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _roleScope;
  String? get roleScope => _$this._roleScope;
  set roleScope(String? roleScope) => _$this._roleScope = roleScope;

  String? _headline;
  String? get headline => _$this._headline;
  set headline(String? headline) => _$this._headline = headline;

  String? _headlineScope;
  String? get headlineScope => _$this._headlineScope;
  set headlineScope(String? headlineScope) => _$this._headlineScope = headlineScope;

  String? _biography;
  String? get biography => _$this._biography;
  set biography(String? biography) => _$this._biography = biography;

  String? _biographyScope;
  String? get biographyScope => _$this._biographyScope;
  set biographyScope(String? biographyScope) => _$this._biographyScope = biographyScope;

  String? _profileEnabled;
  String? get profileEnabled => _$this._profileEnabled;
  set profileEnabled(String? profileEnabled) => _$this._profileEnabled = profileEnabled;

  String? _profileEnabledScope;
  String? get profileEnabledScope => _$this._profileEnabledScope;
  set profileEnabledScope(String? profileEnabledScope) => _$this._profileEnabledScope = profileEnabledScope;

  String? _fediverse;
  String? get fediverse => _$this._fediverse;
  set fediverse(String? fediverse) => _$this._fediverse = fediverse;

  String? _fediverseScope;
  String? get fediverseScope => _$this._fediverseScope;
  set fediverseScope(String? fediverseScope) => _$this._fediverseScope = fediverseScope;

  ListBuilder<String>? _groups;
  ListBuilder<String> get groups => _$this._groups ??= ListBuilder<String>();
  set groups(ListBuilder<String>? groups) => _$this._groups = groups;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  String? _notifyEmail;
  String? get notifyEmail => _$this._notifyEmail;
  set notifyEmail(String? notifyEmail) => _$this._notifyEmail = notifyEmail;

  NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder? _backendCapabilities;
  NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder get backendCapabilities =>
      _$this._backendCapabilities ??= NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder();
  set backendCapabilities(NextcloudProvisioningApiUserDetails_BackendCapabilitiesBuilder? backendCapabilities) =>
      _$this._backendCapabilities = backendCapabilities;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  NextcloudProvisioningApiUserDetailsBuilder();

  NextcloudProvisioningApiUserDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _storageLocation = $v.storageLocation;
      _id = $v.id;
      _lastLogin = $v.lastLogin;
      _backend = $v.backend;
      _subadmin = $v.subadmin.toBuilder();
      _quota = $v.quota.toBuilder();
      _avatarScope = $v.avatarScope;
      _email = $v.email;
      _emailScope = $v.emailScope;
      _additionalMail = $v.additionalMail.toBuilder();
      _additionalMailScope = $v.additionalMailScope.toBuilder();
      _displayname = $v.displayname;
      _displaynameScope = $v.displaynameScope;
      _phone = $v.phone;
      _phoneScope = $v.phoneScope;
      _address = $v.address;
      _addressScope = $v.addressScope;
      _website = $v.website;
      _websiteScope = $v.websiteScope;
      _twitter = $v.twitter;
      _twitterScope = $v.twitterScope;
      _organisation = $v.organisation;
      _organisationScope = $v.organisationScope;
      _role = $v.role;
      _roleScope = $v.roleScope;
      _headline = $v.headline;
      _headlineScope = $v.headlineScope;
      _biography = $v.biography;
      _biographyScope = $v.biographyScope;
      _profileEnabled = $v.profileEnabled;
      _profileEnabledScope = $v.profileEnabledScope;
      _fediverse = $v.fediverse;
      _fediverseScope = $v.fediverseScope;
      _groups = $v.groups.toBuilder();
      _language = $v.language;
      _locale = $v.locale;
      _notifyEmail = $v.notifyEmail;
      _backendCapabilities = $v.backendCapabilities.toBuilder();
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudProvisioningApiUserDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudProvisioningApiUserDetails;
  }

  @override
  void update(void Function(NextcloudProvisioningApiUserDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudProvisioningApiUserDetails build() => _build();

  _$NextcloudProvisioningApiUserDetails _build() {
    _$NextcloudProvisioningApiUserDetails _$result;
    try {
      _$result = _$v ??
          _$NextcloudProvisioningApiUserDetails._(
              enabled: enabled,
              storageLocation: storageLocation,
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudProvisioningApiUserDetails', 'id'),
              lastLogin:
                  BuiltValueNullFieldError.checkNotNull(lastLogin, r'NextcloudProvisioningApiUserDetails', 'lastLogin'),
              backend:
                  BuiltValueNullFieldError.checkNotNull(backend, r'NextcloudProvisioningApiUserDetails', 'backend'),
              subadmin: subadmin.build(),
              quota: quota.build(),
              avatarScope: BuiltValueNullFieldError.checkNotNull(
                  avatarScope, r'NextcloudProvisioningApiUserDetails', 'avatarScope'),
              email: email,
              emailScope: BuiltValueNullFieldError.checkNotNull(
                  emailScope, r'NextcloudProvisioningApiUserDetails', 'emailScope'),
              additionalMail: additionalMail.build(),
              additionalMailScope: additionalMailScope.build(),
              displayname: displayname,
              displaynameScope: BuiltValueNullFieldError.checkNotNull(
                  displaynameScope, r'NextcloudProvisioningApiUserDetails', 'displaynameScope'),
              phone: BuiltValueNullFieldError.checkNotNull(phone, r'NextcloudProvisioningApiUserDetails', 'phone'),
              phoneScope: BuiltValueNullFieldError.checkNotNull(
                  phoneScope, r'NextcloudProvisioningApiUserDetails', 'phoneScope'),
              address:
                  BuiltValueNullFieldError.checkNotNull(address, r'NextcloudProvisioningApiUserDetails', 'address'),
              addressScope: BuiltValueNullFieldError.checkNotNull(
                  addressScope, r'NextcloudProvisioningApiUserDetails', 'addressScope'),
              website:
                  BuiltValueNullFieldError.checkNotNull(website, r'NextcloudProvisioningApiUserDetails', 'website'),
              websiteScope: BuiltValueNullFieldError.checkNotNull(
                  websiteScope, r'NextcloudProvisioningApiUserDetails', 'websiteScope'),
              twitter:
                  BuiltValueNullFieldError.checkNotNull(twitter, r'NextcloudProvisioningApiUserDetails', 'twitter'),
              twitterScope: BuiltValueNullFieldError.checkNotNull(
                  twitterScope, r'NextcloudProvisioningApiUserDetails', 'twitterScope'),
              organisation: BuiltValueNullFieldError.checkNotNull(
                  organisation, r'NextcloudProvisioningApiUserDetails', 'organisation'),
              organisationScope: BuiltValueNullFieldError.checkNotNull(
                  organisationScope, r'NextcloudProvisioningApiUserDetails', 'organisationScope'),
              role: BuiltValueNullFieldError.checkNotNull(role, r'NextcloudProvisioningApiUserDetails', 'role'),
              roleScope: BuiltValueNullFieldError.checkNotNull(roleScope, r'NextcloudProvisioningApiUserDetails', 'roleScope'),
              headline: BuiltValueNullFieldError.checkNotNull(headline, r'NextcloudProvisioningApiUserDetails', 'headline'),
              headlineScope: BuiltValueNullFieldError.checkNotNull(headlineScope, r'NextcloudProvisioningApiUserDetails', 'headlineScope'),
              biography: BuiltValueNullFieldError.checkNotNull(biography, r'NextcloudProvisioningApiUserDetails', 'biography'),
              biographyScope: BuiltValueNullFieldError.checkNotNull(biographyScope, r'NextcloudProvisioningApiUserDetails', 'biographyScope'),
              profileEnabled: BuiltValueNullFieldError.checkNotNull(profileEnabled, r'NextcloudProvisioningApiUserDetails', 'profileEnabled'),
              profileEnabledScope: BuiltValueNullFieldError.checkNotNull(profileEnabledScope, r'NextcloudProvisioningApiUserDetails', 'profileEnabledScope'),
              fediverse: BuiltValueNullFieldError.checkNotNull(fediverse, r'NextcloudProvisioningApiUserDetails', 'fediverse'),
              fediverseScope: BuiltValueNullFieldError.checkNotNull(fediverseScope, r'NextcloudProvisioningApiUserDetails', 'fediverseScope'),
              groups: groups.build(),
              language: BuiltValueNullFieldError.checkNotNull(language, r'NextcloudProvisioningApiUserDetails', 'language'),
              locale: BuiltValueNullFieldError.checkNotNull(locale, r'NextcloudProvisioningApiUserDetails', 'locale'),
              notifyEmail: notifyEmail,
              backendCapabilities: backendCapabilities.build(),
              displayName: displayName);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subadmin';
        subadmin.build();
        _$failedField = 'quota';
        quota.build();

        _$failedField = 'additionalMail';
        additionalMail.build();
        _$failedField = 'additionalMailScope';
        additionalMailScope.build();

        _$failedField = 'groups';
        groups.build();

        _$failedField = 'backendCapabilities';
        backendCapabilities.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudProvisioningApiUserDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudProvisioningApiUser_Ocs extends NextcloudProvisioningApiUser_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudProvisioningApiUserDetails data;

  factory _$NextcloudProvisioningApiUser_Ocs([void Function(NextcloudProvisioningApiUser_OcsBuilder)? updates]) =>
      (NextcloudProvisioningApiUser_OcsBuilder()..update(updates))._build();

  _$NextcloudProvisioningApiUser_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudProvisioningApiUser_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudProvisioningApiUser_Ocs', 'data');
  }

  @override
  NextcloudProvisioningApiUser_Ocs rebuild(void Function(NextcloudProvisioningApiUser_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudProvisioningApiUser_OcsBuilder toBuilder() => NextcloudProvisioningApiUser_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudProvisioningApiUser_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudProvisioningApiUser_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudProvisioningApiUser_OcsBuilder
    implements Builder<NextcloudProvisioningApiUser_Ocs, NextcloudProvisioningApiUser_OcsBuilder> {
  _$NextcloudProvisioningApiUser_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudProvisioningApiUserDetailsBuilder? _data;
  NextcloudProvisioningApiUserDetailsBuilder get data => _$this._data ??= NextcloudProvisioningApiUserDetailsBuilder();
  set data(NextcloudProvisioningApiUserDetailsBuilder? data) => _$this._data = data;

  NextcloudProvisioningApiUser_OcsBuilder();

  NextcloudProvisioningApiUser_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudProvisioningApiUser_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudProvisioningApiUser_Ocs;
  }

  @override
  void update(void Function(NextcloudProvisioningApiUser_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudProvisioningApiUser_Ocs build() => _build();

  _$NextcloudProvisioningApiUser_Ocs _build() {
    _$NextcloudProvisioningApiUser_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudProvisioningApiUser_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudProvisioningApiUser_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudProvisioningApiUser extends NextcloudProvisioningApiUser {
  @override
  final NextcloudProvisioningApiUser_Ocs ocs;

  factory _$NextcloudProvisioningApiUser([void Function(NextcloudProvisioningApiUserBuilder)? updates]) =>
      (NextcloudProvisioningApiUserBuilder()..update(updates))._build();

  _$NextcloudProvisioningApiUser._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudProvisioningApiUser', 'ocs');
  }

  @override
  NextcloudProvisioningApiUser rebuild(void Function(NextcloudProvisioningApiUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudProvisioningApiUserBuilder toBuilder() => NextcloudProvisioningApiUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudProvisioningApiUser && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudProvisioningApiUser')..add('ocs', ocs)).toString();
  }
}

class NextcloudProvisioningApiUserBuilder
    implements Builder<NextcloudProvisioningApiUser, NextcloudProvisioningApiUserBuilder> {
  _$NextcloudProvisioningApiUser? _$v;

  NextcloudProvisioningApiUser_OcsBuilder? _ocs;
  NextcloudProvisioningApiUser_OcsBuilder get ocs => _$this._ocs ??= NextcloudProvisioningApiUser_OcsBuilder();
  set ocs(NextcloudProvisioningApiUser_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudProvisioningApiUserBuilder();

  NextcloudProvisioningApiUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudProvisioningApiUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudProvisioningApiUser;
  }

  @override
  void update(void Function(NextcloudProvisioningApiUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudProvisioningApiUser build() => _build();

  _$NextcloudProvisioningApiUser _build() {
    _$NextcloudProvisioningApiUser _$result;
    try {
      _$result = _$v ?? _$NextcloudProvisioningApiUser._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudProvisioningApiUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderCheckResponse200ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderCheckResponse200ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderCheckResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderCheckResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderCheckResponse200ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderCheckResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderCheckResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderCheckResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderCheckResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderCheckResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderCheckResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson,
            NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderSetKeepaliveResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson {
  @override
  final bool success;
  @override
  final String deviceId;

  factory _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson._(
      {required this.success, required this.deviceId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(
        deviceId, r'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson', 'deviceId');
  }

  @override
  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson &&
        success == other.success &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson')
          ..add('success', success)
          ..add('deviceId', deviceId))
        .toString();
  }
}

class NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _deviceId = $v.deviceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson', 'success'),
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'NextcloudUnifiedPushProviderCreateDeviceResponse200ApplicationJson', 'deviceId'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson
    extends NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson,
            NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderSyncDeviceResponse401ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderDeleteDeviceResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson {
  @override
  final bool success;
  @override
  final String token;

  factory _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson._({required this.success, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson', 'success');
    BuiltValueNullFieldError.checkNotNull(
        token, r'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson', 'token');
  }

  @override
  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson &&
        success == other.success &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson')
          ..add('success', success)
          ..add('token', token))
        .toString();
  }
}

class NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson', 'success'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'NextcloudUnifiedPushProviderCreateAppResponse200ApplicationJson', 'token'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson,
            NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderDeleteAppResponse200ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush
    extends NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush {
  @override
  final int version;

  factory _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush(
          [void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
              updates]) =>
      (NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..update(updates))
          ._build();

  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._({required this.version})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        version, r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush', 'version');
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush rebuild(
          void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder toBuilder() =>
      NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush &&
        version == other.version;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush')
          ..add('version', version))
        .toString();
  }
}

class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder
    implements
        Builder<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush? _$v;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush;
  }

  @override
  void update(
      void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush build() => _build();

  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush._(
            version: BuiltValueNullFieldError.checkNotNull(version,
                r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush', 'version'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson {
  @override
  final NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_Unifiedpush unifiedpush;

  factory _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)?
              updates]) =>
      (NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson._({required this.unifiedpush})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson', 'unifiedpush');
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson &&
        unifiedpush == other.unifiedpush;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unifiedpush.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson? _$v;

  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? _unifiedpush;
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??=
          NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();
  set unifiedpush(
          NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson;
  }

  @override
  void update(
      void Function(NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson _build() {
    _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson _$result;
    try {
      _$result = _$v ??
          _$NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson._(
              unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudUnifiedPushProviderUnifiedpushDiscoveryResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson
    extends NextcloudUnifiedPushProviderPushResponse201ApplicationJson {
  @override
  final bool success;

  factory _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'NextcloudUnifiedPushProviderPushResponse201ApplicationJson', 'success');
  }

  @override
  NextcloudUnifiedPushProviderPushResponse201ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderPushResponse201ApplicationJson && success == other.success;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderPushResponse201ApplicationJson')
          ..add('success', success))
        .toString();
  }
}

class NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderPushResponse201ApplicationJson,
            NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderPushResponse201ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderPushResponse201ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderPushResponse201ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderPushResponse201ApplicationJson._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NextcloudUnifiedPushProviderPushResponse201ApplicationJson', 'success'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush
    extends NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush {
  @override
  final String gateway;

  factory _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush(
          [void Function(
                  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
              updates]) =>
      (NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()
            ..update(updates))
          ._build();

  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._({required this.gateway})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(gateway,
        r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush', 'gateway');
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush rebuild(
          void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder toBuilder() =>
      NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush &&
        gateway == other.gateway;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gateway.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush')
          ..add('gateway', gateway))
        .toString();
  }
}

class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder
    implements
        Builder<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder> {
  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush? _$v;

  String? _gateway;
  String? get gateway => _$this._gateway;
  set gateway(String? gateway) => _$this._gateway = gateway;

  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();

  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gateway = $v.gateway;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush;
  }

  @override
  void update(
      void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush build() => _build();

  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush _build() {
    final _$result = _$v ??
        _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush._(
            gateway: BuiltValueNullFieldError.checkNotNull(
                gateway,
                r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush',
                'gateway'));
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson {
  @override
  final NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_Unifiedpush unifiedpush;

  factory _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)?
              updates]) =>
      (NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson._({required this.unifiedpush})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        unifiedpush, r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson', 'unifiedpush');
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson &&
        unifiedpush == other.unifiedpush;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, unifiedpush.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson')
          ..add('unifiedpush', unifiedpush))
        .toString();
  }
}

class NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson? _$v;

  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder? _unifiedpush;
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder get unifiedpush =>
      _$this._unifiedpush ??=
          NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder();
  set unifiedpush(
          NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson_UnifiedpushBuilder?
              unifiedpush) =>
      _$this._unifiedpush = unifiedpush;

  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _unifiedpush = $v.unifiedpush.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson;
  }

  @override
  void update(
      void Function(NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson _build() {
    _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson _$result;
    try {
      _$result = _$v ??
          _$NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson._(
              unifiedpush: unifiedpush.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'unifiedpush';
        unifiedpush.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudUnifiedPushProviderGatewayMatrixDiscoveryResponse200ApplicationJson',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson
    extends NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson {
  @override
  final BuiltList<String> rejected;

  factory _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson(
          [void Function(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder)? updates]) =>
      (NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder()..update(updates))._build();

  _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson._({required this.rejected}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        rejected, r'NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson', 'rejected');
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson rebuild(
          void Function(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder toBuilder() =>
      NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson && rejected == other.rejected;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, rejected.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson')
          ..add('rejected', rejected))
        .toString();
  }
}

class NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder
    implements
        Builder<NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson,
            NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder> {
  _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson? _$v;

  ListBuilder<String>? _rejected;
  ListBuilder<String> get rejected => _$this._rejected ??= ListBuilder<String>();
  set rejected(ListBuilder<String>? rejected) => _$this._rejected = rejected;

  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder();

  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rejected = $v.rejected.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson;
  }

  @override
  void update(void Function(NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJsonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson build() => _build();

  _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson _build() {
    _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson _$result;
    try {
      _$result =
          _$v ?? _$NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson._(rejected: rejected.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rejected';
        rejected.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NextcloudUnifiedPushProviderGatewayMatrixResponse200ApplicationJson', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusClearAt_Time extends NextcloudUserStatusClearAt_Time {
  @override
  final JsonObject data;
  @override
  final NextcloudUserStatusClearAt_Time0? userStatusClearAtTime0;
  @override
  final int? $int;

  factory _$NextcloudUserStatusClearAt_Time([void Function(NextcloudUserStatusClearAt_TimeBuilder)? updates]) =>
      (NextcloudUserStatusClearAt_TimeBuilder()..update(updates))._build();

  _$NextcloudUserStatusClearAt_Time._({required this.data, this.userStatusClearAtTime0, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusClearAt_Time', 'data');
  }

  @override
  NextcloudUserStatusClearAt_Time rebuild(void Function(NextcloudUserStatusClearAt_TimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusClearAt_TimeBuilder toBuilder() => NextcloudUserStatusClearAt_TimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusClearAt_Time &&
        data == other.data &&
        userStatusClearAtTime0 == other.userStatusClearAtTime0 &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, userStatusClearAtTime0.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusClearAt_Time')
          ..add('data', data)
          ..add('userStatusClearAtTime0', userStatusClearAtTime0)
          ..add('\$int', $int))
        .toString();
  }
}

class NextcloudUserStatusClearAt_TimeBuilder
    implements Builder<NextcloudUserStatusClearAt_Time, NextcloudUserStatusClearAt_TimeBuilder> {
  _$NextcloudUserStatusClearAt_Time? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  NextcloudUserStatusClearAt_Time0? _userStatusClearAtTime0;
  NextcloudUserStatusClearAt_Time0? get userStatusClearAtTime0 => _$this._userStatusClearAtTime0;
  set userStatusClearAtTime0(NextcloudUserStatusClearAt_Time0? userStatusClearAtTime0) =>
      _$this._userStatusClearAtTime0 = userStatusClearAtTime0;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  NextcloudUserStatusClearAt_TimeBuilder();

  NextcloudUserStatusClearAt_TimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _userStatusClearAtTime0 = $v.userStatusClearAtTime0;
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusClearAt_Time other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusClearAt_Time;
  }

  @override
  void update(void Function(NextcloudUserStatusClearAt_TimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusClearAt_Time build() => _build();

  _$NextcloudUserStatusClearAt_Time _build() {
    final _$result = _$v ??
        _$NextcloudUserStatusClearAt_Time._(
            data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusClearAt_Time', 'data'),
            userStatusClearAtTime0: userStatusClearAtTime0,
            $int: $int);
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusClearAt extends NextcloudUserStatusClearAt {
  @override
  final NextcloudUserStatusClearAt_Type type;
  @override
  final NextcloudUserStatusClearAt_Time time;

  factory _$NextcloudUserStatusClearAt([void Function(NextcloudUserStatusClearAtBuilder)? updates]) =>
      (NextcloudUserStatusClearAtBuilder()..update(updates))._build();

  _$NextcloudUserStatusClearAt._({required this.type, required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'NextcloudUserStatusClearAt', 'type');
    BuiltValueNullFieldError.checkNotNull(time, r'NextcloudUserStatusClearAt', 'time');
  }

  @override
  NextcloudUserStatusClearAt rebuild(void Function(NextcloudUserStatusClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusClearAtBuilder toBuilder() => NextcloudUserStatusClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusClearAt && type == other.type && time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusClearAt')
          ..add('type', type)
          ..add('time', time))
        .toString();
  }
}

class NextcloudUserStatusClearAtBuilder
    implements Builder<NextcloudUserStatusClearAt, NextcloudUserStatusClearAtBuilder> {
  _$NextcloudUserStatusClearAt? _$v;

  NextcloudUserStatusClearAt_Type? _type;
  NextcloudUserStatusClearAt_Type? get type => _$this._type;
  set type(NextcloudUserStatusClearAt_Type? type) => _$this._type = type;

  NextcloudUserStatusClearAt_TimeBuilder? _time;
  NextcloudUserStatusClearAt_TimeBuilder get time => _$this._time ??= NextcloudUserStatusClearAt_TimeBuilder();
  set time(NextcloudUserStatusClearAt_TimeBuilder? time) => _$this._time = time;

  NextcloudUserStatusClearAtBuilder();

  NextcloudUserStatusClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _time = $v.time.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusClearAt;
  }

  @override
  void update(void Function(NextcloudUserStatusClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusClearAt build() => _build();

  _$NextcloudUserStatusClearAt _build() {
    _$NextcloudUserStatusClearAt _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusClearAt._(
              type: BuiltValueNullFieldError.checkNotNull(type, r'NextcloudUserStatusClearAt', 'type'),
              time: time.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'time';
        time.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPublicStatus_ClearAt extends NextcloudUserStatusPublicStatus_ClearAt {
  @override
  final JsonObject data;
  @override
  final NextcloudUserStatusClearAt? userStatusClearAt;
  @override
  final int? $int;

  factory _$NextcloudUserStatusPublicStatus_ClearAt(
          [void Function(NextcloudUserStatusPublicStatus_ClearAtBuilder)? updates]) =>
      (NextcloudUserStatusPublicStatus_ClearAtBuilder()..update(updates))._build();

  _$NextcloudUserStatusPublicStatus_ClearAt._({required this.data, this.userStatusClearAt, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusPublicStatus_ClearAt', 'data');
  }

  @override
  NextcloudUserStatusPublicStatus_ClearAt rebuild(
          void Function(NextcloudUserStatusPublicStatus_ClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPublicStatus_ClearAtBuilder toBuilder() =>
      NextcloudUserStatusPublicStatus_ClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPublicStatus_ClearAt &&
        data == other.data &&
        userStatusClearAt == other.userStatusClearAt &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, userStatusClearAt.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPublicStatus_ClearAt')
          ..add('data', data)
          ..add('userStatusClearAt', userStatusClearAt)
          ..add('\$int', $int))
        .toString();
  }
}

class NextcloudUserStatusPublicStatus_ClearAtBuilder
    implements Builder<NextcloudUserStatusPublicStatus_ClearAt, NextcloudUserStatusPublicStatus_ClearAtBuilder> {
  _$NextcloudUserStatusPublicStatus_ClearAt? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  NextcloudUserStatusClearAtBuilder? _userStatusClearAt;
  NextcloudUserStatusClearAtBuilder get userStatusClearAt =>
      _$this._userStatusClearAt ??= NextcloudUserStatusClearAtBuilder();
  set userStatusClearAt(NextcloudUserStatusClearAtBuilder? userStatusClearAt) =>
      _$this._userStatusClearAt = userStatusClearAt;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  NextcloudUserStatusPublicStatus_ClearAtBuilder();

  NextcloudUserStatusPublicStatus_ClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _userStatusClearAt = $v.userStatusClearAt?.toBuilder();
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPublicStatus_ClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPublicStatus_ClearAt;
  }

  @override
  void update(void Function(NextcloudUserStatusPublicStatus_ClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPublicStatus_ClearAt build() => _build();

  _$NextcloudUserStatusPublicStatus_ClearAt _build() {
    _$NextcloudUserStatusPublicStatus_ClearAt _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusPublicStatus_ClearAt._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusPublicStatus_ClearAt', 'data'),
              userStatusClearAt: _userStatusClearAt?.build(),
              $int: $int);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userStatusClearAt';
        _userStatusClearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPublicStatus_ClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPublicStatus extends NextcloudUserStatusPublicStatus {
  @override
  final String userId;
  @override
  final String? message;
  @override
  final String? icon;
  @override
  final NextcloudUserStatusPublicStatus_ClearAt? clearAt;
  @override
  final NextcloudUserStatusType status;

  factory _$NextcloudUserStatusPublicStatus([void Function(NextcloudUserStatusPublicStatusBuilder)? updates]) =>
      (NextcloudUserStatusPublicStatusBuilder()..update(updates))._build();

  _$NextcloudUserStatusPublicStatus._(
      {required this.userId, this.message, this.icon, this.clearAt, required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'NextcloudUserStatusPublicStatus', 'userId');
    BuiltValueNullFieldError.checkNotNull(status, r'NextcloudUserStatusPublicStatus', 'status');
  }

  @override
  NextcloudUserStatusPublicStatus rebuild(void Function(NextcloudUserStatusPublicStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPublicStatusBuilder toBuilder() => NextcloudUserStatusPublicStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPublicStatus &&
        userId == other.userId &&
        message == other.message &&
        icon == other.icon &&
        clearAt == other.clearAt &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPublicStatus')
          ..add('userId', userId)
          ..add('message', message)
          ..add('icon', icon)
          ..add('clearAt', clearAt)
          ..add('status', status))
        .toString();
  }
}

class NextcloudUserStatusPublicStatusBuilder
    implements Builder<NextcloudUserStatusPublicStatus, NextcloudUserStatusPublicStatusBuilder> {
  _$NextcloudUserStatusPublicStatus? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  NextcloudUserStatusPublicStatus_ClearAtBuilder? _clearAt;
  NextcloudUserStatusPublicStatus_ClearAtBuilder get clearAt =>
      _$this._clearAt ??= NextcloudUserStatusPublicStatus_ClearAtBuilder();
  set clearAt(NextcloudUserStatusPublicStatus_ClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  NextcloudUserStatusType? _status;
  NextcloudUserStatusType? get status => _$this._status;
  set status(NextcloudUserStatusType? status) => _$this._status = status;

  NextcloudUserStatusPublicStatusBuilder();

  NextcloudUserStatusPublicStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _message = $v.message;
      _icon = $v.icon;
      _clearAt = $v.clearAt?.toBuilder();
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPublicStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPublicStatus;
  }

  @override
  void update(void Function(NextcloudUserStatusPublicStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPublicStatus build() => _build();

  _$NextcloudUserStatusPublicStatus _build() {
    _$NextcloudUserStatusPublicStatus _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusPublicStatus._(
              userId: BuiltValueNullFieldError.checkNotNull(userId, r'NextcloudUserStatusPublicStatus', 'userId'),
              message: message,
              icon: icon,
              clearAt: _clearAt?.build(),
              status: BuiltValueNullFieldError.checkNotNull(status, r'NextcloudUserStatusPublicStatus', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPublicStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetPublicStatuses_Ocs extends NextcloudUserStatusGetPublicStatuses_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<NextcloudUserStatusPublicStatus> data;

  factory _$NextcloudUserStatusGetPublicStatuses_Ocs(
          [void Function(NextcloudUserStatusGetPublicStatuses_OcsBuilder)? updates]) =>
      (NextcloudUserStatusGetPublicStatuses_OcsBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetPublicStatuses_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudUserStatusGetPublicStatuses_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetPublicStatuses_Ocs', 'data');
  }

  @override
  NextcloudUserStatusGetPublicStatuses_Ocs rebuild(
          void Function(NextcloudUserStatusGetPublicStatuses_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetPublicStatuses_OcsBuilder toBuilder() =>
      NextcloudUserStatusGetPublicStatuses_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetPublicStatuses_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetPublicStatuses_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudUserStatusGetPublicStatuses_OcsBuilder
    implements Builder<NextcloudUserStatusGetPublicStatuses_Ocs, NextcloudUserStatusGetPublicStatuses_OcsBuilder> {
  _$NextcloudUserStatusGetPublicStatuses_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NextcloudUserStatusPublicStatus>? _data;
  ListBuilder<NextcloudUserStatusPublicStatus> get data =>
      _$this._data ??= ListBuilder<NextcloudUserStatusPublicStatus>();
  set data(ListBuilder<NextcloudUserStatusPublicStatus>? data) => _$this._data = data;

  NextcloudUserStatusGetPublicStatuses_OcsBuilder();

  NextcloudUserStatusGetPublicStatuses_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetPublicStatuses_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetPublicStatuses_Ocs;
  }

  @override
  void update(void Function(NextcloudUserStatusGetPublicStatuses_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetPublicStatuses_Ocs build() => _build();

  _$NextcloudUserStatusGetPublicStatuses_Ocs _build() {
    _$NextcloudUserStatusGetPublicStatuses_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetPublicStatuses_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetPublicStatuses_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetPublicStatuses extends NextcloudUserStatusGetPublicStatuses {
  @override
  final NextcloudUserStatusGetPublicStatuses_Ocs ocs;

  factory _$NextcloudUserStatusGetPublicStatuses(
          [void Function(NextcloudUserStatusGetPublicStatusesBuilder)? updates]) =>
      (NextcloudUserStatusGetPublicStatusesBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetPublicStatuses._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudUserStatusGetPublicStatuses', 'ocs');
  }

  @override
  NextcloudUserStatusGetPublicStatuses rebuild(void Function(NextcloudUserStatusGetPublicStatusesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetPublicStatusesBuilder toBuilder() =>
      NextcloudUserStatusGetPublicStatusesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetPublicStatuses && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetPublicStatuses')..add('ocs', ocs)).toString();
  }
}

class NextcloudUserStatusGetPublicStatusesBuilder
    implements Builder<NextcloudUserStatusGetPublicStatuses, NextcloudUserStatusGetPublicStatusesBuilder> {
  _$NextcloudUserStatusGetPublicStatuses? _$v;

  NextcloudUserStatusGetPublicStatuses_OcsBuilder? _ocs;
  NextcloudUserStatusGetPublicStatuses_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudUserStatusGetPublicStatuses_OcsBuilder();
  set ocs(NextcloudUserStatusGetPublicStatuses_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudUserStatusGetPublicStatusesBuilder();

  NextcloudUserStatusGetPublicStatusesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetPublicStatuses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetPublicStatuses;
  }

  @override
  void update(void Function(NextcloudUserStatusGetPublicStatusesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetPublicStatuses build() => _build();

  _$NextcloudUserStatusGetPublicStatuses _build() {
    _$NextcloudUserStatusGetPublicStatuses _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetPublicStatuses._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetPublicStatuses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetPublicStatus_Ocs_Data extends NextcloudUserStatusGetPublicStatus_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final NextcloudUserStatusPublicStatus? userStatusPublicStatus;

  factory _$NextcloudUserStatusGetPublicStatus_Ocs_Data(
          [void Function(NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder)? updates]) =>
      (NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetPublicStatus_Ocs_Data._(
      {required this.data, this.builtListJsonObject, this.userStatusPublicStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetPublicStatus_Ocs_Data', 'data');
  }

  @override
  NextcloudUserStatusGetPublicStatus_Ocs_Data rebuild(
          void Function(NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder toBuilder() =>
      NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetPublicStatus_Ocs_Data &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        userStatusPublicStatus == other.userStatusPublicStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, userStatusPublicStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetPublicStatus_Ocs_Data')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('userStatusPublicStatus', userStatusPublicStatus))
        .toString();
  }
}

class NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder
    implements
        Builder<NextcloudUserStatusGetPublicStatus_Ocs_Data, NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder> {
  _$NextcloudUserStatusGetPublicStatus_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  NextcloudUserStatusPublicStatusBuilder? _userStatusPublicStatus;
  NextcloudUserStatusPublicStatusBuilder get userStatusPublicStatus =>
      _$this._userStatusPublicStatus ??= NextcloudUserStatusPublicStatusBuilder();
  set userStatusPublicStatus(NextcloudUserStatusPublicStatusBuilder? userStatusPublicStatus) =>
      _$this._userStatusPublicStatus = userStatusPublicStatus;

  NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder();

  NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _userStatusPublicStatus = $v.userStatusPublicStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetPublicStatus_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetPublicStatus_Ocs_Data;
  }

  @override
  void update(void Function(NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetPublicStatus_Ocs_Data build() => _build();

  _$NextcloudUserStatusGetPublicStatus_Ocs_Data _build() {
    _$NextcloudUserStatusGetPublicStatus_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusGetPublicStatus_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetPublicStatus_Ocs_Data', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              userStatusPublicStatus: _userStatusPublicStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
        _$failedField = 'userStatusPublicStatus';
        _userStatusPublicStatus?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetPublicStatus_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetPublicStatus_Ocs extends NextcloudUserStatusGetPublicStatus_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudUserStatusGetPublicStatus_Ocs_Data data;

  factory _$NextcloudUserStatusGetPublicStatus_Ocs(
          [void Function(NextcloudUserStatusGetPublicStatus_OcsBuilder)? updates]) =>
      (NextcloudUserStatusGetPublicStatus_OcsBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetPublicStatus_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudUserStatusGetPublicStatus_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetPublicStatus_Ocs', 'data');
  }

  @override
  NextcloudUserStatusGetPublicStatus_Ocs rebuild(
          void Function(NextcloudUserStatusGetPublicStatus_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetPublicStatus_OcsBuilder toBuilder() =>
      NextcloudUserStatusGetPublicStatus_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetPublicStatus_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetPublicStatus_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudUserStatusGetPublicStatus_OcsBuilder
    implements Builder<NextcloudUserStatusGetPublicStatus_Ocs, NextcloudUserStatusGetPublicStatus_OcsBuilder> {
  _$NextcloudUserStatusGetPublicStatus_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder? _data;
  NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder get data =>
      _$this._data ??= NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder();
  set data(NextcloudUserStatusGetPublicStatus_Ocs_DataBuilder? data) => _$this._data = data;

  NextcloudUserStatusGetPublicStatus_OcsBuilder();

  NextcloudUserStatusGetPublicStatus_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetPublicStatus_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetPublicStatus_Ocs;
  }

  @override
  void update(void Function(NextcloudUserStatusGetPublicStatus_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetPublicStatus_Ocs build() => _build();

  _$NextcloudUserStatusGetPublicStatus_Ocs _build() {
    _$NextcloudUserStatusGetPublicStatus_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetPublicStatus_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetPublicStatus_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetPublicStatus extends NextcloudUserStatusGetPublicStatus {
  @override
  final NextcloudUserStatusGetPublicStatus_Ocs ocs;

  factory _$NextcloudUserStatusGetPublicStatus([void Function(NextcloudUserStatusGetPublicStatusBuilder)? updates]) =>
      (NextcloudUserStatusGetPublicStatusBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetPublicStatus._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudUserStatusGetPublicStatus', 'ocs');
  }

  @override
  NextcloudUserStatusGetPublicStatus rebuild(void Function(NextcloudUserStatusGetPublicStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetPublicStatusBuilder toBuilder() => NextcloudUserStatusGetPublicStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetPublicStatus && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetPublicStatus')..add('ocs', ocs)).toString();
  }
}

class NextcloudUserStatusGetPublicStatusBuilder
    implements Builder<NextcloudUserStatusGetPublicStatus, NextcloudUserStatusGetPublicStatusBuilder> {
  _$NextcloudUserStatusGetPublicStatus? _$v;

  NextcloudUserStatusGetPublicStatus_OcsBuilder? _ocs;
  NextcloudUserStatusGetPublicStatus_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudUserStatusGetPublicStatus_OcsBuilder();
  set ocs(NextcloudUserStatusGetPublicStatus_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudUserStatusGetPublicStatusBuilder();

  NextcloudUserStatusGetPublicStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetPublicStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetPublicStatus;
  }

  @override
  void update(void Function(NextcloudUserStatusGetPublicStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetPublicStatus build() => _build();

  _$NextcloudUserStatusGetPublicStatus _build() {
    _$NextcloudUserStatusGetPublicStatus _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetPublicStatus._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetPublicStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusStatus_ClearAt extends NextcloudUserStatusStatus_ClearAt {
  @override
  final JsonObject data;
  @override
  final NextcloudUserStatusClearAt? userStatusClearAt;
  @override
  final int? $int;

  factory _$NextcloudUserStatusStatus_ClearAt([void Function(NextcloudUserStatusStatus_ClearAtBuilder)? updates]) =>
      (NextcloudUserStatusStatus_ClearAtBuilder()..update(updates))._build();

  _$NextcloudUserStatusStatus_ClearAt._({required this.data, this.userStatusClearAt, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusStatus_ClearAt', 'data');
  }

  @override
  NextcloudUserStatusStatus_ClearAt rebuild(void Function(NextcloudUserStatusStatus_ClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusStatus_ClearAtBuilder toBuilder() => NextcloudUserStatusStatus_ClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusStatus_ClearAt &&
        data == other.data &&
        userStatusClearAt == other.userStatusClearAt &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, userStatusClearAt.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusStatus_ClearAt')
          ..add('data', data)
          ..add('userStatusClearAt', userStatusClearAt)
          ..add('\$int', $int))
        .toString();
  }
}

class NextcloudUserStatusStatus_ClearAtBuilder
    implements Builder<NextcloudUserStatusStatus_ClearAt, NextcloudUserStatusStatus_ClearAtBuilder> {
  _$NextcloudUserStatusStatus_ClearAt? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  NextcloudUserStatusClearAtBuilder? _userStatusClearAt;
  NextcloudUserStatusClearAtBuilder get userStatusClearAt =>
      _$this._userStatusClearAt ??= NextcloudUserStatusClearAtBuilder();
  set userStatusClearAt(NextcloudUserStatusClearAtBuilder? userStatusClearAt) =>
      _$this._userStatusClearAt = userStatusClearAt;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  NextcloudUserStatusStatus_ClearAtBuilder();

  NextcloudUserStatusStatus_ClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _userStatusClearAt = $v.userStatusClearAt?.toBuilder();
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusStatus_ClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusStatus_ClearAt;
  }

  @override
  void update(void Function(NextcloudUserStatusStatus_ClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusStatus_ClearAt build() => _build();

  _$NextcloudUserStatusStatus_ClearAt _build() {
    _$NextcloudUserStatusStatus_ClearAt _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusStatus_ClearAt._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusStatus_ClearAt', 'data'),
              userStatusClearAt: _userStatusClearAt?.build(),
              $int: $int);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userStatusClearAt';
        _userStatusClearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusStatus_ClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusStatus extends NextcloudUserStatusStatus {
  @override
  final String userId;
  @override
  final String? message;
  @override
  final String? messageId;
  @override
  final bool messageIsPredefined;
  @override
  final String? icon;
  @override
  final NextcloudUserStatusStatus_ClearAt? clearAt;
  @override
  final NextcloudUserStatusType status;
  @override
  final bool statusIsUserDefined;

  factory _$NextcloudUserStatusStatus([void Function(NextcloudUserStatusStatusBuilder)? updates]) =>
      (NextcloudUserStatusStatusBuilder()..update(updates))._build();

  _$NextcloudUserStatusStatus._(
      {required this.userId,
      this.message,
      this.messageId,
      required this.messageIsPredefined,
      this.icon,
      this.clearAt,
      required this.status,
      required this.statusIsUserDefined})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'NextcloudUserStatusStatus', 'userId');
    BuiltValueNullFieldError.checkNotNull(messageIsPredefined, r'NextcloudUserStatusStatus', 'messageIsPredefined');
    BuiltValueNullFieldError.checkNotNull(status, r'NextcloudUserStatusStatus', 'status');
    BuiltValueNullFieldError.checkNotNull(statusIsUserDefined, r'NextcloudUserStatusStatus', 'statusIsUserDefined');
  }

  @override
  NextcloudUserStatusStatus rebuild(void Function(NextcloudUserStatusStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusStatusBuilder toBuilder() => NextcloudUserStatusStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusStatus &&
        userId == other.userId &&
        message == other.message &&
        messageId == other.messageId &&
        messageIsPredefined == other.messageIsPredefined &&
        icon == other.icon &&
        clearAt == other.clearAt &&
        status == other.status &&
        statusIsUserDefined == other.statusIsUserDefined;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, messageId.hashCode);
    _$hash = $jc(_$hash, messageIsPredefined.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, statusIsUserDefined.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusStatus')
          ..add('userId', userId)
          ..add('message', message)
          ..add('messageId', messageId)
          ..add('messageIsPredefined', messageIsPredefined)
          ..add('icon', icon)
          ..add('clearAt', clearAt)
          ..add('status', status)
          ..add('statusIsUserDefined', statusIsUserDefined))
        .toString();
  }
}

class NextcloudUserStatusStatusBuilder implements Builder<NextcloudUserStatusStatus, NextcloudUserStatusStatusBuilder> {
  _$NextcloudUserStatusStatus? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _messageId;
  String? get messageId => _$this._messageId;
  set messageId(String? messageId) => _$this._messageId = messageId;

  bool? _messageIsPredefined;
  bool? get messageIsPredefined => _$this._messageIsPredefined;
  set messageIsPredefined(bool? messageIsPredefined) => _$this._messageIsPredefined = messageIsPredefined;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  NextcloudUserStatusStatus_ClearAtBuilder? _clearAt;
  NextcloudUserStatusStatus_ClearAtBuilder get clearAt =>
      _$this._clearAt ??= NextcloudUserStatusStatus_ClearAtBuilder();
  set clearAt(NextcloudUserStatusStatus_ClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  NextcloudUserStatusType? _status;
  NextcloudUserStatusType? get status => _$this._status;
  set status(NextcloudUserStatusType? status) => _$this._status = status;

  bool? _statusIsUserDefined;
  bool? get statusIsUserDefined => _$this._statusIsUserDefined;
  set statusIsUserDefined(bool? statusIsUserDefined) => _$this._statusIsUserDefined = statusIsUserDefined;

  NextcloudUserStatusStatusBuilder();

  NextcloudUserStatusStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _message = $v.message;
      _messageId = $v.messageId;
      _messageIsPredefined = $v.messageIsPredefined;
      _icon = $v.icon;
      _clearAt = $v.clearAt?.toBuilder();
      _status = $v.status;
      _statusIsUserDefined = $v.statusIsUserDefined;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusStatus;
  }

  @override
  void update(void Function(NextcloudUserStatusStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusStatus build() => _build();

  _$NextcloudUserStatusStatus _build() {
    _$NextcloudUserStatusStatus _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusStatus._(
              userId: BuiltValueNullFieldError.checkNotNull(userId, r'NextcloudUserStatusStatus', 'userId'),
              message: message,
              messageId: messageId,
              messageIsPredefined: BuiltValueNullFieldError.checkNotNull(
                  messageIsPredefined, r'NextcloudUserStatusStatus', 'messageIsPredefined'),
              icon: icon,
              clearAt: _clearAt?.build(),
              status: BuiltValueNullFieldError.checkNotNull(status, r'NextcloudUserStatusStatus', 'status'),
              statusIsUserDefined: BuiltValueNullFieldError.checkNotNull(
                  statusIsUserDefined, r'NextcloudUserStatusStatus', 'statusIsUserDefined'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetStatus_Ocs_Data extends NextcloudUserStatusGetStatus_Ocs_Data {
  @override
  final JsonObject data;
  @override
  final BuiltList<JsonObject>? builtListJsonObject;
  @override
  final NextcloudUserStatusStatus? userStatusStatus;

  factory _$NextcloudUserStatusGetStatus_Ocs_Data(
          [void Function(NextcloudUserStatusGetStatus_Ocs_DataBuilder)? updates]) =>
      (NextcloudUserStatusGetStatus_Ocs_DataBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetStatus_Ocs_Data._({required this.data, this.builtListJsonObject, this.userStatusStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetStatus_Ocs_Data', 'data');
  }

  @override
  NextcloudUserStatusGetStatus_Ocs_Data rebuild(void Function(NextcloudUserStatusGetStatus_Ocs_DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetStatus_Ocs_DataBuilder toBuilder() =>
      NextcloudUserStatusGetStatus_Ocs_DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetStatus_Ocs_Data &&
        data == other.data &&
        builtListJsonObject == other.builtListJsonObject &&
        userStatusStatus == other.userStatusStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, builtListJsonObject.hashCode);
    _$hash = $jc(_$hash, userStatusStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetStatus_Ocs_Data')
          ..add('data', data)
          ..add('builtListJsonObject', builtListJsonObject)
          ..add('userStatusStatus', userStatusStatus))
        .toString();
  }
}

class NextcloudUserStatusGetStatus_Ocs_DataBuilder
    implements Builder<NextcloudUserStatusGetStatus_Ocs_Data, NextcloudUserStatusGetStatus_Ocs_DataBuilder> {
  _$NextcloudUserStatusGetStatus_Ocs_Data? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  ListBuilder<JsonObject>? _builtListJsonObject;
  ListBuilder<JsonObject> get builtListJsonObject => _$this._builtListJsonObject ??= ListBuilder<JsonObject>();
  set builtListJsonObject(ListBuilder<JsonObject>? builtListJsonObject) =>
      _$this._builtListJsonObject = builtListJsonObject;

  NextcloudUserStatusStatusBuilder? _userStatusStatus;
  NextcloudUserStatusStatusBuilder get userStatusStatus =>
      _$this._userStatusStatus ??= NextcloudUserStatusStatusBuilder();
  set userStatusStatus(NextcloudUserStatusStatusBuilder? userStatusStatus) =>
      _$this._userStatusStatus = userStatusStatus;

  NextcloudUserStatusGetStatus_Ocs_DataBuilder();

  NextcloudUserStatusGetStatus_Ocs_DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _builtListJsonObject = $v.builtListJsonObject?.toBuilder();
      _userStatusStatus = $v.userStatusStatus?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetStatus_Ocs_Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetStatus_Ocs_Data;
  }

  @override
  void update(void Function(NextcloudUserStatusGetStatus_Ocs_DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetStatus_Ocs_Data build() => _build();

  _$NextcloudUserStatusGetStatus_Ocs_Data _build() {
    _$NextcloudUserStatusGetStatus_Ocs_Data _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusGetStatus_Ocs_Data._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetStatus_Ocs_Data', 'data'),
              builtListJsonObject: _builtListJsonObject?.build(),
              userStatusStatus: _userStatusStatus?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'builtListJsonObject';
        _builtListJsonObject?.build();
        _$failedField = 'userStatusStatus';
        _userStatusStatus?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetStatus_Ocs_Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetStatus_Ocs extends NextcloudUserStatusGetStatus_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudUserStatusGetStatus_Ocs_Data data;

  factory _$NextcloudUserStatusGetStatus_Ocs([void Function(NextcloudUserStatusGetStatus_OcsBuilder)? updates]) =>
      (NextcloudUserStatusGetStatus_OcsBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetStatus_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudUserStatusGetStatus_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusGetStatus_Ocs', 'data');
  }

  @override
  NextcloudUserStatusGetStatus_Ocs rebuild(void Function(NextcloudUserStatusGetStatus_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetStatus_OcsBuilder toBuilder() => NextcloudUserStatusGetStatus_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetStatus_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetStatus_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudUserStatusGetStatus_OcsBuilder
    implements Builder<NextcloudUserStatusGetStatus_Ocs, NextcloudUserStatusGetStatus_OcsBuilder> {
  _$NextcloudUserStatusGetStatus_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudUserStatusGetStatus_Ocs_DataBuilder? _data;
  NextcloudUserStatusGetStatus_Ocs_DataBuilder get data =>
      _$this._data ??= NextcloudUserStatusGetStatus_Ocs_DataBuilder();
  set data(NextcloudUserStatusGetStatus_Ocs_DataBuilder? data) => _$this._data = data;

  NextcloudUserStatusGetStatus_OcsBuilder();

  NextcloudUserStatusGetStatus_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetStatus_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetStatus_Ocs;
  }

  @override
  void update(void Function(NextcloudUserStatusGetStatus_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetStatus_Ocs build() => _build();

  _$NextcloudUserStatusGetStatus_Ocs _build() {
    _$NextcloudUserStatusGetStatus_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetStatus_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetStatus_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusGetStatus extends NextcloudUserStatusGetStatus {
  @override
  final NextcloudUserStatusGetStatus_Ocs ocs;

  factory _$NextcloudUserStatusGetStatus([void Function(NextcloudUserStatusGetStatusBuilder)? updates]) =>
      (NextcloudUserStatusGetStatusBuilder()..update(updates))._build();

  _$NextcloudUserStatusGetStatus._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudUserStatusGetStatus', 'ocs');
  }

  @override
  NextcloudUserStatusGetStatus rebuild(void Function(NextcloudUserStatusGetStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusGetStatusBuilder toBuilder() => NextcloudUserStatusGetStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusGetStatus && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusGetStatus')..add('ocs', ocs)).toString();
  }
}

class NextcloudUserStatusGetStatusBuilder
    implements Builder<NextcloudUserStatusGetStatus, NextcloudUserStatusGetStatusBuilder> {
  _$NextcloudUserStatusGetStatus? _$v;

  NextcloudUserStatusGetStatus_OcsBuilder? _ocs;
  NextcloudUserStatusGetStatus_OcsBuilder get ocs => _$this._ocs ??= NextcloudUserStatusGetStatus_OcsBuilder();
  set ocs(NextcloudUserStatusGetStatus_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudUserStatusGetStatusBuilder();

  NextcloudUserStatusGetStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusGetStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusGetStatus;
  }

  @override
  void update(void Function(NextcloudUserStatusGetStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusGetStatus build() => _build();

  _$NextcloudUserStatusGetStatus _build() {
    _$NextcloudUserStatusGetStatus _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusGetStatus._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusGetStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPredefinedStatus_ClearAt extends NextcloudUserStatusPredefinedStatus_ClearAt {
  @override
  final JsonObject data;
  @override
  final NextcloudUserStatusClearAt? userStatusClearAt;
  @override
  final int? $int;

  factory _$NextcloudUserStatusPredefinedStatus_ClearAt(
          [void Function(NextcloudUserStatusPredefinedStatus_ClearAtBuilder)? updates]) =>
      (NextcloudUserStatusPredefinedStatus_ClearAtBuilder()..update(updates))._build();

  _$NextcloudUserStatusPredefinedStatus_ClearAt._({required this.data, this.userStatusClearAt, this.$int}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusPredefinedStatus_ClearAt', 'data');
  }

  @override
  NextcloudUserStatusPredefinedStatus_ClearAt rebuild(
          void Function(NextcloudUserStatusPredefinedStatus_ClearAtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPredefinedStatus_ClearAtBuilder toBuilder() =>
      NextcloudUserStatusPredefinedStatus_ClearAtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPredefinedStatus_ClearAt &&
        data == other.data &&
        userStatusClearAt == other.userStatusClearAt &&
        $int == other.$int;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, userStatusClearAt.hashCode);
    _$hash = $jc(_$hash, $int.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPredefinedStatus_ClearAt')
          ..add('data', data)
          ..add('userStatusClearAt', userStatusClearAt)
          ..add('\$int', $int))
        .toString();
  }
}

class NextcloudUserStatusPredefinedStatus_ClearAtBuilder
    implements
        Builder<NextcloudUserStatusPredefinedStatus_ClearAt, NextcloudUserStatusPredefinedStatus_ClearAtBuilder> {
  _$NextcloudUserStatusPredefinedStatus_ClearAt? _$v;

  JsonObject? _data;
  JsonObject? get data => _$this._data;
  set data(JsonObject? data) => _$this._data = data;

  NextcloudUserStatusClearAtBuilder? _userStatusClearAt;
  NextcloudUserStatusClearAtBuilder get userStatusClearAt =>
      _$this._userStatusClearAt ??= NextcloudUserStatusClearAtBuilder();
  set userStatusClearAt(NextcloudUserStatusClearAtBuilder? userStatusClearAt) =>
      _$this._userStatusClearAt = userStatusClearAt;

  int? _$int;
  int? get $int => _$this._$int;
  set $int(int? $int) => _$this._$int = $int;

  NextcloudUserStatusPredefinedStatus_ClearAtBuilder();

  NextcloudUserStatusPredefinedStatus_ClearAtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _userStatusClearAt = $v.userStatusClearAt?.toBuilder();
      _$int = $v.$int;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPredefinedStatus_ClearAt other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPredefinedStatus_ClearAt;
  }

  @override
  void update(void Function(NextcloudUserStatusPredefinedStatus_ClearAtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPredefinedStatus_ClearAt build() => _build();

  _$NextcloudUserStatusPredefinedStatus_ClearAt _build() {
    _$NextcloudUserStatusPredefinedStatus_ClearAt _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusPredefinedStatus_ClearAt._(
              data: BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusPredefinedStatus_ClearAt', 'data'),
              userStatusClearAt: _userStatusClearAt?.build(),
              $int: $int);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userStatusClearAt';
        _userStatusClearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPredefinedStatus_ClearAt', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPredefinedStatus extends NextcloudUserStatusPredefinedStatus {
  @override
  final String id;
  @override
  final String icon;
  @override
  final String message;
  @override
  final NextcloudUserStatusPredefinedStatus_ClearAt? clearAt;

  factory _$NextcloudUserStatusPredefinedStatus([void Function(NextcloudUserStatusPredefinedStatusBuilder)? updates]) =>
      (NextcloudUserStatusPredefinedStatusBuilder()..update(updates))._build();

  _$NextcloudUserStatusPredefinedStatus._({required this.id, required this.icon, required this.message, this.clearAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'NextcloudUserStatusPredefinedStatus', 'id');
    BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudUserStatusPredefinedStatus', 'icon');
    BuiltValueNullFieldError.checkNotNull(message, r'NextcloudUserStatusPredefinedStatus', 'message');
  }

  @override
  NextcloudUserStatusPredefinedStatus rebuild(void Function(NextcloudUserStatusPredefinedStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPredefinedStatusBuilder toBuilder() => NextcloudUserStatusPredefinedStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPredefinedStatus &&
        id == other.id &&
        icon == other.icon &&
        message == other.message &&
        clearAt == other.clearAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, clearAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPredefinedStatus')
          ..add('id', id)
          ..add('icon', icon)
          ..add('message', message)
          ..add('clearAt', clearAt))
        .toString();
  }
}

class NextcloudUserStatusPredefinedStatusBuilder
    implements Builder<NextcloudUserStatusPredefinedStatus, NextcloudUserStatusPredefinedStatusBuilder> {
  _$NextcloudUserStatusPredefinedStatus? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  NextcloudUserStatusPredefinedStatus_ClearAtBuilder? _clearAt;
  NextcloudUserStatusPredefinedStatus_ClearAtBuilder get clearAt =>
      _$this._clearAt ??= NextcloudUserStatusPredefinedStatus_ClearAtBuilder();
  set clearAt(NextcloudUserStatusPredefinedStatus_ClearAtBuilder? clearAt) => _$this._clearAt = clearAt;

  NextcloudUserStatusPredefinedStatusBuilder();

  NextcloudUserStatusPredefinedStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _icon = $v.icon;
      _message = $v.message;
      _clearAt = $v.clearAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPredefinedStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPredefinedStatus;
  }

  @override
  void update(void Function(NextcloudUserStatusPredefinedStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPredefinedStatus build() => _build();

  _$NextcloudUserStatusPredefinedStatus _build() {
    _$NextcloudUserStatusPredefinedStatus _$result;
    try {
      _$result = _$v ??
          _$NextcloudUserStatusPredefinedStatus._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'NextcloudUserStatusPredefinedStatus', 'id'),
              icon: BuiltValueNullFieldError.checkNotNull(icon, r'NextcloudUserStatusPredefinedStatus', 'icon'),
              message:
                  BuiltValueNullFieldError.checkNotNull(message, r'NextcloudUserStatusPredefinedStatus', 'message'),
              clearAt: _clearAt?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clearAt';
        _clearAt?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPredefinedStatus', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPredefinedStatuses_Ocs extends NextcloudUserStatusPredefinedStatuses_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final BuiltList<NextcloudUserStatusPredefinedStatus> data;

  factory _$NextcloudUserStatusPredefinedStatuses_Ocs(
          [void Function(NextcloudUserStatusPredefinedStatuses_OcsBuilder)? updates]) =>
      (NextcloudUserStatusPredefinedStatuses_OcsBuilder()..update(updates))._build();

  _$NextcloudUserStatusPredefinedStatuses_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudUserStatusPredefinedStatuses_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusPredefinedStatuses_Ocs', 'data');
  }

  @override
  NextcloudUserStatusPredefinedStatuses_Ocs rebuild(
          void Function(NextcloudUserStatusPredefinedStatuses_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPredefinedStatuses_OcsBuilder toBuilder() =>
      NextcloudUserStatusPredefinedStatuses_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPredefinedStatuses_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPredefinedStatuses_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudUserStatusPredefinedStatuses_OcsBuilder
    implements Builder<NextcloudUserStatusPredefinedStatuses_Ocs, NextcloudUserStatusPredefinedStatuses_OcsBuilder> {
  _$NextcloudUserStatusPredefinedStatuses_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  ListBuilder<NextcloudUserStatusPredefinedStatus>? _data;
  ListBuilder<NextcloudUserStatusPredefinedStatus> get data =>
      _$this._data ??= ListBuilder<NextcloudUserStatusPredefinedStatus>();
  set data(ListBuilder<NextcloudUserStatusPredefinedStatus>? data) => _$this._data = data;

  NextcloudUserStatusPredefinedStatuses_OcsBuilder();

  NextcloudUserStatusPredefinedStatuses_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPredefinedStatuses_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPredefinedStatuses_Ocs;
  }

  @override
  void update(void Function(NextcloudUserStatusPredefinedStatuses_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPredefinedStatuses_Ocs build() => _build();

  _$NextcloudUserStatusPredefinedStatuses_Ocs _build() {
    _$NextcloudUserStatusPredefinedStatuses_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusPredefinedStatuses_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPredefinedStatuses_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusPredefinedStatuses extends NextcloudUserStatusPredefinedStatuses {
  @override
  final NextcloudUserStatusPredefinedStatuses_Ocs ocs;

  factory _$NextcloudUserStatusPredefinedStatuses(
          [void Function(NextcloudUserStatusPredefinedStatusesBuilder)? updates]) =>
      (NextcloudUserStatusPredefinedStatusesBuilder()..update(updates))._build();

  _$NextcloudUserStatusPredefinedStatuses._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudUserStatusPredefinedStatuses', 'ocs');
  }

  @override
  NextcloudUserStatusPredefinedStatuses rebuild(void Function(NextcloudUserStatusPredefinedStatusesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusPredefinedStatusesBuilder toBuilder() =>
      NextcloudUserStatusPredefinedStatusesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusPredefinedStatuses && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusPredefinedStatuses')..add('ocs', ocs)).toString();
  }
}

class NextcloudUserStatusPredefinedStatusesBuilder
    implements Builder<NextcloudUserStatusPredefinedStatuses, NextcloudUserStatusPredefinedStatusesBuilder> {
  _$NextcloudUserStatusPredefinedStatuses? _$v;

  NextcloudUserStatusPredefinedStatuses_OcsBuilder? _ocs;
  NextcloudUserStatusPredefinedStatuses_OcsBuilder get ocs =>
      _$this._ocs ??= NextcloudUserStatusPredefinedStatuses_OcsBuilder();
  set ocs(NextcloudUserStatusPredefinedStatuses_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudUserStatusPredefinedStatusesBuilder();

  NextcloudUserStatusPredefinedStatusesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusPredefinedStatuses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusPredefinedStatuses;
  }

  @override
  void update(void Function(NextcloudUserStatusPredefinedStatusesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusPredefinedStatuses build() => _build();

  _$NextcloudUserStatusPredefinedStatuses _build() {
    _$NextcloudUserStatusPredefinedStatuses _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusPredefinedStatuses._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusPredefinedStatuses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusHeartbeat_Ocs extends NextcloudUserStatusHeartbeat_Ocs {
  @override
  final NextcloudOCSMeta meta;
  @override
  final NextcloudUserStatusStatus data;

  factory _$NextcloudUserStatusHeartbeat_Ocs([void Function(NextcloudUserStatusHeartbeat_OcsBuilder)? updates]) =>
      (NextcloudUserStatusHeartbeat_OcsBuilder()..update(updates))._build();

  _$NextcloudUserStatusHeartbeat_Ocs._({required this.meta, required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(meta, r'NextcloudUserStatusHeartbeat_Ocs', 'meta');
    BuiltValueNullFieldError.checkNotNull(data, r'NextcloudUserStatusHeartbeat_Ocs', 'data');
  }

  @override
  NextcloudUserStatusHeartbeat_Ocs rebuild(void Function(NextcloudUserStatusHeartbeat_OcsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusHeartbeat_OcsBuilder toBuilder() => NextcloudUserStatusHeartbeat_OcsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusHeartbeat_Ocs && meta == other.meta && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, meta.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusHeartbeat_Ocs')
          ..add('meta', meta)
          ..add('data', data))
        .toString();
  }
}

class NextcloudUserStatusHeartbeat_OcsBuilder
    implements Builder<NextcloudUserStatusHeartbeat_Ocs, NextcloudUserStatusHeartbeat_OcsBuilder> {
  _$NextcloudUserStatusHeartbeat_Ocs? _$v;

  NextcloudOCSMetaBuilder? _meta;
  NextcloudOCSMetaBuilder get meta => _$this._meta ??= NextcloudOCSMetaBuilder();
  set meta(NextcloudOCSMetaBuilder? meta) => _$this._meta = meta;

  NextcloudUserStatusStatusBuilder? _data;
  NextcloudUserStatusStatusBuilder get data => _$this._data ??= NextcloudUserStatusStatusBuilder();
  set data(NextcloudUserStatusStatusBuilder? data) => _$this._data = data;

  NextcloudUserStatusHeartbeat_OcsBuilder();

  NextcloudUserStatusHeartbeat_OcsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _meta = $v.meta.toBuilder();
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusHeartbeat_Ocs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusHeartbeat_Ocs;
  }

  @override
  void update(void Function(NextcloudUserStatusHeartbeat_OcsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusHeartbeat_Ocs build() => _build();

  _$NextcloudUserStatusHeartbeat_Ocs _build() {
    _$NextcloudUserStatusHeartbeat_Ocs _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusHeartbeat_Ocs._(meta: meta.build(), data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusHeartbeat_Ocs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudUserStatusHeartbeat extends NextcloudUserStatusHeartbeat {
  @override
  final NextcloudUserStatusHeartbeat_Ocs ocs;

  factory _$NextcloudUserStatusHeartbeat([void Function(NextcloudUserStatusHeartbeatBuilder)? updates]) =>
      (NextcloudUserStatusHeartbeatBuilder()..update(updates))._build();

  _$NextcloudUserStatusHeartbeat._({required this.ocs}) : super._() {
    BuiltValueNullFieldError.checkNotNull(ocs, r'NextcloudUserStatusHeartbeat', 'ocs');
  }

  @override
  NextcloudUserStatusHeartbeat rebuild(void Function(NextcloudUserStatusHeartbeatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudUserStatusHeartbeatBuilder toBuilder() => NextcloudUserStatusHeartbeatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudUserStatusHeartbeat && ocs == other.ocs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ocs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudUserStatusHeartbeat')..add('ocs', ocs)).toString();
  }
}

class NextcloudUserStatusHeartbeatBuilder
    implements Builder<NextcloudUserStatusHeartbeat, NextcloudUserStatusHeartbeatBuilder> {
  _$NextcloudUserStatusHeartbeat? _$v;

  NextcloudUserStatusHeartbeat_OcsBuilder? _ocs;
  NextcloudUserStatusHeartbeat_OcsBuilder get ocs => _$this._ocs ??= NextcloudUserStatusHeartbeat_OcsBuilder();
  set ocs(NextcloudUserStatusHeartbeat_OcsBuilder? ocs) => _$this._ocs = ocs;

  NextcloudUserStatusHeartbeatBuilder();

  NextcloudUserStatusHeartbeatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ocs = $v.ocs.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudUserStatusHeartbeat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudUserStatusHeartbeat;
  }

  @override
  void update(void Function(NextcloudUserStatusHeartbeatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudUserStatusHeartbeat build() => _build();

  _$NextcloudUserStatusHeartbeat _build() {
    _$NextcloudUserStatusHeartbeat _$result;
    try {
      _$result = _$v ?? _$NextcloudUserStatusHeartbeat._(ocs: ocs.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ocs';
        ocs.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NextcloudUserStatusHeartbeat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NextcloudNotificationsNotificationDecryptedSubject extends NextcloudNotificationsNotificationDecryptedSubject {
  @override
  final int? nid;
  @override
  final String? app;
  @override
  final String? subject;
  @override
  final String? type;
  @override
  final String? id;
  @override
  final bool? delete;
  @override
  final bool? deleteAll;

  factory _$NextcloudNotificationsNotificationDecryptedSubject(
          [void Function(NextcloudNotificationsNotificationDecryptedSubjectBuilder)? updates]) =>
      (NextcloudNotificationsNotificationDecryptedSubjectBuilder()..update(updates))._build();

  _$NextcloudNotificationsNotificationDecryptedSubject._(
      {this.nid, this.app, this.subject, this.type, this.id, this.delete, this.deleteAll})
      : super._();

  @override
  NextcloudNotificationsNotificationDecryptedSubject rebuild(
          void Function(NextcloudNotificationsNotificationDecryptedSubjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NextcloudNotificationsNotificationDecryptedSubjectBuilder toBuilder() =>
      NextcloudNotificationsNotificationDecryptedSubjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NextcloudNotificationsNotificationDecryptedSubject &&
        nid == other.nid &&
        app == other.app &&
        subject == other.subject &&
        type == other.type &&
        id == other.id &&
        delete == other.delete &&
        deleteAll == other.deleteAll;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nid.hashCode);
    _$hash = $jc(_$hash, app.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, delete.hashCode);
    _$hash = $jc(_$hash, deleteAll.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NextcloudNotificationsNotificationDecryptedSubject')
          ..add('nid', nid)
          ..add('app', app)
          ..add('subject', subject)
          ..add('type', type)
          ..add('id', id)
          ..add('delete', delete)
          ..add('deleteAll', deleteAll))
        .toString();
  }
}

class NextcloudNotificationsNotificationDecryptedSubjectBuilder
    implements
        Builder<NextcloudNotificationsNotificationDecryptedSubject,
            NextcloudNotificationsNotificationDecryptedSubjectBuilder> {
  _$NextcloudNotificationsNotificationDecryptedSubject? _$v;

  int? _nid;
  int? get nid => _$this._nid;
  set nid(int? nid) => _$this._nid = nid;

  String? _app;
  String? get app => _$this._app;
  set app(String? app) => _$this._app = app;

  String? _subject;
  String? get subject => _$this._subject;
  set subject(String? subject) => _$this._subject = subject;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _delete;
  bool? get delete => _$this._delete;
  set delete(bool? delete) => _$this._delete = delete;

  bool? _deleteAll;
  bool? get deleteAll => _$this._deleteAll;
  set deleteAll(bool? deleteAll) => _$this._deleteAll = deleteAll;

  NextcloudNotificationsNotificationDecryptedSubjectBuilder();

  NextcloudNotificationsNotificationDecryptedSubjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nid = $v.nid;
      _app = $v.app;
      _subject = $v.subject;
      _type = $v.type;
      _id = $v.id;
      _delete = $v.delete;
      _deleteAll = $v.deleteAll;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NextcloudNotificationsNotificationDecryptedSubject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NextcloudNotificationsNotificationDecryptedSubject;
  }

  @override
  void update(void Function(NextcloudNotificationsNotificationDecryptedSubjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NextcloudNotificationsNotificationDecryptedSubject build() => _build();

  _$NextcloudNotificationsNotificationDecryptedSubject _build() {
    final _$result = _$v ??
        _$NextcloudNotificationsNotificationDecryptedSubject._(
            nid: nid, app: app, subject: subject, type: type, id: id, delete: delete, deleteAll: deleteAll);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
