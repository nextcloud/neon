// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

part 'notes.openapi.g.dart';

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

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category]
  ///   * [exclude] Defaults to `''`.
  ///   * [pruneBefore] Defaults to `0`.
  ///   * [chunkSize] Defaults to `0`.
  ///   * [chunkCursor]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNotesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BuiltList<Note>, void>> getNotes({
    final String? category,
    final String exclude = '',
    final int pruneBefore = 0,
    final int chunkSize = 0,
    final String? chunkCursor,
    final String? ifNoneMatch,
  }) async {
    final rawResponse = getNotesRaw(
      category: category,
      exclude: exclude,
      pruneBefore: pruneBefore,
      chunkSize: chunkSize,
      chunkCursor: chunkCursor,
      ifNoneMatch: ifNoneMatch,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category]
  ///   * [exclude] Defaults to `''`.
  ///   * [pruneBefore] Defaults to `0`.
  ///   * [chunkSize] Defaults to `0`.
  ///   * [chunkCursor]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNotes] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BuiltList<Note>, void> getNotesRaw({
    final String? category,
    final String exclude = '',
    final int pruneBefore = 0,
    final int chunkSize = 0,
    final String? chunkCursor,
    final String? ifNoneMatch,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
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
    const path = '/index.php/apps/notes/api/v1/notes';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<BuiltList<Note>, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(BuiltList, [FullType(Note)]),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category] Defaults to `''`.
  ///   * [title] Defaults to `''`.
  ///   * [content] Defaults to `''`.
  ///   * [modified] Defaults to `0`.
  ///   * [favorite] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Note, void>> createNote({
    final String category = '',
    final String title = '',
    final String content = '',
    final int modified = 0,
    final int favorite = 0,
  }) async {
    final rawResponse = createNoteRaw(
      category: category,
      title: title,
      content: content,
      modified: modified,
      favorite: favorite,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category] Defaults to `''`.
  ///   * [title] Defaults to `''`.
  ///   * [content] Defaults to `''`.
  ///   * [modified] Defaults to `0`.
  ///   * [favorite] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Note, void> createNoteRaw({
    final String category = '',
    final String title = '',
    final String content = '',
    final int modified = 0,
    final int favorite = 0,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
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
    const path = '/index.php/apps/notes/api/v1/notes';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [exclude] Defaults to `''`.
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Note, void>> getNote({
    required final int id,
    final String exclude = '',
    final String? ifNoneMatch,
  }) async {
    final rawResponse = getNoteRaw(
      id: id,
      exclude: exclude,
      ifNoneMatch: ifNoneMatch,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [exclude] Defaults to `''`.
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Note, void> getNoteRaw({
    required final int id,
    final String exclude = '',
    final String? ifNoneMatch,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final id0 = Uri.encodeQueryComponent(id.toString());
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final path = '/index.php/apps/notes/api/v1/notes/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [content]
  ///   * [modified]
  ///   * [title]
  ///   * [category]
  ///   * [favorite]
  ///   * [ifMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [updateNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Note, void>> updateNote({
    required final int id,
    final String? content,
    final int? modified,
    final String? title,
    final String? category,
    final int? favorite,
    final String? ifMatch,
  }) async {
    final rawResponse = updateNoteRaw(
      id: id,
      content: content,
      modified: modified,
      title: title,
      category: category,
      favorite: favorite,
      ifMatch: ifMatch,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [content]
  ///   * [modified]
  ///   * [title]
  ///   * [category]
  ///   * [favorite]
  ///   * [ifMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [updateNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Note, void> updateNoteRaw({
    required final int id,
    final String? content,
    final int? modified,
    final String? title,
    final String? category,
    final int? favorite,
    final String? ifMatch,
  }) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final id0 = Uri.encodeQueryComponent(id.toString());
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
    if (favorite != null) {
      queryParameters['favorite'] = favorite.toString();
    }
    if (ifMatch != null) {
      headers['If-Match'] = ifMatch;
    }
    final path = '/index.php/apps/notes/api/v1/notes/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<String, void>> deleteNote({required final int id}) async {
    final rawResponse = deleteNoteRaw(
      id: id,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<String, void> deleteNoteRaw({required final int id}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    final id0 = Uri.encodeQueryComponent(id.toString());
    final path = '/index.php/apps/notes/api/v1/notes/$id0';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSettingsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Settings, void>> getSettings() async {
    final rawResponse = getSettingsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSettings] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Settings, void> getSettingsRaw() {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    const path = '/index.php/apps/notes/api/v1/settings';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Settings, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Settings),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [updateSettingsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<Settings, void>> updateSettings({required final Settings settings}) async {
    final rawResponse = updateSettingsRaw(
      settings: settings,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [updateSettings] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<Settings, void> updateSettingsRaw({required final Settings settings}) {
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    headers['Content-Type'] = 'application/json';
    body = utf8.encode(json.encode(_jsonSerializers.serialize(settings, specifiedType: const FullType(Settings))));
    const path = '/index.php/apps/notes/api/v1/settings';
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);

    return DynamiteRawResponse<Settings, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Settings),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class NoteInterface {
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
}

abstract class Note implements NoteInterface, Built<Note, NoteBuilder> {
  factory Note([final void Function(NoteBuilder)? b]) = _$Note;

  // coverage:ignore-start
  const Note._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Note.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Note> get serializer => const _$NoteSerializer();
}

class _$NoteSerializer implements StructuredSerializer<Note> {
  const _$NoteSerializer();

  @override
  Iterable<Type> get types => const [Note, _$Note];

  @override
  String get wireName => 'Note';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Note object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'etag',
      serializers.serialize(object.etag, specifiedType: const FullType(String)),
      'readonly',
      serializers.serialize(object.readonly, specifiedType: const FullType(bool)),
      'content',
      serializers.serialize(object.content, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'category',
      serializers.serialize(object.category, specifiedType: const FullType(String)),
      'favorite',
      serializers.serialize(object.favorite, specifiedType: const FullType(bool)),
      'modified',
      serializers.serialize(object.modified, specifiedType: const FullType(int)),
      'error',
      serializers.serialize(object.error, specifiedType: const FullType(bool)),
      'errorType',
      serializers.serialize(object.errorType, specifiedType: const FullType(String)),
    ];
    return result;
  }

  @override
  Note deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'etag':
          result.etag = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'readonly':
          result.readonly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'content':
          result.content = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'category':
          result.category = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'favorite':
          result.favorite = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'modified':
          result.modified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'error':
          result.error = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'errorType':
          result.errorType = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

class Settings_NoteMode extends EnumClass {
  const Settings_NoteMode._(super.name);

  static const Settings_NoteMode edit = _$settingsNoteModeEdit;

  static const Settings_NoteMode preview = _$settingsNoteModePreview;

  static const Settings_NoteMode rich = _$settingsNoteModeRich;

  // coverage:ignore-start
  static BuiltSet<Settings_NoteMode> get values => _$settingsNoteModeValues;
  // coverage:ignore-end

  static Settings_NoteMode valueOf(final String name) => _$valueOfSettings_NoteMode(name);

  static Serializer<Settings_NoteMode> get serializer => _$settingsNoteModeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class SettingsInterface {
  String get notesPath;
  String get fileSuffix;
  Settings_NoteMode get noteMode;
}

abstract class Settings implements SettingsInterface, Built<Settings, SettingsBuilder> {
  factory Settings([final void Function(SettingsBuilder)? b]) = _$Settings;

  // coverage:ignore-start
  const Settings._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Settings.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Settings> get serializer => const _$SettingsSerializer();
}

class _$SettingsSerializer implements StructuredSerializer<Settings> {
  const _$SettingsSerializer();

  @override
  Iterable<Type> get types => const [Settings, _$Settings];

  @override
  String get wireName => 'Settings';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Settings object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'notesPath',
      serializers.serialize(object.notesPath, specifiedType: const FullType(String)),
      'fileSuffix',
      serializers.serialize(object.fileSuffix, specifiedType: const FullType(String)),
      'noteMode',
      serializers.serialize(object.noteMode, specifiedType: const FullType(Settings_NoteMode)),
    ];
    return result;
  }

  @override
  Settings deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'notesPath':
          result.notesPath = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'fileSuffix':
          result.fileSuffix = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'noteMode':
          result.noteMode =
              serializers.deserialize(value, specifiedType: const FullType(Settings_NoteMode))! as Settings_NoteMode;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class Capabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
}

abstract class Capabilities_Notes
    implements Capabilities_NotesInterface, Built<Capabilities_Notes, Capabilities_NotesBuilder> {
  factory Capabilities_Notes([final void Function(Capabilities_NotesBuilder)? b]) = _$Capabilities_Notes;

  // coverage:ignore-start
  const Capabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Notes.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities_Notes> get serializer => const _$Capabilities_NotesSerializer();
}

class _$Capabilities_NotesSerializer implements StructuredSerializer<Capabilities_Notes> {
  const _$Capabilities_NotesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities_Notes, _$Capabilities_Notes];

  @override
  String get wireName => 'Capabilities_Notes';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities_Notes object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.apiVersion;
    if (value != null) {
      result
        ..add('api_version')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Capabilities_Notes deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = Capabilities_NotesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'api_version':
          result.apiVersion.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
        case 'version':
          result.version = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class CapabilitiesInterface {
  Capabilities_Notes get notes;
}

abstract class Capabilities implements CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([final void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Capabilities> get serializer => const _$CapabilitiesSerializer();
}

class _$CapabilitiesSerializer implements StructuredSerializer<Capabilities> {
  const _$CapabilitiesSerializer();

  @override
  Iterable<Type> get types => const [Capabilities, _$Capabilities];

  @override
  String get wireName => 'Capabilities';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Capabilities object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'notes',
      serializers.serialize(object.notes, specifiedType: const FullType(Capabilities_Notes)),
    ];
    return result;
  }

  @override
  Capabilities deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = CapabilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'notes':
          result.notes.replace(
            serializers.deserialize(value, specifiedType: const FullType(Capabilities_Notes))! as Capabilities_Notes,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OCSMeta> get serializer => const _$OCSMetaSerializer();
}

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  const _$OCSMetaSerializer();

  @override
  Iterable<Type> get types => const [OCSMeta, _$OCSMeta];

  @override
  String get wireName => 'OCSMeta';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OCSMeta object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OCSMeta deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCS_OcsInterface {
  OCSMeta get meta;
  BuiltList<JsonObject> get data;
}

abstract class EmptyOCS_Ocs implements EmptyOCS_OcsInterface, Built<EmptyOCS_Ocs, EmptyOCS_OcsBuilder> {
  factory EmptyOCS_Ocs([final void Function(EmptyOCS_OcsBuilder)? b]) = _$EmptyOCS_Ocs;

  // coverage:ignore-start
  const EmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EmptyOCS_Ocs> get serializer => const _$EmptyOCS_OcsSerializer();
}

class _$EmptyOCS_OcsSerializer implements StructuredSerializer<EmptyOCS_Ocs> {
  const _$EmptyOCS_OcsSerializer();

  @override
  Iterable<Type> get types => const [EmptyOCS_Ocs, _$EmptyOCS_Ocs];

  @override
  String get wireName => 'EmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EmptyOCS_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];
    return result;
  }

  @override
  EmptyOCS_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))!
                as BuiltList<JsonObject>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCSInterface {
  EmptyOCS_Ocs get ocs;
}

abstract class EmptyOCS implements EmptyOCSInterface, Built<EmptyOCS, EmptyOCSBuilder> {
  factory EmptyOCS([final void Function(EmptyOCSBuilder)? b]) = _$EmptyOCS;

  // coverage:ignore-start
  const EmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EmptyOCS> get serializer => const _$EmptyOCSSerializer();
}

class _$EmptyOCSSerializer implements StructuredSerializer<EmptyOCS> {
  const _$EmptyOCSSerializer();

  @override
  Iterable<Type> get types => const [EmptyOCS, _$EmptyOCS];

  @override
  String get wireName => 'EmptyOCS';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EmptyOCS object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(EmptyOCS_Ocs)),
    ];
    return result;
  }

  @override
  EmptyOCS deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(EmptyOCS_Ocs))! as EmptyOCS_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Note), Note.new)
      ..add(Note.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Note)]), ListBuilder<Note>.new)
      ..addBuilderFactory(const FullType(Settings), Settings.new)
      ..add(Settings.serializer)
      ..add(Settings_NoteMode.serializer)
      ..addBuilderFactory(const FullType(Capabilities), Capabilities.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Notes), Capabilities_Notes.new)
      ..add(Capabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS), EmptyOCS.new)
      ..add(EmptyOCS.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS_Ocs), EmptyOCS_Ocs.new)
      ..add(EmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
