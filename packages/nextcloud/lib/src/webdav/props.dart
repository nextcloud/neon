// ignore_for_file: public_member_api_docs
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;
part 'props.g.dart';

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavPropfindProp with _$WebDavPropfindPropXmlSerializableMixin {
  WebDavPropfindProp({
    this.davgetlastmodified,
    this.davgetetag,
    this.davgetcontenttype,
    this.davgetcontentlength,
    this.davresourcetype,
    this.ocid,
    this.ocfileid,
    this.ocfavorite,
    this.occommentshref,
    this.occommentscount,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocownerid,
    this.ocownerdisplayname,
    this.ocsize,
    this.ocpermissions,
    this.ncnote,
    this.ncdatafingerprint,
    this.nchaspreview,
    this.ncmounttype,
    this.ncisencrypted,
    this.ncmetadataetag,
    this.ncuploadtime,
    this.nccreationtime,
    this.ncrichworkspace,
    this.ocssharepermissions,
    this.ocmsharepermissions,
  });
  factory WebDavPropfindProp.fromXmlElement(final XmlElement element) => _$WebDavPropfindPropFromXmlElement(element);
  @annotation.XmlElement(name: 'getlastmodified', namespace: namespaceDav, includeIfNull: false)
  bool? davgetlastmodified;
  @annotation.XmlElement(name: 'getetag', namespace: namespaceDav, includeIfNull: false)
  bool? davgetetag;
  @annotation.XmlElement(name: 'getcontenttype', namespace: namespaceDav, includeIfNull: false)
  bool? davgetcontenttype;
  @annotation.XmlElement(name: 'getcontentlength', namespace: namespaceDav, includeIfNull: false)
  bool? davgetcontentlength;
  @annotation.XmlElement(name: 'resourcetype', namespace: namespaceDav, includeIfNull: false)
  bool? davresourcetype;
  @annotation.XmlElement(name: 'id', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocid;
  @annotation.XmlElement(name: 'fileid', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocfileid;
  @annotation.XmlElement(name: 'favorite', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocfavorite;
  @annotation.XmlElement(name: 'comments-href', namespace: namespaceOwncloud, includeIfNull: false)
  bool? occommentshref;
  @annotation.XmlElement(name: 'comments-count', namespace: namespaceOwncloud, includeIfNull: false)
  bool? occommentscount;
  @annotation.XmlElement(name: 'comments-unread', namespace: namespaceOwncloud, includeIfNull: false)
  bool? occommentsunread;
  @annotation.XmlElement(name: 'downloadURL', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocdownloadurl;
  @annotation.XmlElement(name: 'owner-id', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocownerid;
  @annotation.XmlElement(name: 'owner-display-name', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocownerdisplayname;
  @annotation.XmlElement(name: 'size', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocsize;
  @annotation.XmlElement(name: 'permissions', namespace: namespaceOwncloud, includeIfNull: false)
  bool? ocpermissions;
  @annotation.XmlElement(name: 'note', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncnote;
  @annotation.XmlElement(name: 'data-fingerprint', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncdatafingerprint;
  @annotation.XmlElement(name: 'has-preview', namespace: namespaceNextcloud, includeIfNull: false)
  bool? nchaspreview;
  @annotation.XmlElement(name: 'mount-type', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncmounttype;
  @annotation.XmlElement(name: 'is-encrypted', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncisencrypted;
  @annotation.XmlElement(name: 'metadata_etag', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncmetadataetag;
  @annotation.XmlElement(name: 'upload_time', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncuploadtime;
  @annotation.XmlElement(name: 'creation_time', namespace: namespaceNextcloud, includeIfNull: false)
  bool? nccreationtime;
  @annotation.XmlElement(name: 'rich-workspace', namespace: namespaceNextcloud, includeIfNull: false)
  bool? ncrichworkspace;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCollaborationServices, includeIfNull: false)
  bool? ocssharepermissions;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCloudMesh, includeIfNull: false)
  bool? ocmsharepermissions;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavProp with _$WebDavPropXmlSerializableMixin {
  WebDavProp({
    this.davgetlastmodified,
    this.davgetetag,
    this.davgetcontenttype,
    this.davgetcontentlength,
    this.davresourcetype,
    this.ocid,
    this.ocfileid,
    this.ocfavorite,
    this.occommentshref,
    this.occommentscount,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocownerid,
    this.ocownerdisplayname,
    this.ocsize,
    this.ocpermissions,
    this.ncnote,
    this.ncdatafingerprint,
    this.nchaspreview,
    this.ncmounttype,
    this.ncisencrypted,
    this.ncmetadataetag,
    this.ncuploadtime,
    this.nccreationtime,
    this.ncrichworkspace,
    this.ocssharepermissions,
    this.ocmsharepermissions,
  });
  factory WebDavProp.fromXmlElement(final XmlElement element) => _$WebDavPropFromXmlElement(element);
  @annotation.XmlElement(name: 'getlastmodified', namespace: namespaceDav, includeIfNull: false)
  String? davgetlastmodified;
  @annotation.XmlElement(name: 'getetag', namespace: namespaceDav, includeIfNull: false)
  String? davgetetag;
  @annotation.XmlElement(name: 'getcontenttype', namespace: namespaceDav, includeIfNull: false)
  String? davgetcontenttype;
  @annotation.XmlElement(name: 'getcontentlength', namespace: namespaceDav, includeIfNull: false)
  int? davgetcontentlength;
  @annotation.XmlElement(name: 'resourcetype', namespace: namespaceDav, includeIfNull: false)
  WebDavResourcetype? davresourcetype;
  @annotation.XmlElement(name: 'id', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocid;
  @annotation.XmlElement(name: 'fileid', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocfileid;
  @annotation.XmlElement(name: 'favorite', namespace: namespaceOwncloud, includeIfNull: false)
  int? ocfavorite;
  @annotation.XmlElement(name: 'comments-href', namespace: namespaceOwncloud, includeIfNull: false)
  String? occommentshref;
  @annotation.XmlElement(name: 'comments-count', namespace: namespaceOwncloud, includeIfNull: false)
  int? occommentscount;
  @annotation.XmlElement(name: 'comments-unread', namespace: namespaceOwncloud, includeIfNull: false)
  int? occommentsunread;
  @annotation.XmlElement(name: 'downloadURL', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocdownloadurl;
  @annotation.XmlElement(name: 'owner-id', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocownerid;
  @annotation.XmlElement(name: 'owner-display-name', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocownerdisplayname;
  @annotation.XmlElement(name: 'size', namespace: namespaceOwncloud, includeIfNull: false)
  int? ocsize;
  @annotation.XmlElement(name: 'permissions', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocpermissions;
  @annotation.XmlElement(name: 'note', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncnote;
  @annotation.XmlElement(name: 'data-fingerprint', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncdatafingerprint;
  @annotation.XmlElement(name: 'has-preview', namespace: namespaceNextcloud, includeIfNull: false)
  bool? nchaspreview;
  @annotation.XmlElement(name: 'mount-type', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncmounttype;
  @annotation.XmlElement(name: 'is-encrypted', namespace: namespaceNextcloud, includeIfNull: false)
  int? ncisencrypted;
  @annotation.XmlElement(name: 'metadata_etag', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncmetadataetag;
  @annotation.XmlElement(name: 'upload_time', namespace: namespaceNextcloud, includeIfNull: false)
  int? ncuploadtime;
  @annotation.XmlElement(name: 'creation_time', namespace: namespaceNextcloud, includeIfNull: false)
  int? nccreationtime;
  @annotation.XmlElement(name: 'rich-workspace', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncrichworkspace;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCollaborationServices, includeIfNull: false)
  int? ocssharepermissions;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCloudMesh, includeIfNull: false)
  String? ocmsharepermissions;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'filter-rules', namespace: namespaceOwncloud)
class WebDavOcFilterRules with _$WebDavOcFilterRulesXmlSerializableMixin {
  WebDavOcFilterRules({
    this.davgetlastmodified,
    this.davgetetag,
    this.davgetcontenttype,
    this.davgetcontentlength,
    this.davresourcetype,
    this.ocid,
    this.ocfileid,
    this.ocfavorite,
    this.occommentshref,
    this.occommentscount,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocownerid,
    this.ocownerdisplayname,
    this.ocsize,
    this.ocpermissions,
    this.ncnote,
    this.ncdatafingerprint,
    this.nchaspreview,
    this.ncmounttype,
    this.ncisencrypted,
    this.ncmetadataetag,
    this.ncuploadtime,
    this.nccreationtime,
    this.ncrichworkspace,
    this.ocssharepermissions,
    this.ocmsharepermissions,
  });
  factory WebDavOcFilterRules.fromXmlElement(final XmlElement element) => _$WebDavOcFilterRulesFromXmlElement(element);
  @annotation.XmlElement(name: 'getlastmodified', namespace: namespaceDav, includeIfNull: false)
  String? davgetlastmodified;
  @annotation.XmlElement(name: 'getetag', namespace: namespaceDav, includeIfNull: false)
  String? davgetetag;
  @annotation.XmlElement(name: 'getcontenttype', namespace: namespaceDav, includeIfNull: false)
  String? davgetcontenttype;
  @annotation.XmlElement(name: 'getcontentlength', namespace: namespaceDav, includeIfNull: false)
  int? davgetcontentlength;
  @annotation.XmlElement(name: 'resourcetype', namespace: namespaceDav, includeIfNull: false)
  WebDavResourcetype? davresourcetype;
  @annotation.XmlElement(name: 'id', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocid;
  @annotation.XmlElement(name: 'fileid', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocfileid;
  @annotation.XmlElement(name: 'favorite', namespace: namespaceOwncloud, includeIfNull: false)
  int? ocfavorite;
  @annotation.XmlElement(name: 'comments-href', namespace: namespaceOwncloud, includeIfNull: false)
  String? occommentshref;
  @annotation.XmlElement(name: 'comments-count', namespace: namespaceOwncloud, includeIfNull: false)
  int? occommentscount;
  @annotation.XmlElement(name: 'comments-unread', namespace: namespaceOwncloud, includeIfNull: false)
  int? occommentsunread;
  @annotation.XmlElement(name: 'downloadURL', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocdownloadurl;
  @annotation.XmlElement(name: 'owner-id', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocownerid;
  @annotation.XmlElement(name: 'owner-display-name', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocownerdisplayname;
  @annotation.XmlElement(name: 'size', namespace: namespaceOwncloud, includeIfNull: false)
  int? ocsize;
  @annotation.XmlElement(name: 'permissions', namespace: namespaceOwncloud, includeIfNull: false)
  String? ocpermissions;
  @annotation.XmlElement(name: 'note', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncnote;
  @annotation.XmlElement(name: 'data-fingerprint', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncdatafingerprint;
  @annotation.XmlElement(name: 'has-preview', namespace: namespaceNextcloud, includeIfNull: false)
  bool? nchaspreview;
  @annotation.XmlElement(name: 'mount-type', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncmounttype;
  @annotation.XmlElement(name: 'is-encrypted', namespace: namespaceNextcloud, includeIfNull: false)
  int? ncisencrypted;
  @annotation.XmlElement(name: 'metadata_etag', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncmetadataetag;
  @annotation.XmlElement(name: 'upload_time', namespace: namespaceNextcloud, includeIfNull: false)
  int? ncuploadtime;
  @annotation.XmlElement(name: 'creation_time', namespace: namespaceNextcloud, includeIfNull: false)
  int? nccreationtime;
  @annotation.XmlElement(name: 'rich-workspace', namespace: namespaceNextcloud, includeIfNull: false)
  String? ncrichworkspace;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCollaborationServices, includeIfNull: false)
  int? ocssharepermissions;
  @annotation.XmlElement(name: 'share-permissions', namespace: namespaceOpenCloudMesh, includeIfNull: false)
  String? ocmsharepermissions;
}
