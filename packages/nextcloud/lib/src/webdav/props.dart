// ignore_for_file: public_member_api_docs
// coverage:ignore-file
import 'package:meta/meta.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;
part 'props.g.dart';

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavPropWithoutValues with _$WebDavPropWithoutValuesXmlSerializableMixin {
  const WebDavPropWithoutValues({
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davResourcetype,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncHasPreview,
    this.ncIsEncrypted,
    this.ncMetadataEtag,
    this.ncMountType,
    this.ncNote,
    this.ncRichWorkspace,
    this.ncUploadTime,
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
    this.ocSize,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  const WebDavPropWithoutValues.fromBools({
    bool davGetcontentlength = false,
    bool davGetcontenttype = false,
    bool davGetetag = false,
    bool davGetlastmodified = false,
    bool davResourcetype = false,
    bool ncCreationTime = false,
    bool ncDataFingerprint = false,
    bool ncHasPreview = false,
    bool ncIsEncrypted = false,
    bool ncMetadataEtag = false,
    bool ncMountType = false,
    bool ncNote = false,
    bool ncRichWorkspace = false,
    bool ncUploadTime = false,
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
    bool ocSize = false,
    bool ocmSharePermissions = false,
    bool ocsSharePermissions = false,
  })  : davGetcontentlength = davGetcontentlength ? const [null] : null,
        davGetcontenttype = davGetcontenttype ? const [null] : null,
        davGetetag = davGetetag ? const [null] : null,
        davGetlastmodified = davGetlastmodified ? const [null] : null,
        davResourcetype = davResourcetype ? const [null] : null,
        ncCreationTime = ncCreationTime ? const [null] : null,
        ncDataFingerprint = ncDataFingerprint ? const [null] : null,
        ncHasPreview = ncHasPreview ? const [null] : null,
        ncIsEncrypted = ncIsEncrypted ? const [null] : null,
        ncMetadataEtag = ncMetadataEtag ? const [null] : null,
        ncMountType = ncMountType ? const [null] : null,
        ncNote = ncNote ? const [null] : null,
        ncRichWorkspace = ncRichWorkspace ? const [null] : null,
        ncUploadTime = ncUploadTime ? const [null] : null,
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
        ocSize = ocSize ? const [null] : null,
        ocmSharePermissions = ocmSharePermissions ? const [null] : null,
        ocsSharePermissions = ocsSharePermissions ? const [null] : null;

  factory WebDavPropWithoutValues.fromXmlElement(XmlElement element) =>
      _$WebDavPropWithoutValuesFromXmlElement(element);

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
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davResourcetype;

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
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncHasPreview;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncMetadataEtag;

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
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncUploadTime;

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
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocSize;

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
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davResourcetype,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncHasPreview,
    this.ncIsEncrypted,
    this.ncMetadataEtag,
    this.ncMountType,
    this.ncNote,
    this.ncRichWorkspace,
    this.ncUploadTime,
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
    this.ocSize,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  factory WebDavProp.fromXmlElement(XmlElement element) => _$WebDavPropFromXmlElement(element);

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
  final String? davGetlastmodified;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davResourcetype;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncCreationTime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncDataFingerprint;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHasPreview;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMetadataEtag;

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
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncUploadTime;

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
  final int? ocFavorite;

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
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocSize;

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
    this.davGetcontentlength,
    this.davGetcontenttype,
    this.davGetetag,
    this.davGetlastmodified,
    this.davResourcetype,
    this.ncCreationTime,
    this.ncDataFingerprint,
    this.ncHasPreview,
    this.ncIsEncrypted,
    this.ncMetadataEtag,
    this.ncMountType,
    this.ncNote,
    this.ncRichWorkspace,
    this.ncUploadTime,
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
    this.ocSize,
    this.ocmSharePermissions,
    this.ocsSharePermissions,
  });

  factory WebDavOcFilterRules.fromXmlElement(XmlElement element) => _$WebDavOcFilterRulesFromXmlElement(element);

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
  final String? davGetlastmodified;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davResourcetype;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncCreationTime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncDataFingerprint;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncHasPreview;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncIsEncrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncMetadataEtag;

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
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncRichWorkspace;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncUploadTime;

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
  final int? ocFavorite;

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
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocSize;

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
