part of '../app.dart';

class UploadTask {
  UploadTask({
    required this.path,
    required this.size,
    required this.lastModified,
  });

  final List<String> path;
  final int size;
  final DateTime lastModified;

  final _streamController = StreamController<int>();
  late final progress = _streamController.stream.asBroadcastStream();

  Future execute(final NextcloudClient client, final Stream<List<int>> stream) async {
    var uploaded = 0;
    await client.webdav.uploadStream(
      stream.map((final chunk) {
        uploaded += chunk.length;
        _streamController.add((uploaded / size * 100).toInt());

        return Uint8List.fromList(chunk);
      }),
      path.join('/'),
    );
  }
}
