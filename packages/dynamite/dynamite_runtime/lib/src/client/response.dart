import 'dart:async';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/src/http_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Response returned by operations of a `DynamiteClient`.
@immutable
class DynamiteResponse<B, H> {
  /// Creates a new dynamite response.
  const DynamiteResponse(
    this.statusCode,
    this._body,
    this._headers,
  );

  /// The status code of the response.
  final int statusCode;

  final B? _body;

  final H? _headers;

  /// The decoded body of the response.
  B get body => _body!;

  /// The decoded headers of the response.
  H get headers => _headers!;

  @override
  String toString() => 'DynamiteResponse(data: $body, headers: $headers, statusCode: $statusCode)';
}

/// Raw response returned by operations of a `DynamiteClient`.
///
/// This type itself is serializable.
///
/// The api of this type might change without a major bump.
/// Use methods that return a [DynamiteResponse] instead.
@experimental
class DynamiteRawResponse<B, H> {
  /// Creates a new raw dynamite response.
  ///
  /// The [response] will be awaited and deserialized.
  /// After [future] completes the deserialized response can be accessed
  /// through [response].
  DynamiteRawResponse({
    required Future<http.StreamedResponse> response,
    required this.bodyType,
    required this.headersType,
    required this.serializers,
  }) {
    final completer = Completer<DynamiteResponse<B, H>>();
    future = completer.future;

    // ignore: discarded_futures
    response.then(
      (response) async {
        _rawHeaders = response.headers;
        final headers = deserializeHeaders<H>(_rawHeaders, serializers, headersType);

        _rawBody = switch (bodyType) {
          const FullType(Uint8List) => await response.stream.bytes,
          const FullType(String) => await response.stream.string,
          _ => await response.stream.json,
        };
        final body = deserializeBody<B>(_rawBody, serializers, bodyType);

        _response = DynamiteResponse<B, H>(
          response.statusCode,
          body,
          headers,
        );

        completer.complete(_response);
      },
      onError: completer.completeError,
    );
  }

  /// Decodes a raw dynamite response from json data.
  ///
  /// The [future] must not be awaited and the  deserialized response can be
  /// accessed immediately through [response].
  factory DynamiteRawResponse.fromJson(
    Map<String, Object?> json, {
    required Serializers serializers,
    FullType? bodyType,
    FullType? headersType,
  }) {
    final statusCode = json['statusCode']! as int;
    final body = deserializeBody<B>(json['body'], serializers, bodyType);
    final headers = deserializeHeaders<H>(json['headers'], serializers, headersType);

    final response = DynamiteResponse<B, H>(
      statusCode,
      body,
      headers,
    );

    return DynamiteRawResponse._fromJson(
      response,
      bodyType: bodyType,
      headersType: headersType,
      serializers: serializers,
    );
  }

  DynamiteRawResponse._fromJson(
    this._response, {
    required this.bodyType,
    required this.headersType,
    required this.serializers,
  }) : future = Future.value(_response);

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

  /// Future of the deserialized response.
  ///
  /// After this future completes the response can be accessed synchronously
  /// through [response].
  late final Future<DynamiteResponse<B, H>> future;

  /// Caches the serialized response body for later serialization in [toJson].
  ///
  /// Responses revived with [DynamiteRawResponse.fromJson] are not cached as
  /// they are not expected to be serialized again.
  Object? _rawBody;

  Map<String, Object?>? _rawHeaders;

  /// Caches the serialized response headers for later serialization in [toJson].
  ///
  /// Responses revived with [DynamiteRawResponse.fromJson] are not cached as
  /// they are not expected to be serialized again.
  Map<String, Object?>? get rawHeaders => _rawHeaders;

  DynamiteResponse<B, H>? _response;

  /// Returns the deserialized response synchronously.
  ///
  /// Throws a `StateError` if [future] has not completed yet and `this` has
  /// not been instantiated through [DynamiteRawResponse.fromJson].
  DynamiteResponse<B, H> get response {
    final response = _response;

    if (response == null) {
      throw StateError('The response did not finish yet. Make sure to await `this.future`.');
    }

    return response;
  }

  /// Deserializes the body.
  ///
  /// Most efficient if the [serialized] value is already the correct type.
  /// The [bodyType] should represent the return type [B].
  static B? deserializeBody<B>(Object? serialized, Serializers serializers, FullType? bodyType) {
    // If we use the more efficient helpers from BytesStreamExtension the serialized value can already be correct.
    if (serialized is B) {
      return serialized;
    }

    if (bodyType != null) {
      return serializers.deserialize(serialized, specifiedType: bodyType) as B?;
    }

    return null;
  }

  /// Serializes the body.
  Object? serializeBody(B? object) {
    if (bodyType != null && object != null) {
      return serializers.serialize(object, specifiedType: bodyType!);
    }

    return null;
  }

  /// Deserializes the headers.
  ///
  /// Most efficient if the [serialized] value is already the correct type.
  /// The [headersType] should represent the return type [H].
  static H? deserializeHeaders<H>(
    Object? serialized,
    Serializers serializers,
    FullType? headersType,
  ) {
    // If we use the more efficient helpers from BytesStreamExtension the serialized value can already be correct.
    if (serialized is H) {
      return serialized;
    }

    if (headersType != null) {
      return serializers.deserialize(serialized, specifiedType: headersType) as H?;
    }

    return null;
  }

  /// Serializes the headers.
  Object? serializeHeaders(H? object) {
    if (headersType != null && object != null) {
      return serializers.serialize(object, specifiedType: headersType!);
    }

    return null;
  }

  /// Serializes this response into json.
  ///
  /// To revive it again use [DynamiteRawResponse.fromJson] with the same
  /// serializer and `FullType`s as this.
  Map<String, Object?> toJson() => {
        'statusCode': response.statusCode,
        'body': _rawBody ?? serializeBody(response._body),
        'headers': _rawHeaders ?? serializeHeaders(response._headers),
      };

  @override
  String toString() => 'DynamiteResponse(${toJson()})';
}
