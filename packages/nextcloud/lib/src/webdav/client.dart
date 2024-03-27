// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/src/webdav/models.dart';
import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/props.dart';
import 'package:nextcloud/src/webdav/utils.dart';
import 'package:nextcloud/src/webdav/webdav.dart';
import 'package:nextcloud/utils.dart';
import 'package:universal_io/io.dart' hide HttpClient;

// ignore: do_not_use_environment
const bool _kIsWeb = bool.fromEnvironment('dart.library.js_util');

/// WebDavClient class
class WebDavClient {
  // ignore: public_member_api_docs
  WebDavClient(this.rootClient);

  // ignore: public_member_api_docs
  final DynamiteClient rootClient;

  String? _token;

  Future<http.StreamedResponse> _send(
    http.BaseRequest request,
  ) async {
    final authentication = rootClient.authentications?.firstOrNull;
    if (authentication != null) {
      request.headers.addAll(
        authentication.headers,
      );
    }

    request.headers[HttpHeaders.contentTypeHeader] = 'application/xml';

    // On web we need to send a CSRF token because we also send the cookies.  In theory this should not be required as
    // long as we send the OCS-APIRequest header, but the server has a bug that only triggers when you also send the
    // cookies. On non-web platforms we don't send the cookies so we are fine, but on web the browser always does it
    // and therefore we need this workaround.
    // TODO: Fix this bug in server.
    if (_kIsWeb) {
      if (_token == null) {
        final response = await rootClient.get(Uri.parse('${rootClient.baseURL}/index.php'));
        if (response.statusCode >= 300) {
          throw DynamiteStatusCodeException(
            response.statusCode,
          );
        }

        _token = RegExp('data-requesttoken="([^"]*)"').firstMatch(response.body)!.group(1);
      }

      request.headers.addAll({
        'OCS-APIRequest': 'true',
        'requesttoken': _token!,
      });
    }

    final response = await rootClient.send(request);

    if (response.statusCode >= 300) {
      throw DynamiteStatusCodeException(
        response.statusCode,
      );
    }

    return response;
  }

  Uri _constructUri([PathUri? path]) => constructUri(rootClient.baseURL, path);

  Future<WebDavMultistatus> _parseResponse(http.StreamedResponse response) async =>
      WebDavMultistatus.fromXmlElement(await response.stream.xml);

  Map<String, String> _getUploadHeaders({
    required DateTime? lastModified,
    required DateTime? created,
    required int? contentLength,
  }) =>
      {
        if (lastModified != null) 'X-OC-Mtime': lastModified.secondsSinceEpoch.toString(),
        if (created != null) 'X-OC-CTime': created.secondsSinceEpoch.toString(),
        if (contentLength != null) HttpHeaders.contentLengthHeader: contentLength.toString(),
      };

  /// Request to get the WebDAV capabilities of the server.
  ///
  /// See:
  ///   * [options] for a complete operation executing this request.
  http.BaseRequest options_Request() {
    return http.Request('OPTIONS', _constructUri());
  }

  /// Gets the WebDAV capabilities of the server.
  ///
  /// See:
  ///  * [options_Request] for the request sent by this method.
  Future<WebDavOptions> options() async {
    final request = options_Request();

    final response = await _send(
      request,
    );

    return parseWebDavOptions(response.headers);
  }

  /// Request to create a collection at [path].
  ///
  /// See:
  ///   * [mkcol] for a complete operation executing this request.
  http.BaseRequest mkcol_Request(PathUri path) {
    return http.Request('MKCOL', _constructUri(path));
  }

  /// Creates a collection at [path].
  ///
  /// See:
  ///  * http://www.webdav.org/specs/rfc2518.html#METHOD_MKCOL for more information.
  ///  * [mkcol_Request] for the request sent by this method.
  Future<http.StreamedResponse> mkcol(PathUri path) {
    final request = mkcol_Request(path);

    return _send(request);
  }

  /// Request to delete the resource at [path].
  ///
  /// See:
  ///   * [delete] for a complete operation executing this request.
  http.BaseRequest delete_Request(PathUri path) {
    return http.Request('DELETE', _constructUri(path));
  }

