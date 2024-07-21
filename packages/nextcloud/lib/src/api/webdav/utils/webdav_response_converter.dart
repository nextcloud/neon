import 'dart:convert';

import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/src/api/webdav/webdav.dart';
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';

/// Converter to transform a [http.StreamedResponse] into a [DynamiteResponse].
///
/// Throws a [DynamiteApiException] on errors.
final class WebDavResponseConverter with Converter<http.Response, WebDavMultistatus> {
  /// Creates a new response converter
  const WebDavResponseConverter();

  @override
  WebDavMultistatus convert(http.Response input) {
    final xml = XmlEventDecoder()
        .fuse(const XmlNormalizeEvents())
        .fuse(const XmlNodeDecoder())
        .convert(input.body)
        .firstWhere((element) => element is XmlElement) as XmlElement;

    return WebDavMultistatus.fromXmlElement(xml);
  }
}
