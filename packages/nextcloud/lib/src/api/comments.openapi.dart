// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'comments.openapi.g.dart';

class CommentsResponse<T, U> extends DynamiteResponse<T, U> {
  CommentsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'CommentsResponse(data: $data, headers: $headers)';
}

class CommentsApiException extends DynamiteApiException {
  CommentsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<CommentsApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return CommentsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'CommentsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class CommentsClient extends DynamiteClient {
  CommentsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  CommentsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  CommentsNotificationsClient get notifications => CommentsNotificationsClient(this);
}

class CommentsNotificationsClient {
  CommentsNotificationsClient(this._rootClient);

  final CommentsClient _rootClient;

  /// View a notification
  Future<CommentsNotificationsNotificationsViewHeaders> view({required final String id}) async {
    var path = '/index.php/apps/comments/notifications/view/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id));
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 303) {
      return _jsonSerializers.deserialize(
        response.responseHeaders,
        specifiedType: const FullType(CommentsNotificationsNotificationsViewHeaders),
      )! as CommentsNotificationsNotificationsViewHeaders;
    }
    throw await CommentsApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class CommentsNotificationsNotificationsViewHeaders
    implements
        Built<CommentsNotificationsNotificationsViewHeaders, CommentsNotificationsNotificationsViewHeadersBuilder> {
  factory CommentsNotificationsNotificationsViewHeaders([
    final void Function(CommentsNotificationsNotificationsViewHeadersBuilder)? b,
  ]) = _$CommentsNotificationsNotificationsViewHeaders;

  // coverage:ignore-start
  const CommentsNotificationsNotificationsViewHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsNotificationsNotificationsViewHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String? get location;
  @BuiltValueSerializer(custom: true)
  static Serializer<CommentsNotificationsNotificationsViewHeaders> get serializer =>
      _$CommentsNotificationsNotificationsViewHeadersSerializer();
}

class _$CommentsNotificationsNotificationsViewHeadersSerializer
    implements StructuredSerializer<CommentsNotificationsNotificationsViewHeaders> {
  @override
  final Iterable<Type> types = const [
    CommentsNotificationsNotificationsViewHeaders,
    _$CommentsNotificationsNotificationsViewHeaders,
  ];

  @override
  final String wireName = 'CommentsNotificationsNotificationsViewHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final CommentsNotificationsNotificationsViewHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  CommentsNotificationsNotificationsViewHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CommentsNotificationsNotificationsViewHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'location':
          result.location = value;
      }
    }

    return result.build();
  }
}

abstract class CommentsCapabilities_Files
    implements Built<CommentsCapabilities_Files, CommentsCapabilities_FilesBuilder> {
  factory CommentsCapabilities_Files([final void Function(CommentsCapabilities_FilesBuilder)? b]) =
      _$CommentsCapabilities_Files;

  // coverage:ignore-start
  const CommentsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  bool get comments;
  static Serializer<CommentsCapabilities_Files> get serializer => _$commentsCapabilitiesFilesSerializer;
}

abstract class CommentsCapabilities implements Built<CommentsCapabilities, CommentsCapabilitiesBuilder> {
  factory CommentsCapabilities([final void Function(CommentsCapabilitiesBuilder)? b]) = _$CommentsCapabilities;

  // coverage:ignore-start
  const CommentsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory CommentsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  CommentsCapabilities_Files get files;
  static Serializer<CommentsCapabilities> get serializer => _$commentsCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(CommentsNotificationsNotificationsViewHeaders),
        CommentsNotificationsNotificationsViewHeaders.new,
      )
      ..add(CommentsNotificationsNotificationsViewHeaders.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities), CommentsCapabilities.new)
      ..add(CommentsCapabilities.serializer)
      ..addBuilderFactory(const FullType(CommentsCapabilities_Files), CommentsCapabilities_Files.new)
      ..add(CommentsCapabilities_Files.serializer))
    .build();

Serializers get commentsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeComments<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeComments<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
