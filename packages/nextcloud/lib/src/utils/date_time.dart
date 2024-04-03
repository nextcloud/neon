import 'package:meta/meta.dart';
import 'package:nextcloud/src/utils/http_date_parser.dart';
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:xml/xml.dart' as xml;
import 'package:xml_annotation/xml_annotation.dart' as xml_annotation;

/// Common methods to work with [DateTime] data.
extension DateTimeUtils on DateTime {
  /// Constructs a new [tz.TZDateTime] instance
  /// with the given [secondsSinceEpoch].
  ///
  /// The constructed [tz.TZDateTime] represents
  /// 1970-01-01T00:00:[secondsSinceEpoch]Z in the given
  /// time zone [location].
  /// ```dart
  /// final newYearsDay =
  ///     DateTimeUtils.fromSecondsSinceEpoch(1641031200, location:tz.UTC);
  /// print(newYearsDay); // 2022-01-01 10:00:00.000Z
  /// ```
  static tz.TZDateTime fromSecondsSinceEpoch(tz.Location location, int secondsSinceEpoch) {
    final millisecondsSinceEpoch = secondsSinceEpoch * Duration.millisecondsPerSecond;

    return tz.TZDateTime.fromMillisecondsSinceEpoch(location, millisecondsSinceEpoch);
  }

  /// The number of seconds since the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
  ///
  /// This value is independent of the time zone.
  ///
  /// This value is at most
  /// 8,640,000,000,000s (100,000,000 days) from the Unix epoch.
  /// In other words: `secondsSinceEpoch.abs() <= 8640000000000`.
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
}

@internal
final class HttpDateXMLConverter implements xml_annotation.XmlConverter<tz.TZDateTime?> {
  const HttpDateXMLConverter();

  @override
  void buildXmlChildren(
    tz.TZDateTime? instance,
    xml.XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance == null) {
      return;
    }

    final date = formatHttpDate(instance);
    builder.text(date);
  }

  @override
  tz.TZDateTime? fromXmlElement(
    xml.XmlElement element,
  ) {
    final date = element.getText();
    if (date != null) {
      return parseHttpDate(date);
    }

    return null;
  }

  @override
  List<xml.XmlAttribute> toXmlAttributes(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const <xml.XmlAttribute>[];
  }

  @override
  List<xml.XmlNode> toXmlChildren(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    if (instance == null) {
      return const <xml.XmlNode>[];
    }

    final date = formatHttpDate(instance);
    return <xml.XmlNode>[
      xml.XmlText(date),
    ];
  }
}

@internal
final class ISO8601XMLConverter implements xml_annotation.XmlConverter<tz.TZDateTime?> {
  const ISO8601XMLConverter();

  @override
  void buildXmlChildren(
    tz.TZDateTime? instance,
    xml.XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance == null) {
      return;
    }

    final date = instance.toIso8601String();
    builder.text(date);
  }

  @override
  tz.TZDateTime? fromXmlElement(
    xml.XmlElement element,
  ) {
    final date = element.getText();
    if (date != null) {
      return tz.TZDateTime.parse(tz.UTC, date);
    }

    return null;
  }

  @override
  List<xml.XmlAttribute> toXmlAttributes(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const <xml.XmlAttribute>[];
  }

  @override
  List<xml.XmlNode> toXmlChildren(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    if (instance == null) {
      return const <xml.XmlNode>[];
    }

    final date = instance.toIso8601String();
    return <xml.XmlNode>[
      xml.XmlText(date),
    ];
  }
}

@internal
final class UnixEpochXMLConverter implements xml_annotation.XmlConverter<tz.TZDateTime?> {
  const UnixEpochXMLConverter();

  @override
  void buildXmlChildren(
    tz.TZDateTime? instance,
    xml.XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance == null) {
      return;
    }

    final date = instance.secondsSinceEpoch.toString();
    builder.text(date);
  }

  @override
  tz.TZDateTime? fromXmlElement(
    xml.XmlElement element,
  ) {
    final date = element.getText();
    if (date != null) {
      return DateTimeUtils.fromSecondsSinceEpoch(
        tz.UTC,
        int.parse(date),
      );
    }

    return null;
  }

  @override
  List<xml.XmlAttribute> toXmlAttributes(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const <xml.XmlAttribute>[];
  }

  @override
  List<xml.XmlNode> toXmlChildren(
    tz.TZDateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    if (instance == null) {
      return const <xml.XmlNode>[];
    }

    final date = instance.secondsSinceEpoch.toString();
    return <xml.XmlNode>[
      xml.XmlText(date),
    ];
  }
}
