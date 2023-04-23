// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'props.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$WebDavPropfindPropBuildXmlChildren(WebDavPropfindProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified != null
      ? davgetlastmodified == true
          ? 'true'
          : 'false'
      : null;
  if (davgetlastmodifiedSerialized != null) {
    builder.element('getlastmodified', namespace: 'DAV:', nest: () {
      builder.text(davgetlastmodifiedSerialized);
    });
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag != null
      ? davgetetag == true
          ? 'true'
          : 'false'
      : null;
  if (davgetetagSerialized != null) {
    builder.element('getetag', namespace: 'DAV:', nest: () {
      builder.text(davgetetagSerialized);
    });
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype != null
      ? davgetcontenttype == true
          ? 'true'
          : 'false'
      : null;
  if (davgetcontenttypeSerialized != null) {
    builder.element('getcontenttype', namespace: 'DAV:', nest: () {
      builder.text(davgetcontenttypeSerialized);
    });
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength != null
      ? davgetcontentlength == true
          ? 'true'
          : 'false'
      : null;
  if (davgetcontentlengthSerialized != null) {
    builder.element('getcontentlength', namespace: 'DAV:', nest: () {
      builder.text(davgetcontentlengthSerialized);
    });
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype != null
      ? davresourcetype == true
          ? 'true'
          : 'false'
      : null;
  if (davresourcetypeSerialized != null) {
    builder.element('resourcetype', namespace: 'DAV:', nest: () {
      builder.text(davresourcetypeSerialized);
    });
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid != null
      ? ocid == true
          ? 'true'
          : 'false'
      : null;
  if (ocidSerialized != null) {
    builder.element('id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocidSerialized);
    });
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid != null
      ? ocfileid == true
          ? 'true'
          : 'false'
      : null;
  if (ocfileidSerialized != null) {
    builder.element('fileid', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfileidSerialized);
    });
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite != null
      ? ocfavorite == true
          ? 'true'
          : 'false'
      : null;
  if (ocfavoriteSerialized != null) {
    builder.element('favorite', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfavoriteSerialized);
    });
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref != null
      ? occommentshref == true
          ? 'true'
          : 'false'
      : null;
  if (occommentshrefSerialized != null) {
    builder.element('comments-href', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentshrefSerialized);
    });
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount != null
      ? occommentscount == true
          ? 'true'
          : 'false'
      : null;
  if (occommentscountSerialized != null) {
    builder.element('comments-count', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentscountSerialized);
    });
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread != null
      ? occommentsunread == true
          ? 'true'
          : 'false'
      : null;
  if (occommentsunreadSerialized != null) {
    builder.element('comments-unread', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentsunreadSerialized);
    });
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl != null
      ? ocdownloadurl == true
          ? 'true'
          : 'false'
      : null;
  if (ocdownloadurlSerialized != null) {
    builder.element('downloadURL', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocdownloadurlSerialized);
    });
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid != null
      ? ocownerid == true
          ? 'true'
          : 'false'
      : null;
  if (ocowneridSerialized != null) {
    builder.element('owner-id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocowneridSerialized);
    });
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname != null
      ? ocownerdisplayname == true
          ? 'true'
          : 'false'
      : null;
  if (ocownerdisplaynameSerialized != null) {
    builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocownerdisplaynameSerialized);
    });
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize != null
      ? ocsize == true
          ? 'true'
          : 'false'
      : null;
  if (ocsizeSerialized != null) {
    builder.element('size', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocsizeSerialized);
    });
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions != null
      ? ocpermissions == true
          ? 'true'
          : 'false'
      : null;
  if (ocpermissionsSerialized != null) {
    builder.element('permissions', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocpermissionsSerialized);
    });
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote != null
      ? ncnote == true
          ? 'true'
          : 'false'
      : null;
  if (ncnoteSerialized != null) {
    builder.element('note', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncnoteSerialized);
    });
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint != null
      ? ncdatafingerprint == true
          ? 'true'
          : 'false'
      : null;
  if (ncdatafingerprintSerialized != null) {
    builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncdatafingerprintSerialized);
    });
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  if (nchaspreviewSerialized != null) {
    builder.element('has-preview', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nchaspreviewSerialized);
    });
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype != null
      ? ncmounttype == true
          ? 'true'
          : 'false'
      : null;
  if (ncmounttypeSerialized != null) {
    builder.element('mount-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmounttypeSerialized);
    });
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted != null
      ? ncisencrypted == true
          ? 'true'
          : 'false'
      : null;
  if (ncisencryptedSerialized != null) {
    builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncisencryptedSerialized);
    });
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag != null
      ? ncmetadataetag == true
          ? 'true'
          : 'false'
      : null;
  if (ncmetadataetagSerialized != null) {
    builder.element('metadata_etag', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmetadataetagSerialized);
    });
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime != null
      ? ncuploadtime == true
          ? 'true'
          : 'false'
      : null;
  if (ncuploadtimeSerialized != null) {
    builder.element('upload_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncuploadtimeSerialized);
    });
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime != null
      ? nccreationtime == true
          ? 'true'
          : 'false'
      : null;
  if (nccreationtimeSerialized != null) {
    builder.element('creation_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nccreationtimeSerialized);
    });
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace != null
      ? ncrichworkspace == true
          ? 'true'
          : 'false'
      : null;
  if (ncrichworkspaceSerialized != null) {
    builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncrichworkspaceSerialized);
    });
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions != null
      ? ocssharepermissions == true
          ? 'true'
          : 'false'
      : null;
  if (ocssharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', nest: () {
      builder.text(ocssharepermissionsSerialized);
    });
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions != null
      ? ocmsharepermissions == true
          ? 'true'
          : 'false'
      : null;
  if (ocmsharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', nest: () {
      builder.text(ocmsharepermissionsSerialized);
    });
  }
}

