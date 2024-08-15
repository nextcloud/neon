import 'dart:async';
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/webdav.dart' as webdav;
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart';

sealed class FilesTask {
  FilesTask({
    required this.uri,
  });

  final webdav.PathUri uri;

  @protected
  final progressController = StreamController<double>();

  /// Task progress in percent `[0, 1]`.
  late final progress = progressController.stream.asBroadcastStream();
}

sealed class FilesDownloadTask extends FilesTask {
  FilesDownloadTask({
    required super.uri,
  });
}

sealed class FilesUploadTask extends FilesTask {
  FilesUploadTask({
    required super.uri,
    required this.size,
    required this.lastModified,
  });

  final int? size;

  final tz.TZDateTime? lastModified;
}

sealed class FilesTaskIO extends FilesTask {
  FilesTaskIO({
    required this.file,
    required super.uri,
  });

  final File file;
}

sealed class FilesTaskMemory extends FilesTask {
  FilesTaskMemory({
    required super.uri,
  });

  final _stream = StreamController<List<int>>();

  Stream<List<int>> get stream => _stream.stream;

  void add(Uint8List chunk) => _stream.add(chunk);
}

class FilesDownloadTaskIO extends FilesTaskIO implements FilesDownloadTask {
  FilesDownloadTaskIO({
    required super.uri,
    required super.file,
  });

  Future<void> execute(NextcloudClient client) async {
    await client.webdav.getFile(
      uri,
      file,
      onProgress: progressController.add,
    );
    await progressController.close();
  }
}

class FilesUploadTaskIO extends FilesTaskIO implements FilesUploadTask {
  FilesUploadTaskIO({
    required super.uri,
    required super.file,
  });

  late final FileStat _stat = file.statSync();

  @override
  late int size = _stat.size;

  @override
  late tz.TZDateTime lastModified = tz.TZDateTime.from(_stat.modified, tz.UTC);

  Future<void> execute(NextcloudClient client) async {
    await client.webdav.putFile(
      file,
      _stat,
      uri,
      lastModified: _stat.modified,
      onProgress: progressController.add,
    );
    await progressController.close();
  }
}

class FilesDownloadTaskMemory extends FilesTaskMemory implements FilesDownloadTask {
  FilesDownloadTaskMemory({
    required super.uri,
  });

  Future<void> execute(NextcloudClient client) async {
    final stream = client.webdav.getStream(
      uri,
      onProgress: progressController.add,
    );
    await stream.pipe(_stream);
    await progressController.close();
  }
}

class FilesUploadTaskMemory extends FilesTaskMemory implements FilesUploadTask {
  FilesUploadTaskMemory({
    required super.uri,
    required this.size,
    required this.lastModified,
    required List<int> bytes,
  }) {
    unawaited(Stream.value(bytes).pipe(_stream));
  }

  @override
  final int size;

  @override
  final tz.TZDateTime? lastModified;

  Future<void> execute(NextcloudClient client) async {
    await client.webdav.putStream(
      _stream.stream,
      uri,
      lastModified: lastModified,
      contentLength: size,
      onProgress: progressController.add,
    );
    await progressController.close();
  }
}
