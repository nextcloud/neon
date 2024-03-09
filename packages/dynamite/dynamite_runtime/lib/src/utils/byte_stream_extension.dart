import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';

/// Converter for `String` to `XML`.
@visibleForTesting
final xmlConverter = XmlEventDecoder()
    .fuse(const XmlNormalizeEvents())
    .fuse(const XmlNodeDecoder());

/// Extension on byte streams that enable efficient transformations.
@internal
extension HttpBytesStreamExtension on http.ByteStream {
  /// Collects the data of this stream in a [Uint8List].
  ///
  /// The collector will assume that the bytes in this stream will not change.
  /// See [BytesBuilder] for further information.
  ///
  /// This method is more efficient than using [toBytes].
  Future<Uint8List> get bytes async {
    final buffer = BytesBuilder(copy: false);

    await forEach(buffer.add);

    return buffer.toBytes();
  }

  /// Collect the data of this stream in a json object, decoded according to
  /// [encoding], which defaults to [utf8].
  Future<Object?> bytesToJson([Encoding encoding = utf8]) =>
      encoding.decoder.fuse(const JsonDecoder()).bind(this).first;

  /// Collect the data of this stream in [XmlElement], decoded according to
  /// [encoding], which defaults to [utf8].
  Future<Object?> bytesToXml([Encoding encoding = utf8]) async {
    final element = await encoding.decoder
        .fuse(xmlConverter)
        .bind(this)
        .expand((events) => events)
        .firstWhere((element) => element is XmlElement);

    return element as XmlElement;
  }
}

/// Returns the encoding to use for a response with the given headers.
///
/// Defaults to [latin1] if the headers don't specify a charset or if that
/// charset is unknown.
///
/// Copied from `package:http`.
@internal
Encoding encodingForHeaders(Map<String, String> headers) =>
    _encodingForCharset(_contentTypeForHeaders(headers).parameters['charset']);

/// Returns the [Encoding] that corresponds to [charset].
///
/// Returns [fallback] if [charset] is null or if no [Encoding] was found that
/// corresponds to [charset].
///
/// Copied from `package:http`.
Encoding _encodingForCharset(String? charset, [Encoding fallback = latin1]) {
  if (charset == null) {
    return fallback;
  }
  return Encoding.getByName(charset) ?? fallback;
}

/// Returns the [MediaType] object for the given headers's content-type.
///
/// Defaults to `application/octet-stream`.
///
/// Copied from `package:http`.
MediaType _contentTypeForHeaders(Map<String, String> headers) {
  final contentType = headers['content-type'];
  if (contentType != null) {
    return MediaType.parse(contentType);
  }
  return MediaType('application', 'octet-stream');
}
