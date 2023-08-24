// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'notes.openapi.g.dart';

class NotesResponse<T, U> extends DynamiteResponse<T, U> {
  NotesResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'NotesResponse(data: $data, headers: $headers)';
}

class NotesApiException extends DynamiteApiException {
  NotesApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<NotesApiException> fromResponse(final HttpClientResponse response) async {
    final data = await response.bodyBytes;

    String body;
    try {
      body = utf8.decode(data);
    } on FormatException {
      body = 'binary';
    }

    return NotesApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'NotesApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class NotesClient extends DynamiteClient {
  NotesClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  NotesClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  Future<BuiltList<NotesNote>> getNotes({
    final String? category,
    final String exclude = '',
    final int pruneBefore = 0,
    final int chunkSize = 0,
    final String? chunkCursor,
    final String? ifNoneMatch,
  }) async {
    const path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    if (category != null) {
      queryParameters['category'] = category;
    }
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (pruneBefore != 0) {
      queryParameters['pruneBefore'] = pruneBefore.toString();
    }
    if (chunkSize != 0) {
      queryParameters['chunkSize'] = chunkSize.toString();
    }
    if (chunkCursor != null) {
      queryParameters['chunkCursor'] = chunkCursor;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(BuiltList, [FullType(NotesNote)]),
      )! as BuiltList<NotesNote>;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> createNote({
    final String category = '',
    final String title = '',
    final String content = '',
    final int modified = 0,
    final int favorite = 0,
  }) async {
    const path = '/index.php/apps/notes/api/v1/notes';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    if (category != '') {
      queryParameters['category'] = category;
    }
    if (title != '') {
      queryParameters['title'] = title;
    }
    if (content != '') {
      queryParameters['content'] = content;
    }
    if (modified != 0) {
      queryParameters['modified'] = modified.toString();
    }
    if (favorite != 0) {
      queryParameters['favorite'] = favorite.toString();
    }
    final response = await doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NotesNote))!
          as NotesNote;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> getNote({
    required final int id,
    final String exclude = '',
    final String? ifNoneMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NotesNote))!
          as NotesNote;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesNote> updateNote({
    required final int id,
    final String? content,
    final int? modified,
    final String? title,
    final String? category,
    final int favorite = 0,
    final String? ifMatch,
  }) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (content != null) {
      queryParameters['content'] = content;
    }
    if (modified != null) {
      queryParameters['modified'] = modified.toString();
    }
    if (title != null) {
      queryParameters['title'] = title;
    }
    if (category != null) {
      queryParameters['category'] = category;
    }
    if (favorite != 0) {
      queryParameters['favorite'] = favorite.toString();
    }
    if (ifMatch != null) {
      headers['If-Match'] = ifMatch;
    }
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NotesNote))!
          as NotesNote;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<String> deleteNote({required final int id}) async {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final response = await doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> getSettings() async {
    const path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    final response = await doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NotesSettings))!
          as NotesSettings;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }

  Future<NotesSettings> updateSettings({required final NotesSettings settings}) async {
    const path = '/index.php/apps/notes/api/v1/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers);
    } else {
      throw Exception('Missing authentication for basic_auth');
    }
    // coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    body = utf8.encode(json.encode(_jsonSerializers.serialize(settings, specifiedType: const FullType(NotesSettings))))
        as Uint8List;
    final response = await doRequest(
      'put',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null).toString(),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(await response.jsonBody, specifiedType: const FullType(NotesSettings))!
          as NotesSettings;
    }
    throw await NotesApiException.fromResponse(response); // coverage:ignore-line
  }
}

abstract class NotesNote implements Built<NotesNote, NotesNoteBuilder> {
  factory NotesNote([final void Function(NotesNoteBuilder)? b]) = _$NotesNote;

  // coverage:ignore-start
  const NotesNote._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesNote.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  int get id;
  String get etag;
  bool get readonly;
  String get content;
  String get title;
  String get category;
  bool get favorite;
  int get modified;
  bool get error;
  String get errorType;
  static Serializer<NotesNote> get serializer => _$notesNoteSerializer;
}

class NotesSettings_NoteMode extends EnumClass {
  const NotesSettings_NoteMode._(super.name);

  static const NotesSettings_NoteMode edit = _$notesSettingsNoteModeEdit;