void _$WebDavPropfindPropBuildXmlElement(WebDavPropfindProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('prop', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropfindProp _$WebDavPropfindPropFromXmlElement(XmlElement element) {
  final davgetlastmodified = element.getElement('getlastmodified', namespace: 'DAV:')?.getText();
  final davgetetag = element.getElement('getetag', namespace: 'DAV:')?.getText();
  final davgetcontenttype = element.getElement('getcontenttype', namespace: 'DAV:')?.getText();
  final davgetcontentlength = element.getElement('getcontentlength', namespace: 'DAV:')?.getText();
  final davresourcetype = element.getElement('resourcetype', namespace: 'DAV:')?.getText();
  final ocid = element.getElement('id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfileid = element.getElement('fileid', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfavorite = element.getElement('favorite', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentshref = element.getElement('comments-href', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentscount = element.getElement('comments-count', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentsunread = element.getElement('comments-unread', namespace: 'http://owncloud.org/ns')?.getText();
  final ocdownloadurl = element.getElement('downloadURL', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerid = element.getElement('owner-id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerdisplayname = element.getElement('owner-display-name', namespace: 'http://owncloud.org/ns')?.getText();
  final ocsize = element.getElement('size', namespace: 'http://owncloud.org/ns')?.getText();
  final ocpermissions = element.getElement('permissions', namespace: 'http://owncloud.org/ns')?.getText();
  final ncnote = element.getElement('note', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncdatafingerprint = element.getElement('data-fingerprint', namespace: 'http://nextcloud.org/ns')?.getText();
  final nchaspreview = element.getElement('has-preview', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmounttype = element.getElement('mount-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncisencrypted = element.getElement('is-encrypted', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmetadataetag = element.getElement('metadata_etag', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncuploadtime = element.getElement('upload_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final nccreationtime = element.getElement('creation_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncrichworkspace = element.getElement('rich-workspace', namespace: 'http://nextcloud.org/ns')?.getText();
  final ocssharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-collaboration-services.org/ns')?.getText();
  final ocmsharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')?.getText();
  return WebDavPropfindProp(
      davgetlastmodified: davgetlastmodified != null
          ? davgetlastmodified == 'true' || davgetlastmodified == '1'
              ? true
              : davgetlastmodified == 'false' || davgetlastmodified == '0'
                  ? false
                  : throw FormatException('Invalid bool format', davgetlastmodified)
          : null,
      davgetetag: davgetetag != null
          ? davgetetag == 'true' || davgetetag == '1'
              ? true
              : davgetetag == 'false' || davgetetag == '0'
                  ? false
                  : throw FormatException('Invalid bool format', davgetetag)
          : null,
      davgetcontenttype: davgetcontenttype != null
          ? davgetcontenttype == 'true' || davgetcontenttype == '1'
              ? true
              : davgetcontenttype == 'false' || davgetcontenttype == '0'
                  ? false
                  : throw FormatException('Invalid bool format', davgetcontenttype)
          : null,
      davgetcontentlength: davgetcontentlength != null
          ? davgetcontentlength == 'true' || davgetcontentlength == '1'
              ? true
              : davgetcontentlength == 'false' || davgetcontentlength == '0'
                  ? false
                  : throw FormatException('Invalid bool format', davgetcontentlength)
          : null,
      davresourcetype: davresourcetype != null
          ? davresourcetype == 'true' || davresourcetype == '1'
              ? true
              : davresourcetype == 'false' || davresourcetype == '0'
                  ? false
                  : throw FormatException('Invalid bool format', davresourcetype)
          : null,
      ocid: ocid != null
          ? ocid == 'true' || ocid == '1'
              ? true
              : ocid == 'false' || ocid == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocid)
          : null,
      ocfileid: ocfileid != null
          ? ocfileid == 'true' || ocfileid == '1'
              ? true
              : ocfileid == 'false' || ocfileid == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocfileid)
          : null,
      ocfavorite: ocfavorite != null
          ? ocfavorite == 'true' || ocfavorite == '1'
              ? true
              : ocfavorite == 'false' || ocfavorite == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocfavorite)
          : null,
      occommentshref: occommentshref != null
          ? occommentshref == 'true' || occommentshref == '1'
              ? true
              : occommentshref == 'false' || occommentshref == '0'
                  ? false
                  : throw FormatException('Invalid bool format', occommentshref)
          : null,
      occommentscount: occommentscount != null
          ? occommentscount == 'true' || occommentscount == '1'
              ? true
              : occommentscount == 'false' || occommentscount == '0'
                  ? false
                  : throw FormatException('Invalid bool format', occommentscount)
          : null,
      occommentsunread: occommentsunread != null
          ? occommentsunread == 'true' || occommentsunread == '1'
              ? true
              : occommentsunread == 'false' || occommentsunread == '0'
                  ? false
                  : throw FormatException('Invalid bool format', occommentsunread)
          : null,
      ocdownloadurl: ocdownloadurl != null
          ? ocdownloadurl == 'true' || ocdownloadurl == '1'
              ? true
              : ocdownloadurl == 'false' || ocdownloadurl == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocdownloadurl)
          : null,
      ocownerid: ocownerid != null
          ? ocownerid == 'true' || ocownerid == '1'
              ? true
              : ocownerid == 'false' || ocownerid == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocownerid)
          : null,
      ocownerdisplayname: ocownerdisplayname != null
          ? ocownerdisplayname == 'true' || ocownerdisplayname == '1'
              ? true
              : ocownerdisplayname == 'false' || ocownerdisplayname == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocownerdisplayname)
          : null,
      ocsize: ocsize != null
          ? ocsize == 'true' || ocsize == '1'
              ? true
              : ocsize == 'false' || ocsize == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocsize)
          : null,
      ocpermissions: ocpermissions != null
          ? ocpermissions == 'true' || ocpermissions == '1'
              ? true
              : ocpermissions == 'false' || ocpermissions == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocpermissions)
          : null,
      ncnote: ncnote != null
          ? ncnote == 'true' || ncnote == '1'
              ? true
              : ncnote == 'false' || ncnote == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncnote)
          : null,
      ncdatafingerprint: ncdatafingerprint != null
          ? ncdatafingerprint == 'true' || ncdatafingerprint == '1'
              ? true
              : ncdatafingerprint == 'false' || ncdatafingerprint == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncdatafingerprint)
          : null,
      nchaspreview: nchaspreview != null
          ? nchaspreview == 'true' || nchaspreview == '1'
              ? true
              : nchaspreview == 'false' || nchaspreview == '0'
                  ? false
                  : throw FormatException('Invalid bool format', nchaspreview)
          : null,
      ncmounttype: ncmounttype != null
          ? ncmounttype == 'true' || ncmounttype == '1'
              ? true
              : ncmounttype == 'false' || ncmounttype == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncmounttype)
          : null,
      ncisencrypted: ncisencrypted != null
          ? ncisencrypted == 'true' || ncisencrypted == '1'
              ? true
              : ncisencrypted == 'false' || ncisencrypted == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncisencrypted)
          : null,
      ncmetadataetag: ncmetadataetag != null
          ? ncmetadataetag == 'true' || ncmetadataetag == '1'
              ? true
              : ncmetadataetag == 'false' || ncmetadataetag == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncmetadataetag)
          : null,
      ncuploadtime: ncuploadtime != null
          ? ncuploadtime == 'true' || ncuploadtime == '1'
              ? true
              : ncuploadtime == 'false' || ncuploadtime == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncuploadtime)
          : null,
      nccreationtime: nccreationtime != null
          ? nccreationtime == 'true' || nccreationtime == '1'
              ? true
              : nccreationtime == 'false' || nccreationtime == '0'
                  ? false
                  : throw FormatException('Invalid bool format', nccreationtime)
          : null,
      ncrichworkspace: ncrichworkspace != null
          ? ncrichworkspace == 'true' || ncrichworkspace == '1'
              ? true
              : ncrichworkspace == 'false' || ncrichworkspace == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ncrichworkspace)
          : null,
      ocssharepermissions: ocssharepermissions != null
          ? ocssharepermissions == 'true' || ocssharepermissions == '1'
              ? true
              : ocssharepermissions == 'false' || ocssharepermissions == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocssharepermissions)
          : null,
      ocmsharepermissions: ocmsharepermissions != null
          ? ocmsharepermissions == 'true' || ocmsharepermissions == '1'
              ? true
              : ocmsharepermissions == 'false' || ocmsharepermissions == '0'
                  ? false
                  : throw FormatException('Invalid bool format', ocmsharepermissions)
          : null);
}

