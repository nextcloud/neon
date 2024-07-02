import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

/// Response returned by operations of a `DynamiteClient`.
@immutable
class DynamiteResponse<B, H> {
  /// Creates a new dynamite response.
  const DynamiteResponse(
    this.statusCode,
    this.body,
    this.headers,
  );

  /// The status code of the response.
  final int statusCode;

  /// The decoded body of the response.
  final B body;

  /// The decoded headers of the response.
  final H headers;

  @override
  String toString() => 'DynamiteResponse(data: $body, headers: $headers, statusCode: $statusCode)';
}

/// The serializer to convert the raw headers and body from a [http.BaseResponse].
///
/// The generics [B] and [H] must match the type returned after deserializing to
/// [bodyType] and [headersType] respectively.
@immutable
final class DynamiteSerializer<B, H> {
  /// Creates a new dynamite serializer.
  const DynamiteSerializer({
    required this.bodyType,
    required this.headersType,
    required this.serializers,
    this.validStatuses,
  });

  /// The serializers for the header and body.
  final Serializers serializers;

  /// The full type of the body.
  ///
  /// This is `null` if the body type is void.
  final FullType? bodyType;

  /// The full type of the headers.
  ///
  /// This is `null` if the headers type is void.
  final FullType? headersType;

  /// The expected valid statuses of this request.
  final Set<int>? validStatuses;
}

/// Converter to transform a [http.Response] into a [DynamiteResponse].
///
/// Throws a [DynamiteApiException] on errors.
final class ResponseConverter<B, H> with Converter<http.Response, DynamiteResponse<B, H>> {
  /// Creates a new response converter
  const ResponseConverter(this.serializer);

  /// The serializer to convert the raw header and body into [B] and [H].
  final DynamiteSerializer<B, H> serializer;

  static final Logger _logger = Logger('ResponseConverter');

  @override
  DynamiteResponse<B, H> convert(http.Response input) {
    final rawHeaders = input.headers;
    final statusCode = input.statusCode;
    final validStatuses = serializer.validStatuses;
    if (validStatuses != null && !validStatuses.contains(statusCode)) {
      throw DynamiteStatusCodeException(input);
    }

    final headers = _deserialize<H>(rawHeaders, serializer.serializers, serializer.headersType);

    final contentType = rawHeaders['content-type'];
    MediaType? mediaType;
    if (contentType != null) {
      try {
        mediaType = MediaType.parse(contentType);
      } on FormatException catch (error, stackTrace) {
        _logger.warning('Could not parse $contentType', error, stackTrace);
      }
    }

    final body = switch (mediaType) {
      MediaType(type: 'text') || MediaType(type: 'application', subtype: 'javascript') => input.body,
      MediaType(type: 'application', subtype: 'json') => _deserialize<B>(
          json.decode(input.body),
          serializer.serializers,
          serializer.bodyType,
        ),
      _ => input.bodyBytes,
    };

    return DynamiteResponse<B, H>(
      statusCode,
      body as B,
      headers as H,
    );
  }
}

/// Deserializes the given [serialized] data.
///
/// Serialization is skipped if the data already represents the desired type.
/// The [fullType] should represent the return type [T].
T? _deserialize<T>(Object? serialized, Serializers serializers, FullType? fullType) {
  // If we use the more efficient helpers from BytesStreamExtension the serialized value can already be correct.
  if (serialized is T) {
    return serialized;
  }

  if (fullType != null) {
    return serializers.deserialize(serialized, specifiedType: fullType) as T?;
  }

  return null;
}
