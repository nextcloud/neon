part of '../../nextcloud.dart';

/// WebDavClient class
class WebDavClient {
  // ignore: public_member_api_docs
  WebDavClient(
    this.rootClient,
    this.basePath,
  );

  // ignore: public_member_api_docs
  final NextcloudClient rootClient;

  /// Base path used on the server
  final String basePath;

  Future<HttpClientResponse> _send(
    final String method,
    final String url,
    final List<int> expectedCodes, {
    final Stream<Uint8List>? data,
    final Map<String, String>? headers,
  }) async {
    final request = await HttpClient().openUrl(
      method,
      Uri.parse(url),
    )
      ..followRedirects = false
      ..persistentConnection = true;
    for (final header in {
      HttpHeaders.contentTypeHeader: 'application/xml',
      ...rootClient.baseHeaders,
      if (headers != null) ...headers,
      if (rootClient.authentications.isNotEmpty) ...rootClient.authentications.first.headers,
    }.entries) {
      request.headers.add(header.key, header.value);
    }

    if (data != null) {
      await request.addStream(data);
    }

    final response = await request.close();

    if (!expectedCodes.contains(response.statusCode)) {
      throw NextcloudApiException(
        response.statusCode,
        {}, // TODO
        await response.bodyBytes,
      );
    }

    return response;
  }

  String _constructPath([final String? path]) => [
        rootClient.baseURL,
        basePath,
        if (path != null) ...[
          path,
        ],
      ]
          .map((part) {
            while (part.startsWith('/')) {
              part = part.substring(1);
            }
            while (part.endsWith('/')) {
              part = part.substring(0, part.length - 1);
            }
            return part;
          })
          .where((final part) => part.isNotEmpty)
          .join('/');

  /// returns the WebDAV capabilities of the server
  Future<WebDavStatus> status() async {
    final response = await _send(
      'OPTIONS',
      _constructPath(),
      [200],
    );
    final davCapabilities = response.headers['dav']?.cast<String>().first ?? '';
    final davSearchCapabilities = response.headers['dasl']?.cast<String>().first ?? '';
    return WebDavStatus(
      davCapabilities.split(',').map((final e) => e.trim()).where((final e) => e.isNotEmpty).toSet(),
      davSearchCapabilities.split(',').map((final e) => e.trim()).where((final e) => e.isNotEmpty).toSet(),
    );
  }

  /// make a dir with [remotePath] under current dir
  Future<HttpClientResponse> mkdir(
    final String remotePath, {
    final bool safe = true,
  }) async {
    final expectedCodes = [
      201,
      if (safe) ...[
        301,
        405,
      ],
    ];
    return _send(
      'MKCOL',
      _constructPath(remotePath),
      expectedCodes,
    );
  }

  /// just like mkdir -p
  Future<HttpClientResponse?> mkdirs(
    final String remotePath, {
    final bool safe = true,
  }) async {
    final dirs = remotePath.trim().split('/')..removeWhere((final value) => value == '');
    if (dirs.isEmpty) {
      return null;
    }
    if (remotePath.trim().startsWith('/')) {
      dirs[0] = '/${dirs[0]}';
    }
    final prevPath = StringBuffer();
    late HttpClientResponse response;
    for (final dir in dirs) {
      response = await mkdir(
        '$prevPath/$dir',
        safe: safe,
      );
      prevPath.write('/$dir');
    }

    return response;
  }

  /// remove dir with given [path]
  Future<HttpClientResponse> delete(final String path) => _send(
        'DELETE',
        _constructPath(path),
        [204],
      );

  Map<String, String>? _generateUploadHeaders({
    required final DateTime? lastModified,
    required final DateTime? created,
    required final int? contentLength,
  }) {
    final headers = <String, String>{
      if (lastModified != null) ...{
        'X-OC-Mtime': (lastModified.millisecondsSinceEpoch ~/ 1000).toString(),
      },
      if (created != null) ...{
        'X-OC-CTime': (created.millisecondsSinceEpoch ~/ 1000).toString(),
      },
      if (contentLength != null) ...{
        'Content-Length': contentLength.toString(),
      },
    };
    return headers.isNotEmpty ? headers : null;
  }

  /// upload a new file with [localData] as content to [remotePath]
  Future<HttpClientResponse> upload(
    final Uint8List localData,
    final String remotePath, {
    final DateTime? lastModified,
    final DateTime? created,
  }) =>
      _send(
        'PUT',
        _constructPath(remotePath),
        [200, 201, 204],
        data: Stream.value(localData),
        headers: _generateUploadHeaders(
          lastModified: lastModified,
          created: created,
          contentLength: localData.lengthInBytes,
        ),
      );

