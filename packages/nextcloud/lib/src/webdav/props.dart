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
    this.davcreationdate,
    this.davdisplayname,
    this.davgetcontentlanguage,
    this.davgetcontentlength,
    this.davgetcontenttype,
    this.davgetetag,
    this.davgetlastmodified,
    this.davquotaavailablebytes,
    this.davquotausedbytes,
    this.davresourcetype,
    this.ncaclcanmanage,
    this.ncaclenabled,
    this.nccontainedfilecount,
    this.nccontainedfoldercount,
    this.nccreationtime,
    this.ncdatafingerprint,
    this.ncgroupfolderid,
    this.nchaspreview,
    this.nchidden,
    this.ncisencrypted,
    this.ncismountroot,
    this.nclock,
    this.nclockowner,
    this.nclockownerdisplayname,
    this.nclockownereditor,
    this.nclockownertype,
    this.nclocktime,
    this.nclocktimeout,
    this.nclocktoken,
    this.ncmetadataetag,
    this.ncmounttype,
    this.ncnote,
    this.ncreminderduedate,
    this.ncrichworkspace,
    this.ncrichworkspacefile,
    this.ncshareattributes,
    this.ncuploadtime,
    this.ncversionauthor,
    this.ncversionlabel,
    this.occommentscount,
    this.occommentshref,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocfavorite,
    this.ocfileid,
    this.ocid,
    this.ocownerdisplayname,
    this.ocownerid,
    this.ocpermissions,
    this.ocsize,
    this.ocmsharepermissions,
    this.ocssharepermissions,
  });

  const WebDavPropWithoutValues.fromBools({
    bool davcreationdate = false,
    bool davdisplayname = false,
    bool davgetcontentlanguage = false,
    bool davgetcontentlength = false,
    bool davgetcontenttype = false,
    bool davgetetag = false,
    bool davgetlastmodified = false,
    bool davquotaavailablebytes = false,
    bool davquotausedbytes = false,
    bool davresourcetype = false,
    bool ncaclcanmanage = false,
    bool ncaclenabled = false,
    bool nccontainedfilecount = false,
    bool nccontainedfoldercount = false,
    bool nccreationtime = false,
    bool ncdatafingerprint = false,
    bool ncgroupfolderid = false,
    bool nchaspreview = false,
    bool nchidden = false,
    bool ncisencrypted = false,
    bool ncismountroot = false,
    bool nclock = false,
    bool nclockowner = false,
    bool nclockownerdisplayname = false,
    bool nclockownereditor = false,
    bool nclockownertype = false,
    bool nclocktime = false,
    bool nclocktimeout = false,
    bool nclocktoken = false,
    bool ncmetadataetag = false,
    bool ncmounttype = false,
    bool ncnote = false,
    bool ncreminderduedate = false,
    bool ncrichworkspace = false,
    bool ncrichworkspacefile = false,
    bool ncshareattributes = false,
    bool ncuploadtime = false,
    bool ncversionauthor = false,
    bool ncversionlabel = false,
    bool occommentscount = false,
    bool occommentshref = false,
    bool occommentsunread = false,
    bool ocdownloadurl = false,
    bool ocfavorite = false,
    bool ocfileid = false,
    bool ocid = false,
    bool ocownerdisplayname = false,
    bool ocownerid = false,
    bool ocpermissions = false,
    bool ocsize = false,
    bool ocmsharepermissions = false,
    bool ocssharepermissions = false,
  })  : davcreationdate = davcreationdate ? const [null] : null,
        davdisplayname = davdisplayname ? const [null] : null,
        davgetcontentlanguage = davgetcontentlanguage ? const [null] : null,
        davgetcontentlength = davgetcontentlength ? const [null] : null,
        davgetcontenttype = davgetcontenttype ? const [null] : null,
        davgetetag = davgetetag ? const [null] : null,
        davgetlastmodified = davgetlastmodified ? const [null] : null,
        davquotaavailablebytes = davquotaavailablebytes ? const [null] : null,
        davquotausedbytes = davquotausedbytes ? const [null] : null,
        davresourcetype = davresourcetype ? const [null] : null,
        ncaclcanmanage = ncaclcanmanage ? const [null] : null,
        ncaclenabled = ncaclenabled ? const [null] : null,
        nccontainedfilecount = nccontainedfilecount ? const [null] : null,
        nccontainedfoldercount = nccontainedfoldercount ? const [null] : null,
        nccreationtime = nccreationtime ? const [null] : null,
        ncdatafingerprint = ncdatafingerprint ? const [null] : null,
        ncgroupfolderid = ncgroupfolderid ? const [null] : null,
        nchaspreview = nchaspreview ? const [null] : null,
        nchidden = nchidden ? const [null] : null,
        ncisencrypted = ncisencrypted ? const [null] : null,
        ncismountroot = ncismountroot ? const [null] : null,
        nclock = nclock ? const [null] : null,
        nclockowner = nclockowner ? const [null] : null,
        nclockownerdisplayname = nclockownerdisplayname ? const [null] : null,
        nclockownereditor = nclockownereditor ? const [null] : null,
        nclockownertype = nclockownertype ? const [null] : null,
        nclocktime = nclocktime ? const [null] : null,
        nclocktimeout = nclocktimeout ? const [null] : null,
        nclocktoken = nclocktoken ? const [null] : null,
        ncmetadataetag = ncmetadataetag ? const [null] : null,
        ncmounttype = ncmounttype ? const [null] : null,
        ncnote = ncnote ? const [null] : null,
        ncreminderduedate = ncreminderduedate ? const [null] : null,
        ncrichworkspace = ncrichworkspace ? const [null] : null,
        ncrichworkspacefile = ncrichworkspacefile ? const [null] : null,
        ncshareattributes = ncshareattributes ? const [null] : null,
        ncuploadtime = ncuploadtime ? const [null] : null,
        ncversionauthor = ncversionauthor ? const [null] : null,
        ncversionlabel = ncversionlabel ? const [null] : null,
        occommentscount = occommentscount ? const [null] : null,
        occommentshref = occommentshref ? const [null] : null,
        occommentsunread = occommentsunread ? const [null] : null,
        ocdownloadurl = ocdownloadurl ? const [null] : null,
        ocfavorite = ocfavorite ? const [null] : null,
        ocfileid = ocfileid ? const [null] : null,
        ocid = ocid ? const [null] : null,
        ocownerdisplayname = ocownerdisplayname ? const [null] : null,
        ocownerid = ocownerid ? const [null] : null,
        ocpermissions = ocpermissions ? const [null] : null,
        ocsize = ocsize ? const [null] : null,
        ocmsharepermissions = ocmsharepermissions ? const [null] : null,
        ocssharepermissions = ocssharepermissions ? const [null] : null;

  factory WebDavPropWithoutValues.fromXmlElement(XmlElement element) =>
      _$WebDavPropWithoutValuesFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davcreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davdisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davgetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davgetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davgetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davgetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davquotaavailablebytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davquotausedbytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? davresourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncaclcanmanage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncaclenabled;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nccontainedfilecount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nccontainedfoldercount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nccreationtime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncgroupfolderid;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nchaspreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nchidden;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncisencrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncismountroot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclockowner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclockownerdisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclockownereditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclockownertype;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclocktime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclocktimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? nclocktoken;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncmetadataetag;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncmounttype;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncnote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncreminderduedate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncrichworkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncrichworkspacefile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncshareattributes;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncuploadtime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncversionauthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ncversionlabel;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? occommentscount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? occommentshref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocdownloadurl;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocfavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocfileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocownerid;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocpermissions;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocsize;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocmsharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? ocssharepermissions;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'prop', namespace: namespaceDav)
