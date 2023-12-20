// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: camel_case_extensions
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
import 'package:uri/uri.dart';

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

  Client.fromClient(DynamiteClient client)
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
    String? category,
    String? exclude,
    int? pruneBefore,
    int? chunkSize,
    String? chunkCursor,
    String? ifNoneMatch,
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
    String? category,
    String? exclude,
    int? pruneBefore,
    int? chunkSize,
    String? chunkCursor,
    String? ifNoneMatch,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    final $category = jsonSerializers.serialize(category, specifiedType: const FullType(String));
    parameters['category'] = $category;

    var $exclude = jsonSerializers.serialize(exclude, specifiedType: const FullType(String));
    $exclude ??= '';
    parameters['exclude'] = $exclude;

    var $pruneBefore = jsonSerializers.serialize(pruneBefore, specifiedType: const FullType(int));
    $pruneBefore ??= 0;
    parameters['pruneBefore'] = $pruneBefore;

    var $chunkSize = jsonSerializers.serialize(chunkSize, specifiedType: const FullType(int));
    $chunkSize ??= 0;
    parameters['chunkSize'] = $chunkSize;

    final $chunkCursor = jsonSerializers.serialize(chunkCursor, specifiedType: const FullType(String));
    parameters['chunkCursor'] = $chunkCursor;

    final $ifNoneMatch = jsonSerializers.serialize(ifNoneMatch, specifiedType: const FullType(String));
    if ($ifNoneMatch != null) {
      headers['If-None-Match'] = $ifNoneMatch as String;
    }

    final path =
        UriTemplate('/index.php/apps/notes/api/v1/notes{?category*,exclude*,pruneBefore*,chunkSize*,chunkCursor*}')
            .expand(parameters);
    return DynamiteRawResponse<BuiltList<Note>, void>(
      response: executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(BuiltList, [FullType(Note)]),
      headersType: null,
      serializers: jsonSerializers,
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
    String? category,
    String? title,
    String? content,
    int? modified,
    int? favorite,
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
    String? category,
    String? title,
    String? content,
    int? modified,
    int? favorite,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    var $category = jsonSerializers.serialize(category, specifiedType: const FullType(String));
    $category ??= '';
    parameters['category'] = $category;

    var $title = jsonSerializers.serialize(title, specifiedType: const FullType(String));
    $title ??= '';
    parameters['title'] = $title;

    var $content = jsonSerializers.serialize(content, specifiedType: const FullType(String));
    $content ??= '';
    parameters['content'] = $content;

    var $modified = jsonSerializers.serialize(modified, specifiedType: const FullType(int));
    $modified ??= 0;
    parameters['modified'] = $modified;

    var $favorite = jsonSerializers.serialize(favorite, specifiedType: const FullType(int));
    $favorite ??= 0;
    parameters['favorite'] = $favorite;

    final path = UriTemplate('/index.php/apps/notes/api/v1/notes{?category*,title*,content*,modified*,favorite*}')
        .expand(parameters);
    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'post',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    String? exclude,
    String? ifNoneMatch,
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
    required int id,
    String? exclude,
    String? ifNoneMatch,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    parameters['id'] = $id;

    var $exclude = jsonSerializers.serialize(exclude, specifiedType: const FullType(String));
    $exclude ??= '';
    parameters['exclude'] = $exclude;

    final $ifNoneMatch = jsonSerializers.serialize(ifNoneMatch, specifiedType: const FullType(String));
    if ($ifNoneMatch != null) {
      headers['If-None-Match'] = $ifNoneMatch as String;
    }

    final path = UriTemplate('/index.php/apps/notes/api/v1/notes/{id}{?exclude*}').expand(parameters);
    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: jsonSerializers,
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
    required int id,
    String? content,
    int? modified,
    String? title,
    String? category,
    int? favorite,
    String? ifMatch,
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
    required int id,
    String? content,
    int? modified,
    String? title,
    String? category,
    int? favorite,
    String? ifMatch,
  }) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    parameters['id'] = $id;

    final $content = jsonSerializers.serialize(content, specifiedType: const FullType(String));
    parameters['content'] = $content;

    final $modified = jsonSerializers.serialize(modified, specifiedType: const FullType(int));
    parameters['modified'] = $modified;

    final $title = jsonSerializers.serialize(title, specifiedType: const FullType(String));
    parameters['title'] = $title;

    final $category = jsonSerializers.serialize(category, specifiedType: const FullType(String));
    parameters['category'] = $category;

    final $favorite = jsonSerializers.serialize(favorite, specifiedType: const FullType(int));
    parameters['favorite'] = $favorite;

    final $ifMatch = jsonSerializers.serialize(ifMatch, specifiedType: const FullType(String));
    if ($ifMatch != null) {
      headers['If-Match'] = $ifMatch as String;
    }

    final path = UriTemplate('/index.php/apps/notes/api/v1/notes/{id}{?content*,modified*,title*,category*,favorite*}')
        .expand(parameters);
    return DynamiteRawResponse<Note, void>(
      response: executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Note),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<String, void>> deleteNote({required int id}) async {
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
  DynamiteRawResponse<String, void> deleteNoteRaw({required int id}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    final $id = jsonSerializers.serialize(id, specifiedType: const FullType(int));
    parameters['id'] = $id;

    final path = UriTemplate('/index.php/apps/notes/api/v1/notes/{id}').expand(parameters);
    return DynamiteRawResponse<String, void>(
      response: executeRequest(
        'delete',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(String),
      headersType: null,
      serializers: jsonSerializers,
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
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    final path = UriTemplate('/index.php/apps/notes/api/v1/settings').expand(parameters);
    return DynamiteRawResponse<Settings, void>(
      response: executeRequest(
        'get',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Settings),
      headersType: null,
      serializers: jsonSerializers,
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
  Future<DynamiteResponse<Settings, void>> updateSettings({required Settings settings}) async {
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
  DynamiteRawResponse<Settings, void> updateSettingsRaw({required Settings settings}) {
    final parameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (auth) => switch (auth) {
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
    body = utf8.encode(json.encode(jsonSerializers.serialize(settings, specifiedType: const FullType(Settings))));
    final path = UriTemplate('/index.php/apps/notes/api/v1/settings').expand(parameters);
    return DynamiteRawResponse<Settings, void>(
      response: executeRequest(
        'put',
        path,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(Settings),
      headersType: null,
      serializers: jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class $NoteInterface {
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

abstract class Note implements $NoteInterface, Built<Note, NoteBuilder> {
  factory Note([void Function(NoteBuilder)? b]) = _$Note;

  // coverage:ignore-start
  const Note._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Note.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Note> get serializer => _$noteSerializer;
}

class Settings_NoteMode extends EnumClass {
  const Settings_NoteMode._(super.name);

  static const Settings_NoteMode edit = _$settingsNoteModeEdit;

  static const Settings_NoteMode preview = _$settingsNoteModePreview;

  static const Settings_NoteMode rich = _$settingsNoteModeRich;

  // coverage:ignore-start
  static BuiltSet<Settings_NoteMode> get values => _$settingsNoteModeValues;
  // coverage:ignore-end

  static Settings_NoteMode valueOf(String name) => _$valueOfSettings_NoteMode(name);

  static Serializer<Settings_NoteMode> get serializer => _$settingsNoteModeSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $SettingsInterface {
  String get notesPath;
  String get fileSuffix;
  Settings_NoteMode get noteMode;
}

abstract class Settings implements $SettingsInterface, Built<Settings, SettingsBuilder> {
  factory Settings([void Function(SettingsBuilder)? b]) = _$Settings;

  // coverage:ignore-start
  const Settings._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Settings.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Settings> get serializer => _$settingsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $Capabilities_NotesInterface {
  @BuiltValueField(wireName: 'api_version')
  BuiltList<String>? get apiVersion;
  String? get version;
}

abstract class Capabilities_Notes
    implements $Capabilities_NotesInterface, Built<Capabilities_Notes, Capabilities_NotesBuilder> {
  factory Capabilities_Notes([void Function(Capabilities_NotesBuilder)? b]) = _$Capabilities_Notes;

  // coverage:ignore-start
  const Capabilities_Notes._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities_Notes.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities_Notes> get serializer => _$capabilitiesNotesSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $CapabilitiesInterface {
  Capabilities_Notes get notes;
}

abstract class Capabilities implements $CapabilitiesInterface, Built<Capabilities, CapabilitiesBuilder> {
  factory Capabilities([void Function(CapabilitiesBuilder)? b]) = _$Capabilities;

  // coverage:ignore-start
  const Capabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Capabilities.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<Capabilities> get serializer => _$capabilitiesSerializer;
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
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EmptyOCS_OcsInterface {
  OCSMeta get meta;
  BuiltList<JsonObject> get data;
}

abstract class EmptyOCS_Ocs implements $EmptyOCS_OcsInterface, Built<EmptyOCS_Ocs, EmptyOCS_OcsBuilder> {
  factory EmptyOCS_Ocs([void Function(EmptyOCS_OcsBuilder)? b]) = _$EmptyOCS_Ocs;

  // coverage:ignore-start
  const EmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS_Ocs.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS_Ocs> get serializer => _$emptyOCSOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $EmptyOCSInterface {
  EmptyOCS_Ocs get ocs;
}

abstract class EmptyOCS implements $EmptyOCSInterface, Built<EmptyOCS, EmptyOCSBuilder> {
  factory EmptyOCS([void Function(EmptyOCSBuilder)? b]) = _$EmptyOCS;

  // coverage:ignore-start
  const EmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  static Serializer<EmptyOCS> get serializer => _$emptyOCSSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Note), NoteBuilder.new)
      ..add(Note.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Note)]), ListBuilder<Note>.new)
      ..addBuilderFactory(const FullType(Settings), SettingsBuilder.new)
      ..add(Settings.serializer)
      ..add(Settings_NoteMode.serializer)
      ..addBuilderFactory(const FullType(Capabilities), CapabilitiesBuilder.new)
      ..add(Capabilities.serializer)
      ..addBuilderFactory(const FullType(Capabilities_Notes), Capabilities_NotesBuilder.new)
      ..add(Capabilities_Notes.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS), EmptyOCSBuilder.new)
      ..add(EmptyOCS.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS_Ocs), EmptyOCS_OcsBuilder.new)
      ..add(EmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
