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
      "@annotation.XmlElement(name: '$name', namespace: $namespaceVariable, includeIfNull: true, isSelfClosing: true,)\n  List<String?>? $variable;",
    );
    variables.add(variable);
  }
  File('lib/src/webdav/props.dart').writeAsStringSync(
    [
      '// ignore_for_file: public_member_api_docs',
      "part of '../../nextcloud.dart';",
      '',
      ...generateClass(
        'WebDavPropfindProp',
        'prop',
        'namespaceDav',
        findProps,
        variables,
        isPropfind: true,
      ),
      ...generateClass(
        'WebDavProp',
        'prop',
        'namespaceDav',
        valueProps,
        variables,
        isPropfind: false,
      ),
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
  final String name,
  final String elementName,
  final String namespace,
  final List<String> props,
  final List<String> variables, {
  required final bool isPropfind,
}) =>
    [
      '@annotation.XmlSerializable(createMixin: true)',
      "@annotation.XmlRootElement(name: '$elementName', namespace: $namespace)",
      'class $name with _\$${name}XmlSerializableMixin {',
      '  $name({',
      ...variables.map((final variable) => '    this.$variable,'),
      '  });',
      '',
      if (isPropfind) ...[
        '  $name.fromBools({',
        ...variables.map((final variable) => '    final bool $variable = false,'),
        '  }) : ${variables.map((final variable) => '$variable = $variable ? [null] : null').join(', ')};',
        '',
      ],
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
