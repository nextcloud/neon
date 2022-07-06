//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultApi extends ApiInstance<ApiClient> {
  DefaultApi(ApiClient apiClient) : super(apiClient);

  /// Performs an HTTP 'POST /api/v1/notes' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [NotesNote] notesNote (required):
  Future<Response> createNoteWithHttpInfo(
    NotesNote notesNote,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes';

    // ignore: prefer_final_locals
    Object? postBody = notesNote;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [NotesNote] notesNote (required):
  Future<NotesNote?> createNote(
    NotesNote notesNote,
  ) async {
    final response = await createNoteWithHttpInfo(
      notesNote,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NotesNote',
      ) as NotesNote;
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /api/v1/notes/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] ifNoneMatch:
  Future<Response> deleteNoteWithHttpInfo(
    int id, {
    String? ifNoneMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (ifNoneMatch != null) {
      headerParams[r'If-None-Match'] = parameterToString(ifNoneMatch);
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] ifNoneMatch:
  Future<String?> deleteNote(
    int id, {
    String? ifNoneMatch,
  }) async {
    final response = await deleteNoteWithHttpInfo(
      id,
      ifNoneMatch: ifNoneMatch,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'String',
      ) as String;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/notes/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] ifNoneMatch:
  Future<Response> getNoteWithHttpInfo(
    int id, {
    String? ifNoneMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (ifNoneMatch != null) {
      headerParams[r'If-None-Match'] = parameterToString(ifNoneMatch);
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [String] ifNoneMatch:
  Future<NotesNote?> getNote(
    int id, {
    String? ifNoneMatch,
  }) async {
    final response = await getNoteWithHttpInfo(
      id,
      ifNoneMatch: ifNoneMatch,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NotesNote',
      ) as NotesNote;
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/notes' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] category:
  ///
  /// * [String] exclude:
  ///
  /// * [int] pruneBefore:
  ///
  /// * [String] ifNoneMatch:
  Future<Response> getNotesWithHttpInfo({
    String? category,
    String? exclude,
    int? pruneBefore,
    String? ifNoneMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (category != null) {
      queryParams.addAll(buildQueryParams('', 'category', category));
    }
    if (exclude != null) {
      queryParams.addAll(buildQueryParams('', 'exclude', exclude));
    }
    if (pruneBefore != null) {
      queryParams.addAll(buildQueryParams('', 'pruneBefore', pruneBefore));
    }

    if (ifNoneMatch != null) {
      headerParams[r'If-None-Match'] = parameterToString(ifNoneMatch);
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] category:
  ///
  /// * [String] exclude:
  ///
  /// * [int] pruneBefore:
  ///
  /// * [String] ifNoneMatch:
  Future<List<NotesNote>?> getNotes({
    String? category,
    String? exclude,
    int? pruneBefore,
    String? ifNoneMatch,
  }) async {
    final response = await getNotesWithHttpInfo(
      category: category,
      exclude: exclude,
      pruneBefore: pruneBefore,
      ifNoneMatch: ifNoneMatch,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<NotesNote>') as List).cast<NotesNote>().toList();
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/v1/settings' operation and returns the [Response].
  Future<Response> getSettingsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/settings';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<NotesSettings?> getSettings() async {
    final response = await getSettingsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NotesSettings',
      ) as NotesSettings;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1/notes/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NotesNote] notesNote (required):
  ///
  /// * [String] ifNoneMatch:
  ///
  /// * [String] ifMatch:
  Future<Response> updateNoteWithHttpInfo(
    int id,
    NotesNote notesNote, {
    String? ifNoneMatch,
    String? ifMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = notesNote;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (ifNoneMatch != null) {
      headerParams[r'If-None-Match'] = parameterToString(ifNoneMatch);
    }
    if (ifMatch != null) {
      headerParams[r'If-Match'] = parameterToString(ifMatch);
    }

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [NotesNote] notesNote (required):
  ///
  /// * [String] ifNoneMatch:
  ///
  /// * [String] ifMatch:
  Future<NotesNote?> updateNote(
    int id,
    NotesNote notesNote, {
    String? ifNoneMatch,
    String? ifMatch,
  }) async {
    final response = await updateNoteWithHttpInfo(
      id,
      notesNote,
      ifNoneMatch: ifNoneMatch,
      ifMatch: ifMatch,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NotesNote',
      ) as NotesNote;
    }
    return null;
  }

  /// Performs an HTTP 'PUT /api/v1/settings' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [NotesSettings] notesSettings (required):
  Future<Response> updateSettingsWithHttpInfo(
    NotesSettings notesSettings,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/settings';

    // ignore: prefer_final_locals
    Object? postBody = notesSettings;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [NotesSettings] notesSettings (required):
  Future<NotesSettings?> updateSettings(
    NotesSettings notesSettings,
  ) async {
    final response = await updateSettingsWithHttpInfo(
      notesSettings,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await decodeBodyBytes(response),
        'NotesSettings',
      ) as NotesSettings;
    }
    return null;
  }
}
