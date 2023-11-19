import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:universal_io/io.dart';

/// A stream of bytes.
///
/// Usually a `Stream<Uint8List>`.
typedef BytesStream = Stream<List<int>>;

final _utf8JsonDecoder = utf8.decoder.fuse(json.decoder);

/// Extension on byte streams that enable efficient transformations.
extension BytesStreamExtension on BytesStream {
  /// Returns the all bytes of the stream.
  Future<Uint8List> get bytes async {
    final buffer = BytesBuilder();

    await forEach(buffer.add);

    return buffer.toBytes();
  }

  /// Converts the stream into a `String` using the [utf8] encoding.
  Future<String> get string => transform(utf8.decoder).join();

  /// Converts the stream into a JSON using the [utf8] encoding.
  Future<Object?> get json => transform(_utf8JsonDecoder).first;
}

/// Extension on a http responses.
extension HttpClientResponseExtension on HttpClientResponse {
  /// Returns a map of headers.
  Map<String, String> get responseHeaders {
    final responseHeaders = <String, String>{};
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
