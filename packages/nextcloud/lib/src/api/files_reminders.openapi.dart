// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files_reminders.openapi.g.dart';

class FilesRemindersClient extends DynamiteClient {
  FilesRemindersClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  FilesRemindersClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  FilesRemindersApiClient get api => FilesRemindersApiClient(this);
}

class FilesRemindersApiClient {
  FilesRemindersApiClient(this._rootClient);

  final FilesRemindersClient _rootClient;

  /// Get a reminder
  Future<DynamiteResponse<FilesRemindersApiGetResponseApplicationJson, void>> $get({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = $getRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Get a reminder
  DynamiteRawResponse<FilesRemindersApiGetResponseApplicationJson, void> $getRaw({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
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
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesRemindersApiGetResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(FilesRemindersApiGetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Set a reminder
  Future<DynamiteResponse<FilesRemindersApiSetResponseApplicationJson, void>> $set({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = $setRaw(
      dueDate: dueDate,
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Set a reminder
  DynamiteRawResponse<FilesRemindersApiSetResponseApplicationJson, void> $setRaw({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
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
    queryParameters['dueDate'] = dueDate;
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesRemindersApiSetResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'put',
        uri,
        headers,
        body,
        const {200, 201, 400, 401, 404},
      ),
      bodyType: const FullType(FilesRemindersApiSetResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Remove a reminder
  Future<DynamiteResponse<FilesRemindersApiRemoveResponseApplicationJson, void>> remove({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
    final rawResponse = removeRaw(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );

    return rawResponse.future;
  }

  /// Remove a reminder
  DynamiteRawResponse<FilesRemindersApiRemoveResponseApplicationJson, void> removeRaw({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
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
    checkPattern(version, RegExp(r'^1$'), 'version'); // coverage:ignore-line
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<FilesRemindersApiRemoveResponseApplicationJson, void>(
      response: _rootClient.doRequest(
        'delete',
        uri,
        headers,
        body,
        const {200, 401, 404},
      ),
      bodyType: const FullType(FilesRemindersApiRemoveResponseApplicationJson),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  FilesRemindersOCSMetaInterface rebuild(final void Function(FilesRemindersOCSMetaInterfaceBuilder) updates);
  FilesRemindersOCSMetaInterfaceBuilder toBuilder();
}

abstract class FilesRemindersOCSMeta
    implements FilesRemindersOCSMetaInterface, Built<FilesRemindersOCSMeta, FilesRemindersOCSMetaBuilder> {
  factory FilesRemindersOCSMeta([final void Function(FilesRemindersOCSMetaBuilder)? b]) = _$FilesRemindersOCSMeta;

  // coverage:ignore-start
  const FilesRemindersOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersOCSMeta> get serializer => _$filesRemindersOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterface {
  String? get dueDate;
  FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterface rebuild(
    final void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder) updates,
  );
  FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiGetResponseApplicationJson_Ocs_Data
    implements
        FilesRemindersApiGetResponseApplicationJson_Ocs_DataInterface,
        Built<FilesRemindersApiGetResponseApplicationJson_Ocs_Data,
            FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder> {
  factory FilesRemindersApiGetResponseApplicationJson_Ocs_Data([
    final void Function(FilesRemindersApiGetResponseApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesRemindersApiGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesRemindersApiGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponseApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$filesRemindersApiGetResponseApplicationJsonOcsDataSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiGetResponseApplicationJson_OcsInterface {
  FilesRemindersOCSMeta get meta;
  FilesRemindersApiGetResponseApplicationJson_Ocs_Data get data;
  FilesRemindersApiGetResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesRemindersApiGetResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesRemindersApiGetResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiGetResponseApplicationJson_Ocs
    implements
        FilesRemindersApiGetResponseApplicationJson_OcsInterface,
        Built<FilesRemindersApiGetResponseApplicationJson_Ocs, FilesRemindersApiGetResponseApplicationJson_OcsBuilder> {
  factory FilesRemindersApiGetResponseApplicationJson_Ocs([
    final void Function(FilesRemindersApiGetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiGetResponseApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiGetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiGetResponseApplicationJsonInterface {
  FilesRemindersApiGetResponseApplicationJson_Ocs get ocs;
  FilesRemindersApiGetResponseApplicationJsonInterface rebuild(
    final void Function(FilesRemindersApiGetResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesRemindersApiGetResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiGetResponseApplicationJson
    implements
        FilesRemindersApiGetResponseApplicationJsonInterface,
        Built<FilesRemindersApiGetResponseApplicationJson, FilesRemindersApiGetResponseApplicationJsonBuilder> {
  factory FilesRemindersApiGetResponseApplicationJson([
    final void Function(FilesRemindersApiGetResponseApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiGetResponseApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiGetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiGetResponseApplicationJson> get serializer =>
      _$filesRemindersApiGetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiSetResponseApplicationJson_OcsInterface {
  FilesRemindersOCSMeta get meta;
  JsonObject get data;
  FilesRemindersApiSetResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesRemindersApiSetResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesRemindersApiSetResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiSetResponseApplicationJson_Ocs
    implements
        FilesRemindersApiSetResponseApplicationJson_OcsInterface,
        Built<FilesRemindersApiSetResponseApplicationJson_Ocs, FilesRemindersApiSetResponseApplicationJson_OcsBuilder> {
  factory FilesRemindersApiSetResponseApplicationJson_Ocs([
    final void Function(FilesRemindersApiSetResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiSetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiSetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiSetResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiSetResponseApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiSetResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiSetResponseApplicationJsonInterface {
  FilesRemindersApiSetResponseApplicationJson_Ocs get ocs;
  FilesRemindersApiSetResponseApplicationJsonInterface rebuild(
    final void Function(FilesRemindersApiSetResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesRemindersApiSetResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiSetResponseApplicationJson
    implements
        FilesRemindersApiSetResponseApplicationJsonInterface,
        Built<FilesRemindersApiSetResponseApplicationJson, FilesRemindersApiSetResponseApplicationJsonBuilder> {
  factory FilesRemindersApiSetResponseApplicationJson([
    final void Function(FilesRemindersApiSetResponseApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiSetResponseApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiSetResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiSetResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiSetResponseApplicationJson> get serializer =>
      _$filesRemindersApiSetResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiRemoveResponseApplicationJson_OcsInterface {
  FilesRemindersOCSMeta get meta;
  JsonObject get data;
  FilesRemindersApiRemoveResponseApplicationJson_OcsInterface rebuild(
    final void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  FilesRemindersApiRemoveResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiRemoveResponseApplicationJson_Ocs
    implements
        FilesRemindersApiRemoveResponseApplicationJson_OcsInterface,
        Built<FilesRemindersApiRemoveResponseApplicationJson_Ocs,
            FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder> {
  factory FilesRemindersApiRemoveResponseApplicationJson_Ocs([
    final void Function(FilesRemindersApiRemoveResponseApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiRemoveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiRemoveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiRemoveResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiRemoveResponseApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiRemoveResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class FilesRemindersApiRemoveResponseApplicationJsonInterface {
  FilesRemindersApiRemoveResponseApplicationJson_Ocs get ocs;
  FilesRemindersApiRemoveResponseApplicationJsonInterface rebuild(
    final void Function(FilesRemindersApiRemoveResponseApplicationJsonInterfaceBuilder) updates,
  );
  FilesRemindersApiRemoveResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class FilesRemindersApiRemoveResponseApplicationJson
    implements
        FilesRemindersApiRemoveResponseApplicationJsonInterface,
        Built<FilesRemindersApiRemoveResponseApplicationJson, FilesRemindersApiRemoveResponseApplicationJsonBuilder> {
  factory FilesRemindersApiRemoveResponseApplicationJson([
    final void Function(FilesRemindersApiRemoveResponseApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiRemoveResponseApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiRemoveResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiRemoveResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<FilesRemindersApiRemoveResponseApplicationJson> get serializer =>
      _$filesRemindersApiRemoveResponseApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponseApplicationJson),
        FilesRemindersApiGetResponseApplicationJson.new,
      )
      ..add(FilesRemindersApiGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs),
        FilesRemindersApiGetResponseApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesRemindersOCSMeta), FilesRemindersOCSMeta.new)
      ..add(FilesRemindersOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponseApplicationJson_Ocs_Data),
        FilesRemindersApiGetResponseApplicationJson_Ocs_Data.new,
      )
      ..add(FilesRemindersApiGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiSetResponseApplicationJson),
        FilesRemindersApiSetResponseApplicationJson.new,
      )
      ..add(FilesRemindersApiSetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiSetResponseApplicationJson_Ocs),
        FilesRemindersApiSetResponseApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiSetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiRemoveResponseApplicationJson),
        FilesRemindersApiRemoveResponseApplicationJson.new,
      )
      ..add(FilesRemindersApiRemoveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiRemoveResponseApplicationJson_Ocs),
        FilesRemindersApiRemoveResponseApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiRemoveResponseApplicationJson_Ocs.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
