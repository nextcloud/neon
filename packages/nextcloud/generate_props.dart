import 'dart:io';

import 'package:dynamite/src/helpers/dart_helpers.dart';

void main() {
  final props = <String, Map<String, String>>{
    'dav': {
      // lockdiscovery and supportedlock are omitted because the server only has a dummy implementation anyway.
      'creationdate': 'iso8601',
      'displayname': 'String',
      'getcontentlanguage': 'String',
      'getcontentlength': 'int',
      'getcontenttype': 'String',
      'getetag': 'String',
      'getlastmodified': 'httpDate',
      'quota-available-bytes': 'int',
      'quota-used-bytes': 'int',
      'resourcetype': 'WebDavResourcetype',
    },
    'nc': {
      'acl-can-manage': 'bool',
      'acl-enabled': 'bool',
      'acl-list': 'WebDavNcAclList',
      'contained-file-count': 'int',
      'contained-folder-count': 'int',
      'creation_time': 'unixEpoch',
      'data-fingerprint': 'String',
      'group-folder-id': 'int',
      'has-preview': 'bool',
      'hidden': 'bool',
      'inherited-acl-list': 'WebDavNcAclList',
      'is-encrypted': 'bool',
      'is-mount-root': 'bool',
      'lock': 'bool',
      'lock-owner': 'String',
      'lock-owner-displayname': 'String',
      'lock-owner-editor': 'String',
      'lock-owner-type': 'int',
      'lock-time': 'unixEpoch',
      'lock-timeout': 'seconds',
      'lock-token': 'String',
      'mount-type': 'String',
      'note': 'String',
      'reminder-due-date': 'iso8601',
      'rich-workspace': 'String',
      'rich-workspace-file': 'int',
      'share-attributes': 'String',
      'sharees': 'WebDavNcShareeList',
      'upload_time': 'unixEpoch',
      'version-author': 'String',
      'version-label': 'String',
      'metadata-blurhash': 'String',
    },
    'oc': {
      'checksums': 'WebDavOcChecksums',
      'comments-count': 'int',
      'comments-href': 'String',
      'comments-unread': 'int',
      'downloadURL': 'String',
      'favorite': 'bool',
      'fileid': 'int',
      'id': 'String',
      'owner-display-name': 'String',
      'owner-id': 'String',
      'permissions': 'String',
      'share-types': 'WebDavOcShareTypes',
      'size': 'int',
      'tags': 'WebDavOcTags',
    },
    'ocm': {
      'share-permissions': 'String',
    },
    'ocs': {
      'share-permissions': 'int',
    },
  };

  final valueProps = <String>[];
  final findProps = <String>[];
  final variables = <String>[];
  for (final namespacePrefix in props.keys) {
    for (final name in props[namespacePrefix]!.keys) {
      var type = props[namespacePrefix]![name]!;

      final namespaceVariable = convertNamespace(namespacePrefix);
      final variable = toDartName('$namespacePrefix-$name');

      final value = StringBuffer('''
@annotation.XmlElement(
    name: '$name',
    namespace: $namespaceVariable,
    includeIfNull: false,
  )
''');
      switch (type) {
        case 'httpDate':
          value.writeln('  @HttpDateXMLConverter()');
          type = 'tz.TZDateTime';
        case 'iso8601':
          value.writeln('  @ISO8601XMLConverter()');
          type = 'tz.TZDateTime';
        case 'unixEpoch':
          value.writeln('  @UnixEpochXMLConverter()');
          type = 'tz.TZDateTime';
        case 'seconds':
          value.writeln('  @DurationXMLConverter()');
          type = 'Duration';
      }

      value.write('  final $type? $variable;');
      valueProps.add(value.toString());

      findProps.add('''
@annotation.XmlElement(
    name: '$name',
    namespace: $namespaceVariable,
    includeIfNull: true,
    isSelfClosing: true,
  )
  final List<String?>? $variable;''');
      variables.add(variable);
    }
  }
  File('lib/src/webdav/props.dart').writeAsStringSync(
    [
      '// ignore_for_file: public_member_api_docs',
      '// coverage:ignore-file',
      "import 'package:meta/meta.dart';",
      "import 'package:nextcloud/src/utils/date_time.dart';",
      "import 'package:nextcloud/src/webdav/utils.dart';",
      "import 'package:nextcloud/src/webdav/webdav.dart';",
      "import 'package:timezone/timezone.dart' as tz;",
      "import 'package:xml/xml.dart';",
      "import 'package:xml_annotation/xml_annotation.dart' as annotation;",
      "part 'props.g.dart';",
      '',
      ...generateClass(
        'WebDavPropWithoutValues',
        'prop',
        'namespaceDav',
        findProps,
        variables,
        isPropfind: true,
      ),
      '',
      ...generateClass(
        'WebDavProp',
        'prop',
        'namespaceDav',
        valueProps,
        variables,
        isPropfind: false,
      ),
      '',
      ...generateClass(
        'WebDavOcFilterRules',
        'filter-rules',
        'namespaceOwncloud',
        valueProps,
        variables,
        isPropfind: false,
      ),
      '',
    ].join('\n'),
  );
}

List<String> generateClass(
  String name,
  String elementName,
  String namespace,
  List<String> props,
  List<String> variables, {
  required bool isPropfind,
}) =>
    [
      '@immutable',
      '@annotation.XmlSerializable(createMixin: true)',
      "@annotation.XmlRootElement(name: '$elementName', namespace: $namespace)",
      'class $name with _\$${name}XmlSerializableMixin {',
      '  const $name({',
      ...variables.map((variable) => '    this.$variable,'),
      '  });',
      '',
      if (isPropfind) ...[
        '  const $name.fromBools({',
        ...variables.map((variable) => '    bool $variable = false,'),
        '  })  : ${variables.map((variable) => '$variable = $variable ? const [null] : null').join(',\n        ')};',
        '',
      ],
      '  factory $name.fromXmlElement(XmlElement element) => _\$${name}FromXmlElement(element);',
      ...props.map((prop) => '\n  $prop'),
      '}',
    ];

String convertNamespace(String namespacePrefix) {
  switch (namespacePrefix) {
    case 'dav':
      return 'namespaceDav';
    case 'oc':
      return 'namespaceOwncloud';
    case 'nc':
      return 'namespaceNextcloud';
    case 'ocs':
      return 'namespaceOpenCollaborationServices';
    case 'ocm':
      return 'namespaceOpenCloudMesh';
    default:
      throw Exception('Unknown namespace prefix "$namespacePrefix"');
  }
}
