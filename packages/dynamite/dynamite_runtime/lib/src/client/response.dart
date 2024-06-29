import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
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

  /// Converts the [rawResponse] to a generic dynamite response to free the
  /// resources taken by the raw parameters.
  factory DynamiteResponse.fromRawResponse(DynamiteRawResponse<B, H> rawResponse) => DynamiteResponse(
        rawResponse.statusCode,
        rawResponse.body,
        rawResponse.headers,
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

/// Raw response that can be efficiently serialized into a json Map.
class DynamiteRawResponse<B, H> extends DynamiteResponse<B, H> {
  /// Creates a new raw dynamite response.
  const DynamiteRawResponse({
    required int statusCode,
    required B body,
    required H headers,
    this.rawHeaders,
    this.rawBody,
  }) : super(statusCode, body, headers);

  /// Caches the raw headers for later serialization in [toJson].
  final Map<String, Object?>? rawHeaders;

  /// Caches the raw response body for later serialization in [toJson].
  final Object? rawBody;

  /// Serializes this response into json.
  ///
  /// To revive it again use `DynamiteRawResponse.fromJson` with the same
  /// serializer and `FullType`s as this.
  Map<String, Object?> toJson() => {
        'statusCode': statusCode,
        'body': rawBody,
        'headers': rawHeaders,
      };

  @override
  String toString() => 'DynamiteRawResponse(data: $body, headers: $headers, statusCode: $statusCode)';
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

/// Converter to transform a [http.StreamedResponse] into a [DynamiteResponse].
///
/// Throws a [DynamiteApiException] on errors.
final class ResponseConverter<B, H> with Converter<http.StreamedResponse, Future<DynamiteRawResponse<B, H>>> {
  /// Creates a new response converter
  const ResponseConverter(this.serializer);

  /// The serializer to convert the raw header and body into [B] and [H].
  final DynamiteSerializer<B, H> serializer;

  @override
  Future<DynamiteRawResponse<B, H>> convert(http.StreamedResponse input) async {
    final response = await http.Response.fromStream(input);

    final rawHeaders = response.headers;
    final statusCode = response.statusCode;
    final validStatuses = serializer.validStatuses;
    if (validStatuses != null && !validStatuses.contains(statusCode)) {
      throw DynamiteStatusCodeException(response);
    }

    final headers = _deserialize<H>(rawHeaders, serializer.serializers, serializer.headersType);

    final rawBody = switch (serializer.bodyType) {
      const FullType(Uint8List) => response.bodyBytes,
      const FullType(String) => response.body,
      _ => json.decode(response.body),
    };
    final body = _deserialize<B>(rawBody, serializer.serializers, serializer.bodyType);

    return DynamiteRawResponse<B, H>(
      statusCode: statusCode,
      rawHeaders: rawHeaders,
      headers: headers as H,
      rawBody: rawBody,
      body: body as B,
    );
  }
}

/// Encoder to efficiently convert a raw response to json.
final class RawResponseEncoder with Converter<DynamiteRawResponse<dynamic, dynamic>, Object?> {
  /// Creates a new raw response encoder.
  const RawResponseEncoder();

  @override
  Map<String, Object?> convert(DynamiteRawResponse<dynamic, dynamic> input) => {
        'statusCode': input.statusCode,
        'body': input.rawBody,
        'headers': input.rawHeaders,
      };
}

/// Encoder to revive the json from a raw response.
final class RawResponseDecoder<B, H> with Converter<Object?, DynamiteResponse<B, H>> {
  /// Creates a new raw response decoder.
  const RawResponseDecoder(this.serializer);

  /// The serializer to convert the raw header and body into [B] and [H].
  final DynamiteSerializer<B, H> serializer;

  @override
  DynamiteResponse<B, H> convert(Object? input) {
    if (input is! Map<String, Object?>) {
      throw ArgumentError('Expected Map<String, Object?>, got ${input.runtimeType} instead');
    }

    final rawHeaders = input['headers'];
    final headers = _deserialize<H>(rawHeaders, serializer.serializers, serializer.headersType);

    final rawBody = input['body'];
    final body = _deserialize<B>(rawBody, serializer.serializers, serializer.bodyType);

    return DynamiteResponse<B, H>(
      input['statusCode']! as int,
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
