// ignore_for_file: public_member_api_docs
// coverage:ignore-file
import 'package:meta/meta.dart';
import 'package:nextcloud/src/utils/date_time.dart';
import 'package:nextcloud/src/webdav/utils.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;
part 'props.g.dart';

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavPropWithoutValues with _$WebDavPropWithoutValuesXmlSerializableMixin {
  const WebDavPropWithoutValues({
    this.davCreationdate,
    this.davDisplayname,
    this.davGetcontentlanguage,
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davQuotaAvailableBytes,
    this.davQuotaUsedBytes,
    this.davResourcetype,
    this.ncAclCanManage,
    this.ncAclEnabled,
    this.ncAclList,
    this.ncContainedFileCount,
    this.ncContainedFolderCount,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncGroupFolderId,
    this.ncHasPreview,
    this.ncHidden,
    this.ncInheritedAclList,
    this.ncIsEncrypted,
    this.ncIsMountRoot,
    this.ncLock,
    this.ncLockOwner,
    this.ncLockOwnerDisplayname,
    this.ncLockOwnerEditor,
    this.ncLockOwnerType,
    this.ncLockTime,
    this.ncLockTimeout,
    this.ncLockToken,
    this.ncMountType,
    this.ncNote,
    this.ncReminderDueDate,
    this.ncRichWorkspace,
    this.ncRichWorkspaceFile,
    this.ncShareAttributes,
    this.ncSharees,
    this.ncUploadTime,
    this.ncVersionAuthor,
    this.ncVersionLabel,
    this.ncMetadataBlurhash,
    this.ocChecksums,
    this.ocCommentsCount,
    this.ocCommentsHref,
    this.ocCommentsUnread,
    this.ocDownloadURL,
    this.ocFavorite,
    this.ocFileid,
    this.ocId,
    this.ocOwnerDisplayName,
    this.ocOwnerId,
    this.ocPermissions,
    this.ocShareTypes,
    this.ocSize,
    this.ocTags,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  const WebDavPropWithoutValues.fromBools({
    bool davCreationdate = false,
    bool davDisplayname = false,
    bool davGetcontentlanguage = false,
    bool davGetcontentlength = false,
    bool davGetcontenttype = false,
    bool davGetetag = false,
    bool davGetlastmodified = false,
    bool davQuotaAvailableBytes = false,
    bool davQuotaUsedBytes = false,
    bool davResourcetype = false,
    bool ncAclCanManage = false,
    bool ncAclEnabled = false,
    bool ncAclList = false,
    bool ncContainedFileCount = false,
    bool ncContainedFolderCount = false,
    bool ncCreationTime = false,
    bool ncDataFingerprint = false,
    bool ncGroupFolderId = false,
    bool ncHasPreview = false,
    bool ncHidden = false,
    bool ncInheritedAclList = false,
    bool ncIsEncrypted = false,
    bool ncIsMountRoot = false,
    bool ncLock = false,
    bool ncLockOwner = false,
    bool ncLockOwnerDisplayname = false,
    bool ncLockOwnerEditor = false,
    bool ncLockOwnerType = false,
    bool ncLockTime = false,
    bool ncLockTimeout = false,
    bool ncLockToken = false,
    bool ncMountType = false,
    bool ncNote = false,
    bool ncReminderDueDate = false,
    bool ncRichWorkspace = false,
    bool ncRichWorkspaceFile = false,
    bool ncShareAttributes = false,
    bool ncSharees = false,
    bool ncUploadTime = false,
    bool ncVersionAuthor = false,
    bool ncVersionLabel = false,
    bool ncMetadataBlurhash = false,
    bool ocChecksums = false,
    bool ocCommentsCount = false,
    bool ocCommentsHref = false,
    bool ocCommentsUnread = false,
    bool ocDownloadURL = false,
    bool ocFavorite = false,
    bool ocFileid = false,
    bool ocId = false,
    bool ocOwnerDisplayName = false,
    bool ocOwnerId = false,
    bool ocPermissions = false,
    bool ocShareTypes = false,
    bool ocSize = false,
    bool ocTags = false,
    bool ocmSharePermissions = false,
    bool ocsSharePermissions = false,
  })  : davCreationdate = davCreationdate ? const [null] : null,
        davDisplayname = davDisplayname ? const [null] : null,
        davGetcontentlanguage = davGetcontentlanguage ? const [null] : null,
        davGetcontentlength = davGetcontentlength ? const [null] : null,
        davGetcontenttype = davGetcontenttype ? const [null] : null,
        davGetetag = davGetetag ? const [null] : null,
        davGetlastmodified = davGetlastmodified ? const [null] : null,
        davQuotaAvailableBytes = davQuotaAvailableBytes ? const [null] : null,
        davQuotaUsedBytes = davQuotaUsedBytes ? const [null] : null,
        davResourcetype = davResourcetype ? const [null] : null,
        ncAclCanManage = ncAclCanManage ? const [null] : null,
        ncAclEnabled = ncAclEnabled ? const [null] : null,
        ncAclList = ncAclList ? const [null] : null,
        ncContainedFileCount = ncContainedFileCount ? const [null] : null,
        ncContainedFolderCount = ncContainedFolderCount ? const [null] : null,
        ncCreationTime = ncCreationTime ? const [null] : null,
        ncDataFingerprint = ncDataFingerprint ? const [null] : null,
        ncGroupFolderId = ncGroupFolderId ? const [null] : null,
        ncHasPreview = ncHasPreview ? const [null] : null,
        ncHidden = ncHidden ? const [null] : null,
        ncInheritedAclList = ncInheritedAclList ? const [null] : null,
        ncIsEncrypted = ncIsEncrypted ? const [null] : null,
        ncIsMountRoot = ncIsMountRoot ? const [null] : null,
        ncLock = ncLock ? const [null] : null,
        ncLockOwner = ncLockOwner ? const [null] : null,
        ncLockOwnerDisplayname = ncLockOwnerDisplayname ? const [null] : null,
        ncLockOwnerEditor = ncLockOwnerEditor ? const [null] : null,
        ncLockOwnerType = ncLockOwnerType ? const [null] : null,
        ncLockTime = ncLockTime ? const [null] : null,
        ncLockTimeout = ncLockTimeout ? const [null] : null,
        ncLockToken = ncLockToken ? const [null] : null,
        ncMountType = ncMountType ? const [null] : null,
        ncNote = ncNote ? const [null] : null,
        ncReminderDueDate = ncReminderDueDate ? const [null] : null,
        ncRichWorkspace = ncRichWorkspace ? const [null] : null,
        ncRichWorkspaceFile = ncRichWorkspaceFile ? const [null] : null,
        ncShareAttributes = ncShareAttributes ? const [null] : null,
        ncSharees = ncSharees ? const [null] : null,
        ncUploadTime = ncUploadTime ? const [null] : null,
        ncVersionAuthor = ncVersionAuthor ? const [null] : null,
        ncVersionLabel = ncVersionLabel ? const [null] : null,
        ncMetadataBlurhash = ncMetadataBlurhash ? const [null] : null,
        ocChecksums = ocChecksums ? const [null] : null,
        ocCommentsCount = ocCommentsCount ? const [null] : null,
        ocCommentsHref = ocCommentsHref ? const [null] : null,
        ocCommentsUnread = ocCommentsUnread ? const [null] : null,
        ocDownloadURL = ocDownloadURL ? const [null] : null,
        ocFavorite = ocFavorite ? const [null] : null,
        ocFileid = ocFileid ? const [null] : null,
        ocId = ocId ? const [null] : null,
        ocOwnerDisplayName = ocOwnerDisplayName ? const [null] : null,
        ocOwnerId = ocOwnerId ? const [null] : null,
        ocPermissions = ocPermissions ? const [null] : null,
        ocShareTypes = ocShareTypes ? const [null] : null,
        ocSize = ocSize ? const [null] : null,
        ocTags = ocTags ? const [null] : null,
        ocmSharePermissions = ocmSharePermissions ? const [null] : null,
        ocsSharePermissions = ocsSharePermissions ? const [null] : null;

  factory WebDavPropWithoutValues.fromXmlElement(XmlElement element) =>
      _$WebDavPropWithoutValuesFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davCreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davDisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davGetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davGetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davGetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davGetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davGetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davQuotaAvailableBytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davQuotaUsedBytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davResourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncAclCanManage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncAclEnabled;

  @annotation.XmlElement(
    name: 'acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncAclList;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncContainedFileCount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncContainedFolderCount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncCreationTime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncDataFingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncGroupFolderId;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncHasPreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncHidden;

  @annotation.XmlElement(
    name: 'inherited-acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncInheritedAclList;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncIsMountRoot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockOwner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockOwnerDisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockOwnerEditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockOwnerType;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockTime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockTimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncLockToken;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncMountType;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncNote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncReminderDueDate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncRichWorkspaceFile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncShareAttributes;

  @annotation.XmlElement(
    name: 'sharees',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncSharees;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncUploadTime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncVersionAuthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncVersionLabel;

  @annotation.XmlElement(
    name: 'metadata-blurhash',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncMetadataBlurhash;

  @annotation.XmlElement(
    name: 'checksums',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocChecksums;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocCommentsCount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocCommentsHref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocCommentsUnread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocDownloadURL;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocFavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocFileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocId;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocOwnerDisplayName;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocOwnerId;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocPermissions;

  @annotation.XmlElement(
    name: 'share-types',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocShareTypes;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocSize;

  @annotation.XmlElement(
    name: 'tags',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocTags;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocmSharePermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocsSharePermissions;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavProp with _$WebDavPropXmlSerializableMixin {
  const WebDavProp({
    this.davCreationdate,
    this.davDisplayname,
    this.davGetcontentlanguage,
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davQuotaAvailableBytes,
    this.davQuotaUsedBytes,
    this.davResourcetype,
    this.ncAclCanManage,
    this.ncAclEnabled,
    this.ncAclList,
    this.ncContainedFileCount,
    this.ncContainedFolderCount,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncGroupFolderId,
    this.ncHasPreview,
    this.ncHidden,
    this.ncInheritedAclList,
    this.ncIsEncrypted,
    this.ncIsMountRoot,
    this.ncLock,
    this.ncLockOwner,
    this.ncLockOwnerDisplayname,
    this.ncLockOwnerEditor,
    this.ncLockOwnerType,
    this.ncLockTime,
    this.ncLockTimeout,
    this.ncLockToken,
    this.ncMountType,
    this.ncNote,
    this.ncReminderDueDate,
    this.ncRichWorkspace,
    this.ncRichWorkspaceFile,
    this.ncShareAttributes,
    this.ncSharees,
    this.ncUploadTime,
    this.ncVersionAuthor,
    this.ncVersionLabel,
    this.ncMetadataBlurhash,
    this.ocChecksums,
    this.ocCommentsCount,
    this.ocCommentsHref,
    this.ocCommentsUnread,
    this.ocDownloadURL,
    this.ocFavorite,
    this.ocFileid,
    this.ocId,
    this.ocOwnerDisplayName,
    this.ocOwnerId,
    this.ocPermissions,
    this.ocShareTypes,
    this.ocSize,
    this.ocTags,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  factory WebDavProp.fromXmlElement(XmlElement element) => _$WebDavPropFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  @ISO8601XMLConverter()
  final tz.TZDateTime? davCreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davDisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davGetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  @HttpDateXMLConverter()
  final tz.TZDateTime? davGetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davQuotaAvailableBytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davQuotaUsedBytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davResourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncAclCanManage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncAclEnabled;

  @annotation.XmlElement(
    name: 'acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcAclList? ncAclList;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncContainedFileCount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncContainedFolderCount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncCreationTime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncDataFingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncGroupFolderId;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHasPreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHidden;

  @annotation.XmlElement(
    name: 'inherited-acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcAclList? ncInheritedAclList;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncIsMountRoot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncLock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwnerDisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwnerEditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncLockOwnerType;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncLockTime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @DurationXMLConverter()
  final Duration? ncLockTimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockToken;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMountType;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncNote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @ISO8601XMLConverter()
  final tz.TZDateTime? ncReminderDueDate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncRichWorkspaceFile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncShareAttributes;

  @annotation.XmlElement(
    name: 'sharees',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcShareeList? ncSharees;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncUploadTime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncVersionAuthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncVersionLabel;

  @annotation.XmlElement(
    name: 'metadata-blurhash',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMetadataBlurhash;

  @annotation.XmlElement(
    name: 'checksums',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcChecksums? ocChecksums;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocCommentsCount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocCommentsHref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocCommentsUnread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocDownloadURL;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final bool? ocFavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocFileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocId;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocOwnerDisplayName;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocOwnerId;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocPermissions;

  @annotation.XmlElement(
    name: 'share-types',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcShareTypes? ocShareTypes;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocSize;

  @annotation.XmlElement(
    name: 'tags',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcTags? ocTags;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
  final String? ocmSharePermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  final int? ocsSharePermissions;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'filter-rules', namespace: namespaceOwncloud)
class WebDavOcFilterRules with _$WebDavOcFilterRulesXmlSerializableMixin {
  const WebDavOcFilterRules({
    this.davCreationdate,
    this.davDisplayname,
    this.davGetcontentlanguage,
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davQuotaAvailableBytes,
    this.davQuotaUsedBytes,
    this.davResourcetype,
    this.ncAclCanManage,
    this.ncAclEnabled,
    this.ncAclList,
    this.ncContainedFileCount,
    this.ncContainedFolderCount,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncGroupFolderId,
    this.ncHasPreview,
    this.ncHidden,
    this.ncInheritedAclList,
    this.ncIsEncrypted,
    this.ncIsMountRoot,
    this.ncLock,
    this.ncLockOwner,
    this.ncLockOwnerDisplayname,
    this.ncLockOwnerEditor,
    this.ncLockOwnerType,
    this.ncLockTime,
    this.ncLockTimeout,
    this.ncLockToken,
    this.ncMountType,
    this.ncNote,
    this.ncReminderDueDate,
    this.ncRichWorkspace,
    this.ncRichWorkspaceFile,
    this.ncShareAttributes,
    this.ncSharees,
    this.ncUploadTime,
    this.ncVersionAuthor,
    this.ncVersionLabel,
    this.ncMetadataBlurhash,
    this.ocChecksums,
    this.ocCommentsCount,
    this.ocCommentsHref,
    this.ocCommentsUnread,
    this.ocDownloadURL,
    this.ocFavorite,
    this.ocFileid,
    this.ocId,
    this.ocOwnerDisplayName,
    this.ocOwnerId,
    this.ocPermissions,
    this.ocShareTypes,
    this.ocSize,
    this.ocTags,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  factory WebDavOcFilterRules.fromXmlElement(XmlElement element) => _$WebDavOcFilterRulesFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  @ISO8601XMLConverter()
  final tz.TZDateTime? davCreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davDisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davGetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davGetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  @HttpDateXMLConverter()
  final tz.TZDateTime? davGetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davQuotaAvailableBytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davQuotaUsedBytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davResourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncAclCanManage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncAclEnabled;

  @annotation.XmlElement(
    name: 'acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcAclList? ncAclList;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncContainedFileCount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncContainedFolderCount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncCreationTime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncDataFingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncGroupFolderId;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHasPreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHidden;

  @annotation.XmlElement(
    name: 'inherited-acl-list',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcAclList? ncInheritedAclList;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncIsMountRoot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncLock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwnerDisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockOwnerEditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncLockOwnerType;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncLockTime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @DurationXMLConverter()
  final Duration? ncLockTimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncLockToken;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMountType;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncNote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @ISO8601XMLConverter()
  final tz.TZDateTime? ncReminderDueDate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncRichWorkspaceFile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncShareAttributes;

  @annotation.XmlElement(
    name: 'sharees',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final WebDavNcShareeList? ncSharees;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  @UnixEpochXMLConverter()
  final tz.TZDateTime? ncUploadTime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncVersionAuthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncVersionLabel;

  @annotation.XmlElement(
    name: 'metadata-blurhash',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMetadataBlurhash;

  @annotation.XmlElement(
    name: 'checksums',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcChecksums? ocChecksums;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocCommentsCount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocCommentsHref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocCommentsUnread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocDownloadURL;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final bool? ocFavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocFileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocId;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocOwnerDisplayName;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocOwnerId;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocPermissions;

  @annotation.XmlElement(
    name: 'share-types',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcShareTypes? ocShareTypes;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocSize;

  @annotation.XmlElement(
    name: 'tags',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final WebDavOcTags? ocTags;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
  final String? ocmSharePermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  final int? ocsSharePermissions;
}
