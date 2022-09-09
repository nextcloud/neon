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
  /// * [String] category:
  ///
  /// * [String] title:
  ///
  /// * [String] content:
  ///
  /// * [int] modified:
  ///
  /// * [bool] favorite:
  Future<Response> createNoteWithHttpInfo({
    String? category,
    String? title,
    String? content,
    int? modified,
    bool? favorite,
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
    if (title != null) {
      queryParams.addAll(buildQueryParams('', 'title', title));
    }
    if (content != null) {
      queryParams.addAll(buildQueryParams('', 'content', content));
    }
    if (modified != null) {
      queryParams.addAll(buildQueryParams('', 'modified', modified));
    }
    if (favorite != null) {
      queryParams.addAll(buildQueryParams('', 'favorite', favorite));
    }

    const contentTypes = <String>[];

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
  /// * [String] category:
  ///
  /// * [String] title:
  ///
  /// * [String] content:
  ///
  /// * [int] modified:
  ///
  /// * [bool] favorite:
  Future<NotesNote?> createNote({
    String? category,
    String? title,
    String? content,
    int? modified,
    bool? favorite,
  }) async {
    final response = await createNoteWithHttpInfo(
      category: category,
      title: title,
      content: content,
      modified: modified,
      favorite: favorite,
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
  Future<Response> deleteNoteWithHttpInfo(
    int id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  Future<String?> deleteNote(
    int id,
  ) async {
    final response = await deleteNoteWithHttpInfo(
      id,
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
  /// * [String] exclude:
  ///
  /// * [String] ifNoneMatch:
  Future<Response> getNoteWithHttpInfo(
    int id, {
    String? exclude,
    String? ifNoneMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (exclude != null) {
      queryParams.addAll(buildQueryParams('', 'exclude', exclude));
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
  /// * [int] id (required):
  ///
  /// * [String] exclude:
  ///
  /// * [String] ifNoneMatch:
  Future<NotesNote?> getNote(
    int id, {
    String? exclude,
    String? ifNoneMatch,
  }) async {
    final response = await getNoteWithHttpInfo(
      id,
      exclude: exclude,
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
  /// * [int] chunkSize:
  ///
  /// * [String] chunkCursor:
  ///
  /// * [String] ifNoneMatch:
  Future<Response> getNotesWithHttpInfo({
    String? category,
    String? exclude,
    int? pruneBefore,
    int? chunkSize,
    String? chunkCursor,
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
    if (chunkSize != null) {
      queryParams.addAll(buildQueryParams('', 'chunkSize', chunkSize));
    }
    if (chunkCursor != null) {
      queryParams.addAll(buildQueryParams('', 'chunkCursor', chunkCursor));
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
  /// * [int] chunkSize:
  ///
  /// * [String] chunkCursor:
  ///
  /// * [String] ifNoneMatch:
  Future<List<NotesNote>?> getNotes({
    String? category,
    String? exclude,
    int? pruneBefore,
    int? chunkSize,
    String? chunkCursor,
    String? ifNoneMatch,
  }) async {
    final response = await getNotesWithHttpInfo(
      category: category,
      exclude: exclude,
      pruneBefore: pruneBefore,
      chunkSize: chunkSize,
      chunkCursor: chunkCursor,
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
  /// * [String] content:
  ///
  /// * [int] modified:
  ///
  /// * [String] title:
  ///
  /// * [String] category:
  ///
  /// * [bool] favorite:
  ///
  /// * [String] ifMatch:
  Future<Response> updateNoteWithHttpInfo(
    int id, {
    String? content,
    int? modified,
    String? title,
    String? category,
    bool? favorite,
    String? ifMatch,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/notes/{id}'.replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (content != null) {
      queryParams.addAll(buildQueryParams('', 'content', content));
    }
    if (modified != null) {
      queryParams.addAll(buildQueryParams('', 'modified', modified));
    }
    if (title != null) {
      queryParams.addAll(buildQueryParams('', 'title', title));
    }
    if (category != null) {
      queryParams.addAll(buildQueryParams('', 'category', category));
    }
    if (favorite != null) {
      queryParams.addAll(buildQueryParams('', 'favorite', favorite));
    }

    if (ifMatch != null) {
      headerParams[r'If-Match'] = parameterToString(ifMatch);
    }

    const contentTypes = <String>[];

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
  /// * [String] content:
  ///
  /// * [int] modified:
  ///
  /// * [String] title:
  ///
  /// * [String] category:
  ///
  /// * [bool] favorite:
  ///
  /// * [String] ifMatch:
  Future<NotesNote?> updateNote(
    int id, {
    String? content,
    int? modified,
    String? title,
    String? category,
    bool? favorite,
    String? ifMatch,
  }) async {
    final response = await updateNoteWithHttpInfo(
      id,
      content: content,
      modified: modified,
      title: title,
      category: category,
      favorite: favorite,
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
