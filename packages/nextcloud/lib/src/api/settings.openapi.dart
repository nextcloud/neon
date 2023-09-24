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

part 'settings.openapi.g.dart';

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
  SettingsLogSettingsClient(this._rootClient);

  final SettingsClient _rootClient;

  /// download logfile
  ///
  /// This endpoint requires admin access
  Future<DynamiteResponse<Uint8List, SettingsLogSettingsLogSettingsDownloadHeaders>> download() async {
    final rawResponse = downloadRaw();

    return rawResponse.future;
  }

  /// download logfile
  ///
  /// This endpoint requires admin access
  DynamiteRawResponse<Uint8List, SettingsLogSettingsLogSettingsDownloadHeaders> downloadRaw() {
    const path = '/index.php/settings/admin/log/download';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/octet-stream',
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<Uint8List, SettingsLogSettingsLogSettingsDownloadHeaders>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(SettingsLogSettingsLogSettingsDownloadHeaders),
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class SettingsLogSettingsLogSettingsDownloadHeadersInterface {
  @BuiltValueField(wireName: 'content-disposition')
  String? get contentDisposition;
  SettingsLogSettingsLogSettingsDownloadHeadersInterface rebuild(
    final void Function(SettingsLogSettingsLogSettingsDownloadHeadersInterfaceBuilder) updates,
  );
  SettingsLogSettingsLogSettingsDownloadHeadersInterfaceBuilder toBuilder();
}

abstract class SettingsLogSettingsLogSettingsDownloadHeaders
    implements
        SettingsLogSettingsLogSettingsDownloadHeadersInterface,
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

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingsLogSettingsLogSettingsDownloadHeaders> get serializer =>
      _$SettingsLogSettingsLogSettingsDownloadHeadersSerializer();
}

class _$SettingsLogSettingsLogSettingsDownloadHeadersSerializer
    implements StructuredSerializer<SettingsLogSettingsLogSettingsDownloadHeaders> {
  @override
  final Iterable<Type> types = const [
    SettingsLogSettingsLogSettingsDownloadHeaders,
    _$SettingsLogSettingsLogSettingsDownloadHeaders,
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
