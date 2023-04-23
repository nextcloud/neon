import 'dart:io';

void main() {
  final props = File('lib/src/webdav/props.csv').readAsLinesSync().map((final line) => line.split(','));
  final valueProps = <String>[];
  final findProps = <String>[];
  final variables = <String>[];
  for (final prop in props) {
    final namespacePrefix = prop[0];
    final namespaceVariable = convertNamespace(namespacePrefix);
    final type = prop[2];
    final name = prop[1];
    final variable = namespacePrefix + name.toLowerCase().replaceAll(RegExp('[^a-z]'), '');
    valueProps.add(
      "@annotation.XmlElement(name: '$name', namespace: $namespaceVariable, includeIfNull: false,)\n  $type? $variable;",
    );
    findProps.add(
      "@annotation.XmlElement(name: '$name', namespace: $namespaceVariable, includeIfNull: false,)\n  bool? $variable;",
    );
    variables.add(variable);
  }
  File('lib/src/webdav/props.dart').writeAsStringSync(
    [
      '// ignore_for_file: public_member_api_docs',
      "import 'package:nextcloud/src/webdav/webdav.dart';",
      "import 'package:xml/xml.dart';",
      "import 'package:xml_annotation/xml_annotation.dart' as annotation;",
      "part 'props.g.dart';",
      '',
      ...generateClass('WebDavPropfindProp', 'prop', 'namespaceDav', findProps, variables),
      ...generateClass('WebDavProp', 'prop', 'namespaceDav', valueProps, variables),
      ...generateClass('WebDavOcFilterRules', 'filter-rules', 'namespaceOwncloud', valueProps, variables),
      '',
    ].join('\n'),
  );
}

List<String> generateClass(
  final String name,
  final String elementName,
  final String namespace,
  final List<String> props,
  final List<String> variables,
) =>
    [
      '@annotation.XmlSerializable(createMixin: true)',
      "@annotation.XmlRootElement(name: '$elementName', namespace: $namespace)",
      'class $name with _\$${name}XmlSerializableMixin {',
      '  $name({',
      ...variables.map((final variable) => '    this.$variable,'),
      '  });',
      '  factory $name.fromXmlElement(final XmlElement element) => _\$${name}FromXmlElement(element);',
      ...props.map((final prop) => '\n  $prop'),
      '}',
    ];

String convertNamespace(final String namespacePrefix) {
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