  static const NotesSettings_NoteMode preview = _$notesSettingsNoteModePreview;

  static const NotesSettings_NoteMode rich = _$notesSettingsNoteModeRich;

  // coverage:ignore-start
  static BuiltSet<NotesSettings_NoteMode> get values => _$notesSettingsNoteModeValues;
  // coverage:ignore-end
  static NotesSettings_NoteMode valueOf(final String name) => _$valueOfNotesSettings_NoteMode(name);
  static Serializer<NotesSettings_NoteMode> get serializer => _$notesSettingsNoteModeSerializer;
}

abstract class NotesSettings implements Built<NotesSettings, NotesSettingsBuilder> {
  factory NotesSettings([final void Function(NotesSettingsBuilder)? b]) = _$NotesSettings;

  // coverage:ignore-start
  const NotesSettings._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesSettings.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get notesPath;
  String get fileSuffix;
  NotesSettings_NoteMode get noteMode;
  static Serializer<NotesSettings> get serializer => _$notesSettingsSerializer;
}

abstract class NotesCapabilities_Notes implements Built<NotesCapabilities_Notes, NotesCapabilities_NotesBuilder> {
  factory NotesCapabilities_Notes([final void Function(NotesCapabilities_NotesBuilder)? b]) = _$NotesCapabilities_Notes;

  // coverage:ignore-start
  const NotesCapabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  static Serializer<NotesCapabilities_Notes> get serializer => _$notesCapabilitiesNotesSerializer;
}

abstract class NotesCapabilities implements Built<NotesCapabilities, NotesCapabilitiesBuilder> {
  factory NotesCapabilities([final void Function(NotesCapabilitiesBuilder)? b]) = _$NotesCapabilities;

  // coverage:ignore-start
  const NotesCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotesCapabilities_Notes get notes;
  static Serializer<NotesCapabilities> get serializer => _$notesCapabilitiesSerializer;
}

abstract class NotesOCSMeta implements Built<NotesOCSMeta, NotesOCSMetaBuilder> {
  factory NotesOCSMeta([final void Function(NotesOCSMetaBuilder)? b]) = _$NotesOCSMeta;

  // coverage:ignore-start
  const NotesOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesOCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  static Serializer<NotesOCSMeta> get serializer => _$notesOCSMetaSerializer;
}

abstract class NotesEmptyOCS_Ocs implements Built<NotesEmptyOCS_Ocs, NotesEmptyOCS_OcsBuilder> {
  factory NotesEmptyOCS_Ocs([final void Function(NotesEmptyOCS_OcsBuilder)? b]) = _$NotesEmptyOCS_Ocs;

  // coverage:ignore-start
  const NotesEmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesEmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotesOCSMeta get meta;
  BuiltList<JsonObject> get data;
  static Serializer<NotesEmptyOCS_Ocs> get serializer => _$notesEmptyOCSOcsSerializer;
}

abstract class NotesEmptyOCS implements Built<NotesEmptyOCS, NotesEmptyOCSBuilder> {
  factory NotesEmptyOCS([final void Function(NotesEmptyOCSBuilder)? b]) = _$NotesEmptyOCS;

  // coverage:ignore-start
  const NotesEmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotesEmptyOCS.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  NotesEmptyOCS_Ocs get ocs;
  static Serializer<NotesEmptyOCS> get serializer => _$notesEmptyOCSSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(NotesNote), NotesNote.new)
      ..add(NotesNote.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NotesNote)]), ListBuilder<NotesNote>.new)
      ..addBuilderFactory(const FullType(NotesSettings), NotesSettings.new)
      ..add(NotesSettings.serializer)
      ..add(NotesSettings_NoteMode.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities), NotesCapabilities.new)
      ..add(NotesCapabilities.serializer)
      ..addBuilderFactory(const FullType(NotesCapabilities_Notes), NotesCapabilities_Notes.new)
      ..add(NotesCapabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(NotesOCSMeta), NotesOCSMeta.new)
      ..add(NotesOCSMeta.serializer)
      ..addBuilderFactory(const FullType(NotesEmptyOCS), NotesEmptyOCS.new)
      ..add(NotesEmptyOCS.serializer)
      ..addBuilderFactory(const FullType(NotesEmptyOCS_Ocs), NotesEmptyOCS_Ocs.new)
      ..add(NotesEmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

Serializers get notesSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeNotes<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNotes<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
