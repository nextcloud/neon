part of '../app.dart';

abstract class FilesBlocEvents {
  void uploadFile(final List<String> path, final String localPath);

  void syncFile(final List<String> path);

  void openFile(final List<String> path, final String etag, final String? mimeType);

  void delete(final List<String> path);

  void rename(final List<String> path, final String name);

  void move(final List<String> path, final List<String> destination);

  void copy(final List<String> path, final List<String> destination);

  void addFavorite(final List<String> path);

  void removeFavorite(final List<String> path);
}

abstract class FilesBlocStates {
  BehaviorSubject<List<UploadTask>> get uploadTasks;

  BehaviorSubject<List<DownloadTask>> get downloadTasks;
}

class FilesBloc extends InteractiveBloc implements FilesBlocEvents, FilesBlocStates {
  FilesBloc(
    this.options,
    this.client,
    this._platform,
  ) {
    options.uploadQueueParallelism.stream.listen((final value) {
      _uploadQueue.parallel = value;
    });
    options.downloadQueueParallelism.stream.listen((final value) {
      _downloadQueue.parallel = value;
    });
  }

  final FilesAppSpecificOptions options;
  final NextcloudClient client;
  final NeonPlatform _platform;
  late final browser = getNewFilesBrowserBloc();

  final _uploadQueue = Queue();
  final _downloadQueue = Queue();

  @override
  void dispose() {
    _uploadQueue.dispose();
    _downloadQueue.dispose();
    unawaited(uploadTasks.close());
    unawaited(downloadTasks.close());
  }

  @override
  BehaviorSubject<List<UploadTask>> uploadTasks = BehaviorSubject<List<UploadTask>>.seeded([]);

  @override
  BehaviorSubject<List<DownloadTask>> downloadTasks = BehaviorSubject<List<DownloadTask>>.seeded([]);

  @override
  void addFavorite(final List<String> path) {
    wrapAction(() async => client.webdav.updateProps(path.join('/'), {WebDavProps.ocFavorite.name: '1'}));
  }

  @override
  void copy(final List<String> path, final List<String> destination) {
    wrapAction(() async => client.webdav.copy(path.join('/'), destination.join('/')));
  }

  @override
  void delete(final List<String> path) {
    wrapAction(() async => client.webdav.delete(path.join('/')));
  }

  @override
  void move(final List<String> path, final List<String> destination) {
    wrapAction(() async => client.webdav.move(path.join('/'), destination.join('/')));
  }

  @override
  void openFile(final List<String> path, final String etag, final String? mimeType) {
    wrapAction(
      () async {
        final file = File(
          p.join(
            await _platform.getApplicationCachePath(),
            'files',
            etag.replaceAll('"', ''),
            path.last,
          ),
        );
        if (!file.existsSync()) {
          debugPrint('Downloading ${path.join('/')} since it does not exist');
          if (!file.parent.existsSync()) {
            await file.parent.create(recursive: true);
          }
          await _downloadFile(path, file);
        }
        await OpenFile.open(file.path, type: mimeType);
      },
      disableTimeout: true,
    );
  }

  @override
  Future refresh() async {
    await browser.refresh();
  }

  @override
  void removeFavorite(final List<String> path) {
    wrapAction(
      () async => client.webdav.updateProps(
        path.join('/'),
        {WebDavProps.ocFavorite.name: '0'},
      ),
    );
  }

  @override
  void rename(final List<String> path, final String name) {
    wrapAction(
      () async => client.webdav.move(
        path.join('/'),
        (path.sublist(0, path.length - 1)..add(name)).join('/'),
      ),
    );
  }

  @override
  void syncFile(final List<String> path) {
    wrapAction(
      () async {
        final file = File(
          p.join(
            await _platform.getUserAccessibleAppDataPath(),
            client.humanReadableID,
            'files',
            path.join(Platform.pathSeparator),
          ),
        );
        if (!file.parent.existsSync()) {
          file.parent.createSync(recursive: true);
        }
        await _downloadFile(path, file);
      },
      disableTimeout: true,
    );
  }

  @override
  void uploadFile(final List<String> path, final String localPath) {
    wrapAction(
      () async {
        final file = File(localPath);
        // ignore: avoid_slow_async_io
        final stat = await file.stat();
        final task = UploadTask(
          path: path,
          size: stat.size,
          lastModified: stat.modified,
        );
        uploadTasks.add(uploadTasks.value..add(task));
        await _uploadQueue.add(() => task.execute(client, file.openRead()));
        uploadTasks.add(uploadTasks.value..removeWhere((final t) => t == task));
      },
      disableTimeout: true,
    );
  }

  Future _downloadFile(
    final List<String> path,
    final File file,
  ) async {
    final sink = file.openWrite();
    try {
      final task = DownloadTask(
        path: path,
      );
      downloadTasks.add(downloadTasks.value..add(task));
      await _downloadQueue.add(() => task.execute(client, sink));
      downloadTasks.add(downloadTasks.value..removeWhere((final t) => t == task));
    } finally {
      await sink.close();
    }
  }

  FilesBrowserBloc getNewFilesBrowserBloc() => FilesBrowserBloc(options, client);
}
