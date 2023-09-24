// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files_versions.openapi.g.dart';

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
  Future<DynamiteResponse<Uint8List, void>> getPreview({
    final String file = '',
    final int x = 44,
    final int y = 44,
    final String version = '',
  }) async {
    final rawResponse = getPreviewRaw(
      file: file,
      x: x,
      y: y,
      version: version,
    );

    return rawResponse.future;
  }

  /// Get the preview for a file version
  DynamiteRawResponse<Uint8List, void> getPreviewRaw({
    final String file = '',
    final int x = 44,
    final int y = 44,
    final String version = '',
  }) {
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: null,
      serializers: _jsonSerializers,
    );
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
