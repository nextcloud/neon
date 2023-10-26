part of '../neon_files.dart';

abstract interface class FilesBlocEvents {
  void uploadFile(final List<String> path, final String localPath);

  void syncFile(final List<String> path);

  void openFile(final List<String> path, final String etag, final String? mimeType);

  void shareFileNative(final List<String> path, final String etag);

  void delete(final List<String> path);

  void rename(final List<String> path, final String name);

  void move(final List<String> path, final List<String> destination);

  void copy(final List<String> path, final List<String> destination);

  void addFavorite(final List<String> path);

  void removeFavorite(final List<String> path);
}

abstract interface class FilesBlocStates {
  BehaviorSubject<List<FilesTask>> get tasks;
}

class FilesBloc extends InteractiveBloc implements FilesBlocEvents, FilesBlocStates {
  FilesBloc(
    this.options,
    this.account,
  ) {
    options.uploadQueueParallelism.addListener(_uploadParallelismListener);
    options.downloadQueueParallelism.addListener(_downloadParallelismListener);
  }

  final FilesClientSpecificOptions options;
  final Account account;
  late final browser = getNewFilesBrowserBloc();

  final _uploadQueue = Queue();
  final _downloadQueue = Queue();

  @override
  void dispose() {
    _uploadQueue.dispose();
    _downloadQueue.dispose();
    unawaited(tasks.close());

    options.uploadQueueParallelism.removeListener(_uploadParallelismListener);
    options.downloadQueueParallelism.removeListener(_downloadParallelismListener);

    super.dispose();
  }

  @override
  BehaviorSubject<List<FilesTask>> tasks = BehaviorSubject<List<FilesTask>>.seeded([]);

  @override
  void addFavorite(final List<String> path) {
    wrapAction(
      () async => account.client.webdav.proppatch(
        Uri(pathSegments: path),
        set: WebDavProp(ocfavorite: 1),
      ),
    );
  }

  @override
  void copy(final List<String> path, final List<String> destination) {
    wrapAction(() async => account.client.webdav.copy(Uri(pathSegments: path), Uri(pathSegments: destination)));
  }

  @override
  void delete(final List<String> path) {
    wrapAction(() async => account.client.webdav.delete(Uri(pathSegments: path)));
  }

  @override
  void move(final List<String> path, final List<String> destination) {
    wrapAction(() async => account.client.webdav.move(Uri(pathSegments: path), Uri(pathSegments: destination)));
  }

  @override
  void openFile(final List<String> path, final String etag, final String? mimeType) {
    wrapAction(
      () async {
        final file = await _cacheFile(path, etag);

        final result = await OpenFile.open(file.path, type: mimeType);
        if (result.type != ResultType.done) {
          throw const UnableToOpenFileException();
        }
      },
      disableTimeout: true,
    );
  }

  @override
  void shareFileNative(final List<String> path, final String etag) {
    wrapAction(
      () async {
        final file = await _cacheFile(path, etag);

        await Share.shareXFiles([XFile(file.path)]);
      },
      disableTimeout: true,
    );
  }

  @override
  Future<void> refresh() async {
    await browser.refresh();
  }

  @override
  void removeFavorite(final List<String> path) {
    wrapAction(
      () async => account.client.webdav.proppatch(
        Uri(pathSegments: path),
        set: WebDavProp(ocfavorite: 0),
      ),
    );
  }

  @override
  void rename(final List<String> path, final String name) {
    wrapAction(
      () async => account.client.webdav.move(
        Uri(pathSegments: path),
        Uri(pathSegments: List.from(path)..last = name),
      ),
    );
  }

  @override
  void syncFile(final List<String> path) {
    wrapAction(
      () async {
        final file = File(
          p.join(
            await NeonPlatform.instance.userAccessibleAppDataPath,
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

  Future<File> _cacheFile(final List<String> path, final String etag) async {
    final cacheDir = await getApplicationCacheDirectory();
    final file = File(p.join(cacheDir.path, 'files', etag.replaceAll('"', ''), path.last));

    if (!file.existsSync()) {
      debugPrint('Downloading ${Uri(pathSegments: path)} since it does not exist');
      if (!file.parent.existsSync()) {
        await file.parent.create(recursive: true);
      }
      await _downloadFile(path, file);
    }

    return file;
  }

  Future<void> _downloadFile(
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

  FilesBrowserBloc getNewFilesBrowserBloc({
    final List<String>? initialPath,
  }) =>
      FilesBrowserBloc(
        options,
        account,
        initialPath: initialPath,
      );

  void _downloadParallelismListener() {
    _downloadQueue.parallel = options.downloadQueueParallelism.value;
  }

  void _uploadParallelismListener() {
    _uploadQueue.parallel = options.uploadQueueParallelism.value;
  }
}

@immutable
class UnableToOpenFileException extends NeonException {
  const UnableToOpenFileException();

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (final context) => FilesLocalizations.of(context).errorUnableToOpenFile,
      );
}