class WebDavProp with _$WebDavPropXmlSerializableMixin {
  const WebDavProp({
    this.davcreationdate,
    this.davdisplayname,
    this.davgetcontentlanguage,
    this.davgetcontentlength,
    this.davgetcontenttype,
    this.davgetetag,
    this.davgetlastmodified,
    this.davquotaavailablebytes,
    this.davquotausedbytes,
    this.davresourcetype,
    this.ncaclcanmanage,
    this.ncaclenabled,
    this.nccontainedfilecount,
    this.nccontainedfoldercount,
    this.nccreationtime,
    this.ncdatafingerprint,
    this.ncgroupfolderid,
    this.nchaspreview,
    this.nchidden,
    this.ncisencrypted,
    this.ncismountroot,
    this.nclock,
    this.nclockowner,
    this.nclockownerdisplayname,
    this.nclockownereditor,
    this.nclockownertype,
    this.nclocktime,
    this.nclocktimeout,
    this.nclocktoken,
    this.ncmetadataetag,
    this.ncmounttype,
    this.ncnote,
    this.ncreminderduedate,
    this.ncrichworkspace,
    this.ncrichworkspacefile,
    this.ncshareattributes,
    this.ncuploadtime,
    this.ncversionauthor,
    this.ncversionlabel,
    this.occommentscount,
    this.occommentshref,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocfavorite,
    this.ocfileid,
    this.ocid,
    this.ocownerdisplayname,
    this.ocownerid,
    this.ocpermissions,
    this.ocsize,
    this.ocmsharepermissions,
    this.ocssharepermissions,
  });

