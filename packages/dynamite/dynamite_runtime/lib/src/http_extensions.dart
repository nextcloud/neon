import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:universal_io/io.dart';
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';

/// A stream of bytes.
///
/// Usually a `Stream<Uint8List>`.
typedef BytesStream = Stream<List<int>>;

final _jsonBytesConverter = utf8.decoder.fuse(json.decoder);

final _xmlBytesConverter =
    utf8.decoder.fuse(XmlEventDecoder()).fuse(const XmlNormalizeEvents()).fuse(const XmlNodeDecoder());

/// Extension on byte streams that enable efficient transformations.
extension BytesStreamExtension on BytesStream {
  /// Collects all bytes from this stream into one Uint8List.
  ///
  /// The collector will assume that the bytes in this stream will not change.
  /// See [BytesBuilder] for further information.
  Future<Uint8List> get bytes async {
    final buffer = BytesBuilder(copy: false);

    await forEach(buffer.add);

    return buffer.toBytes();
  }

  /// Converts the stream into a `String` using the [utf8] encoding.
  Future<String> get string => transform(utf8.decoder).join();

  /// Converts the stream into a JSON using the [utf8] encoding.
  Future<Object?> get json => transform(_jsonBytesConverter).first;

  /// Converts the stream into XML using the [utf8] encoding.
  ///
  /// Returns the root element of this stream.
  Future<XmlElement> get xml async {
    final element = await transform(_xmlBytesConverter)
        .expand((final events) => events)
        .firstWhere((final element) => element is XmlElement);

    return element as XmlElement;
  }
}

/// Extension on a http responses.
extension HttpClientResponseExtension on HttpClientResponse {
  /// Returns a map of headers.
  Map<String, Object?> get responseHeaders {
    final responseHeaders = <String, Object?>{};
    headers.forEach((final name, final values) {
      responseHeaders[name] = values.last;
    });

    return responseHeaders;
  }
}

/// Extension for http headers.
extension HttpHeadersExtension on HttpHeaders {
  /// Iteratively adds all header values.
  void addAll(final Map<String, String> headers) {
    for (final header in headers.entries) {
      add(header.key, header.value);
    }
  }
}
