import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:files_app/l10n/localizations.dart';
import 'package:files_app/src/options.dart';
import 'package:files_app/src/utils/task.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/webdav.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart';

sealed class FilesBloc implements InteractiveBloc {
  factory FilesBloc({
    required FilesOptions options,
    required Account account,
  }) = _FilesBloc;

  void uploadFile(PathUri uri, String localPath);

  void uploadMemory(PathUri uri, Uint8List bytes, {tz.TZDateTime? lastModified});

  void openFile(PathUri uri, String etag, String? mimeType);

  void shareFileNative(PathUri uri, String etag, String? mimeType);

  void delete(PathUri uri);

  void rename(PathUri uri, String name);

  void move(PathUri uri, PathUri destination);

  void copy(PathUri uri, PathUri destination);

  void addFavorite(PathUri uri);

  void removeFavorite(PathUri uri);

  void createFolder(PathUri uri);

  BehaviorSubject<BuiltList<FilesTask>> get tasks;

  Stream<void> get updates;
}

class _FilesBloc extends InteractiveBloc implements FilesBloc {
  _FilesBloc({
    required this.options,
    required this.account,
  }) {
    options.uploadQueueParallelism.addListener(uploadParallelismListener);
    options.downloadQueueParallelism.addListener(downloadParallelismListener);
  }

  @override
  final log = Logger('FilesBloc');

  final FilesOptions options;
  final Account account;

  final uploadQueue = Queue();
  final downloadQueue = Queue();
  final updatesController = StreamController<void>();

  @override
  void dispose() {
    uploadQueue.dispose();
    downloadQueue.dispose();
    unawaited(tasks.close());
    unawaited(updatesController.close());

    options.uploadQueueParallelism.removeListener(uploadParallelismListener);
    options.downloadQueueParallelism.removeListener(downloadParallelismListener);

    super.dispose();
  }

  @override
  final tasks = BehaviorSubject.seeded(BuiltList());

  @override
  late final updates = updatesController.stream.asBroadcastStream();

  @override
  Future<void> refresh() async {
    updatesController.add(null);
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
  Future<void> uploadMemory(PathUri uri, Uint8List bytes, {tz.TZDateTime? lastModified}) async {
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

  @override
  Future<void> openFile(PathUri uri, String etag, String? mimeType) async {
    await wrapAction(
      () async {
        if (NeonPlatform.instance.canUsePaths) {
          final file = await cacheFile(uri, etag);
          final result = await OpenFilex.open(file.path, type: mimeType);
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
  Future<void> delete(PathUri uri) async {
    await wrapAction(() async => account.client.webdav.delete(uri));
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
  Future<void> move(PathUri uri, PathUri destination) async {
    await wrapAction(() async => account.client.webdav.move(uri, destination));
  }

  @override
  Future<void> copy(PathUri uri, PathUri destination) async {
    await wrapAction(() async => account.client.webdav.copy(uri, destination));
  }

  @override
  Future<void> addFavorite(PathUri uri) async {
    await wrapAction(
      () async => account.client.webdav.proppatch(
        uri,
        set: const WebDavProp(ocFavorite: true),
      ),
    );
  }

  @override
  Future<void> removeFavorite(PathUri uri) async {
    await wrapAction(
      () async => account.client.webdav.proppatch(
        uri,
        set: const WebDavProp(ocFavorite: false),
      ),
    );
  }

  @override
  Future<void> createFolder(PathUri uri) async {
    await wrapAction(() async => account.client.webdav.mkcol(uri));
  }

  Future<File> cacheFile(PathUri uri, String etag) async {
    final cacheDir = await getApplicationCacheDirectory();
    final file = File(p.join(cacheDir.path, 'files', etag.replaceAll('"', ''), uri.name));

    if (!file.existsSync()) {
      log.fine('Downloading $uri since it does not exist');
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
    final buffer = BytesBuilder(copy: false);
    final future = task.stream.forEach(buffer.add);

    tasks.add(tasks.value.rebuild((b) => b.add(task)));
    await downloadQueue.add(() => task.execute(account.client));
    tasks.add(tasks.value.rebuild((b) => b.remove(task)));

    await future;
    return buffer.toBytes();
  }

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
