// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'props.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$WebDavPropWithoutValuesBuildXmlChildren(WebDavPropWithoutValues instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  if (davCreationdateSerialized != null) {
    for (final value in davCreationdateSerialized) {
      builder.element('creationdate', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  if (davDisplaynameSerialized != null) {
    for (final value in davDisplaynameSerialized) {
      builder.element('displayname', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  if (davGetcontentlanguageSerialized != null) {
    for (final value in davGetcontentlanguageSerialized) {
      builder.element('getcontentlanguage', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength;
  if (davGetcontentlengthSerialized != null) {
    for (final value in davGetcontentlengthSerialized) {
      builder.element('getcontentlength', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  if (davGetcontenttypeSerialized != null) {
    for (final value in davGetcontenttypeSerialized) {
      builder.element('getcontenttype', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  if (davGetetagSerialized != null) {
    for (final value in davGetetagSerialized) {
      builder.element('getetag', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  if (davGetlastmodifiedSerialized != null) {
    for (final value in davGetlastmodifiedSerialized) {
      builder.element('getlastmodified', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes;
  if (davQuotaAvailableBytesSerialized != null) {
    for (final value in davQuotaAvailableBytesSerialized) {
      builder.element('quota-available-bytes', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes;
  if (davQuotaUsedBytesSerialized != null) {
    for (final value in davQuotaUsedBytesSerialized) {
      builder.element('quota-used-bytes', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  if (davResourcetypeSerialized != null) {
    for (final value in davResourcetypeSerialized) {
      builder.element('resourcetype', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage;
  if (ncAclCanManageSerialized != null) {
    for (final value in ncAclCanManageSerialized) {
      builder.element('acl-can-manage', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled;
  if (ncAclEnabledSerialized != null) {
    for (final value in ncAclEnabledSerialized) {
      builder.element('acl-enabled', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  if (ncAclListSerialized != null) {
    for (final value in ncAclListSerialized) {
      builder.element('acl-list', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount;
  if (ncContainedFileCountSerialized != null) {
    for (final value in ncContainedFileCountSerialized) {
      builder.element('contained-file-count', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount;
  if (ncContainedFolderCountSerialized != null) {
    for (final value in ncContainedFolderCountSerialized) {
      builder.element('contained-folder-count', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  if (ncCreationTimeSerialized != null) {
    for (final value in ncCreationTimeSerialized) {
      builder.element('creation_time', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  if (ncDataFingerprintSerialized != null) {
    for (final value in ncDataFingerprintSerialized) {
      builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId;
  if (ncGroupFolderIdSerialized != null) {
    for (final value in ncGroupFolderIdSerialized) {
      builder.element('group-folder-id', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview;
  if (ncHasPreviewSerialized != null) {
    for (final value in ncHasPreviewSerialized) {
      builder.element('has-preview', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden;
  if (ncHiddenSerialized != null) {
    for (final value in ncHiddenSerialized) {
      builder.element('hidden', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  if (ncInheritedAclListSerialized != null) {
    for (final value in ncInheritedAclListSerialized) {
      builder.element('inherited-acl-list', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted;
  if (ncIsEncryptedSerialized != null) {
    for (final value in ncIsEncryptedSerialized) {
      builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot;
  if (ncIsMountRootSerialized != null) {
    for (final value in ncIsMountRootSerialized) {
      builder.element('is-mount-root', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock;
  if (ncLockSerialized != null) {
    for (final value in ncLockSerialized) {
      builder.element('lock', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  if (ncLockOwnerSerialized != null) {
    for (final value in ncLockOwnerSerialized) {
      builder.element('lock-owner', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  if (ncLockOwnerDisplaynameSerialized != null) {
    for (final value in ncLockOwnerDisplaynameSerialized) {
      builder.element('lock-owner-displayname', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  if (ncLockOwnerEditorSerialized != null) {
    for (final value in ncLockOwnerEditorSerialized) {
      builder.element('lock-owner-editor', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType;
  if (ncLockOwnerTypeSerialized != null) {
    for (final value in ncLockOwnerTypeSerialized) {
      builder.element('lock-owner-type', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  if (ncLockTimeSerialized != null) {
    for (final value in ncLockTimeSerialized) {
      builder.element('lock-time', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  if (ncLockTimeoutSerialized != null) {
    for (final value in ncLockTimeoutSerialized) {
      builder.element('lock-timeout', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  if (ncLockTokenSerialized != null) {
    for (final value in ncLockTokenSerialized) {
      builder.element('lock-token', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  if (ncMountTypeSerialized != null) {
    for (final value in ncMountTypeSerialized) {
      builder.element('mount-type', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  if (ncNoteSerialized != null) {
    for (final value in ncNoteSerialized) {
      builder.element('note', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  if (ncReminderDueDateSerialized != null) {
    for (final value in ncReminderDueDateSerialized) {
      builder.element('reminder-due-date', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  if (ncRichWorkspaceSerialized != null) {
    for (final value in ncRichWorkspaceSerialized) {
      builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile;
  if (ncRichWorkspaceFileSerialized != null) {
    for (final value in ncRichWorkspaceFileSerialized) {
      builder.element('rich-workspace-file', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  if (ncShareAttributesSerialized != null) {
    for (final value in ncShareAttributesSerialized) {
      builder.element('share-attributes', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  if (ncShareesSerialized != null) {
    for (final value in ncShareesSerialized) {
      builder.element('sharees', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  if (ncUploadTimeSerialized != null) {
    for (final value in ncUploadTimeSerialized) {
      builder.element('upload_time', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  if (ncVersionAuthorSerialized != null) {
    for (final value in ncVersionAuthorSerialized) {
      builder.element('version-author', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  if (ncVersionLabelSerialized != null) {
    for (final value in ncVersionLabelSerialized) {
      builder.element('version-label', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  if (ncMetadataBlurhashSerialized != null) {
    for (final value in ncMetadataBlurhashSerialized) {
      builder.element('metadata-blurhash', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  if (ocChecksumsSerialized != null) {
    for (final value in ocChecksumsSerialized) {
      builder.element('checksums', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount;
  if (ocCommentsCountSerialized != null) {
    for (final value in ocCommentsCountSerialized) {
      builder.element('comments-count', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  if (ocCommentsHrefSerialized != null) {
    for (final value in ocCommentsHrefSerialized) {
      builder.element('comments-href', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread;
  if (ocCommentsUnreadSerialized != null) {
    for (final value in ocCommentsUnreadSerialized) {
      builder.element('comments-unread', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  if (ocDownloadURLSerialized != null) {
    for (final value in ocDownloadURLSerialized) {
      builder.element('downloadURL', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite;
  if (ocFavoriteSerialized != null) {
    for (final value in ocFavoriteSerialized) {
      builder.element('favorite', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid;
  if (ocFileidSerialized != null) {
    for (final value in ocFileidSerialized) {
      builder.element('fileid', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  if (ocIdSerialized != null) {
    for (final value in ocIdSerialized) {
      builder.element('id', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  if (ocOwnerDisplayNameSerialized != null) {
    for (final value in ocOwnerDisplayNameSerialized) {
      builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  if (ocOwnerIdSerialized != null) {
    for (final value in ocOwnerIdSerialized) {
      builder.element('owner-id', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  if (ocPermissionsSerialized != null) {
    for (final value in ocPermissionsSerialized) {
      builder.element('permissions', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  if (ocShareTypesSerialized != null) {
    for (final value in ocShareTypesSerialized) {
      builder.element('share-types', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize;
  if (ocSizeSerialized != null) {
    for (final value in ocSizeSerialized) {
      builder.element('size', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  if (ocTagsSerialized != null) {
    for (final value in ocTagsSerialized) {
      builder.element('tags', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  if (ocmSharePermissionsSerialized != null) {
    for (final value in ocmSharePermissionsSerialized) {
      builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions;
  if (ocsSharePermissionsSerialized != null) {
    for (final value in ocsSharePermissionsSerialized) {
      builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', isSelfClosing: true,
          nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
}

void _$WebDavPropWithoutValuesBuildXmlElement(WebDavPropWithoutValues instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('prop', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropWithoutValues _$WebDavPropWithoutValuesFromXmlElement(XmlElement element) {
  final davCreationdate =
      element.getElements('creationdate', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davDisplayname =
      element.getElements('displayname', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davGetcontentlanguage =
      element.getElements('getcontentlanguage', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davGetcontentlength =
      element.getElements('getcontentlength', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davGetcontenttype =
      element.getElements('getcontenttype', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davGetetag = element.getElements('getetag', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davGetlastmodified =
      element.getElements('getlastmodified', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davQuotaAvailableBytes =
      element.getElements('quota-available-bytes', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davQuotaUsedBytes =
      element.getElements('quota-used-bytes', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davResourcetype =
      element.getElements('resourcetype', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final ncAclCanManage = element
      .getElements('acl-can-manage', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncAclEnabled = element
      .getElements('acl-enabled', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncAclList = element
      .getElements('acl-list', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncContainedFileCount = element
      .getElements('contained-file-count', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncContainedFolderCount = element
      .getElements('contained-folder-count', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncCreationTime = element
      .getElements('creation_time', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncDataFingerprint = element
      .getElements('data-fingerprint', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncGroupFolderId = element
      .getElements('group-folder-id', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncHasPreview = element
      .getElements('has-preview', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncHidden =
      element.getElements('hidden', namespace: 'http://nextcloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ncInheritedAclList = element
      .getElements('inherited-acl-list', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncIsEncrypted = element
      .getElements('is-encrypted', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncIsMountRoot = element
      .getElements('is-mount-root', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLock =
      element.getElements('lock', namespace: 'http://nextcloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ncLockOwner = element
      .getElements('lock-owner', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockOwnerDisplayname = element
      .getElements('lock-owner-displayname', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockOwnerEditor = element
      .getElements('lock-owner-editor', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockOwnerType = element
      .getElements('lock-owner-type', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockTime = element
      .getElements('lock-time', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockTimeout = element
      .getElements('lock-timeout', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncLockToken = element
      .getElements('lock-token', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncMountType = element
      .getElements('mount-type', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncNote =
      element.getElements('note', namespace: 'http://nextcloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ncReminderDueDate = element
      .getElements('reminder-due-date', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncRichWorkspace = element
      .getElements('rich-workspace', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncRichWorkspaceFile = element
      .getElements('rich-workspace-file', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncShareAttributes = element
      .getElements('share-attributes', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncSharees =
      element.getElements('sharees', namespace: 'http://nextcloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ncUploadTime = element
      .getElements('upload_time', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncVersionAuthor = element
      .getElements('version-author', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncVersionLabel = element
      .getElements('version-label', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncMetadataBlurhash = element
      .getElements('metadata-blurhash', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocChecksums = element
      .getElements('checksums', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocCommentsCount = element
      .getElements('comments-count', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocCommentsHref = element
      .getElements('comments-href', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocCommentsUnread = element
      .getElements('comments-unread', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocDownloadURL = element
      .getElements('downloadURL', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocFavorite =
      element.getElements('favorite', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocFileid =
      element.getElements('fileid', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocId =
      element.getElements('id', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocOwnerDisplayName = element
      .getElements('owner-display-name', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocOwnerId =
      element.getElements('owner-id', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocPermissions = element
      .getElements('permissions', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocShareTypes = element
      .getElements('share-types', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocSize =
      element.getElements('size', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocTags =
      element.getElements('tags', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocmSharePermissions = element
      .getElements('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocsSharePermissions = element
      .getElements('share-permissions', namespace: 'http://open-collaboration-services.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  return WebDavPropWithoutValues(
      davCreationdate: davCreationdate?.toList(),
      davDisplayname: davDisplayname?.toList(),
      davGetcontentlanguage: davGetcontentlanguage?.toList(),
      davGetcontentlength: davGetcontentlength?.toList(),
      davGetcontenttype: davGetcontenttype?.toList(),
      davGetetag: davGetetag?.toList(),
      davGetlastmodified: davGetlastmodified?.toList(),
      davQuotaAvailableBytes: davQuotaAvailableBytes?.toList(),
      davQuotaUsedBytes: davQuotaUsedBytes?.toList(),
      davResourcetype: davResourcetype?.toList(),
      ncAclCanManage: ncAclCanManage?.toList(),
      ncAclEnabled: ncAclEnabled?.toList(),
      ncAclList: ncAclList?.toList(),
      ncContainedFileCount: ncContainedFileCount?.toList(),
      ncContainedFolderCount: ncContainedFolderCount?.toList(),
      ncCreationTime: ncCreationTime?.toList(),
      ncDataFingerprint: ncDataFingerprint?.toList(),
      ncGroupFolderId: ncGroupFolderId?.toList(),
      ncHasPreview: ncHasPreview?.toList(),
      ncHidden: ncHidden?.toList(),
      ncInheritedAclList: ncInheritedAclList?.toList(),
      ncIsEncrypted: ncIsEncrypted?.toList(),
      ncIsMountRoot: ncIsMountRoot?.toList(),
      ncLock: ncLock?.toList(),
      ncLockOwner: ncLockOwner?.toList(),
      ncLockOwnerDisplayname: ncLockOwnerDisplayname?.toList(),
      ncLockOwnerEditor: ncLockOwnerEditor?.toList(),
      ncLockOwnerType: ncLockOwnerType?.toList(),
      ncLockTime: ncLockTime?.toList(),
      ncLockTimeout: ncLockTimeout?.toList(),
      ncLockToken: ncLockToken?.toList(),
      ncMountType: ncMountType?.toList(),
      ncNote: ncNote?.toList(),
      ncReminderDueDate: ncReminderDueDate?.toList(),
      ncRichWorkspace: ncRichWorkspace?.toList(),
      ncRichWorkspaceFile: ncRichWorkspaceFile?.toList(),
      ncShareAttributes: ncShareAttributes?.toList(),
      ncSharees: ncSharees?.toList(),
      ncUploadTime: ncUploadTime?.toList(),
      ncVersionAuthor: ncVersionAuthor?.toList(),
      ncVersionLabel: ncVersionLabel?.toList(),
      ncMetadataBlurhash: ncMetadataBlurhash?.toList(),
      ocChecksums: ocChecksums?.toList(),
      ocCommentsCount: ocCommentsCount?.toList(),
      ocCommentsHref: ocCommentsHref?.toList(),
      ocCommentsUnread: ocCommentsUnread?.toList(),
      ocDownloadURL: ocDownloadURL?.toList(),
      ocFavorite: ocFavorite?.toList(),
      ocFileid: ocFileid?.toList(),
      ocId: ocId?.toList(),
      ocOwnerDisplayName: ocOwnerDisplayName?.toList(),
      ocOwnerId: ocOwnerId?.toList(),
      ocPermissions: ocPermissions?.toList(),
      ocShareTypes: ocShareTypes?.toList(),
      ocSize: ocSize?.toList(),
      ocTags: ocTags?.toList(),
      ocmSharePermissions: ocmSharePermissions?.toList(),
      ocsSharePermissions: ocsSharePermissions?.toList());
}

List<XmlAttribute> _$WebDavPropWithoutValuesToXmlAttributes(WebDavPropWithoutValues instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropWithoutValuesToXmlChildren(WebDavPropWithoutValues instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  final davCreationdateConstructed = davCreationdateSerialized
      ?.map((e) => XmlElement(XmlName('creationdate', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davCreationdateConstructed != null) {
    children.addAll(davCreationdateConstructed);
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  final davDisplaynameConstructed = davDisplaynameSerialized
      ?.map((e) => XmlElement(XmlName('displayname', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davDisplaynameConstructed != null) {
    children.addAll(davDisplaynameConstructed);
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  final davGetcontentlanguageConstructed = davGetcontentlanguageSerialized?.map(
      (e) => XmlElement(XmlName('getcontentlanguage', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davGetcontentlanguageConstructed != null) {
    children.addAll(davGetcontentlanguageConstructed);
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength;
  final davGetcontentlengthConstructed = davGetcontentlengthSerialized?.map(
      (e) => XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davGetcontentlengthConstructed != null) {
    children.addAll(davGetcontentlengthConstructed);
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  final davGetcontenttypeConstructed = davGetcontenttypeSerialized
      ?.map((e) => XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davGetcontenttypeConstructed != null) {
    children.addAll(davGetcontenttypeConstructed);
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  final davGetetagConstructed = davGetetagSerialized
      ?.map((e) => XmlElement(XmlName('getetag', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davGetetagConstructed != null) {
    children.addAll(davGetetagConstructed);
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  final davGetlastmodifiedConstructed = davGetlastmodifiedSerialized
      ?.map((e) => XmlElement(XmlName('getlastmodified', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davGetlastmodifiedConstructed != null) {
    children.addAll(davGetlastmodifiedConstructed);
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes;
  final davQuotaAvailableBytesConstructed = davQuotaAvailableBytesSerialized?.map(
      (e) => XmlElement(XmlName('quota-available-bytes', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davQuotaAvailableBytesConstructed != null) {
    children.addAll(davQuotaAvailableBytesConstructed);
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes;
  final davQuotaUsedBytesConstructed = davQuotaUsedBytesSerialized?.map(
      (e) => XmlElement(XmlName('quota-used-bytes', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davQuotaUsedBytesConstructed != null) {
    children.addAll(davQuotaUsedBytesConstructed);
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  final davResourcetypeConstructed = davResourcetypeSerialized
      ?.map((e) => XmlElement(XmlName('resourcetype', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davResourcetypeConstructed != null) {
    children.addAll(davResourcetypeConstructed);
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage;
  final ncAclCanManageConstructed = ncAclCanManageSerialized?.map((e) => XmlElement(
      XmlName('acl-can-manage', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncAclCanManageConstructed != null) {
    children.addAll(ncAclCanManageConstructed);
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled;
  final ncAclEnabledConstructed = ncAclEnabledSerialized?.map((e) => XmlElement(
      XmlName('acl-enabled', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncAclEnabledConstructed != null) {
    children.addAll(ncAclEnabledConstructed);
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  final ncAclListConstructed = ncAclListSerialized?.map((e) =>
      XmlElement(XmlName('acl-list', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncAclListConstructed != null) {
    children.addAll(ncAclListConstructed);
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount;
  final ncContainedFileCountConstructed = ncContainedFileCountSerialized?.map((e) => XmlElement(
      XmlName('contained-file-count', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncContainedFileCountConstructed != null) {
    children.addAll(ncContainedFileCountConstructed);
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount;
  final ncContainedFolderCountConstructed = ncContainedFolderCountSerialized?.map((e) => XmlElement(
      XmlName('contained-folder-count', namespaces['http://nextcloud.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ncContainedFolderCountConstructed != null) {
    children.addAll(ncContainedFolderCountConstructed);
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  final ncCreationTimeConstructed = ncCreationTimeSerialized?.map((e) => XmlElement(
      XmlName('creation_time', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncCreationTimeConstructed != null) {
    children.addAll(ncCreationTimeConstructed);
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  final ncDataFingerprintConstructed = ncDataFingerprintSerialized?.map((e) => XmlElement(
      XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncDataFingerprintConstructed != null) {
    children.addAll(ncDataFingerprintConstructed);
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId;
  final ncGroupFolderIdConstructed = ncGroupFolderIdSerialized?.map((e) => XmlElement(
      XmlName('group-folder-id', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncGroupFolderIdConstructed != null) {
    children.addAll(ncGroupFolderIdConstructed);
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview;
  final ncHasPreviewConstructed = ncHasPreviewSerialized?.map((e) => XmlElement(
      XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncHasPreviewConstructed != null) {
    children.addAll(ncHasPreviewConstructed);
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden;
  final ncHiddenConstructed = ncHiddenSerialized?.map((e) =>
      XmlElement(XmlName('hidden', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncHiddenConstructed != null) {
    children.addAll(ncHiddenConstructed);
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  final ncInheritedAclListConstructed = ncInheritedAclListSerialized?.map((e) => XmlElement(
      XmlName('inherited-acl-list', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncInheritedAclListConstructed != null) {
    children.addAll(ncInheritedAclListConstructed);
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted;
  final ncIsEncryptedConstructed = ncIsEncryptedSerialized?.map((e) => XmlElement(
      XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncIsEncryptedConstructed != null) {
    children.addAll(ncIsEncryptedConstructed);
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot;
  final ncIsMountRootConstructed = ncIsMountRootSerialized?.map((e) => XmlElement(
      XmlName('is-mount-root', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncIsMountRootConstructed != null) {
    children.addAll(ncIsMountRootConstructed);
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock;
  final ncLockConstructed = ncLockSerialized?.map((e) =>
      XmlElement(XmlName('lock', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockConstructed != null) {
    children.addAll(ncLockConstructed);
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  final ncLockOwnerConstructed = ncLockOwnerSerialized?.map((e) => XmlElement(
      XmlName('lock-owner', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockOwnerConstructed != null) {
    children.addAll(ncLockOwnerConstructed);
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameConstructed = ncLockOwnerDisplaynameSerialized?.map((e) => XmlElement(
      XmlName('lock-owner-displayname', namespaces['http://nextcloud.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ncLockOwnerDisplaynameConstructed != null) {
    children.addAll(ncLockOwnerDisplaynameConstructed);
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  final ncLockOwnerEditorConstructed = ncLockOwnerEditorSerialized?.map((e) => XmlElement(
      XmlName('lock-owner-editor', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockOwnerEditorConstructed != null) {
    children.addAll(ncLockOwnerEditorConstructed);
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType;
  final ncLockOwnerTypeConstructed = ncLockOwnerTypeSerialized?.map((e) => XmlElement(
      XmlName('lock-owner-type', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockOwnerTypeConstructed != null) {
    children.addAll(ncLockOwnerTypeConstructed);
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  final ncLockTimeConstructed = ncLockTimeSerialized?.map((e) =>
      XmlElement(XmlName('lock-time', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockTimeConstructed != null) {
    children.addAll(ncLockTimeConstructed);
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  final ncLockTimeoutConstructed = ncLockTimeoutSerialized?.map((e) => XmlElement(
      XmlName('lock-timeout', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockTimeoutConstructed != null) {
    children.addAll(ncLockTimeoutConstructed);
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  final ncLockTokenConstructed = ncLockTokenSerialized?.map((e) => XmlElement(
      XmlName('lock-token', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncLockTokenConstructed != null) {
    children.addAll(ncLockTokenConstructed);
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  final ncMountTypeConstructed = ncMountTypeSerialized?.map((e) => XmlElement(
      XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncMountTypeConstructed != null) {
    children.addAll(ncMountTypeConstructed);
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  final ncNoteConstructed = ncNoteSerialized?.map((e) =>
      XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncNoteConstructed != null) {
    children.addAll(ncNoteConstructed);
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  final ncReminderDueDateConstructed = ncReminderDueDateSerialized?.map((e) => XmlElement(
      XmlName('reminder-due-date', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncReminderDueDateConstructed != null) {
    children.addAll(ncReminderDueDateConstructed);
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  final ncRichWorkspaceConstructed = ncRichWorkspaceSerialized?.map((e) => XmlElement(
      XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncRichWorkspaceConstructed != null) {
    children.addAll(ncRichWorkspaceConstructed);
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile;
  final ncRichWorkspaceFileConstructed = ncRichWorkspaceFileSerialized?.map((e) => XmlElement(
      XmlName('rich-workspace-file', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncRichWorkspaceFileConstructed != null) {
    children.addAll(ncRichWorkspaceFileConstructed);
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  final ncShareAttributesConstructed = ncShareAttributesSerialized?.map((e) => XmlElement(
      XmlName('share-attributes', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncShareAttributesConstructed != null) {
    children.addAll(ncShareAttributesConstructed);
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  final ncShareesConstructed = ncShareesSerialized?.map((e) =>
      XmlElement(XmlName('sharees', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncShareesConstructed != null) {
    children.addAll(ncShareesConstructed);
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  final ncUploadTimeConstructed = ncUploadTimeSerialized?.map((e) => XmlElement(
      XmlName('upload_time', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncUploadTimeConstructed != null) {
    children.addAll(ncUploadTimeConstructed);
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  final ncVersionAuthorConstructed = ncVersionAuthorSerialized?.map((e) => XmlElement(
      XmlName('version-author', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncVersionAuthorConstructed != null) {
    children.addAll(ncVersionAuthorConstructed);
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  final ncVersionLabelConstructed = ncVersionLabelSerialized?.map((e) => XmlElement(
      XmlName('version-label', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncVersionLabelConstructed != null) {
    children.addAll(ncVersionLabelConstructed);
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  final ncMetadataBlurhashConstructed = ncMetadataBlurhashSerialized?.map((e) => XmlElement(
      XmlName('metadata-blurhash', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncMetadataBlurhashConstructed != null) {
    children.addAll(ncMetadataBlurhashConstructed);
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  final ocChecksumsConstructed = ocChecksumsSerialized?.map((e) =>
      XmlElement(XmlName('checksums', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocChecksumsConstructed != null) {
    children.addAll(ocChecksumsConstructed);
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount;
  final ocCommentsCountConstructed = ocCommentsCountSerialized?.map((e) => XmlElement(
      XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocCommentsCountConstructed != null) {
    children.addAll(ocCommentsCountConstructed);
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  final ocCommentsHrefConstructed = ocCommentsHrefSerialized?.map((e) => XmlElement(
      XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocCommentsHrefConstructed != null) {
    children.addAll(ocCommentsHrefConstructed);
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread;
  final ocCommentsUnreadConstructed = ocCommentsUnreadSerialized?.map((e) => XmlElement(
      XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocCommentsUnreadConstructed != null) {
    children.addAll(ocCommentsUnreadConstructed);
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  final ocDownloadURLConstructed = ocDownloadURLSerialized?.map((e) => XmlElement(
      XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocDownloadURLConstructed != null) {
    children.addAll(ocDownloadURLConstructed);
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite;
  final ocFavoriteConstructed = ocFavoriteSerialized?.map((e) =>
      XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocFavoriteConstructed != null) {
    children.addAll(ocFavoriteConstructed);
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid;
  final ocFileidConstructed = ocFileidSerialized?.map((e) =>
      XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocFileidConstructed != null) {
    children.addAll(ocFileidConstructed);
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  final ocIdConstructed = ocIdSerialized?.map(
      (e) => XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocIdConstructed != null) {
    children.addAll(ocIdConstructed);
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  final ocOwnerDisplayNameConstructed = ocOwnerDisplayNameSerialized?.map((e) => XmlElement(
      XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocOwnerDisplayNameConstructed != null) {
    children.addAll(ocOwnerDisplayNameConstructed);
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  final ocOwnerIdConstructed = ocOwnerIdSerialized?.map((e) =>
      XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocOwnerIdConstructed != null) {
    children.addAll(ocOwnerIdConstructed);
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  final ocPermissionsConstructed = ocPermissionsSerialized?.map((e) => XmlElement(
      XmlName('permissions', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocPermissionsConstructed != null) {
    children.addAll(ocPermissionsConstructed);
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  final ocShareTypesConstructed = ocShareTypesSerialized?.map((e) => XmlElement(
      XmlName('share-types', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocShareTypesConstructed != null) {
    children.addAll(ocShareTypesConstructed);
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize;
  final ocSizeConstructed = ocSizeSerialized?.map((e) =>
      XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocSizeConstructed != null) {
    children.addAll(ocSizeConstructed);
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  final ocTagsConstructed = ocTagsSerialized?.map((e) =>
      XmlElement(XmlName('tags', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocTagsConstructed != null) {
    children.addAll(ocTagsConstructed);
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  final ocmSharePermissionsConstructed = ocmSharePermissionsSerialized?.map((e) => XmlElement(
      XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ocmSharePermissionsConstructed != null) {
    children.addAll(ocmSharePermissionsConstructed);
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions;
  final ocsSharePermissionsConstructed = ocsSharePermissionsSerialized?.map((e) => XmlElement(
      XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ocsSharePermissionsConstructed != null) {
    children.addAll(ocsSharePermissionsConstructed);
  }
  return children;
}

XmlElement _$WebDavPropWithoutValuesToXmlElement(WebDavPropWithoutValues instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('prop', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropWithoutValuesXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropWithoutValuesBuildXmlChildren(this as WebDavPropWithoutValues, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropWithoutValuesBuildXmlElement(this as WebDavPropWithoutValues, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropWithoutValuesToXmlAttributes(this as WebDavPropWithoutValues, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropWithoutValuesToXmlChildren(this as WebDavPropWithoutValues, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropWithoutValuesToXmlElement(this as WebDavPropWithoutValues, namespaces: namespaces);
}

void _$WebDavPropBuildXmlChildren(WebDavProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  if (davCreationdateSerialized != null) {
    builder.element('creationdate', namespace: 'DAV:', nest: () {
      const ISO8601XMLConverter().buildXmlChildren(davCreationdateSerialized, builder, namespaces: namespaces);
    });
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  if (davDisplaynameSerialized != null) {
    builder.element('displayname', namespace: 'DAV:', nest: () {
      builder.text(davDisplaynameSerialized);
    });
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  if (davGetcontentlanguageSerialized != null) {
    builder.element('getcontentlanguage', namespace: 'DAV:', nest: () {
      builder.text(davGetcontentlanguageSerialized);
    });
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength?.toString();
  if (davGetcontentlengthSerialized != null) {
    builder.element('getcontentlength', namespace: 'DAV:', nest: () {
      builder.text(davGetcontentlengthSerialized);
    });
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  if (davGetcontenttypeSerialized != null) {
    builder.element('getcontenttype', namespace: 'DAV:', nest: () {
      builder.text(davGetcontenttypeSerialized);
    });
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  if (davGetetagSerialized != null) {
    builder.element('getetag', namespace: 'DAV:', nest: () {
      builder.text(davGetetagSerialized);
    });
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  if (davGetlastmodifiedSerialized != null) {
    builder.element('getlastmodified', namespace: 'DAV:', nest: () {
      const HttpDateXMLConverter().buildXmlChildren(davGetlastmodifiedSerialized, builder, namespaces: namespaces);
    });
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes?.toString();
  if (davQuotaAvailableBytesSerialized != null) {
    builder.element('quota-available-bytes', namespace: 'DAV:', nest: () {
      builder.text(davQuotaAvailableBytesSerialized);
    });
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes?.toString();
  if (davQuotaUsedBytesSerialized != null) {
    builder.element('quota-used-bytes', namespace: 'DAV:', nest: () {
      builder.text(davQuotaUsedBytesSerialized);
    });
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  if (davResourcetypeSerialized != null) {
    builder.element('resourcetype', namespace: 'DAV:', nest: () {
      davResourcetypeSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage != null
      ? ncAclCanManage == true
          ? 'true'
          : 'false'
      : null;
  if (ncAclCanManageSerialized != null) {
    builder.element('acl-can-manage', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncAclCanManageSerialized);
    });
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled != null
      ? ncAclEnabled == true
          ? 'true'
          : 'false'
      : null;
  if (ncAclEnabledSerialized != null) {
    builder.element('acl-enabled', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncAclEnabledSerialized);
    });
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  if (ncAclListSerialized != null) {
    builder.element('acl-list', namespace: 'http://nextcloud.org/ns', nest: () {
      ncAclListSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount?.toString();
  if (ncContainedFileCountSerialized != null) {
    builder.element('contained-file-count', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncContainedFileCountSerialized);
    });
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount?.toString();
  if (ncContainedFolderCountSerialized != null) {
    builder.element('contained-folder-count', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncContainedFolderCountSerialized);
    });
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  if (ncCreationTimeSerialized != null) {
    builder.element('creation_time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncCreationTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  if (ncDataFingerprintSerialized != null) {
    builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncDataFingerprintSerialized);
    });
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId?.toString();
  if (ncGroupFolderIdSerialized != null) {
    builder.element('group-folder-id', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncGroupFolderIdSerialized);
    });
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview != null
      ? ncHasPreview == true
          ? 'true'
          : 'false'
      : null;
  if (ncHasPreviewSerialized != null) {
    builder.element('has-preview', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncHasPreviewSerialized);
    });
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden != null
      ? ncHidden == true
          ? 'true'
          : 'false'
      : null;
  if (ncHiddenSerialized != null) {
    builder.element('hidden', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncHiddenSerialized);
    });
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  if (ncInheritedAclListSerialized != null) {
    builder.element('inherited-acl-list', namespace: 'http://nextcloud.org/ns', nest: () {
      ncInheritedAclListSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted != null
      ? ncIsEncrypted == true
          ? 'true'
          : 'false'
      : null;
  if (ncIsEncryptedSerialized != null) {
    builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncIsEncryptedSerialized);
    });
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot != null
      ? ncIsMountRoot == true
          ? 'true'
          : 'false'
      : null;
  if (ncIsMountRootSerialized != null) {
    builder.element('is-mount-root', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncIsMountRootSerialized);
    });
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock != null
      ? ncLock == true
          ? 'true'
          : 'false'
      : null;
  if (ncLockSerialized != null) {
    builder.element('lock', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockSerialized);
    });
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  if (ncLockOwnerSerialized != null) {
    builder.element('lock-owner', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerSerialized);
    });
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  if (ncLockOwnerDisplaynameSerialized != null) {
    builder.element('lock-owner-displayname', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerDisplaynameSerialized);
    });
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  if (ncLockOwnerEditorSerialized != null) {
    builder.element('lock-owner-editor', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerEditorSerialized);
    });
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType?.toString();
  if (ncLockOwnerTypeSerialized != null) {
    builder.element('lock-owner-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerTypeSerialized);
    });
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  if (ncLockTimeSerialized != null) {
    builder.element('lock-time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncLockTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  if (ncLockTimeoutSerialized != null) {
    builder.element('lock-timeout', namespace: 'http://nextcloud.org/ns', nest: () {
      const DurationXMLConverter().buildXmlChildren(ncLockTimeoutSerialized, builder, namespaces: namespaces);
    });
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  if (ncLockTokenSerialized != null) {
    builder.element('lock-token', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockTokenSerialized);
    });
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  if (ncMountTypeSerialized != null) {
    builder.element('mount-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncMountTypeSerialized);
    });
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  if (ncNoteSerialized != null) {
    builder.element('note', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncNoteSerialized);
    });
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  if (ncReminderDueDateSerialized != null) {
    builder.element('reminder-due-date', namespace: 'http://nextcloud.org/ns', nest: () {
      const ISO8601XMLConverter().buildXmlChildren(ncReminderDueDateSerialized, builder, namespaces: namespaces);
    });
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  if (ncRichWorkspaceSerialized != null) {
    builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncRichWorkspaceSerialized);
    });
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile?.toString();
  if (ncRichWorkspaceFileSerialized != null) {
    builder.element('rich-workspace-file', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncRichWorkspaceFileSerialized);
    });
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  if (ncShareAttributesSerialized != null) {
    builder.element('share-attributes', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncShareAttributesSerialized);
    });
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  if (ncShareesSerialized != null) {
    builder.element('sharees', namespace: 'http://nextcloud.org/ns', nest: () {
      ncShareesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  if (ncUploadTimeSerialized != null) {
    builder.element('upload_time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncUploadTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  if (ncVersionAuthorSerialized != null) {
    builder.element('version-author', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncVersionAuthorSerialized);
    });
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  if (ncVersionLabelSerialized != null) {
    builder.element('version-label', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncVersionLabelSerialized);
    });
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  if (ncMetadataBlurhashSerialized != null) {
    builder.element('metadata-blurhash', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncMetadataBlurhashSerialized);
    });
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  if (ocChecksumsSerialized != null) {
    builder.element('checksums', namespace: 'http://owncloud.org/ns', nest: () {
      ocChecksumsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount?.toString();
  if (ocCommentsCountSerialized != null) {
    builder.element('comments-count', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsCountSerialized);
    });
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  if (ocCommentsHrefSerialized != null) {
    builder.element('comments-href', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsHrefSerialized);
    });
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread?.toString();
  if (ocCommentsUnreadSerialized != null) {
    builder.element('comments-unread', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsUnreadSerialized);
    });
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  if (ocDownloadURLSerialized != null) {
    builder.element('downloadURL', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocDownloadURLSerialized);
    });
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite != null
      ? ocFavorite == true
          ? 'true'
          : 'false'
      : null;
  if (ocFavoriteSerialized != null) {
    builder.element('favorite', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocFavoriteSerialized);
    });
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid?.toString();
  if (ocFileidSerialized != null) {
    builder.element('fileid', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocFileidSerialized);
    });
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  if (ocIdSerialized != null) {
    builder.element('id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocIdSerialized);
    });
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  if (ocOwnerDisplayNameSerialized != null) {
    builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocOwnerDisplayNameSerialized);
    });
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  if (ocOwnerIdSerialized != null) {
    builder.element('owner-id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocOwnerIdSerialized);
    });
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  if (ocPermissionsSerialized != null) {
    builder.element('permissions', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocPermissionsSerialized);
    });
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  if (ocShareTypesSerialized != null) {
    builder.element('share-types', namespace: 'http://owncloud.org/ns', nest: () {
      ocShareTypesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize?.toString();
  if (ocSizeSerialized != null) {
    builder.element('size', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocSizeSerialized);
    });
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  if (ocTagsSerialized != null) {
    builder.element('tags', namespace: 'http://owncloud.org/ns', nest: () {
      ocTagsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  if (ocmSharePermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', nest: () {
      builder.text(ocmSharePermissionsSerialized);
    });
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions?.toString();
  if (ocsSharePermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', nest: () {
      builder.text(ocsSharePermissionsSerialized);
    });
  }
}

void _$WebDavPropBuildXmlElement(WebDavProp instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
  builder.element('prop', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavProp _$WebDavPropFromXmlElement(XmlElement element) {
  final davCreationdate = element.getElement('creationdate', namespace: 'DAV:');
  final davDisplayname = element.getElement('displayname', namespace: 'DAV:')?.getText();
  final davGetcontentlanguage = element.getElement('getcontentlanguage', namespace: 'DAV:')?.getText();
  final davGetcontentlength = element.getElement('getcontentlength', namespace: 'DAV:')?.getText();
  final davGetcontenttype = element.getElement('getcontenttype', namespace: 'DAV:')?.getText();
  final davGetetag = element.getElement('getetag', namespace: 'DAV:')?.getText();
  final davGetlastmodified = element.getElement('getlastmodified', namespace: 'DAV:');
  final davQuotaAvailableBytes = element.getElement('quota-available-bytes', namespace: 'DAV:')?.getText();
  final davQuotaUsedBytes = element.getElement('quota-used-bytes', namespace: 'DAV:')?.getText();
  final davResourcetype = element.getElement('resourcetype', namespace: 'DAV:');
  final ncAclCanManage = element.getElement('acl-can-manage', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncAclEnabled = element.getElement('acl-enabled', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncAclList = element.getElement('acl-list', namespace: 'http://nextcloud.org/ns');
  final ncContainedFileCount =
      element.getElement('contained-file-count', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncContainedFolderCount =
      element.getElement('contained-folder-count', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncCreationTime = element.getElement('creation_time', namespace: 'http://nextcloud.org/ns');
  final ncDataFingerprint = element.getElement('data-fingerprint', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncGroupFolderId = element.getElement('group-folder-id', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncHasPreview = element.getElement('has-preview', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncHidden = element.getElement('hidden', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncInheritedAclList = element.getElement('inherited-acl-list', namespace: 'http://nextcloud.org/ns');
  final ncIsEncrypted = element.getElement('is-encrypted', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncIsMountRoot = element.getElement('is-mount-root', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLock = element.getElement('lock', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwner = element.getElement('lock-owner', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerDisplayname =
      element.getElement('lock-owner-displayname', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerEditor = element.getElement('lock-owner-editor', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerType = element.getElement('lock-owner-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockTime = element.getElement('lock-time', namespace: 'http://nextcloud.org/ns');
  final ncLockTimeout = element.getElement('lock-timeout', namespace: 'http://nextcloud.org/ns');
  final ncLockToken = element.getElement('lock-token', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncMountType = element.getElement('mount-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncNote = element.getElement('note', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncReminderDueDate = element.getElement('reminder-due-date', namespace: 'http://nextcloud.org/ns');
  final ncRichWorkspace = element.getElement('rich-workspace', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncRichWorkspaceFile =
      element.getElement('rich-workspace-file', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncShareAttributes = element.getElement('share-attributes', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncSharees = element.getElement('sharees', namespace: 'http://nextcloud.org/ns');
  final ncUploadTime = element.getElement('upload_time', namespace: 'http://nextcloud.org/ns');
  final ncVersionAuthor = element.getElement('version-author', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncVersionLabel = element.getElement('version-label', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncMetadataBlurhash = element.getElement('metadata-blurhash', namespace: 'http://nextcloud.org/ns')?.getText();
  final ocChecksums = element.getElement('checksums', namespace: 'http://owncloud.org/ns');
  final ocCommentsCount = element.getElement('comments-count', namespace: 'http://owncloud.org/ns')?.getText();
  final ocCommentsHref = element.getElement('comments-href', namespace: 'http://owncloud.org/ns')?.getText();
  final ocCommentsUnread = element.getElement('comments-unread', namespace: 'http://owncloud.org/ns')?.getText();
  final ocDownloadURL = element.getElement('downloadURL', namespace: 'http://owncloud.org/ns')?.getText();
  final ocFavorite = element.getElement('favorite', namespace: 'http://owncloud.org/ns')?.getText();
  final ocFileid = element.getElement('fileid', namespace: 'http://owncloud.org/ns')?.getText();
  final ocId = element.getElement('id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocOwnerDisplayName = element.getElement('owner-display-name', namespace: 'http://owncloud.org/ns')?.getText();
  final ocOwnerId = element.getElement('owner-id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocPermissions = element.getElement('permissions', namespace: 'http://owncloud.org/ns')?.getText();
  final ocShareTypes = element.getElement('share-types', namespace: 'http://owncloud.org/ns');
  final ocSize = element.getElement('size', namespace: 'http://owncloud.org/ns')?.getText();
  final ocTags = element.getElement('tags', namespace: 'http://owncloud.org/ns');
  final ocmSharePermissions =
      element.getElement('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')?.getText();
  final ocsSharePermissions =
      element.getElement('share-permissions', namespace: 'http://open-collaboration-services.org/ns')?.getText();
  return WebDavProp(
      davCreationdate: davCreationdate != null ? const ISO8601XMLConverter().fromXmlElement(davCreationdate) : null,
      davDisplayname: davDisplayname,
      davGetcontentlanguage: davGetcontentlanguage,
      davGetcontentlength: davGetcontentlength != null ? int.parse(davGetcontentlength) : null,
      davGetcontenttype: davGetcontenttype,
      davGetetag: davGetetag,
      davGetlastmodified:
          davGetlastmodified != null ? const HttpDateXMLConverter().fromXmlElement(davGetlastmodified) : null,
      davQuotaAvailableBytes: davQuotaAvailableBytes != null ? int.parse(davQuotaAvailableBytes) : null,
      davQuotaUsedBytes: davQuotaUsedBytes != null ? int.parse(davQuotaUsedBytes) : null,
      davResourcetype: davResourcetype != null ? WebDavResourcetype.fromXmlElement(davResourcetype) : null,
      ncAclCanManage: ncAclCanManage != null
          ? ncAclCanManage == 'true' || ncAclCanManage == '1'
              ? true
              : ncAclCanManage == 'false' || ncAclCanManage == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncAclCanManage)
          : null,
      ncAclEnabled: ncAclEnabled != null
          ? ncAclEnabled == 'true' || ncAclEnabled == '1'
              ? true
              : ncAclEnabled == 'false' || ncAclEnabled == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncAclEnabled)
          : null,
      ncAclList: ncAclList != null ? WebDavNcAclList.fromXmlElement(ncAclList) : null,
      ncContainedFileCount: ncContainedFileCount != null ? int.parse(ncContainedFileCount) : null,
      ncContainedFolderCount: ncContainedFolderCount != null ? int.parse(ncContainedFolderCount) : null,
      ncCreationTime: ncCreationTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncCreationTime) : null,
      ncDataFingerprint: ncDataFingerprint,
      ncGroupFolderId: ncGroupFolderId != null ? int.parse(ncGroupFolderId) : null,
      ncHasPreview: ncHasPreview != null
          ? ncHasPreview == 'true' || ncHasPreview == '1'
              ? true
              : ncHasPreview == 'false' || ncHasPreview == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncHasPreview)
          : null,
      ncHidden: ncHidden != null
          ? ncHidden == 'true' || ncHidden == '1'
              ? true
              : ncHidden == 'false' || ncHidden == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncHidden)
          : null,
      ncInheritedAclList: ncInheritedAclList != null ? WebDavNcAclList.fromXmlElement(ncInheritedAclList) : null,
      ncIsEncrypted: ncIsEncrypted != null
          ? ncIsEncrypted == 'true' || ncIsEncrypted == '1'
              ? true
              : ncIsEncrypted == 'false' || ncIsEncrypted == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncIsEncrypted)
          : null,
      ncIsMountRoot: ncIsMountRoot != null
          ? ncIsMountRoot == 'true' || ncIsMountRoot == '1'
              ? true
              : ncIsMountRoot == 'false' || ncIsMountRoot == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncIsMountRoot)
          : null,
      ncLock: ncLock != null
          ? ncLock == 'true' || ncLock == '1'
              ? true
              : ncLock == 'false' || ncLock == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncLock)
          : null,
      ncLockOwner: ncLockOwner,
      ncLockOwnerDisplayname: ncLockOwnerDisplayname,
      ncLockOwnerEditor: ncLockOwnerEditor,
      ncLockOwnerType: ncLockOwnerType != null ? int.parse(ncLockOwnerType) : null,
      ncLockTime: ncLockTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncLockTime) : null,
      ncLockTimeout: ncLockTimeout != null ? const DurationXMLConverter().fromXmlElement(ncLockTimeout) : null,
      ncLockToken: ncLockToken,
      ncMountType: ncMountType,
      ncNote: ncNote,
      ncReminderDueDate:
          ncReminderDueDate != null ? const ISO8601XMLConverter().fromXmlElement(ncReminderDueDate) : null,
      ncRichWorkspace: ncRichWorkspace,
      ncRichWorkspaceFile: ncRichWorkspaceFile != null ? int.parse(ncRichWorkspaceFile) : null,
      ncShareAttributes: ncShareAttributes,
      ncSharees: ncSharees != null ? WebDavNcShareeList.fromXmlElement(ncSharees) : null,
      ncUploadTime: ncUploadTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncUploadTime) : null,
      ncVersionAuthor: ncVersionAuthor,
      ncVersionLabel: ncVersionLabel,
      ncMetadataBlurhash: ncMetadataBlurhash,
      ocChecksums: ocChecksums != null ? WebDavOcChecksums.fromXmlElement(ocChecksums) : null,
      ocCommentsCount: ocCommentsCount != null ? int.parse(ocCommentsCount) : null,
      ocCommentsHref: ocCommentsHref,
      ocCommentsUnread: ocCommentsUnread != null ? int.parse(ocCommentsUnread) : null,
      ocDownloadURL: ocDownloadURL,
      ocFavorite: ocFavorite != null
          ? ocFavorite == 'true' || ocFavorite == '1'
              ? true
              : ocFavorite == 'false' || ocFavorite == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocFavorite)
          : null,
      ocFileid: ocFileid != null ? int.parse(ocFileid) : null,
      ocId: ocId,
      ocOwnerDisplayName: ocOwnerDisplayName,
      ocOwnerId: ocOwnerId,
      ocPermissions: ocPermissions,
      ocShareTypes: ocShareTypes != null ? WebDavOcShareTypes.fromXmlElement(ocShareTypes) : null,
      ocSize: ocSize != null ? int.parse(ocSize) : null,
      ocTags: ocTags != null ? WebDavOcTags.fromXmlElement(ocTags) : null,
      ocmSharePermissions: ocmSharePermissions,
      ocsSharePermissions: ocsSharePermissions != null ? int.parse(ocsSharePermissions) : null);
}

List<XmlAttribute> _$WebDavPropToXmlAttributes(WebDavProp instance, {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropToXmlChildren(WebDavProp instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  final davCreationdateConstructed = davCreationdateSerialized != null
      ? XmlElement(
          XmlName('creationdate', namespaces['DAV:']),
          const ISO8601XMLConverter().toXmlAttributes(davCreationdateSerialized, namespaces: namespaces),
          const ISO8601XMLConverter().toXmlChildren(davCreationdateSerialized, namespaces: namespaces))
      : null;
  if (davCreationdateConstructed != null) {
    children.add(davCreationdateConstructed);
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  final davDisplaynameConstructed = davDisplaynameSerialized != null
      ? XmlElement(XmlName('displayname', namespaces['DAV:']), [], [XmlText(davDisplaynameSerialized)])
      : null;
  if (davDisplaynameConstructed != null) {
    children.add(davDisplaynameConstructed);
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  final davGetcontentlanguageConstructed = davGetcontentlanguageSerialized != null
      ? XmlElement(XmlName('getcontentlanguage', namespaces['DAV:']), [], [XmlText(davGetcontentlanguageSerialized)])
      : null;
  if (davGetcontentlanguageConstructed != null) {
    children.add(davGetcontentlanguageConstructed);
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength?.toString();
  final davGetcontentlengthConstructed = davGetcontentlengthSerialized != null
      ? XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], [XmlText(davGetcontentlengthSerialized)])
      : null;
  if (davGetcontentlengthConstructed != null) {
    children.add(davGetcontentlengthConstructed);
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  final davGetcontenttypeConstructed = davGetcontenttypeSerialized != null
      ? XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], [XmlText(davGetcontenttypeSerialized)])
      : null;
  if (davGetcontenttypeConstructed != null) {
    children.add(davGetcontenttypeConstructed);
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  final davGetetagConstructed = davGetetagSerialized != null
      ? XmlElement(XmlName('getetag', namespaces['DAV:']), [], [XmlText(davGetetagSerialized)])
      : null;
  if (davGetetagConstructed != null) {
    children.add(davGetetagConstructed);
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  final davGetlastmodifiedConstructed = davGetlastmodifiedSerialized != null
      ? XmlElement(
          XmlName('getlastmodified', namespaces['DAV:']),
          const HttpDateXMLConverter().toXmlAttributes(davGetlastmodifiedSerialized, namespaces: namespaces),
          const HttpDateXMLConverter().toXmlChildren(davGetlastmodifiedSerialized, namespaces: namespaces))
      : null;
  if (davGetlastmodifiedConstructed != null) {
    children.add(davGetlastmodifiedConstructed);
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes?.toString();
  final davQuotaAvailableBytesConstructed = davQuotaAvailableBytesSerialized != null
      ? XmlElement(
          XmlName('quota-available-bytes', namespaces['DAV:']), [], [XmlText(davQuotaAvailableBytesSerialized)])
      : null;
  if (davQuotaAvailableBytesConstructed != null) {
    children.add(davQuotaAvailableBytesConstructed);
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes?.toString();
  final davQuotaUsedBytesConstructed = davQuotaUsedBytesSerialized != null
      ? XmlElement(XmlName('quota-used-bytes', namespaces['DAV:']), [], [XmlText(davQuotaUsedBytesSerialized)])
      : null;
  if (davQuotaUsedBytesConstructed != null) {
    children.add(davQuotaUsedBytesConstructed);
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  final davResourcetypeConstructed = davResourcetypeSerialized != null
      ? XmlElement(
          XmlName('resourcetype', namespaces['DAV:']),
          davResourcetypeSerialized.toXmlAttributes(namespaces: namespaces),
          davResourcetypeSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (davResourcetypeConstructed != null) {
    children.add(davResourcetypeConstructed);
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage != null
      ? ncAclCanManage == true
          ? 'true'
          : 'false'
      : null;
  final ncAclCanManageConstructed = ncAclCanManageSerialized != null
      ? XmlElement(
          XmlName('acl-can-manage', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncAclCanManageSerialized)])
      : null;
  if (ncAclCanManageConstructed != null) {
    children.add(ncAclCanManageConstructed);
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled != null
      ? ncAclEnabled == true
          ? 'true'
          : 'false'
      : null;
  final ncAclEnabledConstructed = ncAclEnabledSerialized != null
      ? XmlElement(XmlName('acl-enabled', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncAclEnabledSerialized)])
      : null;
  if (ncAclEnabledConstructed != null) {
    children.add(ncAclEnabledConstructed);
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  final ncAclListConstructed = ncAclListSerialized != null
      ? XmlElement(
          XmlName('acl-list', namespaces['http://nextcloud.org/ns']),
          ncAclListSerialized.toXmlAttributes(namespaces: namespaces),
          ncAclListSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncAclListConstructed != null) {
    children.add(ncAclListConstructed);
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount?.toString();
  final ncContainedFileCountConstructed = ncContainedFileCountSerialized != null
      ? XmlElement(XmlName('contained-file-count', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncContainedFileCountSerialized)])
      : null;
  if (ncContainedFileCountConstructed != null) {
    children.add(ncContainedFileCountConstructed);
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount?.toString();
  final ncContainedFolderCountConstructed = ncContainedFolderCountSerialized != null
      ? XmlElement(XmlName('contained-folder-count', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncContainedFolderCountSerialized)])
      : null;
  if (ncContainedFolderCountConstructed != null) {
    children.add(ncContainedFolderCountConstructed);
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  final ncCreationTimeConstructed = ncCreationTimeSerialized != null
      ? XmlElement(
          XmlName('creation_time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncCreationTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncCreationTimeSerialized, namespaces: namespaces))
      : null;
  if (ncCreationTimeConstructed != null) {
    children.add(ncCreationTimeConstructed);
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  final ncDataFingerprintConstructed = ncDataFingerprintSerialized != null
      ? XmlElement(XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncDataFingerprintSerialized)])
      : null;
  if (ncDataFingerprintConstructed != null) {
    children.add(ncDataFingerprintConstructed);
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId?.toString();
  final ncGroupFolderIdConstructed = ncGroupFolderIdSerialized != null
      ? XmlElement(
          XmlName('group-folder-id', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncGroupFolderIdSerialized)])
      : null;
  if (ncGroupFolderIdConstructed != null) {
    children.add(ncGroupFolderIdConstructed);
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview != null
      ? ncHasPreview == true
          ? 'true'
          : 'false'
      : null;
  final ncHasPreviewConstructed = ncHasPreviewSerialized != null
      ? XmlElement(XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncHasPreviewSerialized)])
      : null;
  if (ncHasPreviewConstructed != null) {
    children.add(ncHasPreviewConstructed);
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden != null
      ? ncHidden == true
          ? 'true'
          : 'false'
      : null;
  final ncHiddenConstructed = ncHiddenSerialized != null
      ? XmlElement(XmlName('hidden', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncHiddenSerialized)])
      : null;
  if (ncHiddenConstructed != null) {
    children.add(ncHiddenConstructed);
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  final ncInheritedAclListConstructed = ncInheritedAclListSerialized != null
      ? XmlElement(
          XmlName('inherited-acl-list', namespaces['http://nextcloud.org/ns']),
          ncInheritedAclListSerialized.toXmlAttributes(namespaces: namespaces),
          ncInheritedAclListSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncInheritedAclListConstructed != null) {
    children.add(ncInheritedAclListConstructed);
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted != null
      ? ncIsEncrypted == true
          ? 'true'
          : 'false'
      : null;
  final ncIsEncryptedConstructed = ncIsEncryptedSerialized != null
      ? XmlElement(
          XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncIsEncryptedSerialized)])
      : null;
  if (ncIsEncryptedConstructed != null) {
    children.add(ncIsEncryptedConstructed);
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot != null
      ? ncIsMountRoot == true
          ? 'true'
          : 'false'
      : null;
  final ncIsMountRootConstructed = ncIsMountRootSerialized != null
      ? XmlElement(
          XmlName('is-mount-root', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncIsMountRootSerialized)])
      : null;
  if (ncIsMountRootConstructed != null) {
    children.add(ncIsMountRootConstructed);
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock != null
      ? ncLock == true
          ? 'true'
          : 'false'
      : null;
  final ncLockConstructed = ncLockSerialized != null
      ? XmlElement(XmlName('lock', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockSerialized)])
      : null;
  if (ncLockConstructed != null) {
    children.add(ncLockConstructed);
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  final ncLockOwnerConstructed = ncLockOwnerSerialized != null
      ? XmlElement(XmlName('lock-owner', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockOwnerSerialized)])
      : null;
  if (ncLockOwnerConstructed != null) {
    children.add(ncLockOwnerConstructed);
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameConstructed = ncLockOwnerDisplaynameSerialized != null
      ? XmlElement(XmlName('lock-owner-displayname', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncLockOwnerDisplaynameSerialized)])
      : null;
  if (ncLockOwnerDisplaynameConstructed != null) {
    children.add(ncLockOwnerDisplaynameConstructed);
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  final ncLockOwnerEditorConstructed = ncLockOwnerEditorSerialized != null
      ? XmlElement(XmlName('lock-owner-editor', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncLockOwnerEditorSerialized)])
      : null;
  if (ncLockOwnerEditorConstructed != null) {
    children.add(ncLockOwnerEditorConstructed);
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType?.toString();
  final ncLockOwnerTypeConstructed = ncLockOwnerTypeSerialized != null
      ? XmlElement(
          XmlName('lock-owner-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockOwnerTypeSerialized)])
      : null;
  if (ncLockOwnerTypeConstructed != null) {
    children.add(ncLockOwnerTypeConstructed);
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  final ncLockTimeConstructed = ncLockTimeSerialized != null
      ? XmlElement(
          XmlName('lock-time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncLockTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncLockTimeSerialized, namespaces: namespaces))
      : null;
  if (ncLockTimeConstructed != null) {
    children.add(ncLockTimeConstructed);
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  final ncLockTimeoutConstructed = ncLockTimeoutSerialized != null
      ? XmlElement(
          XmlName('lock-timeout', namespaces['http://nextcloud.org/ns']),
          const DurationXMLConverter().toXmlAttributes(ncLockTimeoutSerialized, namespaces: namespaces),
          const DurationXMLConverter().toXmlChildren(ncLockTimeoutSerialized, namespaces: namespaces))
      : null;
  if (ncLockTimeoutConstructed != null) {
    children.add(ncLockTimeoutConstructed);
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  final ncLockTokenConstructed = ncLockTokenSerialized != null
      ? XmlElement(XmlName('lock-token', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockTokenSerialized)])
      : null;
  if (ncLockTokenConstructed != null) {
    children.add(ncLockTokenConstructed);
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  final ncMountTypeConstructed = ncMountTypeSerialized != null
      ? XmlElement(XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncMountTypeSerialized)])
      : null;
  if (ncMountTypeConstructed != null) {
    children.add(ncMountTypeConstructed);
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  final ncNoteConstructed = ncNoteSerialized != null
      ? XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncNoteSerialized)])
      : null;
  if (ncNoteConstructed != null) {
    children.add(ncNoteConstructed);
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  final ncReminderDueDateConstructed = ncReminderDueDateSerialized != null
      ? XmlElement(
          XmlName('reminder-due-date', namespaces['http://nextcloud.org/ns']),
          const ISO8601XMLConverter().toXmlAttributes(ncReminderDueDateSerialized, namespaces: namespaces),
          const ISO8601XMLConverter().toXmlChildren(ncReminderDueDateSerialized, namespaces: namespaces))
      : null;
  if (ncReminderDueDateConstructed != null) {
    children.add(ncReminderDueDateConstructed);
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  final ncRichWorkspaceConstructed = ncRichWorkspaceSerialized != null
      ? XmlElement(
          XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncRichWorkspaceSerialized)])
      : null;
  if (ncRichWorkspaceConstructed != null) {
    children.add(ncRichWorkspaceConstructed);
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile?.toString();
  final ncRichWorkspaceFileConstructed = ncRichWorkspaceFileSerialized != null
      ? XmlElement(XmlName('rich-workspace-file', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncRichWorkspaceFileSerialized)])
      : null;
  if (ncRichWorkspaceFileConstructed != null) {
    children.add(ncRichWorkspaceFileConstructed);
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  final ncShareAttributesConstructed = ncShareAttributesSerialized != null
      ? XmlElement(XmlName('share-attributes', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncShareAttributesSerialized)])
      : null;
  if (ncShareAttributesConstructed != null) {
    children.add(ncShareAttributesConstructed);
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  final ncShareesConstructed = ncShareesSerialized != null
      ? XmlElement(
          XmlName('sharees', namespaces['http://nextcloud.org/ns']),
          ncShareesSerialized.toXmlAttributes(namespaces: namespaces),
          ncShareesSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncShareesConstructed != null) {
    children.add(ncShareesConstructed);
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  final ncUploadTimeConstructed = ncUploadTimeSerialized != null
      ? XmlElement(
          XmlName('upload_time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncUploadTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncUploadTimeSerialized, namespaces: namespaces))
      : null;
  if (ncUploadTimeConstructed != null) {
    children.add(ncUploadTimeConstructed);
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  final ncVersionAuthorConstructed = ncVersionAuthorSerialized != null
      ? XmlElement(
          XmlName('version-author', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncVersionAuthorSerialized)])
      : null;
  if (ncVersionAuthorConstructed != null) {
    children.add(ncVersionAuthorConstructed);
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  final ncVersionLabelConstructed = ncVersionLabelSerialized != null
      ? XmlElement(
          XmlName('version-label', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncVersionLabelSerialized)])
      : null;
  if (ncVersionLabelConstructed != null) {
    children.add(ncVersionLabelConstructed);
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  final ncMetadataBlurhashConstructed = ncMetadataBlurhashSerialized != null
      ? XmlElement(XmlName('metadata-blurhash', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncMetadataBlurhashSerialized)])
      : null;
  if (ncMetadataBlurhashConstructed != null) {
    children.add(ncMetadataBlurhashConstructed);
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  final ocChecksumsConstructed = ocChecksumsSerialized != null
      ? XmlElement(
          XmlName('checksums', namespaces['http://owncloud.org/ns']),
          ocChecksumsSerialized.toXmlAttributes(namespaces: namespaces),
          ocChecksumsSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocChecksumsConstructed != null) {
    children.add(ocChecksumsConstructed);
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount?.toString();
  final ocCommentsCountConstructed = ocCommentsCountSerialized != null
      ? XmlElement(
          XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsCountSerialized)])
      : null;
  if (ocCommentsCountConstructed != null) {
    children.add(ocCommentsCountConstructed);
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  final ocCommentsHrefConstructed = ocCommentsHrefSerialized != null
      ? XmlElement(
          XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsHrefSerialized)])
      : null;
  if (ocCommentsHrefConstructed != null) {
    children.add(ocCommentsHrefConstructed);
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread?.toString();
  final ocCommentsUnreadConstructed = ocCommentsUnreadSerialized != null
      ? XmlElement(
          XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsUnreadSerialized)])
      : null;
  if (ocCommentsUnreadConstructed != null) {
    children.add(ocCommentsUnreadConstructed);
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  final ocDownloadURLConstructed = ocDownloadURLSerialized != null
      ? XmlElement(XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], [XmlText(ocDownloadURLSerialized)])
      : null;
  if (ocDownloadURLConstructed != null) {
    children.add(ocDownloadURLConstructed);
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite != null
      ? ocFavorite == true
          ? 'true'
          : 'false'
      : null;
  final ocFavoriteConstructed = ocFavoriteSerialized != null
      ? XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], [XmlText(ocFavoriteSerialized)])
      : null;
  if (ocFavoriteConstructed != null) {
    children.add(ocFavoriteConstructed);
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid?.toString();
  final ocFileidConstructed = ocFileidSerialized != null
      ? XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], [XmlText(ocFileidSerialized)])
      : null;
  if (ocFileidConstructed != null) {
    children.add(ocFileidConstructed);
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  final ocIdConstructed = ocIdSerialized != null
      ? XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocIdSerialized)])
      : null;
  if (ocIdConstructed != null) {
    children.add(ocIdConstructed);
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  final ocOwnerDisplayNameConstructed = ocOwnerDisplayNameSerialized != null
      ? XmlElement(XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [],
          [XmlText(ocOwnerDisplayNameSerialized)])
      : null;
  if (ocOwnerDisplayNameConstructed != null) {
    children.add(ocOwnerDisplayNameConstructed);
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  final ocOwnerIdConstructed = ocOwnerIdSerialized != null
      ? XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocOwnerIdSerialized)])
      : null;
  if (ocOwnerIdConstructed != null) {
    children.add(ocOwnerIdConstructed);
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  final ocPermissionsConstructed = ocPermissionsSerialized != null
      ? XmlElement(XmlName('permissions', namespaces['http://owncloud.org/ns']), [], [XmlText(ocPermissionsSerialized)])
      : null;
  if (ocPermissionsConstructed != null) {
    children.add(ocPermissionsConstructed);
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  final ocShareTypesConstructed = ocShareTypesSerialized != null
      ? XmlElement(
          XmlName('share-types', namespaces['http://owncloud.org/ns']),
          ocShareTypesSerialized.toXmlAttributes(namespaces: namespaces),
          ocShareTypesSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocShareTypesConstructed != null) {
    children.add(ocShareTypesConstructed);
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize?.toString();
  final ocSizeConstructed = ocSizeSerialized != null
      ? XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], [XmlText(ocSizeSerialized)])
      : null;
  if (ocSizeConstructed != null) {
    children.add(ocSizeConstructed);
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  final ocTagsConstructed = ocTagsSerialized != null
      ? XmlElement(
          XmlName('tags', namespaces['http://owncloud.org/ns']),
          ocTagsSerialized.toXmlAttributes(namespaces: namespaces),
          ocTagsSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocTagsConstructed != null) {
    children.add(ocTagsConstructed);
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  final ocmSharePermissionsConstructed = ocmSharePermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']), [],
          [XmlText(ocmSharePermissionsSerialized)])
      : null;
  if (ocmSharePermissionsConstructed != null) {
    children.add(ocmSharePermissionsConstructed);
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions?.toString();
  final ocsSharePermissionsConstructed = ocsSharePermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']), [],
          [XmlText(ocsSharePermissionsSerialized)])
      : null;
  if (ocsSharePermissionsConstructed != null) {
    children.add(ocsSharePermissionsConstructed);
  }
  return children;
}

XmlElement _$WebDavPropToXmlElement(WebDavProp instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('prop', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropBuildXmlChildren(this as WebDavProp, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropBuildXmlElement(this as WebDavProp, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropToXmlAttributes(this as WebDavProp, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropToXmlChildren(this as WebDavProp, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropToXmlElement(this as WebDavProp, namespaces: namespaces);
}

void _$WebDavOcFilterRulesBuildXmlChildren(WebDavOcFilterRules instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  if (davCreationdateSerialized != null) {
    builder.element('creationdate', namespace: 'DAV:', nest: () {
      const ISO8601XMLConverter().buildXmlChildren(davCreationdateSerialized, builder, namespaces: namespaces);
    });
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  if (davDisplaynameSerialized != null) {
    builder.element('displayname', namespace: 'DAV:', nest: () {
      builder.text(davDisplaynameSerialized);
    });
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  if (davGetcontentlanguageSerialized != null) {
    builder.element('getcontentlanguage', namespace: 'DAV:', nest: () {
      builder.text(davGetcontentlanguageSerialized);
    });
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength?.toString();
  if (davGetcontentlengthSerialized != null) {
    builder.element('getcontentlength', namespace: 'DAV:', nest: () {
      builder.text(davGetcontentlengthSerialized);
    });
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  if (davGetcontenttypeSerialized != null) {
    builder.element('getcontenttype', namespace: 'DAV:', nest: () {
      builder.text(davGetcontenttypeSerialized);
    });
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  if (davGetetagSerialized != null) {
    builder.element('getetag', namespace: 'DAV:', nest: () {
      builder.text(davGetetagSerialized);
    });
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  if (davGetlastmodifiedSerialized != null) {
    builder.element('getlastmodified', namespace: 'DAV:', nest: () {
      const HttpDateXMLConverter().buildXmlChildren(davGetlastmodifiedSerialized, builder, namespaces: namespaces);
    });
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes?.toString();
  if (davQuotaAvailableBytesSerialized != null) {
    builder.element('quota-available-bytes', namespace: 'DAV:', nest: () {
      builder.text(davQuotaAvailableBytesSerialized);
    });
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes?.toString();
  if (davQuotaUsedBytesSerialized != null) {
    builder.element('quota-used-bytes', namespace: 'DAV:', nest: () {
      builder.text(davQuotaUsedBytesSerialized);
    });
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  if (davResourcetypeSerialized != null) {
    builder.element('resourcetype', namespace: 'DAV:', nest: () {
      davResourcetypeSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage != null
      ? ncAclCanManage == true
          ? 'true'
          : 'false'
      : null;
  if (ncAclCanManageSerialized != null) {
    builder.element('acl-can-manage', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncAclCanManageSerialized);
    });
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled != null
      ? ncAclEnabled == true
          ? 'true'
          : 'false'
      : null;
  if (ncAclEnabledSerialized != null) {
    builder.element('acl-enabled', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncAclEnabledSerialized);
    });
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  if (ncAclListSerialized != null) {
    builder.element('acl-list', namespace: 'http://nextcloud.org/ns', nest: () {
      ncAclListSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount?.toString();
  if (ncContainedFileCountSerialized != null) {
    builder.element('contained-file-count', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncContainedFileCountSerialized);
    });
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount?.toString();
  if (ncContainedFolderCountSerialized != null) {
    builder.element('contained-folder-count', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncContainedFolderCountSerialized);
    });
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  if (ncCreationTimeSerialized != null) {
    builder.element('creation_time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncCreationTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  if (ncDataFingerprintSerialized != null) {
    builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncDataFingerprintSerialized);
    });
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId?.toString();
  if (ncGroupFolderIdSerialized != null) {
    builder.element('group-folder-id', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncGroupFolderIdSerialized);
    });
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview != null
      ? ncHasPreview == true
          ? 'true'
          : 'false'
      : null;
  if (ncHasPreviewSerialized != null) {
    builder.element('has-preview', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncHasPreviewSerialized);
    });
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden != null
      ? ncHidden == true
          ? 'true'
          : 'false'
      : null;
  if (ncHiddenSerialized != null) {
    builder.element('hidden', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncHiddenSerialized);
    });
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  if (ncInheritedAclListSerialized != null) {
    builder.element('inherited-acl-list', namespace: 'http://nextcloud.org/ns', nest: () {
      ncInheritedAclListSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted != null
      ? ncIsEncrypted == true
          ? 'true'
          : 'false'
      : null;
  if (ncIsEncryptedSerialized != null) {
    builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncIsEncryptedSerialized);
    });
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot != null
      ? ncIsMountRoot == true
          ? 'true'
          : 'false'
      : null;
  if (ncIsMountRootSerialized != null) {
    builder.element('is-mount-root', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncIsMountRootSerialized);
    });
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock != null
      ? ncLock == true
          ? 'true'
          : 'false'
      : null;
  if (ncLockSerialized != null) {
    builder.element('lock', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockSerialized);
    });
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  if (ncLockOwnerSerialized != null) {
    builder.element('lock-owner', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerSerialized);
    });
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  if (ncLockOwnerDisplaynameSerialized != null) {
    builder.element('lock-owner-displayname', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerDisplaynameSerialized);
    });
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  if (ncLockOwnerEditorSerialized != null) {
    builder.element('lock-owner-editor', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerEditorSerialized);
    });
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType?.toString();
  if (ncLockOwnerTypeSerialized != null) {
    builder.element('lock-owner-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockOwnerTypeSerialized);
    });
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  if (ncLockTimeSerialized != null) {
    builder.element('lock-time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncLockTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  if (ncLockTimeoutSerialized != null) {
    builder.element('lock-timeout', namespace: 'http://nextcloud.org/ns', nest: () {
      const DurationXMLConverter().buildXmlChildren(ncLockTimeoutSerialized, builder, namespaces: namespaces);
    });
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  if (ncLockTokenSerialized != null) {
    builder.element('lock-token', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncLockTokenSerialized);
    });
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  if (ncMountTypeSerialized != null) {
    builder.element('mount-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncMountTypeSerialized);
    });
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  if (ncNoteSerialized != null) {
    builder.element('note', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncNoteSerialized);
    });
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  if (ncReminderDueDateSerialized != null) {
    builder.element('reminder-due-date', namespace: 'http://nextcloud.org/ns', nest: () {
      const ISO8601XMLConverter().buildXmlChildren(ncReminderDueDateSerialized, builder, namespaces: namespaces);
    });
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  if (ncRichWorkspaceSerialized != null) {
    builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncRichWorkspaceSerialized);
    });
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile?.toString();
  if (ncRichWorkspaceFileSerialized != null) {
    builder.element('rich-workspace-file', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncRichWorkspaceFileSerialized);
    });
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  if (ncShareAttributesSerialized != null) {
    builder.element('share-attributes', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncShareAttributesSerialized);
    });
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  if (ncShareesSerialized != null) {
    builder.element('sharees', namespace: 'http://nextcloud.org/ns', nest: () {
      ncShareesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  if (ncUploadTimeSerialized != null) {
    builder.element('upload_time', namespace: 'http://nextcloud.org/ns', nest: () {
      const UnixEpochXMLConverter().buildXmlChildren(ncUploadTimeSerialized, builder, namespaces: namespaces);
    });
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  if (ncVersionAuthorSerialized != null) {
    builder.element('version-author', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncVersionAuthorSerialized);
    });
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  if (ncVersionLabelSerialized != null) {
    builder.element('version-label', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncVersionLabelSerialized);
    });
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  if (ncMetadataBlurhashSerialized != null) {
    builder.element('metadata-blurhash', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncMetadataBlurhashSerialized);
    });
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  if (ocChecksumsSerialized != null) {
    builder.element('checksums', namespace: 'http://owncloud.org/ns', nest: () {
      ocChecksumsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount?.toString();
  if (ocCommentsCountSerialized != null) {
    builder.element('comments-count', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsCountSerialized);
    });
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  if (ocCommentsHrefSerialized != null) {
    builder.element('comments-href', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsHrefSerialized);
    });
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread?.toString();
  if (ocCommentsUnreadSerialized != null) {
    builder.element('comments-unread', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocCommentsUnreadSerialized);
    });
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  if (ocDownloadURLSerialized != null) {
    builder.element('downloadURL', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocDownloadURLSerialized);
    });
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite != null
      ? ocFavorite == true
          ? 'true'
          : 'false'
      : null;
  if (ocFavoriteSerialized != null) {
    builder.element('favorite', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocFavoriteSerialized);
    });
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid?.toString();
  if (ocFileidSerialized != null) {
    builder.element('fileid', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocFileidSerialized);
    });
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  if (ocIdSerialized != null) {
    builder.element('id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocIdSerialized);
    });
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  if (ocOwnerDisplayNameSerialized != null) {
    builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocOwnerDisplayNameSerialized);
    });
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  if (ocOwnerIdSerialized != null) {
    builder.element('owner-id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocOwnerIdSerialized);
    });
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  if (ocPermissionsSerialized != null) {
    builder.element('permissions', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocPermissionsSerialized);
    });
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  if (ocShareTypesSerialized != null) {
    builder.element('share-types', namespace: 'http://owncloud.org/ns', nest: () {
      ocShareTypesSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize?.toString();
  if (ocSizeSerialized != null) {
    builder.element('size', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocSizeSerialized);
    });
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  if (ocTagsSerialized != null) {
    builder.element('tags', namespace: 'http://owncloud.org/ns', nest: () {
      ocTagsSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  if (ocmSharePermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', nest: () {
      builder.text(ocmSharePermissionsSerialized);
    });
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions?.toString();
  if (ocsSharePermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', nest: () {
      builder.text(ocsSharePermissionsSerialized);
    });
  }
}

void _$WebDavOcFilterRulesBuildXmlElement(WebDavOcFilterRules instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('filter-rules', namespace: 'http://owncloud.org/ns', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavOcFilterRules _$WebDavOcFilterRulesFromXmlElement(XmlElement element) {
  final davCreationdate = element.getElement('creationdate', namespace: 'DAV:');
  final davDisplayname = element.getElement('displayname', namespace: 'DAV:')?.getText();
  final davGetcontentlanguage = element.getElement('getcontentlanguage', namespace: 'DAV:')?.getText();
  final davGetcontentlength = element.getElement('getcontentlength', namespace: 'DAV:')?.getText();
  final davGetcontenttype = element.getElement('getcontenttype', namespace: 'DAV:')?.getText();
  final davGetetag = element.getElement('getetag', namespace: 'DAV:')?.getText();
  final davGetlastmodified = element.getElement('getlastmodified', namespace: 'DAV:');
  final davQuotaAvailableBytes = element.getElement('quota-available-bytes', namespace: 'DAV:')?.getText();
  final davQuotaUsedBytes = element.getElement('quota-used-bytes', namespace: 'DAV:')?.getText();
  final davResourcetype = element.getElement('resourcetype', namespace: 'DAV:');
  final ncAclCanManage = element.getElement('acl-can-manage', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncAclEnabled = element.getElement('acl-enabled', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncAclList = element.getElement('acl-list', namespace: 'http://nextcloud.org/ns');
  final ncContainedFileCount =
      element.getElement('contained-file-count', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncContainedFolderCount =
      element.getElement('contained-folder-count', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncCreationTime = element.getElement('creation_time', namespace: 'http://nextcloud.org/ns');
  final ncDataFingerprint = element.getElement('data-fingerprint', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncGroupFolderId = element.getElement('group-folder-id', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncHasPreview = element.getElement('has-preview', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncHidden = element.getElement('hidden', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncInheritedAclList = element.getElement('inherited-acl-list', namespace: 'http://nextcloud.org/ns');
  final ncIsEncrypted = element.getElement('is-encrypted', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncIsMountRoot = element.getElement('is-mount-root', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLock = element.getElement('lock', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwner = element.getElement('lock-owner', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerDisplayname =
      element.getElement('lock-owner-displayname', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerEditor = element.getElement('lock-owner-editor', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockOwnerType = element.getElement('lock-owner-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncLockTime = element.getElement('lock-time', namespace: 'http://nextcloud.org/ns');
  final ncLockTimeout = element.getElement('lock-timeout', namespace: 'http://nextcloud.org/ns');
  final ncLockToken = element.getElement('lock-token', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncMountType = element.getElement('mount-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncNote = element.getElement('note', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncReminderDueDate = element.getElement('reminder-due-date', namespace: 'http://nextcloud.org/ns');
  final ncRichWorkspace = element.getElement('rich-workspace', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncRichWorkspaceFile =
      element.getElement('rich-workspace-file', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncShareAttributes = element.getElement('share-attributes', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncSharees = element.getElement('sharees', namespace: 'http://nextcloud.org/ns');
  final ncUploadTime = element.getElement('upload_time', namespace: 'http://nextcloud.org/ns');
  final ncVersionAuthor = element.getElement('version-author', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncVersionLabel = element.getElement('version-label', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncMetadataBlurhash = element.getElement('metadata-blurhash', namespace: 'http://nextcloud.org/ns')?.getText();
  final ocChecksums = element.getElement('checksums', namespace: 'http://owncloud.org/ns');
  final ocCommentsCount = element.getElement('comments-count', namespace: 'http://owncloud.org/ns')?.getText();
  final ocCommentsHref = element.getElement('comments-href', namespace: 'http://owncloud.org/ns')?.getText();
  final ocCommentsUnread = element.getElement('comments-unread', namespace: 'http://owncloud.org/ns')?.getText();
  final ocDownloadURL = element.getElement('downloadURL', namespace: 'http://owncloud.org/ns')?.getText();
  final ocFavorite = element.getElement('favorite', namespace: 'http://owncloud.org/ns')?.getText();
  final ocFileid = element.getElement('fileid', namespace: 'http://owncloud.org/ns')?.getText();
  final ocId = element.getElement('id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocOwnerDisplayName = element.getElement('owner-display-name', namespace: 'http://owncloud.org/ns')?.getText();
  final ocOwnerId = element.getElement('owner-id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocPermissions = element.getElement('permissions', namespace: 'http://owncloud.org/ns')?.getText();
  final ocShareTypes = element.getElement('share-types', namespace: 'http://owncloud.org/ns');
  final ocSize = element.getElement('size', namespace: 'http://owncloud.org/ns')?.getText();
  final ocTags = element.getElement('tags', namespace: 'http://owncloud.org/ns');
  final ocmSharePermissions =
      element.getElement('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')?.getText();
  final ocsSharePermissions =
      element.getElement('share-permissions', namespace: 'http://open-collaboration-services.org/ns')?.getText();
  return WebDavOcFilterRules(
      davCreationdate: davCreationdate != null ? const ISO8601XMLConverter().fromXmlElement(davCreationdate) : null,
      davDisplayname: davDisplayname,
      davGetcontentlanguage: davGetcontentlanguage,
      davGetcontentlength: davGetcontentlength != null ? int.parse(davGetcontentlength) : null,
      davGetcontenttype: davGetcontenttype,
      davGetetag: davGetetag,
      davGetlastmodified:
          davGetlastmodified != null ? const HttpDateXMLConverter().fromXmlElement(davGetlastmodified) : null,
      davQuotaAvailableBytes: davQuotaAvailableBytes != null ? int.parse(davQuotaAvailableBytes) : null,
      davQuotaUsedBytes: davQuotaUsedBytes != null ? int.parse(davQuotaUsedBytes) : null,
      davResourcetype: davResourcetype != null ? WebDavResourcetype.fromXmlElement(davResourcetype) : null,
      ncAclCanManage: ncAclCanManage != null
          ? ncAclCanManage == 'true' || ncAclCanManage == '1'
              ? true
              : ncAclCanManage == 'false' || ncAclCanManage == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncAclCanManage)
          : null,
      ncAclEnabled: ncAclEnabled != null
          ? ncAclEnabled == 'true' || ncAclEnabled == '1'
              ? true
              : ncAclEnabled == 'false' || ncAclEnabled == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncAclEnabled)
          : null,
      ncAclList: ncAclList != null ? WebDavNcAclList.fromXmlElement(ncAclList) : null,
      ncContainedFileCount: ncContainedFileCount != null ? int.parse(ncContainedFileCount) : null,
      ncContainedFolderCount: ncContainedFolderCount != null ? int.parse(ncContainedFolderCount) : null,
      ncCreationTime: ncCreationTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncCreationTime) : null,
      ncDataFingerprint: ncDataFingerprint,
      ncGroupFolderId: ncGroupFolderId != null ? int.parse(ncGroupFolderId) : null,
      ncHasPreview: ncHasPreview != null
          ? ncHasPreview == 'true' || ncHasPreview == '1'
              ? true
              : ncHasPreview == 'false' || ncHasPreview == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncHasPreview)
          : null,
      ncHidden: ncHidden != null
          ? ncHidden == 'true' || ncHidden == '1'
              ? true
              : ncHidden == 'false' || ncHidden == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncHidden)
          : null,
      ncInheritedAclList: ncInheritedAclList != null ? WebDavNcAclList.fromXmlElement(ncInheritedAclList) : null,
      ncIsEncrypted: ncIsEncrypted != null
          ? ncIsEncrypted == 'true' || ncIsEncrypted == '1'
              ? true
              : ncIsEncrypted == 'false' || ncIsEncrypted == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncIsEncrypted)
          : null,
      ncIsMountRoot: ncIsMountRoot != null
          ? ncIsMountRoot == 'true' || ncIsMountRoot == '1'
              ? true
              : ncIsMountRoot == 'false' || ncIsMountRoot == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncIsMountRoot)
          : null,
      ncLock: ncLock != null
          ? ncLock == 'true' || ncLock == '1'
              ? true
              : ncLock == 'false' || ncLock == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncLock)
          : null,
      ncLockOwner: ncLockOwner,
      ncLockOwnerDisplayname: ncLockOwnerDisplayname,
      ncLockOwnerEditor: ncLockOwnerEditor,
      ncLockOwnerType: ncLockOwnerType != null ? int.parse(ncLockOwnerType) : null,
      ncLockTime: ncLockTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncLockTime) : null,
      ncLockTimeout: ncLockTimeout != null ? const DurationXMLConverter().fromXmlElement(ncLockTimeout) : null,
      ncLockToken: ncLockToken,
      ncMountType: ncMountType,
      ncNote: ncNote,
      ncReminderDueDate:
          ncReminderDueDate != null ? const ISO8601XMLConverter().fromXmlElement(ncReminderDueDate) : null,
      ncRichWorkspace: ncRichWorkspace,
      ncRichWorkspaceFile: ncRichWorkspaceFile != null ? int.parse(ncRichWorkspaceFile) : null,
      ncShareAttributes: ncShareAttributes,
      ncSharees: ncSharees != null ? WebDavNcShareeList.fromXmlElement(ncSharees) : null,
      ncUploadTime: ncUploadTime != null ? const UnixEpochXMLConverter().fromXmlElement(ncUploadTime) : null,
      ncVersionAuthor: ncVersionAuthor,
      ncVersionLabel: ncVersionLabel,
      ncMetadataBlurhash: ncMetadataBlurhash,
      ocChecksums: ocChecksums != null ? WebDavOcChecksums.fromXmlElement(ocChecksums) : null,
      ocCommentsCount: ocCommentsCount != null ? int.parse(ocCommentsCount) : null,
      ocCommentsHref: ocCommentsHref,
      ocCommentsUnread: ocCommentsUnread != null ? int.parse(ocCommentsUnread) : null,
      ocDownloadURL: ocDownloadURL,
      ocFavorite: ocFavorite != null
          ? ocFavorite == 'true' || ocFavorite == '1'
              ? true
              : ocFavorite == 'false' || ocFavorite == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocFavorite)
          : null,
      ocFileid: ocFileid != null ? int.parse(ocFileid) : null,
      ocId: ocId,
      ocOwnerDisplayName: ocOwnerDisplayName,
      ocOwnerId: ocOwnerId,
      ocPermissions: ocPermissions,
      ocShareTypes: ocShareTypes != null ? WebDavOcShareTypes.fromXmlElement(ocShareTypes) : null,
      ocSize: ocSize != null ? int.parse(ocSize) : null,
      ocTags: ocTags != null ? WebDavOcTags.fromXmlElement(ocTags) : null,
      ocmSharePermissions: ocmSharePermissions,
      ocsSharePermissions: ocsSharePermissions != null ? int.parse(ocsSharePermissions) : null);
}

List<XmlAttribute> _$WebDavOcFilterRulesToXmlAttributes(WebDavOcFilterRules instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavOcFilterRulesToXmlChildren(WebDavOcFilterRules instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davCreationdate = instance.davCreationdate;
  final davCreationdateSerialized = davCreationdate;
  final davCreationdateConstructed = davCreationdateSerialized != null
      ? XmlElement(
          XmlName('creationdate', namespaces['DAV:']),
          const ISO8601XMLConverter().toXmlAttributes(davCreationdateSerialized, namespaces: namespaces),
          const ISO8601XMLConverter().toXmlChildren(davCreationdateSerialized, namespaces: namespaces))
      : null;
  if (davCreationdateConstructed != null) {
    children.add(davCreationdateConstructed);
  }
  final davDisplayname = instance.davDisplayname;
  final davDisplaynameSerialized = davDisplayname;
  final davDisplaynameConstructed = davDisplaynameSerialized != null
      ? XmlElement(XmlName('displayname', namespaces['DAV:']), [], [XmlText(davDisplaynameSerialized)])
      : null;
  if (davDisplaynameConstructed != null) {
    children.add(davDisplaynameConstructed);
  }
  final davGetcontentlanguage = instance.davGetcontentlanguage;
  final davGetcontentlanguageSerialized = davGetcontentlanguage;
  final davGetcontentlanguageConstructed = davGetcontentlanguageSerialized != null
      ? XmlElement(XmlName('getcontentlanguage', namespaces['DAV:']), [], [XmlText(davGetcontentlanguageSerialized)])
      : null;
  if (davGetcontentlanguageConstructed != null) {
    children.add(davGetcontentlanguageConstructed);
  }
  final davGetcontentlength = instance.davGetcontentlength;
  final davGetcontentlengthSerialized = davGetcontentlength?.toString();
  final davGetcontentlengthConstructed = davGetcontentlengthSerialized != null
      ? XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], [XmlText(davGetcontentlengthSerialized)])
      : null;
  if (davGetcontentlengthConstructed != null) {
    children.add(davGetcontentlengthConstructed);
  }
  final davGetcontenttype = instance.davGetcontenttype;
  final davGetcontenttypeSerialized = davGetcontenttype;
  final davGetcontenttypeConstructed = davGetcontenttypeSerialized != null
      ? XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], [XmlText(davGetcontenttypeSerialized)])
      : null;
  if (davGetcontenttypeConstructed != null) {
    children.add(davGetcontenttypeConstructed);
  }
  final davGetetag = instance.davGetetag;
  final davGetetagSerialized = davGetetag;
  final davGetetagConstructed = davGetetagSerialized != null
      ? XmlElement(XmlName('getetag', namespaces['DAV:']), [], [XmlText(davGetetagSerialized)])
      : null;
  if (davGetetagConstructed != null) {
    children.add(davGetetagConstructed);
  }
  final davGetlastmodified = instance.davGetlastmodified;
  final davGetlastmodifiedSerialized = davGetlastmodified;
  final davGetlastmodifiedConstructed = davGetlastmodifiedSerialized != null
      ? XmlElement(
          XmlName('getlastmodified', namespaces['DAV:']),
          const HttpDateXMLConverter().toXmlAttributes(davGetlastmodifiedSerialized, namespaces: namespaces),
          const HttpDateXMLConverter().toXmlChildren(davGetlastmodifiedSerialized, namespaces: namespaces))
      : null;
  if (davGetlastmodifiedConstructed != null) {
    children.add(davGetlastmodifiedConstructed);
  }
  final davQuotaAvailableBytes = instance.davQuotaAvailableBytes;
  final davQuotaAvailableBytesSerialized = davQuotaAvailableBytes?.toString();
  final davQuotaAvailableBytesConstructed = davQuotaAvailableBytesSerialized != null
      ? XmlElement(
          XmlName('quota-available-bytes', namespaces['DAV:']), [], [XmlText(davQuotaAvailableBytesSerialized)])
      : null;
  if (davQuotaAvailableBytesConstructed != null) {
    children.add(davQuotaAvailableBytesConstructed);
  }
  final davQuotaUsedBytes = instance.davQuotaUsedBytes;
  final davQuotaUsedBytesSerialized = davQuotaUsedBytes?.toString();
  final davQuotaUsedBytesConstructed = davQuotaUsedBytesSerialized != null
      ? XmlElement(XmlName('quota-used-bytes', namespaces['DAV:']), [], [XmlText(davQuotaUsedBytesSerialized)])
      : null;
  if (davQuotaUsedBytesConstructed != null) {
    children.add(davQuotaUsedBytesConstructed);
  }
  final davResourcetype = instance.davResourcetype;
  final davResourcetypeSerialized = davResourcetype;
  final davResourcetypeConstructed = davResourcetypeSerialized != null
      ? XmlElement(
          XmlName('resourcetype', namespaces['DAV:']),
          davResourcetypeSerialized.toXmlAttributes(namespaces: namespaces),
          davResourcetypeSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (davResourcetypeConstructed != null) {
    children.add(davResourcetypeConstructed);
  }
  final ncAclCanManage = instance.ncAclCanManage;
  final ncAclCanManageSerialized = ncAclCanManage != null
      ? ncAclCanManage == true
          ? 'true'
          : 'false'
      : null;
  final ncAclCanManageConstructed = ncAclCanManageSerialized != null
      ? XmlElement(
          XmlName('acl-can-manage', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncAclCanManageSerialized)])
      : null;
  if (ncAclCanManageConstructed != null) {
    children.add(ncAclCanManageConstructed);
  }
  final ncAclEnabled = instance.ncAclEnabled;
  final ncAclEnabledSerialized = ncAclEnabled != null
      ? ncAclEnabled == true
          ? 'true'
          : 'false'
      : null;
  final ncAclEnabledConstructed = ncAclEnabledSerialized != null
      ? XmlElement(XmlName('acl-enabled', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncAclEnabledSerialized)])
      : null;
  if (ncAclEnabledConstructed != null) {
    children.add(ncAclEnabledConstructed);
  }
  final ncAclList = instance.ncAclList;
  final ncAclListSerialized = ncAclList;
  final ncAclListConstructed = ncAclListSerialized != null
      ? XmlElement(
          XmlName('acl-list', namespaces['http://nextcloud.org/ns']),
          ncAclListSerialized.toXmlAttributes(namespaces: namespaces),
          ncAclListSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncAclListConstructed != null) {
    children.add(ncAclListConstructed);
  }
  final ncContainedFileCount = instance.ncContainedFileCount;
  final ncContainedFileCountSerialized = ncContainedFileCount?.toString();
  final ncContainedFileCountConstructed = ncContainedFileCountSerialized != null
      ? XmlElement(XmlName('contained-file-count', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncContainedFileCountSerialized)])
      : null;
  if (ncContainedFileCountConstructed != null) {
    children.add(ncContainedFileCountConstructed);
  }
  final ncContainedFolderCount = instance.ncContainedFolderCount;
  final ncContainedFolderCountSerialized = ncContainedFolderCount?.toString();
  final ncContainedFolderCountConstructed = ncContainedFolderCountSerialized != null
      ? XmlElement(XmlName('contained-folder-count', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncContainedFolderCountSerialized)])
      : null;
  if (ncContainedFolderCountConstructed != null) {
    children.add(ncContainedFolderCountConstructed);
  }
  final ncCreationTime = instance.ncCreationTime;
  final ncCreationTimeSerialized = ncCreationTime;
  final ncCreationTimeConstructed = ncCreationTimeSerialized != null
      ? XmlElement(
          XmlName('creation_time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncCreationTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncCreationTimeSerialized, namespaces: namespaces))
      : null;
  if (ncCreationTimeConstructed != null) {
    children.add(ncCreationTimeConstructed);
  }
  final ncDataFingerprint = instance.ncDataFingerprint;
  final ncDataFingerprintSerialized = ncDataFingerprint;
  final ncDataFingerprintConstructed = ncDataFingerprintSerialized != null
      ? XmlElement(XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncDataFingerprintSerialized)])
      : null;
  if (ncDataFingerprintConstructed != null) {
    children.add(ncDataFingerprintConstructed);
  }
  final ncGroupFolderId = instance.ncGroupFolderId;
  final ncGroupFolderIdSerialized = ncGroupFolderId?.toString();
  final ncGroupFolderIdConstructed = ncGroupFolderIdSerialized != null
      ? XmlElement(
          XmlName('group-folder-id', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncGroupFolderIdSerialized)])
      : null;
  if (ncGroupFolderIdConstructed != null) {
    children.add(ncGroupFolderIdConstructed);
  }
  final ncHasPreview = instance.ncHasPreview;
  final ncHasPreviewSerialized = ncHasPreview != null
      ? ncHasPreview == true
          ? 'true'
          : 'false'
      : null;
  final ncHasPreviewConstructed = ncHasPreviewSerialized != null
      ? XmlElement(XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncHasPreviewSerialized)])
      : null;
  if (ncHasPreviewConstructed != null) {
    children.add(ncHasPreviewConstructed);
  }
  final ncHidden = instance.ncHidden;
  final ncHiddenSerialized = ncHidden != null
      ? ncHidden == true
          ? 'true'
          : 'false'
      : null;
  final ncHiddenConstructed = ncHiddenSerialized != null
      ? XmlElement(XmlName('hidden', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncHiddenSerialized)])
      : null;
  if (ncHiddenConstructed != null) {
    children.add(ncHiddenConstructed);
  }
  final ncInheritedAclList = instance.ncInheritedAclList;
  final ncInheritedAclListSerialized = ncInheritedAclList;
  final ncInheritedAclListConstructed = ncInheritedAclListSerialized != null
      ? XmlElement(
          XmlName('inherited-acl-list', namespaces['http://nextcloud.org/ns']),
          ncInheritedAclListSerialized.toXmlAttributes(namespaces: namespaces),
          ncInheritedAclListSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncInheritedAclListConstructed != null) {
    children.add(ncInheritedAclListConstructed);
  }
  final ncIsEncrypted = instance.ncIsEncrypted;
  final ncIsEncryptedSerialized = ncIsEncrypted != null
      ? ncIsEncrypted == true
          ? 'true'
          : 'false'
      : null;
  final ncIsEncryptedConstructed = ncIsEncryptedSerialized != null
      ? XmlElement(
          XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncIsEncryptedSerialized)])
      : null;
  if (ncIsEncryptedConstructed != null) {
    children.add(ncIsEncryptedConstructed);
  }
  final ncIsMountRoot = instance.ncIsMountRoot;
  final ncIsMountRootSerialized = ncIsMountRoot != null
      ? ncIsMountRoot == true
          ? 'true'
          : 'false'
      : null;
  final ncIsMountRootConstructed = ncIsMountRootSerialized != null
      ? XmlElement(
          XmlName('is-mount-root', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncIsMountRootSerialized)])
      : null;
  if (ncIsMountRootConstructed != null) {
    children.add(ncIsMountRootConstructed);
  }
  final ncLock = instance.ncLock;
  final ncLockSerialized = ncLock != null
      ? ncLock == true
          ? 'true'
          : 'false'
      : null;
  final ncLockConstructed = ncLockSerialized != null
      ? XmlElement(XmlName('lock', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockSerialized)])
      : null;
  if (ncLockConstructed != null) {
    children.add(ncLockConstructed);
  }
  final ncLockOwner = instance.ncLockOwner;
  final ncLockOwnerSerialized = ncLockOwner;
  final ncLockOwnerConstructed = ncLockOwnerSerialized != null
      ? XmlElement(XmlName('lock-owner', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockOwnerSerialized)])
      : null;
  if (ncLockOwnerConstructed != null) {
    children.add(ncLockOwnerConstructed);
  }
  final ncLockOwnerDisplayname = instance.ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameSerialized = ncLockOwnerDisplayname;
  final ncLockOwnerDisplaynameConstructed = ncLockOwnerDisplaynameSerialized != null
      ? XmlElement(XmlName('lock-owner-displayname', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncLockOwnerDisplaynameSerialized)])
      : null;
  if (ncLockOwnerDisplaynameConstructed != null) {
    children.add(ncLockOwnerDisplaynameConstructed);
  }
  final ncLockOwnerEditor = instance.ncLockOwnerEditor;
  final ncLockOwnerEditorSerialized = ncLockOwnerEditor;
  final ncLockOwnerEditorConstructed = ncLockOwnerEditorSerialized != null
      ? XmlElement(XmlName('lock-owner-editor', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncLockOwnerEditorSerialized)])
      : null;
  if (ncLockOwnerEditorConstructed != null) {
    children.add(ncLockOwnerEditorConstructed);
  }
  final ncLockOwnerType = instance.ncLockOwnerType;
  final ncLockOwnerTypeSerialized = ncLockOwnerType?.toString();
  final ncLockOwnerTypeConstructed = ncLockOwnerTypeSerialized != null
      ? XmlElement(
          XmlName('lock-owner-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockOwnerTypeSerialized)])
      : null;
  if (ncLockOwnerTypeConstructed != null) {
    children.add(ncLockOwnerTypeConstructed);
  }
  final ncLockTime = instance.ncLockTime;
  final ncLockTimeSerialized = ncLockTime;
  final ncLockTimeConstructed = ncLockTimeSerialized != null
      ? XmlElement(
          XmlName('lock-time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncLockTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncLockTimeSerialized, namespaces: namespaces))
      : null;
  if (ncLockTimeConstructed != null) {
    children.add(ncLockTimeConstructed);
  }
  final ncLockTimeout = instance.ncLockTimeout;
  final ncLockTimeoutSerialized = ncLockTimeout;
  final ncLockTimeoutConstructed = ncLockTimeoutSerialized != null
      ? XmlElement(
          XmlName('lock-timeout', namespaces['http://nextcloud.org/ns']),
          const DurationXMLConverter().toXmlAttributes(ncLockTimeoutSerialized, namespaces: namespaces),
          const DurationXMLConverter().toXmlChildren(ncLockTimeoutSerialized, namespaces: namespaces))
      : null;
  if (ncLockTimeoutConstructed != null) {
    children.add(ncLockTimeoutConstructed);
  }
  final ncLockToken = instance.ncLockToken;
  final ncLockTokenSerialized = ncLockToken;
  final ncLockTokenConstructed = ncLockTokenSerialized != null
      ? XmlElement(XmlName('lock-token', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncLockTokenSerialized)])
      : null;
  if (ncLockTokenConstructed != null) {
    children.add(ncLockTokenConstructed);
  }
  final ncMountType = instance.ncMountType;
  final ncMountTypeSerialized = ncMountType;
  final ncMountTypeConstructed = ncMountTypeSerialized != null
      ? XmlElement(XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncMountTypeSerialized)])
      : null;
  if (ncMountTypeConstructed != null) {
    children.add(ncMountTypeConstructed);
  }
  final ncNote = instance.ncNote;
  final ncNoteSerialized = ncNote;
  final ncNoteConstructed = ncNoteSerialized != null
      ? XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncNoteSerialized)])
      : null;
  if (ncNoteConstructed != null) {
    children.add(ncNoteConstructed);
  }
  final ncReminderDueDate = instance.ncReminderDueDate;
  final ncReminderDueDateSerialized = ncReminderDueDate;
  final ncReminderDueDateConstructed = ncReminderDueDateSerialized != null
      ? XmlElement(
          XmlName('reminder-due-date', namespaces['http://nextcloud.org/ns']),
          const ISO8601XMLConverter().toXmlAttributes(ncReminderDueDateSerialized, namespaces: namespaces),
          const ISO8601XMLConverter().toXmlChildren(ncReminderDueDateSerialized, namespaces: namespaces))
      : null;
  if (ncReminderDueDateConstructed != null) {
    children.add(ncReminderDueDateConstructed);
  }
  final ncRichWorkspace = instance.ncRichWorkspace;
  final ncRichWorkspaceSerialized = ncRichWorkspace;
  final ncRichWorkspaceConstructed = ncRichWorkspaceSerialized != null
      ? XmlElement(
          XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncRichWorkspaceSerialized)])
      : null;
  if (ncRichWorkspaceConstructed != null) {
    children.add(ncRichWorkspaceConstructed);
  }
  final ncRichWorkspaceFile = instance.ncRichWorkspaceFile;
  final ncRichWorkspaceFileSerialized = ncRichWorkspaceFile?.toString();
  final ncRichWorkspaceFileConstructed = ncRichWorkspaceFileSerialized != null
      ? XmlElement(XmlName('rich-workspace-file', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncRichWorkspaceFileSerialized)])
      : null;
  if (ncRichWorkspaceFileConstructed != null) {
    children.add(ncRichWorkspaceFileConstructed);
  }
  final ncShareAttributes = instance.ncShareAttributes;
  final ncShareAttributesSerialized = ncShareAttributes;
  final ncShareAttributesConstructed = ncShareAttributesSerialized != null
      ? XmlElement(XmlName('share-attributes', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncShareAttributesSerialized)])
      : null;
  if (ncShareAttributesConstructed != null) {
    children.add(ncShareAttributesConstructed);
  }
  final ncSharees = instance.ncSharees;
  final ncShareesSerialized = ncSharees;
  final ncShareesConstructed = ncShareesSerialized != null
      ? XmlElement(
          XmlName('sharees', namespaces['http://nextcloud.org/ns']),
          ncShareesSerialized.toXmlAttributes(namespaces: namespaces),
          ncShareesSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ncShareesConstructed != null) {
    children.add(ncShareesConstructed);
  }
  final ncUploadTime = instance.ncUploadTime;
  final ncUploadTimeSerialized = ncUploadTime;
  final ncUploadTimeConstructed = ncUploadTimeSerialized != null
      ? XmlElement(
          XmlName('upload_time', namespaces['http://nextcloud.org/ns']),
          const UnixEpochXMLConverter().toXmlAttributes(ncUploadTimeSerialized, namespaces: namespaces),
          const UnixEpochXMLConverter().toXmlChildren(ncUploadTimeSerialized, namespaces: namespaces))
      : null;
  if (ncUploadTimeConstructed != null) {
    children.add(ncUploadTimeConstructed);
  }
  final ncVersionAuthor = instance.ncVersionAuthor;
  final ncVersionAuthorSerialized = ncVersionAuthor;
  final ncVersionAuthorConstructed = ncVersionAuthorSerialized != null
      ? XmlElement(
          XmlName('version-author', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncVersionAuthorSerialized)])
      : null;
  if (ncVersionAuthorConstructed != null) {
    children.add(ncVersionAuthorConstructed);
  }
  final ncVersionLabel = instance.ncVersionLabel;
  final ncVersionLabelSerialized = ncVersionLabel;
  final ncVersionLabelConstructed = ncVersionLabelSerialized != null
      ? XmlElement(
          XmlName('version-label', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncVersionLabelSerialized)])
      : null;
  if (ncVersionLabelConstructed != null) {
    children.add(ncVersionLabelConstructed);
  }
  final ncMetadataBlurhash = instance.ncMetadataBlurhash;
  final ncMetadataBlurhashSerialized = ncMetadataBlurhash;
  final ncMetadataBlurhashConstructed = ncMetadataBlurhashSerialized != null
      ? XmlElement(XmlName('metadata-blurhash', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncMetadataBlurhashSerialized)])
      : null;
  if (ncMetadataBlurhashConstructed != null) {
    children.add(ncMetadataBlurhashConstructed);
  }
  final ocChecksums = instance.ocChecksums;
  final ocChecksumsSerialized = ocChecksums;
  final ocChecksumsConstructed = ocChecksumsSerialized != null
      ? XmlElement(
          XmlName('checksums', namespaces['http://owncloud.org/ns']),
          ocChecksumsSerialized.toXmlAttributes(namespaces: namespaces),
          ocChecksumsSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocChecksumsConstructed != null) {
    children.add(ocChecksumsConstructed);
  }
  final ocCommentsCount = instance.ocCommentsCount;
  final ocCommentsCountSerialized = ocCommentsCount?.toString();
  final ocCommentsCountConstructed = ocCommentsCountSerialized != null
      ? XmlElement(
          XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsCountSerialized)])
      : null;
  if (ocCommentsCountConstructed != null) {
    children.add(ocCommentsCountConstructed);
  }
  final ocCommentsHref = instance.ocCommentsHref;
  final ocCommentsHrefSerialized = ocCommentsHref;
  final ocCommentsHrefConstructed = ocCommentsHrefSerialized != null
      ? XmlElement(
          XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsHrefSerialized)])
      : null;
  if (ocCommentsHrefConstructed != null) {
    children.add(ocCommentsHrefConstructed);
  }
  final ocCommentsUnread = instance.ocCommentsUnread;
  final ocCommentsUnreadSerialized = ocCommentsUnread?.toString();
  final ocCommentsUnreadConstructed = ocCommentsUnreadSerialized != null
      ? XmlElement(
          XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], [XmlText(ocCommentsUnreadSerialized)])
      : null;
  if (ocCommentsUnreadConstructed != null) {
    children.add(ocCommentsUnreadConstructed);
  }
  final ocDownloadURL = instance.ocDownloadURL;
  final ocDownloadURLSerialized = ocDownloadURL;
  final ocDownloadURLConstructed = ocDownloadURLSerialized != null
      ? XmlElement(XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], [XmlText(ocDownloadURLSerialized)])
      : null;
  if (ocDownloadURLConstructed != null) {
    children.add(ocDownloadURLConstructed);
  }
  final ocFavorite = instance.ocFavorite;
  final ocFavoriteSerialized = ocFavorite != null
      ? ocFavorite == true
          ? 'true'
          : 'false'
      : null;
  final ocFavoriteConstructed = ocFavoriteSerialized != null
      ? XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], [XmlText(ocFavoriteSerialized)])
      : null;
  if (ocFavoriteConstructed != null) {
    children.add(ocFavoriteConstructed);
  }
  final ocFileid = instance.ocFileid;
  final ocFileidSerialized = ocFileid?.toString();
  final ocFileidConstructed = ocFileidSerialized != null
      ? XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], [XmlText(ocFileidSerialized)])
      : null;
  if (ocFileidConstructed != null) {
    children.add(ocFileidConstructed);
  }
  final ocId = instance.ocId;
  final ocIdSerialized = ocId;
  final ocIdConstructed = ocIdSerialized != null
      ? XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocIdSerialized)])
      : null;
  if (ocIdConstructed != null) {
    children.add(ocIdConstructed);
  }
  final ocOwnerDisplayName = instance.ocOwnerDisplayName;
  final ocOwnerDisplayNameSerialized = ocOwnerDisplayName;
  final ocOwnerDisplayNameConstructed = ocOwnerDisplayNameSerialized != null
      ? XmlElement(XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [],
          [XmlText(ocOwnerDisplayNameSerialized)])
      : null;
  if (ocOwnerDisplayNameConstructed != null) {
    children.add(ocOwnerDisplayNameConstructed);
  }
  final ocOwnerId = instance.ocOwnerId;
  final ocOwnerIdSerialized = ocOwnerId;
  final ocOwnerIdConstructed = ocOwnerIdSerialized != null
      ? XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocOwnerIdSerialized)])
      : null;
  if (ocOwnerIdConstructed != null) {
    children.add(ocOwnerIdConstructed);
  }
  final ocPermissions = instance.ocPermissions;
  final ocPermissionsSerialized = ocPermissions;
  final ocPermissionsConstructed = ocPermissionsSerialized != null
      ? XmlElement(XmlName('permissions', namespaces['http://owncloud.org/ns']), [], [XmlText(ocPermissionsSerialized)])
      : null;
  if (ocPermissionsConstructed != null) {
    children.add(ocPermissionsConstructed);
  }
  final ocShareTypes = instance.ocShareTypes;
  final ocShareTypesSerialized = ocShareTypes;
  final ocShareTypesConstructed = ocShareTypesSerialized != null
      ? XmlElement(
          XmlName('share-types', namespaces['http://owncloud.org/ns']),
          ocShareTypesSerialized.toXmlAttributes(namespaces: namespaces),
          ocShareTypesSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocShareTypesConstructed != null) {
    children.add(ocShareTypesConstructed);
  }
  final ocSize = instance.ocSize;
  final ocSizeSerialized = ocSize?.toString();
  final ocSizeConstructed = ocSizeSerialized != null
      ? XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], [XmlText(ocSizeSerialized)])
      : null;
  if (ocSizeConstructed != null) {
    children.add(ocSizeConstructed);
  }
  final ocTags = instance.ocTags;
  final ocTagsSerialized = ocTags;
  final ocTagsConstructed = ocTagsSerialized != null
      ? XmlElement(
          XmlName('tags', namespaces['http://owncloud.org/ns']),
          ocTagsSerialized.toXmlAttributes(namespaces: namespaces),
          ocTagsSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (ocTagsConstructed != null) {
    children.add(ocTagsConstructed);
  }
  final ocmSharePermissions = instance.ocmSharePermissions;
  final ocmSharePermissionsSerialized = ocmSharePermissions;
  final ocmSharePermissionsConstructed = ocmSharePermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']), [],
          [XmlText(ocmSharePermissionsSerialized)])
      : null;
  if (ocmSharePermissionsConstructed != null) {
    children.add(ocmSharePermissionsConstructed);
  }
  final ocsSharePermissions = instance.ocsSharePermissions;
  final ocsSharePermissionsSerialized = ocsSharePermissions?.toString();
  final ocsSharePermissionsConstructed = ocsSharePermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']), [],
          [XmlText(ocsSharePermissionsSerialized)])
      : null;
  if (ocsSharePermissionsConstructed != null) {
    children.add(ocsSharePermissionsConstructed);
  }
  return children;
}

XmlElement _$WebDavOcFilterRulesToXmlElement(WebDavOcFilterRules instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('filter-rules', namespaces['http://owncloud.org/ns']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavOcFilterRulesXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavOcFilterRulesBuildXmlChildren(this as WebDavOcFilterRules, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavOcFilterRulesBuildXmlElement(this as WebDavOcFilterRules, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterRulesToXmlAttributes(this as WebDavOcFilterRules, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterRulesToXmlChildren(this as WebDavOcFilterRules, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterRulesToXmlElement(this as WebDavOcFilterRules, namespaces: namespaces);
}
