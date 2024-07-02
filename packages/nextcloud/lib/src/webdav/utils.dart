import 'dart:convert';

import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:nextcloud/src/webdav/models.dart';
import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';
import 'package:xml_annotation/xml_annotation.dart' as xml_annotation;

/// Base path used on the server
final webdavBase = PathUri.parse('/remote.php/webdav');

/// Parses the response headers from a `options` request.
WebDavOptions parseWebDavOptions(Map<String, String> headers) {
  final davCapabilities = headers['dav'];
  final davSearchCapabilities = headers['dasl'];

  return WebDavOptions(
    davCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
    davSearchCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
  );
}

/// Constructs the uri for a webdav request for a given server [baseURL] and file [path].
@internal
Uri constructUri(Uri baseURL, [PathUri? path]) {
  final segments = baseURL.pathSegments.toList()..addAll(webdavBase.pathSegments);
  if (path != null) {
    segments.addAll(path.pathSegments);
  }
  return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
}

/// Converter to transform a [http.StreamedResponse] into a [DynamiteResponse].
///
/// Throws a [DynamiteApiException] on errors.
final class WebDavResponseConverter with Converter<http.StreamedResponse, Future<WebDavMultistatus>> {
  /// Creates a new response converter
  const WebDavResponseConverter();

  @override
  Future<WebDavMultistatus> convert(http.StreamedResponse input) async {
    final response = await http.Response.fromStream(input);

    final xml = XmlEventDecoder()
        .fuse(const XmlNormalizeEvents())
        .fuse(const XmlNodeDecoder())
        .convert(response.body)
        .firstWhere((element) => element is XmlElement) as XmlElement;

    return WebDavMultistatus.fromXmlElement(xml);
  }
}

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
