// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'settings.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  LogSettingsClient get logSettings => LogSettingsClient(this);
}

class LogSettingsClient {
  LogSettingsClient(this._rootClient);

  final Client _rootClient;

  /// download logfile.
  ///
  /// This endpoint requires admin access.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Logfile returned
  ///
  /// See:
  ///  * [downloadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Uint8List, LogSettingsLogSettingsDownloadHeaders>> download() async {
    final rawResponse = downloadRaw();

    return rawResponse.future;
  }

  /// download logfile.
  ///
  /// This endpoint requires admin access.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Logfile returned
  ///
  /// See:
  ///  * [download] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Uint8List, LogSettingsLogSettingsDownloadHeaders> downloadRaw() {
    final _headers = <String, String>{
      'Accept': 'application/octet-stream',
    };

// coverage:ignore-start
    final authentication = _rootClient.authentications.firstWhereOrNull(
      (auth) => switch (auth) {
        DynamiteHttpBearerAuthentication() || DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    const _path = '/index.php/settings/admin/log/download';
    return DynamiteRawResponse<Uint8List, LogSettingsLogSettingsDownloadHeaders>(
      response: _rootClient.executeRequest(
        'get',
        _path,
        _headers,
        null,
        const {200},
      ),
      bodyType: const FullType(Uint8List),
      headersType: const FullType(LogSettingsLogSettingsDownloadHeaders),
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $LogSettingsLogSettingsDownloadHeadersInterface {
  @BuiltValueField(wireName: 'content-disposition')
  String? get contentDisposition;
}

abstract class LogSettingsLogSettingsDownloadHeaders
    implements
        $LogSettingsLogSettingsDownloadHeadersInterface,
        Built<LogSettingsLogSettingsDownloadHeaders, LogSettingsLogSettingsDownloadHeadersBuilder> {
  factory LogSettingsLogSettingsDownloadHeaders([void Function(LogSettingsLogSettingsDownloadHeadersBuilder)? b]) =
      _$LogSettingsLogSettingsDownloadHeaders;

  // coverage:ignore-start
  const LogSettingsLogSettingsDownloadHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory LogSettingsLogSettingsDownloadHeaders.fromJson(Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<LogSettingsLogSettingsDownloadHeaders> get serializer =>
      _$logSettingsLogSettingsDownloadHeadersSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(LogSettingsLogSettingsDownloadHeaders),
        LogSettingsLogSettingsDownloadHeadersBuilder.new,
      )
      ..add(LogSettingsLogSettingsDownloadHeaders.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
