part of '../neon_files.dart';

sealed class FilesTask {
  FilesTask({
    required this.path,
  });

  final List<String> path;

  @protected
  final streamController = StreamController<double>();

  /// Task progress in percent [0, 1].
  late final progress = streamController.stream.asBroadcastStream();
}

class FilesDownloadTask extends FilesTask {
  FilesDownloadTask({
    required super.path,
  });

  Future execute(final NextcloudClient client, final IOSink sink) async {
    final completer = Completer();

    final response = await client.webdav.getStream(path.join('/'));
    var downloaded = 0;

    response.listen((final chunk) async {
      sink.add(chunk);

      downloaded += chunk.length;
      streamController.add(downloaded / response.contentLength);

      if (downloaded >= response.contentLength) {
        completer.complete();
      }
    });

    return completer.future;
  }
}

class FilesUploadTask extends FilesTask {
  FilesUploadTask({
    required super.path,
    required this.size,
    required this.lastModified,
  });

  final int size;
  final DateTime lastModified;

  Future execute(final NextcloudClient client, final Stream<List<int>> stream) async {
    var uploaded = 0;
    await client.webdav.putStream(
      stream.map((final chunk) {
        uploaded += chunk.length;
        streamController.add(uploaded / size);

        return Uint8List.fromList(chunk);
      }),
      path.join('/'),
      lastModified: lastModified,
    );
  }
}
