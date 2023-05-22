// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nextcloud.dart';

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$WebDavPropfindPropBuildXmlChildren(WebDavPropfindProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final davgetlastmodified = instance.davgetlastmodified;
  final davgetlastmodifiedSerialized = davgetlastmodified;
  if (davgetlastmodifiedSerialized != null) {
    for (final value in davgetlastmodifiedSerialized) {
      builder.element('getlastmodified', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  if (davgetetagSerialized != null) {
    for (final value in davgetetagSerialized) {
      builder.element('getetag', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  if (davgetcontenttypeSerialized != null) {
    for (final value in davgetcontenttypeSerialized) {
      builder.element('getcontenttype', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength;
  if (davgetcontentlengthSerialized != null) {
    for (final value in davgetcontentlengthSerialized) {
      builder.element('getcontentlength', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  if (davresourcetypeSerialized != null) {
    for (final value in davresourcetypeSerialized) {
      builder.element('resourcetype', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  if (ocidSerialized != null) {
    for (final value in ocidSerialized) {
      builder.element('id', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  if (ocfileidSerialized != null) {
    for (final value in ocfileidSerialized) {
      builder.element('fileid', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite;
  if (ocfavoriteSerialized != null) {
    for (final value in ocfavoriteSerialized) {
      builder.element('favorite', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  if (occommentshrefSerialized != null) {
    for (final value in occommentshrefSerialized) {
      builder.element('comments-href', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount;
  if (occommentscountSerialized != null) {
    for (final value in occommentscountSerialized) {
      builder.element('comments-count', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread;
  if (occommentsunreadSerialized != null) {
    for (final value in occommentsunreadSerialized) {
      builder.element('comments-unread', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  if (ocdownloadurlSerialized != null) {
    for (final value in ocdownloadurlSerialized) {
      builder.element('downloadURL', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  if (ocowneridSerialized != null) {
    for (final value in ocowneridSerialized) {
      builder.element('owner-id', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  if (ocownerdisplaynameSerialized != null) {
    for (final value in ocownerdisplaynameSerialized) {
      builder.element('owner-display-name', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize;
  if (ocsizeSerialized != null) {
    for (final value in ocsizeSerialized) {
      builder.element('size', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  if (ocpermissionsSerialized != null) {
    for (final value in ocpermissionsSerialized) {
      builder.element('permissions', namespace: 'http://owncloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  if (ncnoteSerialized != null) {
    for (final value in ncnoteSerialized) {
      builder.element('note', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  if (ncdatafingerprintSerialized != null) {
    for (final value in ncdatafingerprintSerialized) {
      builder.element('data-fingerprint', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview;
  if (nchaspreviewSerialized != null) {
    for (final value in nchaspreviewSerialized) {
      builder.element('has-preview', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  if (ncmounttypeSerialized != null) {
    for (final value in ncmounttypeSerialized) {
      builder.element('mount-type', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted;
  if (ncisencryptedSerialized != null) {
    for (final value in ncisencryptedSerialized) {
      builder.element('is-encrypted', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  if (ncmetadataetagSerialized != null) {
    for (final value in ncmetadataetagSerialized) {
      builder.element('metadata_etag', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime;
  if (ncuploadtimeSerialized != null) {
    for (final value in ncuploadtimeSerialized) {
      builder.element('upload_time', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime;
  if (nccreationtimeSerialized != null) {
    for (final value in nccreationtimeSerialized) {
      builder.element('creation_time', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  if (ncrichworkspaceSerialized != null) {
    for (final value in ncrichworkspaceSerialized) {
      builder.element('rich-workspace', namespace: 'http://nextcloud.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions;
  if (ocssharepermissionsSerialized != null) {
    for (final value in ocssharepermissionsSerialized) {
      builder.element('share-permissions', namespace: 'http://open-collaboration-services.org/ns', isSelfClosing: true,
          nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  if (ocmsharepermissionsSerialized != null) {
    for (final value in ocmsharepermissionsSerialized) {
      builder.element('share-permissions', namespace: 'http://open-cloud-mesh.org/ns', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
}

void _$WebDavPropfindPropBuildXmlElement(WebDavPropfindProp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('prop', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropfindProp _$WebDavPropfindPropFromXmlElement(XmlElement element) {
  final davgetlastmodified =
      element.getElements('getlastmodified', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davgetetag = element.getElements('getetag', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davgetcontenttype =
      element.getElements('getcontenttype', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davgetcontentlength =
      element.getElements('getcontentlength', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final davresourcetype =
      element.getElements('resourcetype', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  final ocid =
      element.getElements('id', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocfileid =
      element.getElements('fileid', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocfavorite =
      element.getElements('favorite', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final occommentshref = element
      .getElements('comments-href', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final occommentscount = element
      .getElements('comments-count', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final occommentsunread = element
      .getElements('comments-unread', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocdownloadurl = element
      .getElements('downloadURL', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocownerid =
      element.getElements('owner-id', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocownerdisplayname = element
      .getElements('owner-display-name', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocsize =
      element.getElements('size', namespace: 'http://owncloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ocpermissions = element
      .getElements('permissions', namespace: 'http://owncloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncnote =
      element.getElements('note', namespace: 'http://nextcloud.org/ns')?.map((e) => e.getText()).whereType<String>();
  final ncdatafingerprint = element
      .getElements('data-fingerprint', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final nchaspreview = element
      .getElements('has-preview', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncmounttype = element
      .getElements('mount-type', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncisencrypted = element
      .getElements('is-encrypted', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncmetadataetag = element
      .getElements('metadata_etag', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncuploadtime = element
      .getElements('upload_time', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final nccreationtime = element
      .getElements('creation_time', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ncrichworkspace = element
      .getElements('rich-workspace', namespace: 'http://nextcloud.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocssharepermissions = element
      .getElements('share-permissions', namespace: 'http://open-collaboration-services.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  final ocmsharepermissions = element
      .getElements('share-permissions', namespace: 'http://open-cloud-mesh.org/ns')
      ?.map((e) => e.getText())
      .whereType<String>();
  return WebDavPropfindProp(
      davgetlastmodified: davgetlastmodified?.toList(),
      davgetetag: davgetetag?.toList(),
      davgetcontenttype: davgetcontenttype?.toList(),
      davgetcontentlength: davgetcontentlength?.toList(),
      davresourcetype: davresourcetype?.toList(),
      ocid: ocid?.toList(),
      ocfileid: ocfileid?.toList(),
      ocfavorite: ocfavorite?.toList(),
      occommentshref: occommentshref?.toList(),
      occommentscount: occommentscount?.toList(),
      occommentsunread: occommentsunread?.toList(),
      ocdownloadurl: ocdownloadurl?.toList(),
      ocownerid: ocownerid?.toList(),
      ocownerdisplayname: ocownerdisplayname?.toList(),
      ocsize: ocsize?.toList(),
      ocpermissions: ocpermissions?.toList(),
      ncnote: ncnote?.toList(),
      ncdatafingerprint: ncdatafingerprint?.toList(),
      nchaspreview: nchaspreview?.toList(),
      ncmounttype: ncmounttype?.toList(),
      ncisencrypted: ncisencrypted?.toList(),
      ncmetadataetag: ncmetadataetag?.toList(),
      ncuploadtime: ncuploadtime?.toList(),
      nccreationtime: nccreationtime?.toList(),
      ncrichworkspace: ncrichworkspace?.toList(),
      ocssharepermissions: ocssharepermissions?.toList(),
      ocmsharepermissions: ocmsharepermissions?.toList());
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
  final davgetlastmodifiedSerialized = davgetlastmodified;
  final davgetlastmodifiedConstructed = davgetlastmodifiedSerialized
      ?.map((e) => XmlElement(XmlName('getlastmodified', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davgetlastmodifiedConstructed != null) {
    children.addAll(davgetlastmodifiedConstructed);
  }
  final davgetetag = instance.davgetetag;
  final davgetetagSerialized = davgetetag;
  final davgetetagConstructed = davgetetagSerialized
      ?.map((e) => XmlElement(XmlName('getetag', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davgetetagConstructed != null) {
    children.addAll(davgetetagConstructed);
  }
  final davgetcontenttype = instance.davgetcontenttype;
  final davgetcontenttypeSerialized = davgetcontenttype;
  final davgetcontenttypeConstructed = davgetcontenttypeSerialized
      ?.map((e) => XmlElement(XmlName('getcontenttype', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davgetcontenttypeConstructed != null) {
    children.addAll(davgetcontenttypeConstructed);
  }
  final davgetcontentlength = instance.davgetcontentlength;
  final davgetcontentlengthSerialized = davgetcontentlength;
  final davgetcontentlengthConstructed = davgetcontentlengthSerialized?.map(
      (e) => XmlElement(XmlName('getcontentlength', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davgetcontentlengthConstructed != null) {
    children.addAll(davgetcontentlengthConstructed);
  }
  final davresourcetype = instance.davresourcetype;
  final davresourcetypeSerialized = davresourcetype;
  final davresourcetypeConstructed = davresourcetypeSerialized
      ?.map((e) => XmlElement(XmlName('resourcetype', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (davresourcetypeConstructed != null) {
    children.addAll(davresourcetypeConstructed);
  }
  final ocid = instance.ocid;
  final ocidSerialized = ocid;
  final ocidConstructed = ocidSerialized?.map(
      (e) => XmlElement(XmlName('id', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocidConstructed != null) {
    children.addAll(ocidConstructed);
  }
  final ocfileid = instance.ocfileid;
  final ocfileidSerialized = ocfileid;
  final ocfileidConstructed = ocfileidSerialized?.map((e) =>
      XmlElement(XmlName('fileid', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocfileidConstructed != null) {
    children.addAll(ocfileidConstructed);
  }
  final ocfavorite = instance.ocfavorite;
  final ocfavoriteSerialized = ocfavorite;
  final ocfavoriteConstructed = ocfavoriteSerialized?.map((e) =>
      XmlElement(XmlName('favorite', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocfavoriteConstructed != null) {
    children.addAll(ocfavoriteConstructed);
  }
  final occommentshref = instance.occommentshref;
  final occommentshrefSerialized = occommentshref;
  final occommentshrefConstructed = occommentshrefSerialized?.map((e) => XmlElement(
      XmlName('comments-href', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (occommentshrefConstructed != null) {
    children.addAll(occommentshrefConstructed);
  }
  final occommentscount = instance.occommentscount;
  final occommentscountSerialized = occommentscount;
  final occommentscountConstructed = occommentscountSerialized?.map((e) => XmlElement(
      XmlName('comments-count', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (occommentscountConstructed != null) {
    children.addAll(occommentscountConstructed);
  }
  final occommentsunread = instance.occommentsunread;
  final occommentsunreadSerialized = occommentsunread;
  final occommentsunreadConstructed = occommentsunreadSerialized?.map((e) => XmlElement(
      XmlName('comments-unread', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (occommentsunreadConstructed != null) {
    children.addAll(occommentsunreadConstructed);
  }
  final ocdownloadurl = instance.ocdownloadurl;
  final ocdownloadurlSerialized = ocdownloadurl;
  final ocdownloadurlConstructed = ocdownloadurlSerialized?.map((e) => XmlElement(
      XmlName('downloadURL', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocdownloadurlConstructed != null) {
    children.addAll(ocdownloadurlConstructed);
  }
  final ocownerid = instance.ocownerid;
  final ocowneridSerialized = ocownerid;
  final ocowneridConstructed = ocowneridSerialized?.map((e) =>
      XmlElement(XmlName('owner-id', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocowneridConstructed != null) {
    children.addAll(ocowneridConstructed);
  }
  final ocownerdisplayname = instance.ocownerdisplayname;
  final ocownerdisplaynameSerialized = ocownerdisplayname;
  final ocownerdisplaynameConstructed = ocownerdisplaynameSerialized?.map((e) => XmlElement(
      XmlName('owner-display-name', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocownerdisplaynameConstructed != null) {
    children.addAll(ocownerdisplaynameConstructed);
  }
  final ocsize = instance.ocsize;
  final ocsizeSerialized = ocsize;
  final ocsizeConstructed = ocsizeSerialized?.map((e) =>
      XmlElement(XmlName('size', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocsizeConstructed != null) {
    children.addAll(ocsizeConstructed);
  }
  final ocpermissions = instance.ocpermissions;
  final ocpermissionsSerialized = ocpermissions;
  final ocpermissionsConstructed = ocpermissionsSerialized?.map((e) => XmlElement(
      XmlName('permissions', namespaces['http://owncloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ocpermissionsConstructed != null) {
    children.addAll(ocpermissionsConstructed);
  }
  final ncnote = instance.ncnote;
  final ncnoteSerialized = ncnote;
  final ncnoteConstructed = ncnoteSerialized?.map((e) =>
      XmlElement(XmlName('note', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncnoteConstructed != null) {
    children.addAll(ncnoteConstructed);
  }
  final ncdatafingerprint = instance.ncdatafingerprint;
  final ncdatafingerprintSerialized = ncdatafingerprint;
  final ncdatafingerprintConstructed = ncdatafingerprintSerialized?.map((e) => XmlElement(
      XmlName('data-fingerprint', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncdatafingerprintConstructed != null) {
    children.addAll(ncdatafingerprintConstructed);
  }
  final nchaspreview = instance.nchaspreview;
  final nchaspreviewSerialized = nchaspreview;
  final nchaspreviewConstructed = nchaspreviewSerialized?.map((e) => XmlElement(
      XmlName('has-preview', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (nchaspreviewConstructed != null) {
    children.addAll(nchaspreviewConstructed);
  }
  final ncmounttype = instance.ncmounttype;
  final ncmounttypeSerialized = ncmounttype;
  final ncmounttypeConstructed = ncmounttypeSerialized?.map((e) => XmlElement(
      XmlName('mount-type', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncmounttypeConstructed != null) {
    children.addAll(ncmounttypeConstructed);
  }
  final ncisencrypted = instance.ncisencrypted;
  final ncisencryptedSerialized = ncisencrypted;
  final ncisencryptedConstructed = ncisencryptedSerialized?.map((e) => XmlElement(
      XmlName('is-encrypted', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncisencryptedConstructed != null) {
    children.addAll(ncisencryptedConstructed);
  }
  final ncmetadataetag = instance.ncmetadataetag;
  final ncmetadataetagSerialized = ncmetadataetag;
  final ncmetadataetagConstructed = ncmetadataetagSerialized?.map((e) => XmlElement(
      XmlName('metadata_etag', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncmetadataetagConstructed != null) {
    children.addAll(ncmetadataetagConstructed);
  }
  final ncuploadtime = instance.ncuploadtime;
  final ncuploadtimeSerialized = ncuploadtime;
  final ncuploadtimeConstructed = ncuploadtimeSerialized?.map((e) => XmlElement(
      XmlName('upload_time', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncuploadtimeConstructed != null) {
    children.addAll(ncuploadtimeConstructed);
  }
  final nccreationtime = instance.nccreationtime;
  final nccreationtimeSerialized = nccreationtime;
  final nccreationtimeConstructed = nccreationtimeSerialized?.map((e) => XmlElement(
      XmlName('creation_time', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (nccreationtimeConstructed != null) {
    children.addAll(nccreationtimeConstructed);
  }
  final ncrichworkspace = instance.ncrichworkspace;
  final ncrichworkspaceSerialized = ncrichworkspace;
  final ncrichworkspaceConstructed = ncrichworkspaceSerialized?.map((e) => XmlElement(
      XmlName('rich-workspace', namespaces['http://nextcloud.org/ns']), [], e != null ? [XmlText(e)] : [], true));
  if (ncrichworkspaceConstructed != null) {
    children.addAll(ncrichworkspaceConstructed);
  }
  final ocssharepermissions = instance.ocssharepermissions;
  final ocssharepermissionsSerialized = ocssharepermissions;
  final ocssharepermissionsConstructed = ocssharepermissionsSerialized?.map((e) => XmlElement(
      XmlName('share-permissions', namespaces['http://open-collaboration-services.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ocssharepermissionsConstructed != null) {
    children.addAll(ocssharepermissionsConstructed);
  }
  final ocmsharepermissions = instance.ocmsharepermissions;
  final ocmsharepermissionsSerialized = ocmsharepermissions;
  final ocmsharepermissionsConstructed = ocmsharepermissionsSerialized?.map((e) => XmlElement(
      XmlName('share-permissions', namespaces['http://open-cloud-mesh.org/ns']),
      [],
      e != null ? [XmlText(e)] : [],
      true));
  if (ocmsharepermissionsConstructed != null) {
    children.addAll(ocmsharepermissionsConstructed);
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

void _$WebDavMultistatusBuildXmlChildren(WebDavMultistatus instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final responses = instance.responses;
  final responsesSerialized = responses;
  for (final value in responsesSerialized) {
    builder.element('response', namespace: 'DAV:', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
}

void _$WebDavMultistatusBuildXmlElement(WebDavMultistatus instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('multistatus', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavMultistatus _$WebDavMultistatusFromXmlElement(XmlElement element) {
  final responses = element.getElements('response', namespace: 'DAV:')!;
  return WebDavMultistatus(responses: responses.map((e) => WebDavResponse.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$WebDavMultistatusToXmlAttributes(WebDavMultistatus instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavMultistatusToXmlChildren(WebDavMultistatus instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final responses = instance.responses;
  final responsesSerialized = responses;
  final responsesConstructed = responsesSerialized.map((e) => XmlElement(XmlName('response', namespaces['DAV:']),
      e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)));
  children.addAll(responsesConstructed);
  return children;
}

XmlElement _$WebDavMultistatusToXmlElement(WebDavMultistatus instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('multistatus', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavMultistatusXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavMultistatusBuildXmlChildren(this as WebDavMultistatus, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavMultistatusBuildXmlElement(this as WebDavMultistatus, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavMultistatusToXmlAttributes(this as WebDavMultistatus, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavMultistatusToXmlChildren(this as WebDavMultistatus, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavMultistatusToXmlElement(this as WebDavMultistatus, namespaces: namespaces);
}

void _$WebDavResponseBuildXmlChildren(WebDavResponse instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final href = instance.href;
  final hrefSerialized = href;
  builder.element('href', namespace: 'DAV:', nest: () {
    if (hrefSerialized != null) {
      builder.text(hrefSerialized);
    }
  });
  final propstats = instance.propstats;
  final propstatsSerialized = propstats;
  for (final value in propstatsSerialized) {
    builder.element('propstat', namespace: 'DAV:', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
}

void _$WebDavResponseBuildXmlElement(WebDavResponse instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('response', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavResponse _$WebDavResponseFromXmlElement(XmlElement element) {
  final href = element.getElement('href', namespace: 'DAV:')?.getText();
  final propstats = element.getElements('propstat', namespace: 'DAV:')!;
  return WebDavResponse(href: href, propstats: propstats.map((e) => WebDavPropstat.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$WebDavResponseToXmlAttributes(WebDavResponse instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavResponseToXmlChildren(WebDavResponse instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final href = instance.href;
  final hrefSerialized = href;
  final hrefConstructed =
      XmlElement(XmlName('href', namespaces['DAV:']), [], hrefSerialized != null ? [XmlText(hrefSerialized)] : []);
  children.add(hrefConstructed);
  final propstats = instance.propstats;
  final propstatsSerialized = propstats;
  final propstatsConstructed = propstatsSerialized.map((e) => XmlElement(XmlName('propstat', namespaces['DAV:']),
      e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)));
  children.addAll(propstatsConstructed);
  return children;
}

XmlElement _$WebDavResponseToXmlElement(WebDavResponse instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('response', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavResponseXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavResponseBuildXmlChildren(this as WebDavResponse, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavResponseBuildXmlElement(this as WebDavResponse, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResponseToXmlAttributes(this as WebDavResponse, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResponseToXmlChildren(this as WebDavResponse, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResponseToXmlElement(this as WebDavResponse, namespaces: namespaces);
}

void _$WebDavPropstatBuildXmlChildren(WebDavPropstat instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final status = instance.status;
  final statusSerialized = status;
  builder.element('status', namespace: 'DAV:', nest: () {
    builder.text(statusSerialized);
  });
  final prop = instance.prop;
  final propSerialized = prop;
  builder.element('prop', namespace: 'DAV:', nest: () {
    propSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
}

void _$WebDavPropstatBuildXmlElement(WebDavPropstat instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('propstat', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropstat _$WebDavPropstatFromXmlElement(XmlElement element) {
  final status = element.getElement('status', namespace: 'DAV:')!.getText()!;
  final prop = element.getElement('prop', namespace: 'DAV:')!;
  return WebDavPropstat(status: status, prop: WebDavProp.fromXmlElement(prop));
}

List<XmlAttribute> _$WebDavPropstatToXmlAttributes(WebDavPropstat instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropstatToXmlChildren(WebDavPropstat instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final status = instance.status;
  final statusSerialized = status;
  final statusConstructed = XmlElement(XmlName('status', namespaces['DAV:']), [], [XmlText(statusSerialized)]);
  children.add(statusConstructed);
  final prop = instance.prop;
  final propSerialized = prop;
  final propConstructed = XmlElement(XmlName('prop', namespaces['DAV:']),
      propSerialized.toXmlAttributes(namespaces: namespaces), propSerialized.toXmlChildren(namespaces: namespaces));
  children.add(propConstructed);
  return children;
}

XmlElement _$WebDavPropstatToXmlElement(WebDavPropstat instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('propstat', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropstatXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropstatBuildXmlChildren(this as WebDavPropstat, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropstatBuildXmlElement(this as WebDavPropstat, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropstatToXmlAttributes(this as WebDavPropstat, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropstatToXmlChildren(this as WebDavPropstat, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropstatToXmlElement(this as WebDavPropstat, namespaces: namespaces);
}

void _$WebDavPropertyupdateBuildXmlChildren(WebDavPropertyupdate instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final set = instance.set;
  final setSerialized = set;
  builder.element('set', namespace: 'DAV:', nest: () {
    setSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
}

void _$WebDavPropertyupdateBuildXmlElement(WebDavPropertyupdate instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('propertyupdate', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropertyupdate _$WebDavPropertyupdateFromXmlElement(XmlElement element) {
  final set = element.getElement('set', namespace: 'DAV:')!;
  return WebDavPropertyupdate(set: WebDavSet.fromXmlElement(set));
}

List<XmlAttribute> _$WebDavPropertyupdateToXmlAttributes(WebDavPropertyupdate instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropertyupdateToXmlChildren(WebDavPropertyupdate instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final set = instance.set;
  final setSerialized = set;
  final setConstructed = XmlElement(XmlName('set', namespaces['DAV:']),
      setSerialized.toXmlAttributes(namespaces: namespaces), setSerialized.toXmlChildren(namespaces: namespaces));
  children.add(setConstructed);
  return children;
}

XmlElement _$WebDavPropertyupdateToXmlElement(WebDavPropertyupdate instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('propertyupdate', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropertyupdateXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropertyupdateBuildXmlChildren(this as WebDavPropertyupdate, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropertyupdateBuildXmlElement(this as WebDavPropertyupdate, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropertyupdateToXmlAttributes(this as WebDavPropertyupdate, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropertyupdateToXmlChildren(this as WebDavPropertyupdate, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropertyupdateToXmlElement(this as WebDavPropertyupdate, namespaces: namespaces);
}

void _$WebDavSetBuildXmlChildren(WebDavSet instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
  final prop = instance.prop;
  final propSerialized = prop;
  builder.element('prop', namespace: 'DAV:', nest: () {
    propSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
}

void _$WebDavSetBuildXmlElement(WebDavSet instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
  builder.element('propertyupdate', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavSet _$WebDavSetFromXmlElement(XmlElement element) {
  final prop = element.getElement('prop', namespace: 'DAV:')!;
  return WebDavSet(prop: WebDavProp.fromXmlElement(prop));
}

List<XmlAttribute> _$WebDavSetToXmlAttributes(WebDavSet instance, {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavSetToXmlChildren(WebDavSet instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final prop = instance.prop;
  final propSerialized = prop;
  final propConstructed = XmlElement(XmlName('prop', namespaces['DAV:']),
      propSerialized.toXmlAttributes(namespaces: namespaces), propSerialized.toXmlChildren(namespaces: namespaces));
  children.add(propConstructed);
  return children;
}

XmlElement _$WebDavSetToXmlElement(WebDavSet instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('propertyupdate', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavSetXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavSetBuildXmlChildren(this as WebDavSet, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavSetBuildXmlElement(this as WebDavSet, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavSetToXmlAttributes(this as WebDavSet, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavSetToXmlChildren(this as WebDavSet, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavSetToXmlElement(this as WebDavSet, namespaces: namespaces);
}

void _$WebDavPropfindBuildXmlChildren(WebDavPropfind instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final prop = instance.prop;
  final propSerialized = prop;
  builder.element('prop', namespace: 'DAV:', nest: () {
    propSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
}

void _$WebDavPropfindBuildXmlElement(WebDavPropfind instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('propfind', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavPropfind _$WebDavPropfindFromXmlElement(XmlElement element) {
  final prop = element.getElement('prop', namespace: 'DAV:')!;
  return WebDavPropfind(prop: WebDavPropfindProp.fromXmlElement(prop));
}

List<XmlAttribute> _$WebDavPropfindToXmlAttributes(WebDavPropfind instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavPropfindToXmlChildren(WebDavPropfind instance, {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final prop = instance.prop;
  final propSerialized = prop;
  final propConstructed = XmlElement(XmlName('prop', namespaces['DAV:']),
      propSerialized.toXmlAttributes(namespaces: namespaces), propSerialized.toXmlChildren(namespaces: namespaces));
  children.add(propConstructed);
  return children;
}

XmlElement _$WebDavPropfindToXmlElement(WebDavPropfind instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('propfind', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavPropfindXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropfindBuildXmlChildren(this as WebDavPropfind, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavPropfindBuildXmlElement(this as WebDavPropfind, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindToXmlAttributes(this as WebDavPropfind, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindToXmlChildren(this as WebDavPropfind, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavPropfindToXmlElement(this as WebDavPropfind, namespaces: namespaces);
}

void _$WebDavOcFilterFilesBuildXmlChildren(WebDavOcFilterFiles instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final filterRules = instance.filterRules;
  final filterRulesSerialized = filterRules;
  builder.element('filter-rules', namespace: 'http://owncloud.org/ns', nest: () {
    filterRulesSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
  final prop = instance.prop;
  final propSerialized = prop;
  builder.element('prop', namespace: 'DAV:', nest: () {
    propSerialized.buildXmlChildren(builder, namespaces: namespaces);
  });
}

void _$WebDavOcFilterFilesBuildXmlElement(WebDavOcFilterFiles instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('filter-files', namespace: 'http://owncloud.org/ns', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavOcFilterFiles _$WebDavOcFilterFilesFromXmlElement(XmlElement element) {
  final filterRules = element.getElement('filter-rules', namespace: 'http://owncloud.org/ns')!;
  final prop = element.getElement('prop', namespace: 'DAV:')!;
  return WebDavOcFilterFiles(
      filterRules: WebDavOcFilterRules.fromXmlElement(filterRules), prop: WebDavPropfindProp.fromXmlElement(prop));
}

List<XmlAttribute> _$WebDavOcFilterFilesToXmlAttributes(WebDavOcFilterFiles instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavOcFilterFilesToXmlChildren(WebDavOcFilterFiles instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final filterRules = instance.filterRules;
  final filterRulesSerialized = filterRules;
  final filterRulesConstructed = XmlElement(
      XmlName('filter-rules', namespaces['http://owncloud.org/ns']),
      filterRulesSerialized.toXmlAttributes(namespaces: namespaces),
      filterRulesSerialized.toXmlChildren(namespaces: namespaces));
  children.add(filterRulesConstructed);
  final prop = instance.prop;
  final propSerialized = prop;
  final propConstructed = XmlElement(XmlName('prop', namespaces['DAV:']),
      propSerialized.toXmlAttributes(namespaces: namespaces), propSerialized.toXmlChildren(namespaces: namespaces));
  children.add(propConstructed);
  return children;
}

XmlElement _$WebDavOcFilterFilesToXmlElement(WebDavOcFilterFiles instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('filter-files', namespaces['http://owncloud.org/ns']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavOcFilterFilesXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavOcFilterFilesBuildXmlChildren(this as WebDavOcFilterFiles, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavOcFilterFilesBuildXmlElement(this as WebDavOcFilterFiles, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterFilesToXmlAttributes(this as WebDavOcFilterFiles, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterFilesToXmlChildren(this as WebDavOcFilterFiles, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavOcFilterFilesToXmlElement(this as WebDavOcFilterFiles, namespaces: namespaces);
}

void _$WebDavResourcetypeBuildXmlChildren(WebDavResourcetype instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final collection = instance.collection;
  final collectionSerialized = collection;
  if (collectionSerialized != null) {
    for (final value in collectionSerialized) {
      builder.element('collection', namespace: 'DAV:', isSelfClosing: true, nest: () {
        if (value != null) {
          builder.text(value);
        }
      });
    }
  }
}

void _$WebDavResourcetypeBuildXmlElement(WebDavResourcetype instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('resourcetype', namespace: 'DAV:', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WebDavResourcetype _$WebDavResourcetypeFromXmlElement(XmlElement element) {
  final collection = element.getElements('collection', namespace: 'DAV:')?.map((e) => e.getText()).whereType<String>();
  return WebDavResourcetype(collection: collection?.toList());
}

List<XmlAttribute> _$WebDavResourcetypeToXmlAttributes(WebDavResourcetype instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$WebDavResourcetypeToXmlChildren(WebDavResourcetype instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final collection = instance.collection;
  final collectionSerialized = collection;
  final collectionConstructed = collectionSerialized
      ?.map((e) => XmlElement(XmlName('collection', namespaces['DAV:']), [], e != null ? [XmlText(e)] : [], true));
  if (collectionConstructed != null) {
    children.addAll(collectionConstructed);
  }
  return children;
}

XmlElement _$WebDavResourcetypeToXmlElement(WebDavResourcetype instance, {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('resourcetype', namespaces['DAV:']),
      [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WebDavResourcetypeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavResourcetypeBuildXmlChildren(this as WebDavResourcetype, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) =>
      _$WebDavResourcetypeBuildXmlElement(this as WebDavResourcetype, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResourcetypeToXmlAttributes(this as WebDavResourcetype, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResourcetypeToXmlChildren(this as WebDavResourcetype, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WebDavResourcetypeToXmlElement(this as WebDavResourcetype, namespaces: namespaces);
}
