import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/props.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:universal_io/io.dart';

/// Base path used on the server
final webdavBase = PathUri.parse('/remote.php/webdav');

/// WebDavClient class
class WebDavClient {
  // ignore: public_member_api_docs
  WebDavClient(this.rootClient);

  // ignore: public_member_api_docs
  final DynamiteClient rootClient;

  Future<HttpClientResponse> _send(
    String method,
    Uri url, {
    Stream<Uint8List>? dataStream,
    Uint8List? data,
    Map<String, String>? headers,
  }) async {
    assert(dataStream == null || data == null, 'Only one of dataStream or data can be specified.');

    final request = await rootClient.httpClient.openUrl(method, url)
      ..persistentConnection = true;

    request.headers.addAll({
      HttpHeaders.contentTypeHeader: 'application/xml',
      ...?rootClient.baseHeaders,
      ...?headers,
      ...?rootClient.authentications.firstOrNull?.headers,
    });

    if (data != null) {
      request.add(data);
    }
    if (dataStream != null) {
      await request.addStream(dataStream);
    }

    final response = await request.close();

    if (response.statusCode > 299) {
      throw DynamiteApiException(
        response.statusCode,
        response.responseHeaders,
        await response.string,
      );
    }

    return response;
  }

  Uri _constructUri([PathUri? path]) => constructUri(rootClient.baseURL, path);

  @visibleForTesting
  // ignore: public_member_api_docs
  static Uri constructUri(Uri baseURL, [PathUri? path]) {
    final segments = baseURL.pathSegments.toList()..addAll(webdavBase.pathSegments);
    if (path != null) {
      segments.addAll(path.pathSegments);
    }
    return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
  }

  Future<WebDavMultistatus> _parseResponse(HttpClientResponse response) async =>
      WebDavMultistatus.fromXmlElement(await response.xml);

  Map<String, String> _getUploadHeaders({
    required DateTime? lastModified,
    required DateTime? created,
    required int? contentLength,
  }) =>
      {
        if (lastModified != null) 'X-OC-Mtime': (lastModified.millisecondsSinceEpoch ~/ 1000).toString(),
        if (created != null) 'X-OC-CTime': (created.millisecondsSinceEpoch ~/ 1000).toString(),
        if (contentLength != null) HttpHeaders.contentLengthHeader: contentLength.toString(),
      };

  /// Gets the WebDAV capabilities of the server.
  Future<WebDavOptions> options() async {
    final response = await _send(
      'OPTIONS',
      _constructUri(),
    );

    final davCapabilities = response.headers['dav']?.first;
    final davSearchCapabilities = response.headers['dasl']?.first;
    return WebDavOptions(
      davCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
      davSearchCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
    );
  }

  /// Creates a collection at [path].
  ///
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_MKCOL for more information.
  Future<HttpClientResponse> mkcol(PathUri path) async => _send(
        'MKCOL',
        _constructUri(path),
      );

  /// Deletes the resource at [path].
  ///
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_DELETE for more information.
  Future<HttpClientResponse> delete(PathUri path) => _send(
        'DELETE',
        _constructUri(path),
      );