  factory WebDavProp.fromXmlElement(XmlElement element) => _$WebDavPropFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final DateTime? davcreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davdisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davgetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davquotaavailablebytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davquotausedbytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davresourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncaclcanmanage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncaclenabled;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccontainedfilecount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccontainedfoldercount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccreationtime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncgroupfolderid;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? nchaspreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? nchidden;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncisencrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncismountroot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockowner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockownerdisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockownereditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclockownertype;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclocktime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclocktimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclocktoken;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncmetadataetag;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncmounttype;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncnote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final DateTime? ncreminderduedate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncrichworkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncrichworkspacefile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncshareattributes;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncuploadtime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncversionauthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncversionlabel;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? occommentscount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? occommentshref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocdownloadurl;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocfavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocfileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocownerid;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocpermissions;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocsize;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
  final String? ocmsharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  final int? ocssharepermissions;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'filter-rules', namespace: namespaceOwncloud)
class WebDavOcFilterRules with _$WebDavOcFilterRulesXmlSerializableMixin {
  const WebDavOcFilterRules({
    this.davcreationdate,
    this.davdisplayname,
    this.davgetcontentlanguage,
    this.davgetcontentlength,
    this.davgetcontenttype,
    this.davgetetag,
    this.davgetlastmodified,
    this.davquotaavailablebytes,
    this.davquotausedbytes,
    this.davresourcetype,
    this.ncaclcanmanage,
    this.ncaclenabled,
    this.nccontainedfilecount,
    this.nccontainedfoldercount,
    this.nccreationtime,
    this.ncdatafingerprint,
    this.ncgroupfolderid,
    this.nchaspreview,
    this.nchidden,
    this.ncisencrypted,
    this.ncismountroot,
    this.nclock,
    this.nclockowner,
    this.nclockownerdisplayname,
    this.nclockownereditor,
    this.nclockownertype,
    this.nclocktime,
    this.nclocktimeout,
    this.nclocktoken,
    this.ncmetadataetag,
    this.ncmounttype,
    this.ncnote,
    this.ncreminderduedate,
    this.ncrichworkspace,
    this.ncrichworkspacefile,
    this.ncshareattributes,
    this.ncuploadtime,
    this.ncversionauthor,
    this.ncversionlabel,
    this.occommentscount,
    this.occommentshref,
    this.occommentsunread,
    this.ocdownloadurl,
    this.ocfavorite,
    this.ocfileid,
    this.ocid,
    this.ocownerdisplayname,
    this.ocownerid,
    this.ocpermissions,
    this.ocsize,
    this.ocmsharepermissions,
    this.ocssharepermissions,
  });

  factory WebDavOcFilterRules.fromXmlElement(XmlElement element) => _$WebDavOcFilterRulesFromXmlElement(element);

