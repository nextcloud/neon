// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'files_reminders.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  ApiClient get api => ApiClient(this);
}

class ApiClient {
  ApiClient(this._rootClient);

  final Client _rootClient;

  /// Get a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$getRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiGetResponseApplicationJson, void>> $get({
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) async {
    final rawResponse = $getRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$get] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiGetResponseApplicationJson, void> $getRaw({
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    dynamite_utils.checkPattern(version, RegExp(r'^1$'), 'version');
    final $version = jsonSerializers.serialize(version, specifiedType: const FullType(String));
    parameters['version'] = $version;

    final $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    parameters['fileId'] = $fileId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(parameters));
    return DynamiteRawResponse<ApiGetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ApiGetResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Set a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$setRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiSetResponseApplicationJson, void>> $set({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) async {
    final rawResponse = $setRaw(
      dueDate: dueDate,
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$set] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiSetResponseApplicationJson, void> $setRaw({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    final $dueDate = jsonSerializers.serialize(dueDate, specifiedType: const FullType(String));
    parameters['dueDate'] = $dueDate;

    dynamite_utils.checkPattern(version, RegExp(r'^1$'), 'version');
    final $version = jsonSerializers.serialize(version, specifiedType: const FullType(String));
    parameters['version'] = $version;

    final $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    parameters['fileId'] = $fileId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final uri = Uri.parse(
      UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}{?dueDate*}').expand(parameters),
    );
    return DynamiteRawResponse<ApiSetResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200, 201, 400, 401, 404},
      ),
      bodyType: const FullType(ApiSetResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }

  /// Remove a reminder.
  ///
  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [removeRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ApiRemoveResponseApplicationJson, void>> remove({
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) async {
    final rawResponse = removeRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a reminder.
  ///
  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [remove] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ApiRemoveResponseApplicationJson, void> removeRaw({
    required final String version,
    required final int fileId,
    final bool? oCSAPIRequest,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    dynamite_utils.checkPattern(version, RegExp(r'^1$'), 'version');
    final $version = jsonSerializers.serialize(version, specifiedType: const FullType(String));
    parameters['version'] = $version;

    final $fileId = jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    parameters['fileId'] = $fileId;

    var $oCSAPIRequest = jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    headers['OCS-APIRequest'] = $oCSAPIRequest.toString();

    final uri = Uri.parse(UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(parameters));
    return DynamiteRawResponse<ApiRemoveResponseApplicationJson, void>(
      response: _rootClient.executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 401, 404},
      ),
      bodyType: const FullType(ApiRemoveResponseApplicationJson),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJson_Ocs_DataInterface {
  String? get dueDate;
}

abstract class ApiGetResponseApplicationJson_Ocs_Data
    implements
        $ApiGetResponseApplicationJson_Ocs_DataInterface,
        Built<ApiGetResponseApplicationJson_Ocs_Data, ApiGetResponseApplicationJson_Ocs_DataBuilder> {
  factory ApiGetResponseApplicationJson_Ocs_Data([
    final void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$ApiGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$apiGetResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ApiGetResponseApplicationJson_Ocs_Data get data;
}

abstract class ApiGetResponseApplicationJson_Ocs
    implements
        $ApiGetResponseApplicationJson_OcsInterface,
        Built<ApiGetResponseApplicationJson_Ocs, ApiGetResponseApplicationJson_OcsBuilder> {
  factory ApiGetResponseApplicationJson_Ocs([final void Function(ApiGetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGetResponseApplicationJson_Ocs> get serializer => _$apiGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJsonInterface {
  ApiGetResponseApplicationJson_Ocs get ocs;
}

abstract class ApiGetResponseApplicationJson
    implements
        $ApiGetResponseApplicationJsonInterface,
        Built<ApiGetResponseApplicationJson, ApiGetResponseApplicationJsonBuilder> {
  factory ApiGetResponseApplicationJson([final void Function(ApiGetResponseApplicationJsonBuilder)? b]) =
      _$ApiGetResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiGetResponseApplicationJson> get serializer => _$apiGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiSetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiSetResponseApplicationJson_Ocs
    implements
        $ApiSetResponseApplicationJson_OcsInterface,
        Built<ApiSetResponseApplicationJson_Ocs, ApiSetResponseApplicationJson_OcsBuilder> {
  factory ApiSetResponseApplicationJson_Ocs([final void Function(ApiSetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiSetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiSetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiSetResponseApplicationJson_Ocs> get serializer => _$apiSetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiSetResponseApplicationJsonInterface {
  ApiSetResponseApplicationJson_Ocs get ocs;
}

abstract class ApiSetResponseApplicationJson
    implements
        $ApiSetResponseApplicationJsonInterface,
        Built<ApiSetResponseApplicationJson, ApiSetResponseApplicationJsonBuilder> {
  factory ApiSetResponseApplicationJson([final void Function(ApiSetResponseApplicationJsonBuilder)? b]) =
      _$ApiSetResponseApplicationJson;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiSetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiSetResponseApplicationJson> get serializer => _$apiSetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiRemoveResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
}

abstract class ApiRemoveResponseApplicationJson_Ocs
    implements
        $ApiRemoveResponseApplicationJson_OcsInterface,
        Built<ApiRemoveResponseApplicationJson_Ocs, ApiRemoveResponseApplicationJson_OcsBuilder> {
  factory ApiRemoveResponseApplicationJson_Ocs([final void Function(ApiRemoveResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiRemoveResponseApplicationJson_Ocs> get serializer =>
      _$apiRemoveResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $ApiRemoveResponseApplicationJsonInterface {
  ApiRemoveResponseApplicationJson_Ocs get ocs;
}

abstract class ApiRemoveResponseApplicationJson
    implements
        $ApiRemoveResponseApplicationJsonInterface,
        Built<ApiRemoveResponseApplicationJson, ApiRemoveResponseApplicationJsonBuilder> {
  factory ApiRemoveResponseApplicationJson([final void Function(ApiRemoveResponseApplicationJsonBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<ApiRemoveResponseApplicationJson> get serializer => _$apiRemoveResponseApplicationJsonSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(ApiGetResponseApplicationJson), ApiGetResponseApplicationJsonBuilder.new)
      ..add(ApiGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetResponseApplicationJson_Ocs),
        ApiGetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetResponseApplicationJson_Ocs_Data),
        ApiGetResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ApiGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ApiSetResponseApplicationJson), ApiSetResponseApplicationJsonBuilder.new)
      ..add(ApiSetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiSetResponseApplicationJson_Ocs),
        ApiSetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiSetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ApiRemoveResponseApplicationJson), ApiRemoveResponseApplicationJsonBuilder.new)
      ..add(ApiRemoveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiRemoveResponseApplicationJson_Ocs),
        ApiRemoveResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiRemoveResponseApplicationJson_Ocs.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