  /// Puts a new file at [path] with [localData] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  Future<HttpClientResponse> put(
    Uint8List localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
  }) =>
      _send(
        'PUT',
        _constructUri(path),
        data: localData,
        headers: _getUploadHeaders(
          lastModified: lastModified,
          created: created,
          contentLength: localData.length,
        ),
      );

  /// Puts a new file at [path] with [localData] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// [contentLength] sets the length of the [localData] that is uploaded.
  /// [onProgress] can be used to watch the upload progress. Possible values range from 0.0 to 1.0. [contentLength] needs to be set for it to work.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  Future<HttpClientResponse> putStream(
    Stream<Uint8List> localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    int? contentLength,
    void Function(double progress)? onProgress,
  }) async {
    var uploaded = 0;
    return _send(
      'PUT',
      _constructUri(path),
      dataStream: contentLength != null
          ? localData.map((chunk) {
              uploaded += chunk.length;
              onProgress?.call(uploaded / contentLength);
              return chunk;
            })
          : localData,
      headers: _getUploadHeaders(
        lastModified: lastModified,
        created: created,
        contentLength: contentLength,
      ),
    );
  }

  /// Puts a new file at [path] with [file] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// [onProgress] can be used to watch the upload progress. Possible values range from 0.0 to 1.0.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  Future<HttpClientResponse> putFile(
    File file,
    FileStat fileStat,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    void Function(double progress)? onProgress,
  }) async =>
      putStream(
        file.openRead().cast<Uint8List>(),
        path,
        lastModified: lastModified,
        created: created,
        contentLength: fileStat.size,
        onProgress: onProgress,
      );

  /// Gets the content of the file at [path].
  Future<Uint8List> get(PathUri path) async => (await getStream(path)).bytes;

  /// Gets the content of the file at [path].
  Future<HttpClientResponse> getStream(PathUri path) async => _send(
        'GET',
        _constructUri(path),
      );

  /// Gets the content of the file at [path].
  Future<void> getFile(
    PathUri path,
    File file, {
    void Function(double progress)? onProgress,
  }) async {
    final sink = file.openWrite();
    final response = await getStream(path);
    if (response.contentLength > 0) {
      final completer = Completer<void>();
      var downloaded = 0;

      response.listen((chunk) async {
        sink.add(chunk);
        downloaded += chunk.length;
        onProgress?.call(downloaded / response.contentLength);
        if (downloaded >= response.contentLength) {
          completer.complete();
        }
      });
      await completer.future;
    }

    await sink.close();
  }

  /// Retrieves the props for the resource at [path].
  ///
  /// Optionally populates the given [prop]s on the returned resources.
  /// [depth] can be used to limit scope of the returned resources.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_PROPFIND for more information.
  Future<WebDavMultistatus> propfind(
    PathUri path, {
    WebDavPropWithoutValues? prop,
    WebDavDepth? depth,
  }) async =>
      _parseResponse(
        await _send(
          'PROPFIND',
          _constructUri(path),
          data: utf8.encode(
            WebDavPropfind(prop: prop ?? WebDavPropWithoutValues()).toXmlElement(namespaces: namespaces).toXmlString(),
          ),
          headers: depth != null ? {'Depth': depth.value} : null,
        ),
      );

  /// Runs the filter-files report with the [filterRules] on the resource at [path].
  ///
  /// Optionally populates the [prop]s on the returned resources.
  /// See https://github.com/owncloud/docs/issues/359 for more information.
  Future<WebDavMultistatus> report(
    PathUri path,
    WebDavOcFilterRules filterRules, {
    WebDavPropWithoutValues? prop,
  }) async =>
      _parseResponse(
        await _send(
          'REPORT',
          _constructUri(path),
          data: utf8.encode(
            WebDavOcFilterFiles(
              filterRules: filterRules,
              prop: prop ?? WebDavPropWithoutValues(), // coverage:ignore-line
            ).toXmlElement(namespaces: namespaces).toXmlString(),
          ),
        ),
      );

  /// Updates the props of the resource at [path].
  ///
  /// The props in [set] will be updated.
  /// The props in [remove] will be removed.
  /// Returns true if the update was successful.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_PROPPATCH for more information.
  Future<bool> proppatch(
    PathUri path, {
    WebDavProp? set,
    WebDavPropWithoutValues? remove,
  }) async {
    final response = await _send(
      'PROPPATCH',
      _constructUri(path),
      data: utf8.encode(
        WebDavPropertyupdate(
          set: set != null ? WebDavSet(prop: set) : null,
          remove: remove != null ? WebDavRemove(prop: remove) : null,
        ).toXmlElement(namespaces: namespaces).toXmlString(),
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

  /// Moves the resource from [sourcePath] to [destinationPath].
  ///
  /// If [overwrite] is set any existing resource will be replaced.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_MOVE for more information.
  Future<HttpClientResponse> move(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) =>
      _send(
        'MOVE',
        _constructUri(sourcePath),
        headers: {
          'Destination': _constructUri(destinationPath).toString(),
          'Overwrite': overwrite ? 'T' : 'F',
        },
      );

  /// Copies the resource from [sourcePath] to [destinationPath].
  ///
  /// If [overwrite] is set any existing resource will be replaced.
  /// See http://www.webdav.org/specs/rfc2518.html#METHOD_COPY for more information.
  Future<HttpClientResponse> copy(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) =>
      _send(
        'COPY',
        _constructUri(sourcePath),
        headers: {
          'Destination': _constructUri(destinationPath).toString(),
          'Overwrite': overwrite ? 'T' : 'F',
        },
      );
}

/// WebDAV capabilities
class WebDavOptions {
  /// Creates a new WebDavStatus.
  WebDavOptions(
    Set<String>? capabilities,
    Set<String>? searchCapabilities,
  )   : capabilities = capabilities ?? {},
        searchCapabilities = searchCapabilities ?? {};

  /// DAV capabilities as advertised by the server in the 'dav' header.
  Set<String> capabilities;

  /// DAV search and locating capabilities as advertised by the server in the 'dasl' header.
  Set<String> searchCapabilities;
}

/// Depth used for [WebDavClient.propfind].
///
/// See http://www.webdav.org/specs/rfc2518.html#HEADER_Depth for more information.
enum WebDavDepth {
  /// Returns props of the resource.
  zero('0'),

  /// Returns props of the resource and its immediate children.
  ///
  /// Only works on collections and returns the same as [WebDavDepth.zero] for other resources.
  one('1'),

  /// Returns props of the resource and all its progeny.
  ///
  /// Only works on collections and returns the same as [WebDavDepth.zero] for other resources.
  infinity('infinity');

  const WebDavDepth(this.value);

  // ignore: public_member_api_docs
  final String value;
}