  @annotation.XmlElement(
    name: 'creationdate',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final DateTime? davcreationdate;

  @annotation.XmlElement(
    name: 'displayname',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davdisplayname;

  @annotation.XmlElement(
    name: 'getcontentlanguage',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetcontentlanguage;

  @annotation.XmlElement(
    name: 'getcontentlength',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davgetcontentlength;

  @annotation.XmlElement(
    name: 'getcontenttype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetcontenttype;

  @annotation.XmlElement(
    name: 'getetag',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetetag;

  @annotation.XmlElement(
    name: 'getlastmodified',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final String? davgetlastmodified;

  @annotation.XmlElement(
    name: 'quota-available-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davquotaavailablebytes;

  @annotation.XmlElement(
    name: 'quota-used-bytes',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final int? davquotausedbytes;

  @annotation.XmlElement(
    name: 'resourcetype',
    namespace: namespaceDav,
    includeIfNull: false,
  )
  final WebDavResourcetype? davresourcetype;

  @annotation.XmlElement(
    name: 'acl-can-manage',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncaclcanmanage;

  @annotation.XmlElement(
    name: 'acl-enabled',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncaclenabled;

  @annotation.XmlElement(
    name: 'contained-file-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccontainedfilecount;

  @annotation.XmlElement(
    name: 'contained-folder-count',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccontainedfoldercount;

  @annotation.XmlElement(
    name: 'creation_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nccreationtime;

  @annotation.XmlElement(
    name: 'data-fingerprint',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncdatafingerprint;

  @annotation.XmlElement(
    name: 'group-folder-id',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncgroupfolderid;

  @annotation.XmlElement(
    name: 'has-preview',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? nchaspreview;

  @annotation.XmlElement(
    name: 'hidden',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? nchidden;

  @annotation.XmlElement(
    name: 'is-encrypted',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncisencrypted;

  @annotation.XmlElement(
    name: 'is-mount-root',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final bool? ncismountroot;

  @annotation.XmlElement(
    name: 'lock',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclock;

  @annotation.XmlElement(
    name: 'lock-owner',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockowner;

  @annotation.XmlElement(
    name: 'lock-owner-displayname',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockownerdisplayname;

  @annotation.XmlElement(
    name: 'lock-owner-editor',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclockownereditor;

  @annotation.XmlElement(
    name: 'lock-owner-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclockownertype;

  @annotation.XmlElement(
    name: 'lock-time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclocktime;

  @annotation.XmlElement(
    name: 'lock-timeout',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? nclocktimeout;

  @annotation.XmlElement(
    name: 'lock-token',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? nclocktoken;

  @annotation.XmlElement(
    name: 'metadata_etag',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncmetadataetag;

  @annotation.XmlElement(
    name: 'mount-type',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncmounttype;

  @annotation.XmlElement(
    name: 'note',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncnote;

  @annotation.XmlElement(
    name: 'reminder-due-date',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final DateTime? ncreminderduedate;

  @annotation.XmlElement(
    name: 'rich-workspace',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncrichworkspace;

  @annotation.XmlElement(
    name: 'rich-workspace-file',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncrichworkspacefile;

  @annotation.XmlElement(
    name: 'share-attributes',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncshareattributes;

  @annotation.XmlElement(
    name: 'upload_time',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final int? ncuploadtime;

  @annotation.XmlElement(
    name: 'version-author',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncversionauthor;

  @annotation.XmlElement(
    name: 'version-label',
    namespace: namespaceNextcloud,
    includeIfNull: false,
  )
  final String? ncversionlabel;

  @annotation.XmlElement(
    name: 'comments-count',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? occommentscount;

  @annotation.XmlElement(
    name: 'comments-href',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? occommentshref;

  @annotation.XmlElement(
    name: 'comments-unread',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? occommentsunread;

  @annotation.XmlElement(
    name: 'downloadURL',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocdownloadurl;

  @annotation.XmlElement(
    name: 'favorite',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocfavorite;

  @annotation.XmlElement(
    name: 'fileid',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocfileid;

  @annotation.XmlElement(
    name: 'id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocid;

  @annotation.XmlElement(
    name: 'owner-display-name',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocownerdisplayname;

  @annotation.XmlElement(
    name: 'owner-id',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocownerid;

  @annotation.XmlElement(
    name: 'permissions',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final String? ocpermissions;

  @annotation.XmlElement(
    name: 'size',
    namespace: namespaceOwncloud,
    includeIfNull: false,
  )
  final int? ocsize;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCloudMesh,
    includeIfNull: false,
  )
  final String? ocmsharepermissions;

  @annotation.XmlElement(
    name: 'share-permissions',
    namespace: namespaceOpenCollaborationServices,
    includeIfNull: false,
  )
  final int? ocssharepermissions;
}
