// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:nextcloud/src/client.dart';
import 'package:nextcloud/src/webdav/csrf_client.dart';
import 'package:nextcloud/src/webdav/models.dart';
import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/props.dart';
import 'package:nextcloud/src/webdav/utils.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:nextcloud/utils.dart';
import 'package:universal_io/io.dart' show File, FileStat;

/// WebDavClient class
class WebDavClient {
  // ignore: public_member_api_docs
  WebDavClient(this.rootClient) : csrfClient = WebDavCSRFClient(rootClient);

  // ignore: public_member_api_docs
  final NextcloudClient rootClient;

  /// {@macro WebDavCSRFClient}
  // TODO: Fix this bug in server.
  final WebDavCSRFClient csrfClient;

  Uri _constructUri([PathUri? path]) => constructUri(rootClient.baseURL, path);

  /// Request to get the WebDAV capabilities of the server.
  ///
  /// See:
  ///   * [options] for a complete operation executing this request.
  http.BaseRequest options_Request() {
    final request = http.Request('OPTIONS', _constructUri());

    _addBaseHeaders(request);
    return request;
  }

  /// Gets the WebDAV capabilities of the server.
  ///
  /// See:
  ///  * [options_Request] for the request sent by this method.
  Future<WebDavOptions> options() async {
    final request = options_Request();

    final response = await csrfClient.send(request);
    return parseWebDavOptions(response.headers);
  }

  /// Request to create a collection at [path].
  ///
  /// See:
  ///   * [mkcol] for a complete operation executing this request.
  http.BaseRequest mkcol_Request(PathUri path) {
    final request = http.Request('MKCOL', _constructUri(path));

    _addBaseHeaders(request);
    return request;
  }

  /// Creates a collection at [path].
  ///
  /// See:
  ///  * http://www.webdav.org/specs/rfc2518.html#METHOD_MKCOL for more information.
  ///  * [mkcol_Request] for the request sent by this method.
  Future<http.StreamedResponse> mkcol(PathUri path) {
    final request = mkcol_Request(path);

    return csrfClient.send(request);
  }

  /// Request to delete the resource at [path].
  ///
  /// See:
  ///   * [delete] for a complete operation executing this request.
  http.BaseRequest delete_Request(PathUri path) {
    final request = http.Request('DELETE', _constructUri(path));

    _addBaseHeaders(request);
    return request;
  }

  /// Deletes the resource at [path].
  ///
  /// See:
  ///  * http://www.webdav.org/specs/rfc2518.html#METHOD_DELETE for more information.
  ///  * [delete_Request] for the request sent by this method.
  Future<http.StreamedResponse> delete(PathUri path) {
    final request = delete_Request(path);

    return csrfClient.send(request);
  }

