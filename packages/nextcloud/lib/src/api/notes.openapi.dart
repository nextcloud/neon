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
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'notes.openapi.g.dart';

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

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category]
  ///   * [exclude]
  ///   * [pruneBefore]
  ///   * [chunkSize]
  ///   * [chunkCursor]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNotesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<BuiltList<NotesNote>, void>> getNotes({
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
  ///   * [exclude]
  ///   * [pruneBefore]
  ///   * [chunkSize]
  ///   * [chunkCursor]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNotes] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<BuiltList<NotesNote>, void> getNotesRaw({
    final String? category,
    final String exclude = '',
    final int pruneBefore = 0,
    final int chunkSize = 0,
    final String? chunkCursor,
    final String? ifNoneMatch,
  }) {
    const path = '/index.php/apps/notes/api/v1/notes';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<BuiltList<NotesNote>, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(BuiltList, [FullType(NotesNote)]),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [category]
  ///   * [title]
  ///   * [content]
  ///   * [modified]
  ///   * [favorite]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NotesNote, void>> createNote({
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
  ///   * [category]
  ///   * [title]
  ///   * [content]
  ///   * [modified]
  ///   * [favorite]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NotesNote, void> createNoteRaw({
    final String category = '',
    final String title = '',
    final String content = '',
    final int modified = 0,
    final int favorite = 0,
  }) {
    const path = '/index.php/apps/notes/api/v1/notes';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NotesNote, void>(
      response: doRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NotesNote),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [exclude]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNoteRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<NotesNote, void>> getNote({
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
  ///   * [exclude]
  ///   * [ifNoneMatch]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getNote] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<NotesNote, void> getNoteRaw({
    required final int id,
    final String exclude = '',
    final String? ifNoneMatch,
  }) {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    if (exclude != '') {
      queryParameters['exclude'] = exclude;
    }
    if (ifNoneMatch != null) {
      headers['If-None-Match'] = ifNoneMatch;
    }
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NotesNote, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NotesNote),
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
  Future<DynamiteResponse<NotesNote, void>> updateNote({
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
  DynamiteRawResponse<NotesNote, void> updateNoteRaw({
    required final int id,
    final String? content,
    final int? modified,
    final String? title,
    final String? category,
    final int? favorite,
    final String? ifMatch,
  }) {
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
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
    if (favorite != null) {
      queryParameters['favorite'] = favorite.toString();
    }
    if (ifMatch != null) {
      headers['If-Match'] = ifMatch;
    }
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NotesNote, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NotesNote),
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
    var path = '/index.php/apps/notes/api/v1/notes/{id}';
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
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<String, void>(
      response: doRequest(
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
  Future<DynamiteResponse<NotesSettings, void>> getSettings() async {
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
  DynamiteRawResponse<NotesSettings, void> getSettingsRaw() {
    const path = '/index.php/apps/notes/api/v1/settings';
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
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NotesSettings, void>(
      response: doRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NotesSettings),
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
  Future<DynamiteResponse<NotesSettings, void>> updateSettings({required final NotesSettings settings}) async {
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
  DynamiteRawResponse<NotesSettings, void> updateSettingsRaw({required final NotesSettings settings}) {
    const path = '/index.php/apps/notes/api/v1/settings';
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
    body = utf8.encode(json.encode(_jsonSerializers.serialize(settings, specifiedType: const FullType(NotesSettings))))
        as Uint8List;
    final uri = Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null);
    return DynamiteRawResponse<NotesSettings, void>(
      response: doRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(NotesSettings),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class NotesNoteInterface {
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
  NotesNoteInterface rebuild(final void Function(NotesNoteInterfaceBuilder) updates);
  NotesNoteInterfaceBuilder toBuilder();
}

abstract class NotesNote implements NotesNoteInterface, Built<NotesNote, NotesNoteBuilder> {
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

@BuiltValue(instantiable: false)
abstract interface class NotesSettingsInterface {
  String get notesPath;
  String get fileSuffix;
  NotesSettings_NoteMode get noteMode;
  NotesSettingsInterface rebuild(final void Function(NotesSettingsInterfaceBuilder) updates);
  NotesSettingsInterfaceBuilder toBuilder();
}

abstract class NotesSettings implements NotesSettingsInterface, Built<NotesSettings, NotesSettingsBuilder> {
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

  static Serializer<NotesSettings> get serializer => _$notesSettingsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesCapabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
  NotesCapabilities_NotesInterface rebuild(final void Function(NotesCapabilities_NotesInterfaceBuilder) updates);
  NotesCapabilities_NotesInterfaceBuilder toBuilder();
}

abstract class NotesCapabilities_Notes
    implements NotesCapabilities_NotesInterface, Built<NotesCapabilities_Notes, NotesCapabilities_NotesBuilder> {
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

  static Serializer<NotesCapabilities_Notes> get serializer => _$notesCapabilitiesNotesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesCapabilitiesInterface {
  NotesCapabilities_Notes get notes;
  NotesCapabilitiesInterface rebuild(final void Function(NotesCapabilitiesInterfaceBuilder) updates);
  NotesCapabilitiesInterfaceBuilder toBuilder();
}

abstract class NotesCapabilities
    implements NotesCapabilitiesInterface, Built<NotesCapabilities, NotesCapabilitiesBuilder> {
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

  static Serializer<NotesCapabilities> get serializer => _$notesCapabilitiesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  NotesOCSMetaInterface rebuild(final void Function(NotesOCSMetaInterfaceBuilder) updates);
  NotesOCSMetaInterfaceBuilder toBuilder();
}

abstract class NotesOCSMeta implements NotesOCSMetaInterface, Built<NotesOCSMeta, NotesOCSMetaBuilder> {
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

  static Serializer<NotesOCSMeta> get serializer => _$notesOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesEmptyOCS_OcsInterface {
  NotesOCSMeta get meta;
  BuiltList<JsonObject> get data;
  NotesEmptyOCS_OcsInterface rebuild(final void Function(NotesEmptyOCS_OcsInterfaceBuilder) updates);
  NotesEmptyOCS_OcsInterfaceBuilder toBuilder();
}

abstract class NotesEmptyOCS_Ocs
    implements NotesEmptyOCS_OcsInterface, Built<NotesEmptyOCS_Ocs, NotesEmptyOCS_OcsBuilder> {
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

  static Serializer<NotesEmptyOCS_Ocs> get serializer => _$notesEmptyOCSOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotesEmptyOCSInterface {
  NotesEmptyOCS_Ocs get ocs;
  NotesEmptyOCSInterface rebuild(final void Function(NotesEmptyOCSInterfaceBuilder) updates);
  NotesEmptyOCSInterfaceBuilder toBuilder();
}

abstract class NotesEmptyOCS implements NotesEmptyOCSInterface, Built<NotesEmptyOCS, NotesEmptyOCSBuilder> {
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

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