List<XmlAttribute> _$WebDavPropfindPropToXmlAttributes(WebDavPropfindProp instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropfindPropToXmlChildren(WebDavPropfindProp instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified != null
      ? davgetlastmodified == true
          ? 'true'
          : 'false'
      : null;
  final davgetlastmodifiedConstructed = davgetlastmodifiedSerialized != null
      ? XmlElement(XmlName('getlastmodified', namespaces['DAV:']), [], [XmlText(davgetlastmodifiedSerialized)])
      : null;
  if (davgetlastmodifiedConstructed != null) {
    children.add(davgetlastmodifiedConstructed);
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag != null
      ? davgetetag == true
          ? 'true'
          : 'false'
      : null;
  final davgetetagConstructed = davgetetagSerialized != null
      ? XmlElement(XmlName('getetag', namespaces['DAV:']), [], [XmlText(davgetetagSerialized)])
      : null;
  if (davgetetagConstructed != null) {
    children.add(davgetetagConstructed);
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype != null
      ? davgetcontenttype == true
          ? 'true'
          : 'false'
      : null;
  final davgetcontenttypeConstructed = davgetcontenttypeSerialized != null
      ? XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], [XmlText(davgetcontenttypeSerialized)])
      : null;
  if (davgetcontenttypeConstructed != null) {
    children.add(davgetcontenttypeConstructed);
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength != null
      ? davgetcontentlength == true
          ? 'true'
          : 'false'
      : null;
  final davgetcontentlengthConstructed = davgetcontentlengthSerialized != null
      ? XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], [XmlText(davgetcontentlengthSerialized)])
      : null;
  if (davgetcontentlengthConstructed != null) {
    children.add(davgetcontentlengthConstructed);
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype != null
      ? davresourcetype == true
          ? 'true'
          : 'false'
      : null;
  final davresourcetypeConstructed = davresourcetypeSerialized != null
      ? XmlElement(XmlName('resourcetype', namespaces['DAV:']), [], [XmlText(davresourcetypeSerialized)])
      : null;
  if (davresourcetypeConstructed != null) {
    children.add(davresourcetypeConstructed);
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid != null
      ? ocid == true
          ? 'true'
          : 'false'
      : null;
  final ocidConstructed = ocidSerialized != null
      ? XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocidSerialized)])
      : null;
  if (ocidConstructed != null) {
    children.add(ocidConstructed);
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid != null
      ? ocfileid == true
          ? 'true'
          : 'false'
      : null;
  final ocfileidConstructed = ocfileidSerialized != null
      ? XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfileidSerialized)])
      : null;
  if (ocfileidConstructed != null) {
    children.add(ocfileidConstructed);
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite != null
      ? ocfavorite == true
          ? 'true'
          : 'false'
      : null;
  final ocfavoriteConstructed = ocfavoriteSerialized != null
      ? XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfavoriteSerialized)])
      : null;
  if (ocfavoriteConstructed != null) {
    children.add(ocfavoriteConstructed);
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref != null
      ? occommentshref == true
          ? 'true'
          : 'false'
      : null;
  final occommentshrefConstructed = occommentshrefSerialized != null
      ? XmlElement(
          XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentshrefSerialized)])
      : null;
  if (occommentshrefConstructed != null) {
    children.add(occommentshrefConstructed);
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount != null
      ? occommentscount == true
          ? 'true'
          : 'false'
      : null;
  final occommentscountConstructed = occommentscountSerialized != null
      ? XmlElement(
          XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentscountSerialized)])
      : null;
  if (occommentscountConstructed != null) {
    children.add(occommentscountConstructed);
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread != null
      ? occommentsunread == true
          ? 'true'
          : 'false'
      : null;
  final occommentsunreadConstructed = occommentsunreadSerialized != null
      ? XmlElement(
          XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentsunreadSerialized)])
      : null;
  if (occommentsunreadConstructed != null) {
    children.add(occommentsunreadConstructed);
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl != null
      ? ocdownloadurl == true
          ? 'true'
          : 'false'
      : null;
  final ocdownloadurlConstructed = ocdownloadurlSerialized != null
      ? XmlElement(XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], [XmlText(ocdownloadurlSerialized)])
      : null;
  if (ocdownloadurlConstructed != null) {
    children.add(ocdownloadurlConstructed);
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid != null
      ? ocownerid == true
          ? 'true'
          : 'false'
      : null;
  final ocowneridConstructed = ocowneridSerialized != null
      ? XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocowneridSerialized)])
      : null;
  if (ocowneridConstructed != null) {
    children.add(ocowneridConstructed);
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname != null
      ? ocownerdisplayname == true
          ? 'true'
          : 'false'
      : null;
  final ocownerdisplaynameConstructed = ocownerdisplaynameSerialized != null
      ? XmlElement(XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [],
          [XmlText(ocownerdisplaynameSerialized)])
      : null;
  if (ocownerdisplaynameConstructed != null) {
    children.add(ocownerdisplaynameConstructed);
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize != null
      ? ocsize == true
          ? 'true'
          : 'false'
      : null;
  final ocsizeConstructed = ocsizeSerialized != null
      ? XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], [XmlText(ocsizeSerialized)])
      : null;
  if (ocsizeConstructed != null) {
    children.add(ocsizeConstructed);
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions != null
      ? ocpermissions == true
          ? 'true'
          : 'false'
      : null;
  final ocpermissionsConstructed = ocpermissionsSerialized != null
      ? XmlElement(XmlName('permissions', namespaces['http://owncloud.org/ns']), [], [XmlText(ocpermissionsSerialized)])
      : null;
  if (ocpermissionsConstructed != null) {
    children.add(ocpermissionsConstructed);
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote != null
      ? ncnote == true
          ? 'true'
          : 'false'
      : null;
  final ncnoteConstructed = ncnoteSerialized != null
      ? XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncnoteSerialized)])
      : null;
  if (ncnoteConstructed != null) {
    children.add(ncnoteConstructed);
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint != null
      ? ncdatafingerprint == true
          ? 'true'
          : 'false'
      : null;
  final ncdatafingerprintConstructed = ncdatafingerprintSerialized != null
      ? XmlElement(XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncdatafingerprintSerialized)])
      : null;
  if (ncdatafingerprintConstructed != null) {
    children.add(ncdatafingerprintConstructed);
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  final nchaspreviewConstructed = nchaspreviewSerialized != null
      ? XmlElement(XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], [XmlText(nchaspreviewSerialized)])
      : null;
  if (nchaspreviewConstructed != null) {
    children.add(nchaspreviewConstructed);
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype != null
      ? ncmounttype == true
          ? 'true'
          : 'false'
      : null;
  final ncmounttypeConstructed = ncmounttypeSerialized != null
      ? XmlElement(XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmounttypeSerialized)])
      : null;
  if (ncmounttypeConstructed != null) {
    children.add(ncmounttypeConstructed);
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted != null
      ? ncisencrypted == true
          ? 'true'
          : 'false'
      : null;
  final ncisencryptedConstructed = ncisencryptedSerialized != null
      ? XmlElement(
          XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncisencryptedSerialized)])
      : null;
  if (ncisencryptedConstructed != null) {
    children.add(ncisencryptedConstructed);
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag != null
      ? ncmetadataetag == true
          ? 'true'
          : 'false'
      : null;
  final ncmetadataetagConstructed = ncmetadataetagSerialized != null
      ? XmlElement(
          XmlName('metadata_etag', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmetadataetagSerialized)])
      : null;
  if (ncmetadataetagConstructed != null) {
    children.add(ncmetadataetagConstructed);
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime != null
      ? ncuploadtime == true
          ? 'true'
          : 'false'
      : null;
  final ncuploadtimeConstructed = ncuploadtimeSerialized != null
      ? XmlElement(XmlName('upload_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncuploadtimeSerialized)])
      : null;
  if (ncuploadtimeConstructed != null) {
    children.add(ncuploadtimeConstructed);
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime != null
      ? nccreationtime == true
          ? 'true'
          : 'false'
      : null;
  final nccreationtimeConstructed = nccreationtimeSerialized != null
      ? XmlElement(
          XmlName('creation_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(nccreationtimeSerialized)])
      : null;
  if (nccreationtimeConstructed != null) {
    children.add(nccreationtimeConstructed);
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace != null
      ? ncrichworkspace == true
          ? 'true'
          : 'false'
      : null;
  final ncrichworkspaceConstructed = ncrichworkspaceSerialized != null
      ? XmlElement(
          XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncrichworkspaceSerialized)])
      : null;
  if (ncrichworkspaceConstructed != null) {
    children.add(ncrichworkspaceConstructed);
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions != null
      ? ocssharepermissions == true
          ? 'true'
          : 'false'
      : null;
  final ocssharepermissionsConstructed = ocssharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']), [],
          [XmlText(ocssharepermissionsSerialized)])
      : null;
  if (ocssharepermissionsConstructed != null) {
    children.add(ocssharepermissionsConstructed);
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions != null
      ? ocmsharepermissions == true
          ? 'true'
          : 'false'
      : null;
  final ocmsharepermissionsConstructed = ocmsharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']), [],
          [XmlText(ocmsharepermissionsSerialized)])
      : null;
  if (ocmsharepermissionsConstructed != null) {
    children.add(ocmsharepermissionsConstructed);
  }
  return children;
}

XmlElement _$WebDavPropfindPropToXmlElement(WebDavPropfindProp instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('prop', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropfindPropXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropfindPropBuildXmlChildren(this as WebDavPropfindProp, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropfindPropBuildXmlElement(this as WebDavPropfindProp, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindPropToXmlAttributes(this as WebDavPropfindProp, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindPropToXmlChildren(this as WebDavPropfindProp, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindPropToXmlElement(this as WebDavPropfindProp, namespaces: namespaces);
}

void _$WebDavPropBuildXmlChildren(WebDavProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified;
  if (davgetlastmodifiedSerialized != null) {
    builder.element('getlastmodified', namespace: 'DAV:', nest: () {
      builder.text(davgetlastmodifiedSerialized);
    });
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  if (davgetetagSerialized != null) {
    builder.element('getetag', namespace: 'DAV:', nest: () {
      builder.text(davgetetagSerialized);
    });
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  if (davgetcontenttypeSerialized != null) {
    builder.element('getcontenttype', namespace: 'DAV:', nest: () {
      builder.text(davgetcontenttypeSerialized);
    });
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength?.toString();
  if (davgetcontentlengthSerialized != null) {
    builder.element('getcontentlength', namespace: 'DAV:', nest: () {
      builder.text(davgetcontentlengthSerialized);
    });
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  if (davresourcetypeSerialized != null) {
    builder.element('resourcetype', namespace: 'DAV:', nest: () {
      davresourcetypeSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  if (ocidSerialized != null) {
    builder.element('id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocidSerialized);
    });
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  if (ocfileidSerialized != null) {
    builder.element('fileid', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfileidSerialized);
    });
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite?.toString();
  if (ocfavoriteSerialized != null) {
    builder.element('favorite', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfavoriteSerialized);
    });
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  if (occommentshrefSerialized != null) {
    builder.element('comments-href', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentshrefSerialized);
    });
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount?.toString();
  if (occommentscountSerialized != null) {
    builder.element('comments-count', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentscountSerialized);
    });
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread?.toString();
  if (occommentsunreadSerialized != null) {
    builder.element('comments-unread', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentsunreadSerialized);
    });
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  if (ocdownloadurlSerialized != null) {
    builder.element('downloadURL', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocdownloadurlSerialized);
    });
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  if (ocowneridSerialized != null) {
    builder.element('owner-id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocowneridSerialized);
    });
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  if (ocownerdisplaynameSerialized != null) {
    builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocownerdisplaynameSerialized);
    });
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize?.toString();
  if (ocsizeSerialized != null) {
    builder.element('size', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocsizeSerialized);
    });
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  if (ocpermissionsSerialized != null) {
    builder.element('permissions', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocpermissionsSerialized);
    });
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  if (ncnoteSerialized != null) {
    builder.element('note', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncnoteSerialized);
    });
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  if (ncdatafingerprintSerialized != null) {
    builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncdatafingerprintSerialized);
    });
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  if (nchaspreviewSerialized != null) {
    builder.element('has-preview', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nchaspreviewSerialized);
    });
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  if (ncmounttypeSerialized != null) {
    builder.element('mount-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmounttypeSerialized);
    });
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted?.toString();
  if (ncisencryptedSerialized != null) {
    builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncisencryptedSerialized);
    });
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  if (ncmetadataetagSerialized != null) {
    builder.element('metadata_etag', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmetadataetagSerialized);
    });
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime?.toString();
  if (ncuploadtimeSerialized != null) {
    builder.element('upload_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncuploadtimeSerialized);
    });
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime?.toString();
  if (nccreationtimeSerialized != null) {
    builder.element('creation_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nccreationtimeSerialized);
    });
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  if (ncrichworkspaceSerialized != null) {
    builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncrichworkspaceSerialized);
    });
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions?.toString();
  if (ocssharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', nest: () {
      builder.text(ocssharepermissionsSerialized);
    });
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  if (ocmsharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', nest: () {
      builder.text(ocmsharepermissionsSerialized);
    });
  }
}

