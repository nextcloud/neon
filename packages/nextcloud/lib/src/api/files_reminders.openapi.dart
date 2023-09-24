// ignore_for_file: camel_case_types
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
  Future<FilesRemindersApiGetResponseApplicationJson> $get({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
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
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiGetResponseApplicationJson),
      )! as FilesRemindersApiGetResponseApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Set a reminder
  Future<FilesRemindersApiSetResponseApplicationJson> $set({
    required final String dueDate,
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
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
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 404) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiSetResponseApplicationJson),
      )! as FilesRemindersApiSetResponseApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a reminder
  Future<FilesRemindersApiRemoveResponseApplicationJson> remove({
    required final String version,
    required final int fileId,
    final bool oCSAPIRequest = true,
  }) async {
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
    if (!RegExp(r'^1$').hasMatch(version)) {
      throw Exception(
        'Invalid value "$version" for parameter "version" with pattern "${r'^1$'}"',
      ); // coverage:ignore-line
    }
    path = path.replaceAll('{version}', Uri.encodeQueryComponent(version));
    path = path.replaceAll('{fileId}', Uri.encodeQueryComponent(fileId.toString()));
    headers['OCS-APIRequest'] = oCSAPIRequest.toString();
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200 || response.statusCode == 401 || response.statusCode == 404) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(FilesRemindersApiRemoveResponseApplicationJson),
      )! as FilesRemindersApiRemoveResponseApplicationJson;
    }
    throw await FilesRemindersApiException.fromResponse(response); // coverage:ignore-line
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

Serializers get filesRemindersSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeFilesReminders<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeFilesReminders<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