  /// Request to put a new file at [path] with [localData] as content.
  ///
  /// See:
  ///   * [put] for a complete operation executing this request.
  http.BaseRequest put_Request(
    Uint8List localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
  }) {
    final request = http.Request('PUT', _constructUri(path))..bodyBytes = localData;

    _addUploadHeaders(
      request,
      lastModified: lastModified,
      created: created,
      contentLength: localData.length,
    );
    _addBaseHeaders(request);
    return request;
  }

  /// Puts a new file at [path] with [localData] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  ///   * [put_Request] for the request sent by this method.
  Future<http.StreamedResponse> put(
    Uint8List localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
  }) {
    final request = put_Request(
      localData,
      path,
      lastModified: lastModified,
      created: created,
    );

    return csrfClient.send(request);
  }

  /// Request to put a new file at [path] with [localData] as content.
  ///
  /// See:
  ///   * [putStream] for a complete operation executing this request.
  http.BaseRequest putStream_Request(
    Stream<List<int>> localData,
    PathUri path, {
    required int contentLength,
    DateTime? lastModified,
    DateTime? created,
    void Function(double progress)? onProgress,
  }) {
    final request = http.StreamedRequest('PUT', _constructUri(path));

    _addBaseHeaders(request);
    _addUploadHeaders(
      request,
      lastModified: lastModified,
      created: created,
      contentLength: contentLength,
    );

    if (onProgress != null) {
      var uploaded = 0;

      unawaited(
        localData.map((chunk) {
          uploaded += chunk.length;
          onProgress.call(uploaded / contentLength);
          return chunk;
        }).pipe(request.sink),
      );
    } else {
      unawaited(
        localData.pipe(request.sink),
      );
    }

    return request;
  }

  /// Puts a new file at [path] with [localData] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// [contentLength] sets the length of the [localData] that is uploaded.
  /// [onProgress] can be used to watch the upload progress. Possible values range from 0.0 to 1.0. [contentLength] needs to be set for it to work.
  ///
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  ///   * [putStream_Request] for the request sent by this method.
  Future<http.StreamedResponse> putStream(
    Stream<List<int>> localData,
    PathUri path, {
    required int contentLength,
    DateTime? lastModified,
    DateTime? created,
    void Function(double progress)? onProgress,
  }) {
    final request = putStream_Request(
      localData,
      path,
      lastModified: lastModified,
      created: created,
      contentLength: contentLength,
      onProgress: onProgress,
    );

    return csrfClient.send(request);
  }

  /// Request to put a new file at [path] with [file] as content.
  ///
  /// See:
  ///   * [putFile] for a complete operation executing this request.
  http.BaseRequest putFile_Request(
    File file,
    FileStat fileStat,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    void Function(double progress)? onProgress,
  }) {
    // Authentication and content-type headers are already set by the putStream_Request.
    // No need to set them here.
    return putStream_Request(
      file.openRead(),
      path,
      lastModified: lastModified,
      created: created,
      contentLength: fileStat.size,
      onProgress: onProgress,
    );
  }

  /// Puts a new file at [path] with [file] as content.
  ///
  /// [lastModified] sets the date when the file was last modified on the server.
  /// [created] sets the date when the file was created on the server.
  /// [onProgress] can be used to watch the upload progress. Possible values range from 0.0 to 1.0.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  ///   * [putFile_Request] for the request sent by this method.
  Future<http.StreamedResponse> putFile(
    File file,
    FileStat fileStat,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    void Function(double progress)? onProgress,
  }) {
    final request = putFile_Request(
      file,
      fileStat,
      path,
      lastModified: lastModified,
      created: created,
      onProgress: onProgress,
    );

    return csrfClient.send(request);
  }

  /// Request to get the content of the file at [path].
  ///
  /// See:
  ///   * [get], [getStream] and [getFile] for complete operations executing this request.
  http.BaseRequest get_Request(PathUri path) {
    final request = http.Request('GET', _constructUri(path));

    _addBaseHeaders(request);
    return request;
  }

  /// Gets the content of the file at [path].
  Future<Uint8List> get(PathUri path) async {
    final buffer = BytesBuilder(copy: false);

    await getStream(path).forEach(buffer.add);

    return buffer.toBytes();
  }

  /// Gets the content of the file at [path].
  Stream<List<int>> getStream(
    PathUri path, {
    void Function(double progress)? onProgress,
  }) {
    final request = get_Request(path);
    // ignore: discarded_futures
    final response = csrfClient.send(request);
    final controller = StreamController<List<int>>();

    unawaited(
      response.then(
        (response) {
          final contentLength = response.contentLength;
          var downloaded = 0;

          response.stream.listen(
            (chunk) async {
              controller.add(chunk);
              downloaded += chunk.length;
              if (contentLength != null) {
                onProgress?.call(downloaded / contentLength);
              }
            },
            onDone: () {
              onProgress?.call(1);
              controller.close();
            },
          );
        },
        // ignore: avoid_types_on_closure_parameters
        onError: (Object error) {
          controller.addError(error);
        },
      ),
    );

    return controller.stream;
  }

  /// Gets the content of the file at [path].
  ///
  /// If the response is empty the file will be created with no data.
  Future<void> getFile(
    PathUri path,
    File file, {
    void Function(double progress)? onProgress,
  }) async {
    final sink = file.openWrite();
    final stream = getStream(
      path,
      onProgress: onProgress,
    );
    await stream.pipe(sink);
    await sink.close();
  }

  /// Request to retrieve the props for the resource at [path].
  ///
  /// See:
  ///   * [propfind] for a complete operation executing this request.
  http.BaseRequest propfind_Request(
    PathUri path, {
    WebDavPropWithoutValues? prop,
    WebDavDepth? depth,
  }) {
    final request = http.Request('PROPFIND', _constructUri(path))
      ..encoding = utf8
      ..body = WebDavPropfind(prop: prop ?? const WebDavPropWithoutValues())
          .toXmlElement(namespaces: namespaces)
          .toXmlString();

    if (depth != null) {
      request.headers['Depth'] = depth.value;
    }

    _addBaseHeaders(request);
    return request;
  }

  /// Retrieves the props for the resource at [path].
  ///
  /// Optionally populates the given [prop]s on the returned resources.
  /// [depth] can be used to limit scope of the returned resources.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PROPFIND for more information.
  ///   * [propfind_Request] for the request sent by this method.
  Future<WebDavMultistatus> propfind(
    PathUri path, {
    WebDavPropWithoutValues? prop,
    WebDavDepth? depth,
  }) async {
    final request = propfind_Request(
      path,
      prop: prop,
      depth: depth,
    );

    final response = await csrfClient.send(request);
    return const WebDavResponseConverter().convert(response);
  }

  /// Request to run the filter-files report with the [filterRules] on the resource at [path].
  ///
  /// See:
  ///   * [report] for a complete operation executing this request.
  http.BaseRequest report_Request(
    PathUri path,
    WebDavOcFilterRules filterRules, {
    WebDavPropWithoutValues? prop,
  }) {
    final request = http.Request('REPORT', _constructUri(path))
      ..encoding = utf8
      ..body = WebDavOcFilterFiles(
        filterRules: filterRules,
        prop: prop ?? const WebDavPropWithoutValues(), // coverage:ignore-line
      ).toXmlElement(namespaces: namespaces).toXmlString();

    _addBaseHeaders(request);
    return request;
  }

  /// Runs the filter-files report with the [filterRules] on the resource at [path].
  ///
  /// Optionally populates the [prop]s on the returned resources.
  /// See:
  ///   * https://github.com/owncloud/docs/issues/359 for more information.
  ///   * [report_Request] for the request sent by this method.
  Future<WebDavMultistatus> report(
    PathUri path,
    WebDavOcFilterRules filterRules, {
    WebDavPropWithoutValues? prop,
  }) async {
    final request = report_Request(
      path,
      filterRules,
      prop: prop,
    );

    final response = await csrfClient.send(request);
    return const WebDavResponseConverter().convert(response);
  }

  /// Request to update the props of the resource at [path].
  ///
  /// See:
  ///   * [proppatch] for a complete operation executing this request.
  http.BaseRequest proppatch_Request(
    PathUri path, {
    WebDavProp? set,
    WebDavPropWithoutValues? remove,
  }) {
    final request = http.Request('PROPPATCH', _constructUri(path))
      ..encoding = utf8
      ..body = WebDavPropertyupdate(
        set: set != null ? WebDavSet(prop: set) : null,
        remove: remove != null ? WebDavRemove(prop: remove) : null,
      ).toXmlElement(namespaces: namespaces).toXmlString();

    _addBaseHeaders(request);
    return request;
  }

  /// Updates the props of the resource at [path].
  ///
  /// The props in [set] will be updated.
  /// The props in [remove] will be removed.
  /// Returns true if the update was successful.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PROPPATCH for more information.
  ///   * [proppatch_Request] for the request sent by this method.
  Future<bool> proppatch(
    PathUri path, {
    WebDavProp? set,
    WebDavPropWithoutValues? remove,
  }) async {
    final request = proppatch_Request(
      path,
      set: set,
      remove: remove,
    );

    final response = await csrfClient.send(request);
    final data = await const WebDavResponseConverter().convert(response);
    for (final a in data.responses) {
      for (final b in a.propstats) {
        if (!b.status.contains('200')) {
          return false;
        }
      }
    }
    return true;
  }

  /// Request to move the resource from [sourcePath] to [destinationPath].
  ///
  /// See:
  ///   * [move] for a complete operation executing this request.
  http.BaseRequest move_Request(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) {
    final request = http.Request('MOVE', _constructUri(sourcePath));

    _addCopyHeaders(
      request,
      destinationPath: destinationPath,
      overwrite: overwrite,
    );
    _addBaseHeaders(request);
    return request;
  }

  /// Moves the resource from [sourcePath] to [destinationPath].
  ///
  /// If [overwrite] is set any existing resource will be replaced.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_MOVE for more information.
  ///   * [move_Request] for the request sent by this method.
  Future<http.StreamedResponse> move(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) {
    final request = move_Request(
      sourcePath,
      destinationPath,
      overwrite: overwrite,
    );

    return csrfClient.send(request);
  }

  /// Request to copy the resource from [sourcePath] to [destinationPath].
  ///
  /// See:
  ///   * [copy] for a complete operation executing this request.
  http.BaseRequest copy_Request(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) {
    final request = http.Request('COPY', _constructUri(sourcePath));

    _addCopyHeaders(
      request,
      destinationPath: destinationPath,
      overwrite: overwrite,
    );
    _addBaseHeaders(request);
    return request;
  }

  /// Copies the resource from [sourcePath] to [destinationPath].
  ///
  /// If [overwrite] is set any existing resource will be replaced.
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_COPY for more information.
  ///   * [copy_Request] for the request sent by this method.
  Future<http.StreamedResponse> copy(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) {
    final request = copy_Request(
      sourcePath,
      destinationPath,
      overwrite: overwrite,
    );

    return csrfClient.send(request);
  }

  void _addBaseHeaders(http.BaseRequest request) {
    request.headers['content-type'] = 'application/xml';

    final authentication = rootClient.authentications?.firstOrNull;
    if (authentication != null) {
      request.headers.addAll(
        authentication.headers,
      );
    }
  }

  static void _addUploadHeaders(
    http.BaseRequest request, {
    required int contentLength,
    DateTime? lastModified,
    DateTime? created,
  }) {
    if (lastModified != null) {
      request.headers['X-OC-Mtime'] = lastModified.secondsSinceEpoch.toString();
    }
    if (created != null) {
      request.headers['X-OC-CTime'] = created.secondsSinceEpoch.toString();
    }
    request.headers['content-length'] = contentLength.toString();
  }

  void _addCopyHeaders(http.BaseRequest request, {required PathUri destinationPath, required bool overwrite}) {
    request.headers['Destination'] = _constructUri(destinationPath).toString();
    request.headers['Overwrite'] = overwrite ? 'T' : 'F';
  }
}
