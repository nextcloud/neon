part of '../neon_files.dart';

class DownloadTask {
  DownloadTask({
    required this.path,
  });

  final List<String> path;

  final _streamController = StreamController<int>();
  late final progress = _streamController.stream.asBroadcastStream();

  Future execute(final NextcloudClient client, final IOSink sink) async {
    final completer = Completer();

    final response = await client.webdav.downloadStream(path.join('/'));
    var downloaded = 0;

    response.listen((final chunk) async {
      sink.add(chunk);

      downloaded += chunk.length;
      _streamController.add((downloaded / response.contentLength * 100).toInt());

      if (downloaded >= response.contentLength) {
        completer.complete();
      }
    });

    return completer.future;
  }
}