  /// Deletes the resource at [path].
  ///
  /// See:
  ///  * http://www.webdav.org/specs/rfc2518.html#METHOD_DELETE for more information.
  ///  * [delete_Request] for the request sent by this method.
  Future<http.StreamedResponse> delete(PathUri path) {
    final request = delete_Request(path);

    return _send(request);
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
    final headers = _getUploadHeaders(
      lastModified: lastModified,
      created: created,
      contentLength: localData.length,
    );

    return http.Request('PUT', _constructUri(path))
      ..bodyBytes = localData
      ..headers.addAll(headers);
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

    return _send(request);
  }

  /// Request to put a new file at [path] with [localData] as content.
  ///
  /// See:
  ///   * [putStream] for a complete operation executing this request.
  http.BaseRequest putStream_Request(
    Stream<List<int>> localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    int? contentLength,
    void Function(double progress)? onProgress,
  }) {
    final headers = _getUploadHeaders(
      lastModified: lastModified,
      created: created,
      contentLength: contentLength,
    );

    final request = http.StreamedRequest('PUT', _constructUri(path))..headers.addAll(headers);

    if (contentLength != null && onProgress != null) {
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
  /// See:
  ///   * http://www.webdav.org/specs/rfc2518.html#METHOD_PUT for more information.
  ///   * [putStream_Request] for the request sent by this method.
  Future<http.StreamedResponse> putStream(
    Stream<List<int>> localData,
    PathUri path, {
    DateTime? lastModified,
    DateTime? created,
    int? contentLength,
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

    return _send(request);
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

    return _send(request);
  }

  /// Request to get the content of the file at [path].
  ///
  /// See:
  ///   * [get], [getStream] and [getFile] for complete operations executing this request.
  http.BaseRequest get_Request(PathUri path) {
    return http.Request('GET', _constructUri(path));
  }

  /// Gets the content of the file at [path].
  Future<Uint8List> get(PathUri path) async => getStream(path).bytes;

  /// Gets the content of the file at [path].
  Stream<List<int>> getStream(
    PathUri path, {
    void Function(double progress)? onProgress,
  }) {
    final request = get_Request(path);
    // ignore: discarded_futures
    final response = _send(request);
    final controller = StreamController<List<int>>();

    unawaited(
      response.then(
        (response) async {
          final contentLength = response.contentLength;
          if (contentLength == null || contentLength <= 0) {
            onProgress?.call(1);
          } else {
            final completer = Completer<void>();
            var downloaded = 0;

            response.stream.listen((chunk) async {
              controller.add(chunk);
              downloaded += chunk.length;
              onProgress?.call(downloaded / contentLength);
              if (downloaded >= contentLength) {
                completer.complete();
              }
            });
            await completer.future;
          }
          await controller.close();
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

    final response = await _send(request);
    return _parseResponse(response);
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
    return http.Request('REPORT', _constructUri(path))
      ..encoding = utf8
      ..body = WebDavOcFilterFiles(
        filterRules: filterRules,
        prop: prop ?? const WebDavPropWithoutValues(), // coverage:ignore-line
      ).toXmlElement(namespaces: namespaces).toXmlString();
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

    final response = await _send(request);
    return _parseResponse(response);
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
    return http.Request('PROPPATCH', _constructUri(path))
      ..encoding = utf8
      ..body = WebDavPropertyupdate(
        set: set != null ? WebDavSet(prop: set) : null,
        remove: remove != null ? WebDavRemove(prop: remove) : null,
      ).toXmlElement(namespaces: namespaces).toXmlString();
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

    final response = await _send(request);
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

  /// Request to move the resource from [sourcePath] to [destinationPath].
  ///
  /// See:
  ///   * [move] for a complete operation executing this request.
  http.BaseRequest move_Request(
    PathUri sourcePath,
    PathUri destinationPath, {
    bool overwrite = false,
  }) {
    return http.Request('MOVE', _constructUri(sourcePath))
      ..headers['Destination'] = _constructUri(destinationPath).toString()
      ..headers['Overwrite'] = overwrite ? 'T' : 'F';
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

    return _send(request);
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
    return http.Request('COPY', _constructUri(sourcePath))
      ..headers['Destination'] = _constructUri(destinationPath).toString()
      ..headers['Overwrite'] = overwrite ? 'T' : 'F';
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

    return _send(request);
  }
}