  /// upload a new file with [localData] as content to [remotePath]
  Future<HttpClientResponse> uploadStream(
    final Stream<Uint8List> localData,
    final String remotePath, {
    final DateTime? lastModified,
    final DateTime? created,
    final int? contentLength,
  }) async =>
      _send(
        'PUT',
        _constructPath(remotePath),
        [200, 201, 204],
        data: localData,
        headers: _generateUploadHeaders(
          lastModified: lastModified,
          created: created,
          contentLength: contentLength,
        ),
      );

  /// download [remotePath] and store the response file contents to String
  Future<Uint8List> download(final String remotePath) async => Uint8List.fromList(
        (await (await _send(
          'GET',
          _constructPath(remotePath),
          [200],
        ))
                .join())
            .codeUnits,
      );

  /// download [remotePath] and store the response file contents to ByteStream
  Future<HttpClientResponse> downloadStream(final String remotePath) async => _send(
        'GET',
        _constructPath(remotePath),
        [200],
      );

  Future<WebDavMultistatus> _parseResponse(final HttpClientResponse response) async =>
      WebDavMultistatus.fromXmlElement(xml.XmlDocument.parse(await response.body).rootElement);

  /// list the directories and files under given [remotePath].
  ///
  /// Optionally populates the given [prop]s on the returned files.
  /// [depth] can be '0', '1' or 'infinity'.
  Future<WebDavMultistatus> ls(
    final String remotePath, {
    final WebDavPropfindProp? prop,
    final String? depth,
  }) async {
    assert(depth == null || ['0', '1', 'infinity'].contains(depth), 'Depth has to be 0, 1 or infinity');
    final response = await _send(
      'PROPFIND',
      _constructPath(remotePath),
      [207, 301],
      data: Stream.value(
        Uint8List.fromList(
          utf8.encode(
            WebDavPropfind(prop: prop ?? WebDavPropfindProp()).toXmlElement(namespaces: namespaces).toXmlString(),
          ),
        ),
      ),
      headers: {
        if (depth != null) ...{
          'Depth': depth,
        },
      },
    );
    if (response.statusCode == 301) {
      return ls(
        response.headers['location']!.first,
        prop: prop,
        depth: depth,
      );
    }
    return _parseResponse(response);
  }

  /// Runs the filter-files report with the given [filterRules] on the
  /// [remotePath].
  ///
  /// Optionally populates the given [prop]s on the returned files.
  Future<WebDavMultistatus> filter(
    final String remotePath,
    final WebDavOcFilterRules filterRules, {
    final WebDavPropfindProp? prop,
  }) async {
    final response = await _send(
      'REPORT',
      _constructPath(remotePath),
      [200, 207],
      data: Stream.value(
        Uint8List.fromList(
          utf8.encode(
            WebDavOcFilterFiles(
              filterRules: filterRules,
              prop: prop ?? WebDavPropfindProp(),
            ).toXmlElement(namespaces: namespaces).toXmlString(),
          ),
        ),
      ),
    );
    return _parseResponse(response);
  }

  /// Update (string) properties of the given [remotePath].
  ///
  /// Returns true if the update was successful.
  Future<bool> updateProps(
    final String remotePath,
    final WebDavProp prop,
  ) async {
    final response = await _send(
      'PROPPATCH',
      _constructPath(remotePath),
      [200, 207],
      data: Stream.value(
        Uint8List.fromList(
          utf8.encode(
            WebDavPropertyupdate(set: WebDavSet(prop: prop)).toXmlElement(namespaces: namespaces).toXmlString(),
          ),
        ),
      ),
    );
    final data = await _parseResponse(response);
    for (final a in data.responses) {
      for (final b in a.propstats) {
        if (!b.status.contains('200')) {
          return false;
        }
      }
    }
    return true;
  }

  /// Move a file from [sourcePath] to [destinationPath]
  Future<HttpClientResponse> move(
    final String sourcePath,
    final String destinationPath, {
    final bool overwrite = false,
  }) =>
      _send(
        'MOVE',
        _constructPath(sourcePath),
        [200, 201, 204],
        headers: {
          'Destination': _constructPath(destinationPath),
          'Overwrite': overwrite ? 'T' : 'F',
        },
      );

  /// Copy a file from [sourcePath] to [destinationPath]
  Future<HttpClientResponse> copy(
    final String sourcePath,
    final String destinationPath, {
    final bool overwrite = false,
  }) =>
      _send(
        'COPY',
        _constructPath(sourcePath),
        [200, 201, 204],
        headers: {
          'Destination': _constructPath(destinationPath),
          'Overwrite': overwrite ? 'T' : 'F',
        },
      );
}

/// WebDAV server status.
class WebDavStatus {
  /// Creates a new WebDavStatus.
  WebDavStatus(
    this.capabilities,
    this.searchCapabilities,
  );

  /// DAV capabilities as advertised by the server in the 'dav' header.
  Set<String> capabilities;

  /// DAV search and locating capabilities as advertised by the server in the
  /// 'dasl' header.
  Set<String> searchCapabilities;
}
