// ignore_for_file: public_member_api_docs
part of '../../nextcloud.dart';

/// Format used in WebDAV
final webdavDateFormat = DateFormat('E, d MMM yyyy HH:mm:ss', 'en_US');

const namespaceDav = 'DAV:';
const namespaceOwncloud = 'http://owncloud.org/ns';
const namespaceNextcloud = 'http://nextcloud.org/ns';
const namespaceOpenCollaborationServices = 'http://open-collaboration-services.org/ns';
const namespaceOpenCloudMesh = 'http://open-cloud-mesh.org/ns';

final Map<String, String> namespaces = {
  namespaceDav: 'd',
  namespaceOwncloud: 'oc',
  namespaceNextcloud: 'nc',
  namespaceOpenCollaborationServices: 'ocs',
  namespaceOpenCloudMesh: 'ocm',
};

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'multistatus', namespace: namespaceDav)
class WebDavMultistatus with _$WebDavMultistatusXmlSerializableMixin {
  WebDavMultistatus({
    required this.responses,
  });

  factory WebDavMultistatus.fromXmlElement(final XmlElement element) => _$WebDavMultistatusFromXmlElement(element);

  @annotation.XmlElement(name: 'response', namespace: namespaceDav)
  final List<WebDavResponse> responses;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'response', namespace: namespaceDav)
class WebDavResponse with _$WebDavResponseXmlSerializableMixin {
  WebDavResponse({
    required this.href,
    required this.propstats,
  });

  factory WebDavResponse.fromXmlElement(final XmlElement element) => _$WebDavResponseFromXmlElement(element);

  @annotation.XmlElement(name: 'href', namespace: namespaceDav)
  final String? href;

  @annotation.XmlElement(name: 'propstat', namespace: namespaceDav)
  final List<WebDavPropstat> propstats;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propstat', namespace: namespaceDav)
class WebDavPropstat with _$WebDavPropstatXmlSerializableMixin {
  WebDavPropstat({
    required this.status,
    required this.prop,
  });

  factory WebDavPropstat.fromXmlElement(final XmlElement element) => _$WebDavPropstatFromXmlElement(element);

  @annotation.XmlElement(name: 'status', namespace: namespaceDav)
  final String status;

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavProp prop;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propertyupdate', namespace: namespaceDav)
class WebDavPropertyupdate with _$WebDavPropertyupdateXmlSerializableMixin {
  WebDavPropertyupdate({
    required this.set,
  });

  factory WebDavPropertyupdate.fromXmlElement(final XmlElement element) =>
      _$WebDavPropertyupdateFromXmlElement(element);

  @annotation.XmlElement(name: 'set', namespace: namespaceDav)
  final WebDavSet set;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propertyupdate', namespace: namespaceDav)
class WebDavSet with _$WebDavSetXmlSerializableMixin {
  WebDavSet({
    required this.prop,
  });

  factory WebDavSet.fromXmlElement(final XmlElement element) => _$WebDavSetFromXmlElement(element);

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavProp prop;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propfind', namespace: namespaceDav)
class WebDavPropfind with _$WebDavPropfindXmlSerializableMixin {
  WebDavPropfind({
    required this.prop,
  });

  factory WebDavPropfind.fromXmlElement(final XmlElement element) => _$WebDavPropfindFromXmlElement(element);

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavPropfindProp prop;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'filter-files', namespace: namespaceOwncloud)
class WebDavOcFilterFiles with _$WebDavOcFilterFilesXmlSerializableMixin {
  WebDavOcFilterFiles({
    required this.filterRules,
    required this.prop,
  });

  factory WebDavOcFilterFiles.fromXmlElement(final XmlElement element) => _$WebDavOcFilterFilesFromXmlElement(element);

  @annotation.XmlElement(name: 'filter-rules', namespace: namespaceOwncloud)
  final WebDavOcFilterRules filterRules;

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavPropfindProp prop;
}

@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'resourcetype', namespace: namespaceDav)
class WebDavResourcetype with _$WebDavResourcetypeXmlSerializableMixin {
  WebDavResourcetype({
    required this.collection,
  });

  factory WebDavResourcetype.fromXmlElement(final XmlElement element) => _$WebDavResourcetypeFromXmlElement(element);

  @annotation.XmlElement(name: 'collection', namespace: namespaceDav, isSelfClosing: true, includeIfNull: true)
  final List<String?>? collection;
}

// TODO: oc:checksum
// TODO: oc:tags
// TODO: oc:systemtag
// TODO: oc:circle
// TODO: oc:share-types
// TODO: nc:sharees
