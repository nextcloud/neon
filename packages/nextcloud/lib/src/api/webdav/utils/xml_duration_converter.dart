import 'package:meta/meta.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml_annotation/xml_annotation.dart' as xml_annotation;

@internal
final class DurationXMLConverter implements xml_annotation.XmlConverter<Duration?> {
  const DurationXMLConverter();

  @override
  void buildXmlChildren(
    Duration? instance,
    xml.XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance == null) {
      return;
    }

    final serialized = instance.inSeconds.toString();
    builder.text(serialized);
  }

  @override
  Duration? fromXmlElement(
    xml.XmlElement element,
  ) {
    final value = element.getText();

    if (value != null) {
      final seconds = int.parse(value);
      return Duration(seconds: seconds);
    }

    return null;
  }

  @override
  List<xml.XmlAttribute> toXmlAttributes(
    Duration? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const <xml.XmlAttribute>[];
  }

  @override
  List<xml.XmlNode> toXmlChildren(
    Duration? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    if (instance == null) {
      return const <xml.XmlNode>[];
    }

    final serialized = instance.inSeconds.toString();
    return <xml.XmlNode>[
      xml.XmlText(serialized),
    ];
  }
}
