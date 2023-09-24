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

part 'files_trashbin.openapi.g.dart';

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
  Future<DynamiteResponse<Uint8List, void>> getPreview({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
  }) async {
    final rawResponse = getPreviewRaw(
      fileId: fileId,
      x: x,
      y: y,
      a: a,
    );

    return rawResponse.future;
  }

  /// Get the preview for a file
  DynamiteRawResponse<Uint8List, void> getPreviewRaw({
    final int fileId = -1,
    final int x = 32,
    final int y = 32,
    final int a = 0,
  }) {
    const path = '/index.php/apps/files_trashbin/preview';
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
