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

part 'files_trashbin.openapi.g.dart';

class FilesTrashbinResponse<T, U> extends DynamiteResponse<T, U> {
  FilesTrashbinResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesTrashbinResponse(data: $data, headers: $headers)';
}

class FilesTrashbinApiException extends DynamiteApiException {
  FilesTrashbinApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesTrashbinApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesTrashbinApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesTrashbinApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class FilesTrashbinClient extends DynamiteClient {
  FilesTrashbinClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesTrashbinClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesTrashbinPreviewClient get preview => FilesTrashbinPreviewClient(this);
}

class FilesTrashbinPreviewClient {
  FilesTrashbinPreviewClient(this._rootClient);

  final FilesTrashbinClient _rootClient;

  /// Get the preview for a file
  Future<Uint8List> getPreview({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
  }) async {
    const path = '/index.php/apps/files_trashbin/preview';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': '*/*',
    };
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
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    if (fileId != -1) {
      queryParameters['fileId'] = fileId.toString();
    }
    if (x != 32) {
      queryParameters['x'] = x.toString();
    }
    if (y != 32) {
      queryParameters['y'] = y.toString();
    }
    if (a != 0) {
      queryParameters['a'] = a.toString();
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
    throw await FilesTrashbinApiException.fromResponse(response); // coverage:ignore-line
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesTrashbinCapabilities_FilesInterface {
  bool get undelete;
  FilesTrashbinCapabilities_FilesInterface rebuild(
    final void Function(FilesTrashbinCapabilities_FilesInterfaceBuilder) updates,
  );
  FilesTrashbinCapabilities_FilesInterfaceBuilder toBuilder();
}

abstract class FilesTrashbinCapabilities_Files
    implements
        FilesTrashbinCapabilities_FilesInterface,
        Built<FilesTrashbinCapabilities_Files, FilesTrashbinCapabilities_FilesBuilder> {
  factory FilesTrashbinCapabilities_Files([final void Function(FilesTrashbinCapabilities_FilesBuilder)? b]) =
      _$FilesTrashbinCapabilities_Files;

  // coverage:ignore-start
  const FilesTrashbinCapabilities_Files._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities_Files.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities_Files> get serializer => _$filesTrashbinCapabilitiesFilesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesTrashbinCapabilitiesInterface {
  FilesTrashbinCapabilities_Files get files;
  FilesTrashbinCapabilitiesInterface rebuild(final void Function(FilesTrashbinCapabilitiesInterfaceBuilder) updates);
  FilesTrashbinCapabilitiesInterfaceBuilder toBuilder();
}

abstract class FilesTrashbinCapabilities
    implements FilesTrashbinCapabilitiesInterface, Built<FilesTrashbinCapabilities, FilesTrashbinCapabilitiesBuilder> {
  factory FilesTrashbinCapabilities([final void Function(FilesTrashbinCapabilitiesBuilder)? b]) =
      _$FilesTrashbinCapabilities;

  // coverage:ignore-start
  const FilesTrashbinCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesTrashbinCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesTrashbinCapabilities> get serializer => _$filesTrashbinCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities), FilesTrashbinCapabilities.new)
      ..add(FilesTrashbinCapabilities.serializer)
      ..addBuilderFactory(const FullType(FilesTrashbinCapabilities_Files), FilesTrashbinCapabilities_Files.new)
      ..add(FilesTrashbinCapabilities_Files.serializer))
    .build();

Serializers get filesTrashbinSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesTrashbin<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesTrashbin<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
