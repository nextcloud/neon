import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/browser.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_files/src/utils/task.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_io/io.dart';

sealed class FilesBloc implements InteractiveBloc {
  @internal
  factory FilesBloc(
    FilesOptions options,
    Account account,
  ) =>
      _FilesBloc(
        options,
        account,
      );

  void uploadFile(PathUri uri, String localPath);

  void uploadMemory(PathUri uri, Uint8List bytes, {DateTime? lastModified});

  void openFile(PathUri uri, String etag, String? mimeType);

  void shareFileNative(PathUri uri, String etag, String? mimeType);

  void delete(PathUri uri);

  void rename(PathUri uri, String name);

  void move(PathUri uri, PathUri destination);

  void copy(PathUri uri, PathUri destination);

  void addFavorite(PathUri uri);

  void removeFavorite(PathUri uri);

  BehaviorSubject<BuiltList<FilesTask>> get tasks;

  FilesOptions get options;

  FilesBrowserBloc get browser;

  FilesBrowserBloc getNewFilesBrowserBloc({PathUri? initialUri, FilesBrowserMode? mode});
}

class _FilesBloc extends InteractiveBloc implements FilesBloc {
  _FilesBloc(
    this.options,
    this.account,
  ) {
    options.uploadQueueParallelism.addListener(uploadParallelismListener);
    options.downloadQueueParallelism.addListener(downloadParallelismListener);
  }

  @override
  final FilesOptions options;
  final Account account;
  @override
  late final browser = getNewFilesBrowserBloc();

  final uploadQueue = Queue();
  final downloadQueue = Queue();

  @override
  void dispose() {
    uploadQueue.dispose();
    downloadQueue.dispose();
    unawaited(tasks.close());

    options.uploadQueueParallelism.removeListener(uploadParallelismListener);
    options.downloadQueueParallelism.removeListener(downloadParallelismListener);

    super.dispose();
  }

  @override
  final tasks = BehaviorSubject.seeded(BuiltList());

  @override
  Future<void> addFavorite(PathUri uri) async {
    await wrapAction(
      () async => account.client.webdav.proppatch(
        uri,
        set: const WebDavProp(ocfavorite: 1),
      ),
    );
  }

  @override
  Future<void> copy(PathUri uri, PathUri destination) async {
    await wrapAction(() async => account.client.webdav.copy(uri, destination));
  }

  @override
  Future<void> delete(PathUri uri) async {
    await wrapAction(() async => account.client.webdav.delete(uri));
  }

  @override
  Future<void> move(PathUri uri, PathUri destination) async {
    await wrapAction(() async => account.client.webdav.move(uri, destination));
  }

  @override
  Future<void> openFile(PathUri uri, String etag, String? mimeType) async {
    await wrapAction(
      () async {
        if (NeonPlatform.instance.canUsePaths) {
          final file = await cacheFile(uri, etag);
          final result = await OpenFile.open(file.path, type: mimeType);
          if (result.type != ResultType.done) {
            throw const UnableToOpenFileException();
          }
        } else {
          final bytes = await downloadMemory(uri);
          await NeonPlatform.instance.saveFileWithPickDialog(uri.name, mimeType ?? 'application/octet-stream', bytes);
        }
      },
      disableTimeout: true,
    );
  }

  @override
  Future<void> shareFileNative(PathUri uri, String etag, String? mimeType) async {
    await wrapAction(
      () async {
        if (NeonPlatform.instance.canUsePaths) {
          final file = await cacheFile(uri, etag);
          await Share.shareXFiles([XFile(file.path)]);
        } else {
          throw UnimplementedError('Sharing is not supported on web');
        }
      },
      disableTimeout: true,
    );
  }

  @override
  Future<void> refresh() async {
    await browser.refresh();
  }

  @override
  Future<void> removeFavorite(PathUri uri) async {
    await wrapAction(
      () async => account.client.webdav.proppatch(
        uri,
        set: const WebDavProp(ocfavorite: 0),
      ),
    );
  }

  @override
  Future<void> rename(PathUri uri, String name) async {
    await wrapAction(
      () async => account.client.webdav.move(
        uri,
        uri.rename(name),
      ),
    );
  }

  @override
  Future<void> uploadFile(PathUri uri, String localPath) async {
    await wrapAction(
      () async {
        final task = FilesUploadTaskIO(
          uri: uri,
          file: File(localPath),
        );
        tasks.add(tasks.value.rebuild((b) => b.add(task)));
        await uploadQueue.add(() => task.execute(account.client));
        tasks.add(tasks.value.rebuild((b) => b.remove(task)));
      },
      disableTimeout: true,
    );
  }

  @override
  Future<void> uploadMemory(PathUri uri, Uint8List bytes, {DateTime? lastModified}) async {
    await wrapAction(
      () async {
        final task = FilesUploadTaskMemory(
          uri: uri,
          size: bytes.length,
          lastModified: lastModified,
          bytes: bytes,
        );
        tasks.add(tasks.value.rebuild((b) => b.add(task)));
        await uploadQueue.add(() => task.execute(account.client));
        tasks.add(tasks.value.rebuild((b) => b.remove(task)));
      },
      disableTimeout: true,
    );
  }

  Future<File> cacheFile(PathUri uri, String etag) async {
    final cacheDir = await getApplicationCacheDirectory();
    final file = File(p.join(cacheDir.path, 'files', etag.replaceAll('"', ''), uri.name));

    if (!file.existsSync()) {
      debugPrint('Downloading $uri since it does not exist');
      if (!file.parent.existsSync()) {
        await file.parent.create(recursive: true);
      }
      await downloadIO(uri, file);
    }

    return file;
  }

  Future<void> downloadIO(PathUri uri, File file) async {
    final task = FilesDownloadTaskIO(
      uri: uri,
      file: file,
    );

    tasks.add(tasks.value.rebuild((b) => b.add(task)));
    await downloadQueue.add(() => task.execute(account.client));
    tasks.add(tasks.value.rebuild((b) => b.remove(task)));
  }

  Future<Uint8List> downloadMemory(PathUri uri) async {
    final task = FilesDownloadTaskMemory(uri: uri);
    // We need to listen to the stream, otherwise it will get stuck.
    final future = task.stream.bytes;

    tasks.add(tasks.value.rebuild((b) => b.add(task)));
    await downloadQueue.add(() => task.execute(account.client));
    tasks.add(tasks.value.rebuild((b) => b.remove(task)));

    return future;
  }

  @override
  FilesBrowserBloc getNewFilesBrowserBloc({PathUri? initialUri, FilesBrowserMode? mode}) => FilesBrowserBloc(
        options,
        account,
        initialPath: initialUri,
        mode: mode,
      );

  void downloadParallelismListener() {
    downloadQueue.parallel = options.downloadQueueParallelism.value;
  }

  void uploadParallelismListener() {
    uploadQueue.parallel = options.uploadQueueParallelism.value;
  }
}

@immutable
class UnableToOpenFileException extends NeonException {
  const UnableToOpenFileException();

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (context) => FilesLocalizations.of(context).errorUnableToOpenFile,
      );
}
