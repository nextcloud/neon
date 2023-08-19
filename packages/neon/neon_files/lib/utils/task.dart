part of '../neon_files.dart';

sealed class FilesTask {
  FilesTask({
    required this.path,
    required this.file,
  });

  final List<String> path;

  final File file;

  @protected
  final streamController = StreamController<double>();

  /// Task progress in percent [0, 1].
  late final progress = streamController.stream.asBroadcastStream();
}

class FilesDownloadTask extends FilesTask {
  FilesDownloadTask({
    required super.path,
    required super.file,
  });

  Future execute(final NextcloudClient client) async {
    await client.webdav.getFile(
      path.join('/'),
      file,
      onProgress: (final progress) {
        streamController.add(progress);
      },
    );
  }
}

class FilesUploadTask extends FilesTask {
  FilesUploadTask({
    required super.path,
    required super.file,
  });

  FileStat? _stat;
  FileStat get stat => _stat ??= file.statSync();

  Future execute(final NextcloudClient client) async {
    await client.webdav.putFile(
      file,
      stat,
      path.join('/'),
      lastModified: stat.modified,
      onProgress: (final progress) {
        streamController.add(progress);
      },
    );
  }
}
