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

  WebDavPropfindProp.fromBools({
    final bool davgetlastmodified = false,
    final bool davgetetag = false,
    final bool davgetcontenttype = false,
    final bool davgetcontentlength = false,
    final bool davresourcetype = false,
    final bool ocid = false,
    final bool ocfileid = false,
    final bool ocfavorite = false,
    final bool occommentshref = false,
    final bool occommentscount = false,
    final bool occommentsunread = false,
    final bool ocdownloadurl = false,
    final bool ocownerid = false,
    final bool ocownerdisplayname = false,
    final bool ocsize = false,
    final bool ocpermissions = false,
    final bool ncnote = false,
    final bool ncdatafingerprint = false,
    final bool nchaspreview = false,
    final bool ncmounttype = false,
    final bool ncisencrypted = false,
    final bool ncmetadataetag = false,
    final bool ncuploadtime = false,
    final bool nccreationtime = false,
    final bool ncrichworkspace = false,
    final bool ocssharepermissions = false,
    final bool ocmsharepermissions = false,
  })  : davgetlastmodified = davgetlastmodified ? [null] : null,
        davgetetag = davgetetag ? [null] : null,
        davgetcontenttype = davgetcontenttype ? [null] : null,
        davgetcontentlength = davgetcontentlength ? [null] : null,
        davresourcetype = davresourcetype ? [null] : null,
        ocid = ocid ? [null] : null,
        ocfileid = ocfileid ? [null] : null,
        ocfavorite = ocfavorite ? [null] : null,
        occommentshref = occommentshref ? [null] : null,
        occommentscount = occommentscount ? [null] : null,
        occommentsunread = occommentsunread ? [null] : null,
        ocdownloadurl = ocdownloadurl ? [null] : null,
        ocownerid = ocownerid ? [null] : null,
        ocownerdisplayname = ocownerdisplayname ? [null] : null,
        ocsize = ocsize ? [null] : null,
        ocpermissions = ocpermissions ? [null] : null,
        ncnote = ncnote ? [null] : null,
        ncdatafingerprint = ncdatafingerprint ? [null] : null,
        nchaspreview = nchaspreview ? [null] : null,
        ncmounttype = ncmounttype ? [null] : null,
        ncisencrypted = ncisencrypted ? [null] : null,
        ncmetadataetag = ncmetadataetag ? [null] : null,
        ncuploadtime = ncuploadtime ? [null] : null,
        nccreationtime = nccreationtime ? [null] : null,
        ncrichworkspace = ncrichworkspace ? [null] : null,
        ocssharepermissions = ocssharepermissions ? [null] : null,
        ocmsharepermissions = ocmsharepermissions ? [null] : null;

  factory WebDavPropfindProp.fromXmlElement(final XmlElement element) => _$WebDavPropfindPropFromXmlElement(element);

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? davgetlastmodified;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? davgetetag;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? davgetcontentlength;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? davresourcetype;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocid;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocfileid;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocfavorite;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? occommentshref;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? occommentscount;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocdownloadurl;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocownerid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocsize;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocpermissions;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncnote;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? nchaspreview;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncmounttype;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncisencrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncmetadataetag;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncuploadtime;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? nccreationtime;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ncrichworkspace;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocssharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: true,
    isSelfClosing: true,
  )
  List<String?>? ocmsharepermissions;
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

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetlastmodified;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetetag;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  int? davgetcontentlength;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  WebDavResourcetype? davresourcetype;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocid;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocfileid;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? ocfavorite;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? occommentshref;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? occommentscount;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocdownloadurl;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocownerid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? ocsize;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocpermissions;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncnote;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  bool? nchaspreview;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncmounttype;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? ncisencrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncmetadataetag;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? ncuploadtime;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? nccreationtime;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncrichworkspace;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  int? ocssharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
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

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetlastmodified;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetetag;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  String? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  int? davgetcontentlength;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  WebDavResourcetype? davresourcetype;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocid;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocfileid;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? ocfavorite;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? occommentshref;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? occommentscount;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocdownloadurl;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocownerid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  int? ocsize;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  String? ocpermissions;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncnote;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  bool? nchaspreview;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncmounttype;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? ncisencrypted;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncmetadataetag;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? ncuploadtime;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  int? nccreationtime;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  String? ncrichworkspace;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  int? ocssharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
  String? ocmsharepermissions;
}
