import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';
import 'package:nextcloud/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

typedef ChunkedUpload = ({String token, PathUri destination});

class ChunkedUploadClient {
  ChunkedUploadClient(
    NextcloudClient rootClient,
    String username,
  )   : _username = username,
        _webDavClient = WebDavClient(
          rootClient,
          endpoint: 'remote.php/dav/uploads/$username',
        );

  final WebDavClient _webDavClient;
  final String _username;

  Future<ChunkedUpload> start(PathUri path) async {
    final destination = PathUri.parse('/remote.php/dav/files/$_username/').join(path);
    final token = _uuid.v7();

    final streamedResponse = await _webDavClient.mkcol(
      PathUri.parse(token),
      headers: {
        'Destination': destination.toString(),
      },
    );
    if (streamedResponse.statusCode != 201) {
      final response = await http.Response.fromStream(streamedResponse);

      throw DynamiteStatusCodeException(response);
    }

    return (
      token: token,
      destination: destination,
    );
  }

  Future<void> uploadChunk(
    ChunkedUpload chunkedUpload,
    int index,
    Uint8List chunk,
    int totalLength,
  ) async {
    assert(
      index >= 1 && index <= 10000,
      'Index must be a number between 1 and 10000',
    );
    assert(
      chunk.lengthInBytes >= 5 * pow(1024, 2) && chunk.lengthInBytes <= 5 * pow(1024, 3),
      'Chunk size must be between 5MB and 5GB',
    );

    final streamedResponse = await _webDavClient.put(
      chunk,
      PathUri.parse('${chunkedUpload.token}/$index'),
      headers: {
        'Destination': chunkedUpload.destination.toString(),
        'OC-Total-Length': totalLength.toString(),
      },
    );
    if (streamedResponse.statusCode != 201) {
      final response = await http.Response.fromStream(streamedResponse);

      throw DynamiteStatusCodeException(response);
    }
  }

  Future<void> assembleChunks(
    ChunkedUpload chunkedUpload,
    int totalLength, {
    DateTime? lastModified,
    DateTime? created,
  }) async {
    final request = http.Request(
      'MOVE',
      constructUri(
        _webDavClient.rootClient.baseURL,
        'remote.php/dav/uploads/$_username',
        PathUri.parse('${chunkedUpload.token}/.file'),
      ),
    );
    request.headers.addAll({
      'Destination': chunkedUpload.destination.toString(),
      'OC-Total-Length': totalLength.toString(),
      if (lastModified != null) 'X-OC-Mtime': lastModified.secondsSinceEpoch.toString(),
      if (created != null) 'X-OC-CTime': created.secondsSinceEpoch.toString(),
    });

    final streamedResponse = await _webDavClient.csrfClient.send(request);
    if (streamedResponse.statusCode != 201) {
      final response = await http.Response.fromStream(streamedResponse);

      throw DynamiteStatusCodeException(response);
    }
  }
}
