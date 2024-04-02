// ignore_for_file: public_member_api_docs
// coverage:ignore-file

import 'package:meta/meta.dart';
import 'package:nextcloud/src/webdav/props.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'webdav.g.dart';

const namespaceDav = 'DAV:';
const namespaceOwncloud = 'http://owncloud.org/ns';
const namespaceNextcloud = 'http://nextcloud.org/ns';
const namespaceOpenCollaborationServices = 'http://open-collaboration-services.org/ns';
const namespaceOpenCloudMesh = 'http://open-cloud-mesh.org/ns';

const Map<String, String> namespaces = {
  namespaceDav: 'd',
  namespaceOwncloud: 'oc',
  namespaceNextcloud: 'nc',
  namespaceOpenCollaborationServices: 'ocs',
  namespaceOpenCloudMesh: 'ocm',
};

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'multistatus', namespace: namespaceDav)
class WebDavMultistatus with _$WebDavMultistatusXmlSerializableMixin {
  const WebDavMultistatus({
    required this.responses,
  });

  factory WebDavMultistatus.fromXmlElement(XmlElement element) => _$WebDavMultistatusFromXmlElement(element);

  @annotation.XmlElement(name: 'response', namespace: namespaceDav)
  final List<WebDavResponse> responses;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'response', namespace: namespaceDav)
class WebDavResponse with _$WebDavResponseXmlSerializableMixin {
  const WebDavResponse({
    required this.href,
    required this.propstats,
  });

  factory WebDavResponse.fromXmlElement(XmlElement element) => _$WebDavResponseFromXmlElement(element);

  @annotation.XmlElement(name: 'href', namespace: namespaceDav)
  final String? href;

  @annotation.XmlElement(name: 'propstat', namespace: namespaceDav)
  final List<WebDavPropstat> propstats;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propstat', namespace: namespaceDav)
class WebDavPropstat with _$WebDavPropstatXmlSerializableMixin {
  const WebDavPropstat({
    required this.status,
    required this.prop,
  });

  factory WebDavPropstat.fromXmlElement(XmlElement element) => _$WebDavPropstatFromXmlElement(element);

  @annotation.XmlElement(name: 'status', namespace: namespaceDav)
  final String status;

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavProp prop;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propertyupdate', namespace: namespaceDav)
class WebDavPropertyupdate with _$WebDavPropertyupdateXmlSerializableMixin {
  const WebDavPropertyupdate({
    this.set,
    this.remove,
  });

  @annotation.XmlElement(name: 'set', namespace: namespaceDav, includeIfNull: false)
  final WebDavSet? set;

  @annotation.XmlElement(name: 'remove', namespace: namespaceDav, includeIfNull: false)
  final WebDavRemove? remove;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'set', namespace: namespaceDav)
class WebDavSet with _$WebDavSetXmlSerializableMixin {
  const WebDavSet({
    required this.prop,
  });

  factory WebDavSet.fromXmlElement(XmlElement element) => _$WebDavSetFromXmlElement(element);

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavProp prop; // coverage:ignore-line
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'remove', namespace: namespaceDav)
class WebDavRemove with _$WebDavRemoveXmlSerializableMixin {
  const WebDavRemove({
    required this.prop,
  });

  factory WebDavRemove.fromXmlElement(XmlElement element) => _$WebDavRemoveFromXmlElement(element);

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavPropWithoutValues prop; // coverage:ignore-line
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'propfind', namespace: namespaceDav)
class WebDavPropfind with _$WebDavPropfindXmlSerializableMixin {
  const WebDavPropfind({
    required this.prop,
  });

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavPropWithoutValues prop;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'filter-files', namespace: namespaceOwncloud)
class WebDavOcFilterFiles with _$WebDavOcFilterFilesXmlSerializableMixin {
  const WebDavOcFilterFiles({
    required this.filterRules,
    required this.prop,
  });

  @annotation.XmlElement(name: 'filter-rules', namespace: namespaceOwncloud)
  final WebDavOcFilterRules filterRules;

  @annotation.XmlElement(name: 'prop', namespace: namespaceDav)
  final WebDavPropWithoutValues prop;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'resourcetype', namespace: namespaceDav)
class WebDavResourcetype with _$WebDavResourcetypeXmlSerializableMixin {
  const WebDavResourcetype({
    required this.collection,
  });

