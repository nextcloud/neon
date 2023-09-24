// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files_versions.openapi.g.dart';

class FilesVersionsResponse<T, U> extends DynamiteResponse<T, U> {
  FilesVersionsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesVersionsResponse(data: $data, headers: $headers)';
}

class FilesVersionsApiException extends DynamiteApiException {
  FilesVersionsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesVersionsApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesVersionsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesVersionsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class FilesVersionsClient extends DynamiteClient {
  FilesVersionsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesVersionsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesVersionsPreviewClient get preview => FilesVersionsPreviewClient(this);
}

class FilesVersionsPreviewClient {
  FilesVersionsPreviewClient(this._rootClient);

  final FilesVersionsClient _rootClient;

  /// Get the preview for a file version
  Future<Uint8List> getPreview({
    final String file = '',
    final int x = 44,
    final int y = 44,
    final String version = '',
  }) async {
    const path = '/index.php/apps/files_versions/preview';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    if (file != '') {
      queryParameters['file'] = file;
    }
    if (x != 44) {
      queryParameters['x'] = x.toString();
    }
    if (y != 44) {
      queryParameters['y'] = y.toString();
    }
    if (version != '') {
      queryParameters['version'] = version;
    }
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw await FilesVersionsApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesVersionsCapabilities_FilesInterface {
  bool get versioning;
  @BuiltValueField(wireName: 'version_labeling')
  bool get versionLabeling;
  @BuiltValueField(wireName: 'version_deletion')
  bool get versionDeletion;
  FilesVersionsCapabilities_FilesInterface rebuild(
    final void Function(FilesVersionsCapabilities_FilesInterfaceBuilder) updates,
  );
  FilesVersionsCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class FilesVersionsCapabilities_Files
    implements
        FilesVersionsCapabilities_FilesInterface,
        Built<FilesVersionsCapabilities_Files, FilesVersionsCapabilities_FilesBuilder> {
  factory FilesVersionsCapabilities_Files([final void Function(FilesVersionsCapabilities_FilesBuilder)? b]) =
      _$FilesVersionsCapabilities_Files;

  // coverage:ignore-start
  const FilesVersionsCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities_Files> get serializer => _$filesVersionsCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesVersionsCapabilitiesInterface {
  FilesVersionsCapabilities_Files get files;
  FilesVersionsCapabilitiesInterface rebuild(final void Function(FilesVersionsCapabilitiesInterfaceBuilder) updates);
  FilesVersionsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class FilesVersionsCapabilities
    implements FilesVersionsCapabilitiesInterface, Built<FilesVersionsCapabilities, FilesVersionsCapabilitiesBuilder> {
  factory FilesVersionsCapabilities([final void Function(FilesVersionsCapabilitiesBuilder)? b]) =
      _$FilesVersionsCapabilities;

  // coverage:ignore-start
  const FilesVersionsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesVersionsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesVersionsCapabilities> get serializer => _$filesVersionsCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities), FilesVersionsCapabilities.new)
      ..add(FilesVersionsCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesVersionsCapabilities_Files), FilesVersionsCapabilities_Files.new)
      ..add(FilesVersionsCapabilities_Files.serializer))
    .build();

Serializers get filesVersionsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesVersions<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesVersions<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