void _$WebDavPropBuildXmlElement(WebDavProp instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
  builder.element('prop', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavProp _$WebDavPropFromXmlElement(XmlElement element) {
  final davgetlastmodified = element.getElement('getlastmodified', namespace: 'DAV:')?.getText();
  final davgetetag = element.getElement('getetag', namespace: 'DAV:')?.getText();
  final davgetcontenttype = element.getElement('getcontenttype', namespace: 'DAV:')?.getText();
  final davgetcontentlength = element.getElement('getcontentlength', namespace: 'DAV:')?.getText();
  final davresourcetype = element.getElement('resourcetype', namespace: 'DAV:');
  final ocid = element.getElement('id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfileid = element.getElement('fileid', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfavorite = element.getElement('favorite', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentshref = element.getElement('comments-href', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentscount = element.getElement('comments-count', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentsunread = element.getElement('comments-unread', namespace: 'http://owncloud.org/ns')?.getText();
  final ocdownloadurl = element.getElement('downloadURL', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerid = element.getElement('owner-id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerdisplayname = element.getElement('owner-display-name', namespace: 'http://owncloud.org/ns')?.getText();
  final ocsize = element.getElement('size', namespace: 'http://owncloud.org/ns')?.getText();
  final ocpermissions = element.getElement('permissions', namespace: 'http://owncloud.org/ns')?.getText();
  final ncnote = element.getElement('note', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncdatafingerprint = element.getElement('data-fingerprint', namespace: 'http://nextcloud.org/ns')?.getText();
  final nchaspreview = element.getElement('has-preview', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmounttype = element.getElement('mount-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncisencrypted = element.getElement('is-encrypted', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmetadataetag = element.getElement('metadata_etag', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncuploadtime = element.getElement('upload_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final nccreationtime = element.getElement('creation_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncrichworkspace = element.getElement('rich-workspace', namespace: 'http://nextcloud.org/ns')?.getText();
  final ocssharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-collaboration-services.org/ns')?.getText();
  final ocmsharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')?.getText();
  return WebDavProp(
      davgetlastmodified: davgetlastmodified,
      davgetetag: davgetetag,
      davgetcontenttype: davgetcontenttype,
      davgetcontentlength: davgetcontentlength != null ? int.parse(davgetcontentlength) : null,
      davresourcetype: davresourcetype != null ? WebDavResourcetype.fromXmlElement(davresourcetype) : null,
      ocid: ocid,
      ocfileid: ocfileid,
      ocfavorite: ocfavorite != null ? int.parse(ocfavorite) : null,
      occommentshref: occommentshref,
      occommentscount: occommentscount != null ? int.parse(occommentscount) : null,
      occommentsunread: occommentsunread != null ? int.parse(occommentsunread) : null,
      ocdownloadurl: ocdownloadurl,
      ocownerid: ocownerid,
      ocownerdisplayname: ocownerdisplayname,
      ocsize: ocsize != null ? int.parse(ocsize) : null,
      ocpermissions: ocpermissions,
      ncnote: ncnote,
      ncdatafingerprint: ncdatafingerprint,
      nchaspreview: nchaspreview != null
          ? nchaspreview == 'true' || nchaspreview == '1'
              ? true
              : nchaspreview == 'false' || nchaspreview == '0'
                  ? false
                  : throw FormatException('Invalid bool format', nchaspreview)
          : null,
      ncmounttype: ncmounttype,
      ncisencrypted: ncisencrypted != null ? int.parse(ncisencrypted) : null,
      ncmetadataetag: ncmetadataetag,
      ncuploadtime: ncuploadtime != null ? int.parse(ncuploadtime) : null,
      nccreationtime: nccreationtime != null ? int.parse(nccreationtime) : null,
      ncrichworkspace: ncrichworkspace,
      ocssharepermissions: ocssharepermissions != null ? int.parse(ocssharepermissions) : null,
      ocmsharepermissions: ocmsharepermissions);
}

List<XmlAttribute> _$WebDavPropToXmlAttributes(WebDavProp instance, {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropToXmlChildren(WebDavProp instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified;
  final davgetlastmodifiedConstructed = davgetlastmodifiedSerialized != null
      ? XmlElement(XmlName('getlastmodified', namespaces['DAV:']), [], [XmlText(davgetlastmodifiedSerialized)])
      : null;
  if (davgetlastmodifiedConstructed != null) {
    children.add(davgetlastmodifiedConstructed);
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  final davgetetagConstructed = davgetetagSerialized != null
      ? XmlElement(XmlName('getetag', namespaces['DAV:']), [], [XmlText(davgetetagSerialized)])
      : null;
  if (davgetetagConstructed != null) {
    children.add(davgetetagConstructed);
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  final davgetcontenttypeConstructed = davgetcontenttypeSerialized != null
      ? XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], [XmlText(davgetcontenttypeSerialized)])
      : null;
  if (davgetcontenttypeConstructed != null) {
    children.add(davgetcontenttypeConstructed);
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength?.toString();
  final davgetcontentlengthConstructed = davgetcontentlengthSerialized != null
      ? XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], [XmlText(davgetcontentlengthSerialized)])
      : null;
  if (davgetcontentlengthConstructed != null) {
    children.add(davgetcontentlengthConstructed);
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  final davresourcetypeConstructed = davresourcetypeSerialized != null
      ? XmlElement(
          XmlName('resourcetype', namespaces['DAV:']),
          davresourcetypeSerialized.toXmlAttributes(namespaces: namespaces),
          davresourcetypeSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (davresourcetypeConstructed != null) {
    children.add(davresourcetypeConstructed);
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  final ocidConstructed = ocidSerialized != null
      ? XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocidSerialized)])
      : null;
  if (ocidConstructed != null) {
    children.add(ocidConstructed);
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  final ocfileidConstructed = ocfileidSerialized != null
      ? XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfileidSerialized)])
      : null;
  if (ocfileidConstructed != null) {
    children.add(ocfileidConstructed);
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite?.toString();
  final ocfavoriteConstructed = ocfavoriteSerialized != null
      ? XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfavoriteSerialized)])
      : null;
  if (ocfavoriteConstructed != null) {
    children.add(ocfavoriteConstructed);
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  final occommentshrefConstructed = occommentshrefSerialized != null
      ? XmlElement(
          XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentshrefSerialized)])
      : null;
  if (occommentshrefConstructed != null) {
    children.add(occommentshrefConstructed);
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount?.toString();
  final occommentscountConstructed = occommentscountSerialized != null
      ? XmlElement(
          XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentscountSerialized)])
      : null;
  if (occommentscountConstructed != null) {
    children.add(occommentscountConstructed);
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread?.toString();
  final occommentsunreadConstructed = occommentsunreadSerialized != null
      ? XmlElement(
          XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentsunreadSerialized)])
      : null;
  if (occommentsunreadConstructed != null) {
    children.add(occommentsunreadConstructed);
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  final ocdownloadurlConstructed = ocdownloadurlSerialized != null
      ? XmlElement(XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], [XmlText(ocdownloadurlSerialized)])
      : null;
  if (ocdownloadurlConstructed != null) {
    children.add(ocdownloadurlConstructed);
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  final ocowneridConstructed = ocowneridSerialized != null
      ? XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocowneridSerialized)])
      : null;
  if (ocowneridConstructed != null) {
    children.add(ocowneridConstructed);
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  final ocownerdisplaynameConstructed = ocownerdisplaynameSerialized != null
      ? XmlElement(XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [],
          [XmlText(ocownerdisplaynameSerialized)])
      : null;
  if (ocownerdisplaynameConstructed != null) {
    children.add(ocownerdisplaynameConstructed);
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize?.toString();
  final ocsizeConstructed = ocsizeSerialized != null
      ? XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], [XmlText(ocsizeSerialized)])
      : null;
  if (ocsizeConstructed != null) {
    children.add(ocsizeConstructed);
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  final ocpermissionsConstructed = ocpermissionsSerialized != null
      ? XmlElement(XmlName('permissions', namespaces['http://owncloud.org/ns']), [], [XmlText(ocpermissionsSerialized)])
      : null;
  if (ocpermissionsConstructed != null) {
    children.add(ocpermissionsConstructed);
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  final ncnoteConstructed = ncnoteSerialized != null
      ? XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncnoteSerialized)])
      : null;
  if (ncnoteConstructed != null) {
    children.add(ncnoteConstructed);
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  final ncdatafingerprintConstructed = ncdatafingerprintSerialized != null
      ? XmlElement(XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncdatafingerprintSerialized)])
      : null;
  if (ncdatafingerprintConstructed != null) {
    children.add(ncdatafingerprintConstructed);
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  final nchaspreviewConstructed = nchaspreviewSerialized != null
      ? XmlElement(XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], [XmlText(nchaspreviewSerialized)])
      : null;
  if (nchaspreviewConstructed != null) {
    children.add(nchaspreviewConstructed);
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  final ncmounttypeConstructed = ncmounttypeSerialized != null
      ? XmlElement(XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmounttypeSerialized)])
      : null;
  if (ncmounttypeConstructed != null) {
    children.add(ncmounttypeConstructed);
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted?.toString();
  final ncisencryptedConstructed = ncisencryptedSerialized != null
      ? XmlElement(
          XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncisencryptedSerialized)])
      : null;
  if (ncisencryptedConstructed != null) {
    children.add(ncisencryptedConstructed);
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  final ncmetadataetagConstructed = ncmetadataetagSerialized != null
      ? XmlElement(
          XmlName('metadata_etag', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmetadataetagSerialized)])
      : null;
  if (ncmetadataetagConstructed != null) {
    children.add(ncmetadataetagConstructed);
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime?.toString();
  final ncuploadtimeConstructed = ncuploadtimeSerialized != null
      ? XmlElement(XmlName('upload_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncuploadtimeSerialized)])
      : null;
  if (ncuploadtimeConstructed != null) {
    children.add(ncuploadtimeConstructed);
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime?.toString();
  final nccreationtimeConstructed = nccreationtimeSerialized != null
      ? XmlElement(
          XmlName('creation_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(nccreationtimeSerialized)])
      : null;
  if (nccreationtimeConstructed != null) {
    children.add(nccreationtimeConstructed);
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  final ncrichworkspaceConstructed = ncrichworkspaceSerialized != null
      ? XmlElement(
          XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncrichworkspaceSerialized)])
      : null;
  if (ncrichworkspaceConstructed != null) {
    children.add(ncrichworkspaceConstructed);
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions?.toString();
  final ocssharepermissionsConstructed = ocssharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']), [],
          [XmlText(ocssharepermissionsSerialized)])
      : null;
  if (ocssharepermissionsConstructed != null) {
    children.add(ocssharepermissionsConstructed);
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  final ocmsharepermissionsConstructed = ocmsharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']), [],
          [XmlText(ocmsharepermissionsSerialized)])
      : null;
  if (ocmsharepermissionsConstructed != null) {
    children.add(ocmsharepermissionsConstructed);
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
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified;
  if (davgetlastmodifiedSerialized != null) {
    builder.element('getlastmodified', namespace: 'DAV:', nest: () {
      builder.text(davgetlastmodifiedSerialized);
    });
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  if (davgetetagSerialized != null) {
    builder.element('getetag', namespace: 'DAV:', nest: () {
      builder.text(davgetetagSerialized);
    });
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  if (davgetcontenttypeSerialized != null) {
    builder.element('getcontenttype', namespace: 'DAV:', nest: () {
      builder.text(davgetcontenttypeSerialized);
    });
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength?.toString();
  if (davgetcontentlengthSerialized != null) {
    builder.element('getcontentlength', namespace: 'DAV:', nest: () {
      builder.text(davgetcontentlengthSerialized);
    });
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  if (davresourcetypeSerialized != null) {
    builder.element('resourcetype', namespace: 'DAV:', nest: () {
      davresourcetypeSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  if (ocidSerialized != null) {
    builder.element('id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocidSerialized);
    });
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  if (ocfileidSerialized != null) {
    builder.element('fileid', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfileidSerialized);
    });
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite?.toString();
  if (ocfavoriteSerialized != null) {
    builder.element('favorite', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocfavoriteSerialized);
    });
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  if (occommentshrefSerialized != null) {
    builder.element('comments-href', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentshrefSerialized);
    });
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount?.toString();
  if (occommentscountSerialized != null) {
    builder.element('comments-count', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentscountSerialized);
    });
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread?.toString();
  if (occommentsunreadSerialized != null) {
    builder.element('comments-unread', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(occommentsunreadSerialized);
    });
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  if (ocdownloadurlSerialized != null) {
    builder.element('downloadURL', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocdownloadurlSerialized);
    });
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  if (ocowneridSerialized != null) {
    builder.element('owner-id', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocowneridSerialized);
    });
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  if (ocownerdisplaynameSerialized != null) {
    builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocownerdisplaynameSerialized);
    });
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize?.toString();
  if (ocsizeSerialized != null) {
    builder.element('size', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocsizeSerialized);
    });
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  if (ocpermissionsSerialized != null) {
    builder.element('permissions', namespace: 'http://owncloud.org/ns', nest: () {
      builder.text(ocpermissionsSerialized);
    });
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  if (ncnoteSerialized != null) {
    builder.element('note', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncnoteSerialized);
    });
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  if (ncdatafingerprintSerialized != null) {
    builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncdatafingerprintSerialized);
    });
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  if (nchaspreviewSerialized != null) {
    builder.element('has-preview', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nchaspreviewSerialized);
    });
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  if (ncmounttypeSerialized != null) {
    builder.element('mount-type', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmounttypeSerialized);
    });
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted?.toString();
  if (ncisencryptedSerialized != null) {
    builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncisencryptedSerialized);
    });
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  if (ncmetadataetagSerialized != null) {
    builder.element('metadata_etag', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncmetadataetagSerialized);
    });
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime?.toString();
  if (ncuploadtimeSerialized != null) {
    builder.element('upload_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncuploadtimeSerialized);
    });
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime?.toString();
  if (nccreationtimeSerialized != null) {
    builder.element('creation_time', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(nccreationtimeSerialized);
    });
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  if (ncrichworkspaceSerialized != null) {
    builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', nest: () {
      builder.text(ncrichworkspaceSerialized);
    });
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions?.toString();
  if (ocssharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', nest: () {
      builder.text(ocssharepermissionsSerialized);
    });
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  if (ocmsharepermissionsSerialized != null) {
    builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', nest: () {
      builder.text(ocmsharepermissionsSerialized);
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
  final davgetlastmodified = element.getElement('getlastmodified', namespace: 'DAV:')?.getText();
  final davgetetag = element.getElement('getetag', namespace: 'DAV:')?.getText();
  final davgetcontenttype = element.getElement('getcontenttype', namespace: 'DAV:')?.getText();
  final davgetcontentlength = element.getElement('getcontentlength', namespace: 'DAV:')?.getText();
  final davresourcetype = element.getElement('resourcetype', namespace: 'DAV:');
  final ocid = element.getElement('id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfileid = element.getElement('fileid', namespace: 'http://owncloud.org/ns')?.getText();
  final ocfavorite = element.getElement('favorite', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentshref = element.getElement('comments-href', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentscount = element.getElement('comments-count', namespace: 'http://owncloud.org/ns')?.getText();
  final occommentsunread = element.getElement('comments-unread', namespace: 'http://owncloud.org/ns')?.getText();
  final ocdownloadurl = element.getElement('downloadURL', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerid = element.getElement('owner-id', namespace: 'http://owncloud.org/ns')?.getText();
  final ocownerdisplayname = element.getElement('owner-display-name', namespace: 'http://owncloud.org/ns')?.getText();
  final ocsize = element.getElement('size', namespace: 'http://owncloud.org/ns')?.getText();
  final ocpermissions = element.getElement('permissions', namespace: 'http://owncloud.org/ns')?.getText();
  final ncnote = element.getElement('note', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncdatafingerprint = element.getElement('data-fingerprint', namespace: 'http://nextcloud.org/ns')?.getText();
  final nchaspreview = element.getElement('has-preview', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmounttype = element.getElement('mount-type', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncisencrypted = element.getElement('is-encrypted', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncmetadataetag = element.getElement('metadata_etag', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncuploadtime = element.getElement('upload_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final nccreationtime = element.getElement('creation_time', namespace: 'http://nextcloud.org/ns')?.getText();
  final ncrichworkspace = element.getElement('rich-workspace', namespace: 'http://nextcloud.org/ns')?.getText();
  final ocssharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-collaboration-services.org/ns')?.getText();
  final ocmsharepermissions =
      element.getElement('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')?.getText();
  return WebDavOcFilterRules(
      davgetlastmodified: davgetlastmodified,
      davgetetag: davgetetag,
      davgetcontenttype: davgetcontenttype,
      davgetcontentlength: davgetcontentlength != null ? int.parse(davgetcontentlength) : null,
      davresourcetype: davresourcetype != null ? WebDavResourcetype.fromXmlElement(davresourcetype) : null,
      ocid: ocid,
      ocfileid: ocfileid,
      ocfavorite: ocfavorite != null ? int.parse(ocfavorite) : null,
      occommentshref: occommentshref,
      occommentscount: occommentscount != null ? int.parse(occommentscount) : null,
      occommentsunread: occommentsunread != null ? int.parse(occommentsunread) : null,
      ocdownloadurl: ocdownloadurl,
      ocownerid: ocownerid,
      ocownerdisplayname: ocownerdisplayname,
      ocsize: ocsize != null ? int.parse(ocsize) : null,
      ocpermissions: ocpermissions,
      ncnote: ncnote,
      ncdatafingerprint: ncdatafingerprint,
      nchaspreview: nchaspreview != null
          ? nchaspreview == 'true' || nchaspreview == '1'
              ? true
              : nchaspreview == 'false' || nchaspreview == '0'
                  ? false
                  : throw FormatException('Invalid bool format', nchaspreview)
          : null,
      ncmounttype: ncmounttype,
      ncisencrypted: ncisencrypted != null ? int.parse(ncisencrypted) : null,
      ncmetadataetag: ncmetadataetag,
      ncuploadtime: ncuploadtime != null ? int.parse(ncuploadtime) : null,
      nccreationtime: nccreationtime != null ? int.parse(nccreationtime) : null,
      ncrichworkspace: ncrichworkspace,
      ocssharepermissions: ocssharepermissions != null ? int.parse(ocssharepermissions) : null,
      ocmsharepermissions: ocmsharepermissions);
}

List<XmlAttribute> _$WebDavOcFilterRulesToXmlAttributes(WebDavOcFilterRules instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavOcFilterRulesToXmlChildren(WebDavOcFilterRules instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified;
  final davgetlastmodifiedConstructed = davgetlastmodifiedSerialized != null
      ? XmlElement(XmlName('getlastmodified', namespaces['DAV:']), [], [XmlText(davgetlastmodifiedSerialized)])
      : null;
  if (davgetlastmodifiedConstructed != null) {
    children.add(davgetlastmodifiedConstructed);
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  final davgetetagConstructed = davgetetagSerialized != null
      ? XmlElement(XmlName('getetag', namespaces['DAV:']), [], [XmlText(davgetetagSerialized)])
      : null;
  if (davgetetagConstructed != null) {
    children.add(davgetetagConstructed);
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  final davgetcontenttypeConstructed = davgetcontenttypeSerialized != null
      ? XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], [XmlText(davgetcontenttypeSerialized)])
      : null;
  if (davgetcontenttypeConstructed != null) {
    children.add(davgetcontenttypeConstructed);
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength?.toString();
  final davgetcontentlengthConstructed = davgetcontentlengthSerialized != null
      ? XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], [XmlText(davgetcontentlengthSerialized)])
      : null;
  if (davgetcontentlengthConstructed != null) {
    children.add(davgetcontentlengthConstructed);
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  final davresourcetypeConstructed = davresourcetypeSerialized != null
      ? XmlElement(
          XmlName('resourcetype', namespaces['DAV:']),
          davresourcetypeSerialized.toXmlAttributes(namespaces: namespaces),
          davresourcetypeSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (davresourcetypeConstructed != null) {
    children.add(davresourcetypeConstructed);
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  final ocidConstructed = ocidSerialized != null
      ? XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocidSerialized)])
      : null;
  if (ocidConstructed != null) {
    children.add(ocidConstructed);
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  final ocfileidConstructed = ocfileidSerialized != null
      ? XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfileidSerialized)])
      : null;
  if (ocfileidConstructed != null) {
    children.add(ocfileidConstructed);
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite?.toString();
  final ocfavoriteConstructed = ocfavoriteSerialized != null
      ? XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], [XmlText(ocfavoriteSerialized)])
      : null;
  if (ocfavoriteConstructed != null) {
    children.add(ocfavoriteConstructed);
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  final occommentshrefConstructed = occommentshrefSerialized != null
      ? XmlElement(
          XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentshrefSerialized)])
      : null;
  if (occommentshrefConstructed != null) {
    children.add(occommentshrefConstructed);
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount?.toString();
  final occommentscountConstructed = occommentscountSerialized != null
      ? XmlElement(
          XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentscountSerialized)])
      : null;
  if (occommentscountConstructed != null) {
    children.add(occommentscountConstructed);
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread?.toString();
  final occommentsunreadConstructed = occommentsunreadSerialized != null
      ? XmlElement(
          XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], [XmlText(occommentsunreadSerialized)])
      : null;
  if (occommentsunreadConstructed != null) {
    children.add(occommentsunreadConstructed);
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  final ocdownloadurlConstructed = ocdownloadurlSerialized != null
      ? XmlElement(XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], [XmlText(ocdownloadurlSerialized)])
      : null;
  if (ocdownloadurlConstructed != null) {
    children.add(ocdownloadurlConstructed);
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  final ocowneridConstructed = ocowneridSerialized != null
      ? XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], [XmlText(ocowneridSerialized)])
      : null;
  if (ocowneridConstructed != null) {
    children.add(ocowneridConstructed);
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  final ocownerdisplaynameConstructed = ocownerdisplaynameSerialized != null
      ? XmlElement(XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [],
          [XmlText(ocownerdisplaynameSerialized)])
      : null;
  if (ocownerdisplaynameConstructed != null) {
    children.add(ocownerdisplaynameConstructed);
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize?.toString();
  final ocsizeConstructed = ocsizeSerialized != null
      ? XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], [XmlText(ocsizeSerialized)])
      : null;
  if (ocsizeConstructed != null) {
    children.add(ocsizeConstructed);
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  final ocpermissionsConstructed = ocpermissionsSerialized != null
      ? XmlElement(XmlName('permissions', namespaces['http://owncloud.org/ns']), [], [XmlText(ocpermissionsSerialized)])
      : null;
  if (ocpermissionsConstructed != null) {
    children.add(ocpermissionsConstructed);
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  final ncnoteConstructed = ncnoteSerialized != null
      ? XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncnoteSerialized)])
      : null;
  if (ncnoteConstructed != null) {
    children.add(ncnoteConstructed);
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  final ncdatafingerprintConstructed = ncdatafingerprintSerialized != null
      ? XmlElement(XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [],
          [XmlText(ncdatafingerprintSerialized)])
      : null;
  if (ncdatafingerprintConstructed != null) {
    children.add(ncdatafingerprintConstructed);
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview != null
      ? nchaspreview == true
          ? 'true'
          : 'false'
      : null;
  final nchaspreviewConstructed = nchaspreviewSerialized != null
      ? XmlElement(XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], [XmlText(nchaspreviewSerialized)])
      : null;
  if (nchaspreviewConstructed != null) {
    children.add(nchaspreviewConstructed);
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  final ncmounttypeConstructed = ncmounttypeSerialized != null
      ? XmlElement(XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmounttypeSerialized)])
      : null;
  if (ncmounttypeConstructed != null) {
    children.add(ncmounttypeConstructed);
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted?.toString();
  final ncisencryptedConstructed = ncisencryptedSerialized != null
      ? XmlElement(
          XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncisencryptedSerialized)])
      : null;
  if (ncisencryptedConstructed != null) {
    children.add(ncisencryptedConstructed);
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  final ncmetadataetagConstructed = ncmetadataetagSerialized != null
      ? XmlElement(
          XmlName('metadata_etag', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncmetadataetagSerialized)])
      : null;
  if (ncmetadataetagConstructed != null) {
    children.add(ncmetadataetagConstructed);
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime?.toString();
  final ncuploadtimeConstructed = ncuploadtimeSerialized != null
      ? XmlElement(XmlName('upload_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncuploadtimeSerialized)])
      : null;
  if (ncuploadtimeConstructed != null) {
    children.add(ncuploadtimeConstructed);
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime?.toString();
  final nccreationtimeConstructed = nccreationtimeSerialized != null
      ? XmlElement(
          XmlName('creation_time', namespaces['http://nextcloud.org/ns']), [], [XmlText(nccreationtimeSerialized)])
      : null;
  if (nccreationtimeConstructed != null) {
    children.add(nccreationtimeConstructed);
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  final ncrichworkspaceConstructed = ncrichworkspaceSerialized != null
      ? XmlElement(
          XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], [XmlText(ncrichworkspaceSerialized)])
      : null;
  if (ncrichworkspaceConstructed != null) {
    children.add(ncrichworkspaceConstructed);
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions?.toString();
  final ocssharepermissionsConstructed = ocssharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']), [],
          [XmlText(ocssharepermissionsSerialized)])
      : null;
  if (ocssharepermissionsConstructed != null) {
    children.add(ocssharepermissionsConstructed);
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  final ocmsharepermissionsConstructed = ocmsharepermissionsSerialized != null
      ? XmlElement(XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']), [],
          [XmlText(ocmsharepermissionsSerialized)])
      : null;
  if (ocmsharepermissionsConstructed != null) {
    children.add(ocmsharepermissionsConstructed);
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