  factory WebDavResourcetype.fromXmlElement(XmlElement element) => _$WebDavResourcetypeFromXmlElement(element);

  @annotation.XmlElement(name: 'collection', namespace: namespaceDav, isSelfClosing: true, includeIfNull: true)
  final List<String?>? collection;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'acl-list', namespace: namespaceNextcloud)
class WebDavNcAclList with _$WebDavNcAclListXmlSerializableMixin {
  const WebDavNcAclList({
    required this.acls,
  });

  factory WebDavNcAclList.fromXmlElement(XmlElement element) => _$WebDavNcAclListFromXmlElement(element);

  @annotation.XmlElement(name: 'acl', namespace: namespaceNextcloud)
  final List<WebDavNcAcl>? acls;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'acl', namespace: namespaceNextcloud)
class WebDavNcAcl with _$WebDavNcAclXmlSerializableMixin {
  const WebDavNcAcl({
    required this.mappingType,
    required this.mappingId,
    required this.mappingDisplayName,
    required this.mask,
    required this.permissions,
  });

  factory WebDavNcAcl.fromXmlElement(XmlElement element) => _$WebDavNcAclFromXmlElement(element);

  @annotation.XmlElement(name: 'acl-mapping-type', namespace: namespaceNextcloud)
  final String mappingType;

  @annotation.XmlElement(name: 'acl-mapping-id', namespace: namespaceNextcloud)
  final String mappingId;

  @annotation.XmlElement(name: 'acl-mapping-display-name', namespace: namespaceNextcloud)
  final String mappingDisplayName;

  @annotation.XmlElement(name: 'acl-mask', namespace: namespaceNextcloud)
  final int mask;

  @annotation.XmlElement(name: 'acl-permissions', namespace: namespaceNextcloud)
  final int permissions;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'sharees', namespace: namespaceNextcloud)
class WebDavNcShareeList with _$WebDavNcShareeListXmlSerializableMixin {
  const WebDavNcShareeList({
    required this.sharees,
  });

  factory WebDavNcShareeList.fromXmlElement(XmlElement element) => _$WebDavNcShareeListFromXmlElement(element);

  @annotation.XmlElement(name: 'sharee', namespace: namespaceNextcloud)
  final List<WebDavNcSharee>? sharees;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'sharee', namespace: namespaceNextcloud)
class WebDavNcSharee with _$WebDavNcShareeXmlSerializableMixin {
  const WebDavNcSharee({
    required this.id,
    required this.displayName,
    required this.type,
  });

  factory WebDavNcSharee.fromXmlElement(XmlElement element) => _$WebDavNcShareeFromXmlElement(element);

  @annotation.XmlElement(name: 'id', namespace: namespaceNextcloud)
  final String id;

  @annotation.XmlElement(name: 'display-name', namespace: namespaceNextcloud)
  final String displayName;

  @annotation.XmlElement(name: 'type', namespace: namespaceNextcloud)
  final int type;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'checksums', namespace: namespaceOwncloud)
class WebDavOcChecksums with _$WebDavOcChecksumsXmlSerializableMixin {
  const WebDavOcChecksums({
    required this.checksums,
  });

  factory WebDavOcChecksums.fromXmlElement(XmlElement element) => _$WebDavOcChecksumsFromXmlElement(element);

  @annotation.XmlElement(name: 'checksum', namespace: namespaceNextcloud)
  final List<String>? checksums;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'share-types', namespace: namespaceOwncloud)
class WebDavOcShareTypes with _$WebDavOcShareTypesXmlSerializableMixin {
  const WebDavOcShareTypes({
    required this.shareTypes,
  });

  factory WebDavOcShareTypes.fromXmlElement(XmlElement element) => _$WebDavOcShareTypesFromXmlElement(element);

  @annotation.XmlElement(name: 'share-type', namespace: namespaceNextcloud)
  final List<int>? shareTypes;
}

@immutable
@annotation.XmlSerializable(createMixin: true)
@annotation.XmlRootElement(name: 'tags', namespace: namespaceOwncloud)
class WebDavOcTags with _$WebDavOcTagsXmlSerializableMixin {
  const WebDavOcTags({
    required this.tags,
  });

  factory WebDavOcTags.fromXmlElement(XmlElement element) => _$WebDavOcTagsFromXmlElement(element);

  @annotation.XmlElement(name: 'tag', namespace: namespaceNextcloud)
  final List<String>? tags;
}
