part of '../neon_files.dart';

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
  BehaviorSubject<List<FilesTask>> get tasks;
}

class FilesBloc extends InteractiveBloc implements FilesBlocEvents, FilesBlocStates {
  FilesBloc(
    this.options,
    this.account,
  ) {
    options.uploadQueueParallelism.addListener(_uploadParalelismListener);
    options.downloadQueueParallelism.addListener(_downloadParalelismListener);
  }

  final FilesAppSpecificOptions options;
  final Account account;
  late final browser = getNewFilesBrowserBloc();

  final _uploadQueue = Queue();
  final _downloadQueue = Queue();

  @override
  void dispose() {
    _uploadQueue.dispose();
    _downloadQueue.dispose();
    unawaited(tasks.close());

    options.uploadQueueParallelism.removeListener(_uploadParalelismListener);
    options.downloadQueueParallelism.removeListener(_downloadParalelismListener);
  }

  @override
  BehaviorSubject<List<FilesTask>> tasks = BehaviorSubject<List<FilesTask>>.seeded([]);

  @override
  void addFavorite(final List<String> path) {
    wrapAction(
      () async => account.client.webdav.proppatch(
        path.join('/'),
        set: WebDavProp(ocfavorite: 1),
      ),
    );
  }

  @override
  void copy(final List<String> path, final List<String> destination) {
    wrapAction(() async => account.client.webdav.copy(path.join('/'), destination.join('/')));
  }

  @override
  void delete(final List<String> path) {
    wrapAction(() async => account.client.webdav.delete(path.join('/')));
  }

  @override
  void move(final List<String> path, final List<String> destination) {
    wrapAction(() async => account.client.webdav.move(path.join('/'), destination.join('/')));
  }

  @override
  void openFile(final List<String> path, final String etag, final String? mimeType) {
    wrapAction(
      () async {
        final file = File(
          p.join(
            await NeonPlatform.instance.getApplicationCachePath(),
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
        final result = await OpenFile.open(file.path, type: mimeType);
        if (result.type != ResultType.done) {
          throw UnableToOpenFileException();
        }
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
      () async => account.client.webdav.proppatch(
        path.join('/'),
        set: WebDavProp(ocfavorite: 0),
      ),
    );
  }

  @override
  void rename(final List<String> path, final String name) {
    wrapAction(
      () async => account.client.webdav.move(
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
            await NeonPlatform.instance.getUserAccessibleAppDataPath(),
            account.humanReadableID,
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
        final task = FilesUploadTask(
          path: path,
          file: File(localPath),
        );
        tasks.add(tasks.value..add(task));
        await _uploadQueue.add(() => task.execute(account.client));
        tasks.add(tasks.value..remove(task));
      },
      disableTimeout: true,
    );
  }

  Future _downloadFile(
    final List<String> path,
    final File file,
  ) async {
    final task = FilesDownloadTask(
      path: path,
      file: file,
    );
    tasks.add(tasks.value..add(task));
    await _downloadQueue.add(() => task.execute(account.client));
    tasks.add(tasks.value..remove(task));
  }

  FilesBrowserBloc getNewFilesBrowserBloc() => FilesBrowserBloc(options, account);

  void _downloadParalelismListener() {
    _downloadQueue.parallel = options.downloadQueueParallelism.value;
  }

  void _uploadParalelismListener() {
    _uploadQueue.parallel = options.uploadQueueParallelism.value;
  }
}
