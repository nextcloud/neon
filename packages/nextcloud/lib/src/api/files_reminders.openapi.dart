// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'files_reminders.openapi.g.dart';

class FilesRemindersResponse<T, U> extends DynamiteResponse<T, U> {
  FilesRemindersResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'FilesRemindersResponse(data: $data, headers: $headers)';
}

class FilesRemindersApiException extends DynamiteApiException {
  FilesRemindersApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<FilesRemindersApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return FilesRemindersApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'FilesRemindersApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

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
  Future<FilesRemindersApiGetResponse200ApplicationJson> $get({
    required final String version,
    required final int fileId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiGetResponse200ApplicationJson),
      )! as FilesRemindersApiGetResponse200ApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set a reminder
  Future<FilesRemindersApiSetResponse200ApplicationJson> $set({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    queryParameters['dueDate'] = dueDate;
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiSetResponse200ApplicationJson),
      )! as FilesRemindersApiSetResponse200ApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a reminder
  Future<FilesRemindersApiRemoveResponse200ApplicationJson> remove({
    required final String version,
    required final int fileId,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
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
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiRemoveResponse200ApplicationJson),
      )! as FilesRemindersApiRemoveResponse200ApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class FilesRemindersOCSMeta implements Built<FilesRemindersOCSMeta, FilesRemindersOCSMetaBuilder> {
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
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<FilesRemindersOCSMeta> get serializer => _$filesRemindersOCSMetaSerializer;
}

abstract class FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data
    implements
        Built<FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data,
            FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder> {
  factory FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data([
    final void Function(FilesRemindersApiGetResponse200ApplicationJson_Ocs_DataBuilder)? b,
  ]) = _$FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String? get dueDate;
  static Serializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data> get serializer =>
      _$filesRemindersApiGetResponse200ApplicationJsonOcsDataSerializer;
}

abstract class FilesRemindersApiGetResponse200ApplicationJson_Ocs
    implements
        Built<FilesRemindersApiGetResponse200ApplicationJson_Ocs,
            FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder> {
  factory FilesRemindersApiGetResponse200ApplicationJson_Ocs([
    final void Function(FilesRemindersApiGetResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiGetResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiGetResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersOCSMeta get meta;
  FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data get data;
  static Serializer<FilesRemindersApiGetResponse200ApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiGetResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesRemindersApiGetResponse200ApplicationJson
    implements
        Built<FilesRemindersApiGetResponse200ApplicationJson, FilesRemindersApiGetResponse200ApplicationJsonBuilder> {
  factory FilesRemindersApiGetResponse200ApplicationJson([
    final void Function(FilesRemindersApiGetResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiGetResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiGetResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiGetResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersApiGetResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesRemindersApiGetResponse200ApplicationJson> get serializer =>
      _$filesRemindersApiGetResponse200ApplicationJsonSerializer;
}

abstract class FilesRemindersApiSetResponse200ApplicationJson_Ocs
    implements
        Built<FilesRemindersApiSetResponse200ApplicationJson_Ocs,
            FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder> {
  factory FilesRemindersApiSetResponse200ApplicationJson_Ocs([
    final void Function(FilesRemindersApiSetResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiSetResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiSetResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiSetResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesRemindersApiSetResponse200ApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiSetResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesRemindersApiSetResponse200ApplicationJson
    implements
        Built<FilesRemindersApiSetResponse200ApplicationJson, FilesRemindersApiSetResponse200ApplicationJsonBuilder> {
  factory FilesRemindersApiSetResponse200ApplicationJson([
    final void Function(FilesRemindersApiSetResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiSetResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiSetResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiSetResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersApiSetResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesRemindersApiSetResponse200ApplicationJson> get serializer =>
      _$filesRemindersApiSetResponse200ApplicationJsonSerializer;
}

abstract class FilesRemindersApiRemoveResponse200ApplicationJson_Ocs
    implements
        Built<FilesRemindersApiRemoveResponse200ApplicationJson_Ocs,
            FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder> {
  factory FilesRemindersApiRemoveResponse200ApplicationJson_Ocs([
    final void Function(FilesRemindersApiRemoveResponse200ApplicationJson_OcsBuilder)? b,
  ]) = _$FilesRemindersApiRemoveResponse200ApplicationJson_Ocs;

  // coverage:ignore-start
  const FilesRemindersApiRemoveResponse200ApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiRemoveResponse200ApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersOCSMeta get meta;
  JsonObject get data;
  static Serializer<FilesRemindersApiRemoveResponse200ApplicationJson_Ocs> get serializer =>
      _$filesRemindersApiRemoveResponse200ApplicationJsonOcsSerializer;
}

abstract class FilesRemindersApiRemoveResponse200ApplicationJson
    implements
        Built<FilesRemindersApiRemoveResponse200ApplicationJson,
            FilesRemindersApiRemoveResponse200ApplicationJsonBuilder> {
  factory FilesRemindersApiRemoveResponse200ApplicationJson([
    final void Function(FilesRemindersApiRemoveResponse200ApplicationJsonBuilder)? b,
  ]) = _$FilesRemindersApiRemoveResponse200ApplicationJson;

  // coverage:ignore-start
  const FilesRemindersApiRemoveResponse200ApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory FilesRemindersApiRemoveResponse200ApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  FilesRemindersApiRemoveResponse200ApplicationJson_Ocs get ocs;
  static Serializer<FilesRemindersApiRemoveResponse200ApplicationJson> get serializer =>
      _$filesRemindersApiRemoveResponse200ApplicationJsonSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponse200ApplicationJson),
        FilesRemindersApiGetResponse200ApplicationJson.new,
      )
      ..add(FilesRemindersApiGetResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs),
        FilesRemindersApiGetResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiGetResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(FilesRemindersOCSMeta), FilesRemindersOCSMeta.new)
      ..add(FilesRemindersOCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data),
        FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data.new,
      )
      ..add(FilesRemindersApiGetResponse200ApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiSetResponse200ApplicationJson),
        FilesRemindersApiSetResponse200ApplicationJson.new,
      )
      ..add(FilesRemindersApiSetResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiSetResponse200ApplicationJson_Ocs),
        FilesRemindersApiSetResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiSetResponse200ApplicationJson_Ocs.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiRemoveResponse200ApplicationJson),
        FilesRemindersApiRemoveResponse200ApplicationJson.new,
      )
      ..add(FilesRemindersApiRemoveResponse200ApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(FilesRemindersApiRemoveResponse200ApplicationJson_Ocs),
        FilesRemindersApiRemoveResponse200ApplicationJson_Ocs.new,
      )
      ..add(FilesRemindersApiRemoveResponse200ApplicationJson_Ocs.serializer))
    .build();

Serializers get filesRemindersSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesReminders<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesReminders<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
