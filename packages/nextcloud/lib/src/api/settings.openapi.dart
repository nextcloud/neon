// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'settings.openapi.g.dart';

class SettingsResponse<T, U> extends DynamiteResponse<T, U> {
  SettingsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'SettingsResponse(data: $data, headers: $headers)';
}

class SettingsApiException extends DynamiteApiException {
  SettingsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<SettingsApiException> fromResponse(final HttpClientResponse response) async {
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
    } on FormatException {
      body = 'binary';
    }

    return SettingsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'SettingsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class SettingsClient extends DynamiteClient {
  SettingsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  SettingsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  SettingsLogSettingsClient get logSettings => SettingsLogSettingsClient(this);
}

class SettingsLogSettingsClient {
  SettingsLogSettingsClient(this.rootClient);

  final SettingsClient rootClient;

  /// download logfile
  ///
  /// This endpoint requires admin access
  Future<SettingsResponse<Uint8List, SettingsLogSettingsLogSettingsDownloadHeaders>> download() async {
    const path = '/index.php/settings/admin/log/download';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/octet-stream',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers
          .addAll(rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    final response = await rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return SettingsResponse<Uint8List, SettingsLogSettingsLogSettingsDownloadHeaders>(
        await response.bodyBytes,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(SettingsLogSettingsLogSettingsDownloadHeaders),
        )! as SettingsLogSettingsLogSettingsDownloadHeaders,
      );
    }
    throw await SettingsApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class SettingsLogSettingsLogSettingsDownloadHeaders
    implements
        Built<SettingsLogSettingsLogSettingsDownloadHeaders, SettingsLogSettingsLogSettingsDownloadHeadersBuilder> {
  factory SettingsLogSettingsLogSettingsDownloadHeaders([
    final void Function(SettingsLogSettingsLogSettingsDownloadHeadersBuilder)? b,
  ]) = _$SettingsLogSettingsLogSettingsDownloadHeaders;

  // coverage:ignore-start
  const SettingsLogSettingsLogSettingsDownloadHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SettingsLogSettingsLogSettingsDownloadHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'content-disposition')
  String? get contentDisposition;
  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsLogSettingsLogSettingsDownloadHeaders> get serializer =>
      _$SettingsLogSettingsLogSettingsDownloadHeadersSerializer();
}

class _$SettingsLogSettingsLogSettingsDownloadHeadersSerializer
    implements StructuredSerializer<SettingsLogSettingsLogSettingsDownloadHeaders> {
  @override
  final Iterable<Type> types = const [
    SettingsLogSettingsLogSettingsDownloadHeaders,
    _$SettingsLogSettingsLogSettingsDownloadHeaders
  ];

  @override
  final String wireName = 'SettingsLogSettingsLogSettingsDownloadHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SettingsLogSettingsLogSettingsDownloadHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  SettingsLogSettingsLogSettingsDownloadHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsLogSettingsLogSettingsDownloadHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'content-disposition':
          result.contentDisposition = value;
          break;
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(SettingsLogSettingsLogSettingsDownloadHeaders),
        SettingsLogSettingsLogSettingsDownloadHeaders.new,
      )
      ..add(SettingsLogSettingsLogSettingsDownloadHeaders.serializer))
    .build();

Serializers get settingsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeSettings<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeSettings<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
