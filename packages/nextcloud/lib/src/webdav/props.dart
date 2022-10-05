part of '../../nextcloud.dart';

/// Mapping of all WebDAV properties.
enum WebDavProps {
  /// Contains the Last-Modified header value  .
  davLastModified('d:getlastmodified'),

  /// Contains the ETag header value.
  davETag('d:getetag'),

  /// Contains the Content-Type header value.
  davContentType('d:getcontenttype'),

  /// Specifies the nature of the resource.
  davResourceType('d:resourcetype'),

  /// Contains the Content-Length header.
  davContentLength('d:getcontentlength'),

  /// The fileid namespaced by the instance id, globally unique
  ocId('oc:id'),

  /// The unique id for the file within the instance
  ocFileId('oc:fileid'),

  /// List of user specified tags. Can be modified.
  ocTags('oc:tags'),

  /// Whether a resource is tagged as favorite.
  /// Can be modified and reported on with list-files.
  ocFavorite('oc:favorite'),

  /// List of collaborative tags. Can be reported on with list-files.
  ///
  /// Valid system tags are:
  /// - oc:id
  /// - oc:display-name
  /// - oc:user-visible
  /// - oc:user-assignable
  /// - oc:groups
  /// - oc:can-assign
  ocSystemTag('oc:systemtag'),

  /// Can be reported on with list-files.
  ocCircle('oc:circle'),

  /// Link to the comments for this resource.
  ocCommentsHref('oc:comments-href'),

  /// Number of comments.
  ocCommentsCount('oc:comments-count'),

  /// Number of unread comments.
  ocCommentsUnread('oc:comments-unread'),

  /// Download URL.
  ocDownloadURL('oc:downloadURL'),

  /// The user id of the owner of a shared file
  ocOwnerId('oc:owner-id'),

  /// The display name of the owner of a shared file
  ocOwnerDisplayName('oc:owner-display-name'),

  /// Share types of this file.
  ///
  /// Returns a list of share-type objects where:
  /// - 0: user share
  /// - 1: group share
  /// - 2: usergroup share
  /// - 3: public link
  /// - 4: email
  /// - 5: contact
  /// - 6: remote (federated cloud)
  /// - 7: circle
  /// - 8: guest
  /// - 9: remote group
  /// - 10: room (talk conversation)
  /// - 11: userroom
  /// See also [OCS Share API](https://docs.nextcloud.com/server/19/developer_manual/client_apis/OCS/ocs-share-api.html)
  ocShareTypes('oc:share-types'),

  /// List of users this file is shared with.
  ///
  /// Returns a list of sharee objects with:
  /// - id
  /// - display-name
  /// - type (share type)
  ncShareees('nc:sharees'),

  /// Share note.
  ncNote('nc:note'),

  /// Checksums as provided during upload.
  ///
  /// Returns a list of checksum objects.
  ocChecksums('oc:checksums'),

  /// Unlike [[davContentLength]], this property also works for folders
  /// reporting the size of everything in the folder.
  ocSize('oc:size'),

  /// WebDAV permissions:
  ///
  /// - S: shared
  /// - R: shareable
  /// - M: mounted
  /// - G: readable
  /// - D: deletable
  /// - NV: updateable, renameable, moveble
  /// - W: updateable (file)
  /// - CK: creatable
  ocPermissions('oc:permissions'),

  /// Nextcloud CRUDS permissions:
  ///
  /// - 1: read
  /// - 2: update
  /// - 4: create
  /// - 8: delete
  /// - 16: share
  /// - 31: all
  ocsSharePermissions('ocs:share-permissions'),

  /// OCM permissions:
  ///
  /// - share
  /// - read
  /// - write
  ocmSharePermissions('ocm:share-permissions'),

  /// system data-fingerprint
  ncDataFingerprint('nc:data-fingerprint'),

  /// Whether a preview is available.
  ncHasPreview('nc:has-preview'),

  /// Mount type, e.g. global, group, user, personal, shared, shared-root, external
  ncMountType('nc:mount-type'),

  /// Is this file is encrypted, 0 for false or 1 for true.
  ncIsEncrypted('nc:is-encrypted'),

  // ignore: public_member_api_docs
  ncMetadataETag('nc:metadata_etag'),

  /// Date this file was uploaded.
  ncUploadTime('nc:upload_time'),

  /// Creation time of the file as provided during upload.
  ncCreationTime('nc:creation_time'),

  // ignore: public_member_api_docs
  ncRichWorkspace('nc:rich-workspace');

  // ignore: public_member_api_docs
  const WebDavProps(this.name);

  /// Name of the prop
  final String name;

  // coverage:ignore-start
  @override
  String toString() => name;
  // coverage:ignore-end
}
