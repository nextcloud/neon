part of '../sync.dart';

/// [SyncSources] to sync from [WebDavFile]s to [FileSystemEntity]s
class WebDavIOSyncSources extends SyncSources<WebDavFile, FileSystemEntity> {
  // ignore: public_member_api_docs
  WebDavIOSyncSources(
    this.client,
    this.webdavBaseDir,
    this.ioBaseDir, {
    this.extraProps = const [],
  });

  /// [NextcloudClient] used by the WebDAV part.
  final NextcloudClient client;

  /// Base directory on the WebDAV server.
  final List<String> webdavBaseDir;

  /// Base directory on the local filesystem.
  final String ioBaseDir;

  /// Extra props to request from the WebDAV server
  final List<WebDavProps> extraProps;

  String _path(final SyncObject object) => [...webdavBaseDir, object.id].join('/');

  @override
  Future<List<SyncObject<WebDavFile>>> listObjectsA() async => (await client.webdav.ls(
        webdavBaseDir.join('/'),
        props: [
          WebDavProps.davResourceType,
          WebDavProps.davETag,
          ...extraProps,
        ].map((final p) => p.name).toSet(),
        depth: 'infinity',
      ))
          .map(
        (final file) {
          var id = file.path;
          if (webdavBaseDir.isNotEmpty) {
            id = id.replaceFirst('/${webdavBaseDir.join('/')}', '');
          }
          id = id.replaceFirst('/', '');
          if (id.endsWith('/')) {
            id = id.substring(0, id.length - 1);
          }

          return SyncObject<WebDavFile>(
            id,
            file,
          );
        },
      ).toList();

  @override
  Future<List<SyncObject<FileSystemEntity>>> listObjectsB() async => Directory(ioBaseDir)
      .listSync(recursive: true)
      .map(
        (final e) => SyncObject<FileSystemEntity>(
          p.relative(
            e.path,
            from: ioBaseDir,
          ),
          e,
        ),
      )
      .toList();

  @override
  Future<String> getObjectETagA(final SyncObject<WebDavFile> object) async =>
      object.data.isDirectory ? '' : object.data.etag!;

  @override
  Future<String> getObjectETagB(final SyncObject<FileSystemEntity> object) async =>
      object.data is Directory ? '' : object.data.statSync().modified.millisecondsSinceEpoch.toString();

  @override
  Future<SyncObject<FileSystemEntity>> writeObjectA(final SyncObject<WebDavFile> object) async {
    var path = object.data.path;
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (object.data.isDirectory) {
      final dir = Directory(p.join(ioBaseDir, object.id))..createSync();
      return SyncObject<FileSystemEntity>(object.id, dir);
    } else {
      final file = File(p.join(ioBaseDir, object.id));
      await client.webdav.downloadFile(path, file);
      return SyncObject<FileSystemEntity>(object.id, file);
    }
  }

  @override
  Future<SyncObject<WebDavFile>> writeObjectB(final SyncObject<FileSystemEntity> object) async {
    if (object.data is File) {
      await client.webdav.uploadFile(
        object.data as File,
        object.data.statSync(),
        _path(object),
      );
    } else if (object.data is Directory) {
      await client.webdav.mkdirs(_path(object));
    } else {
      print('Unable to sync FileSystemEntity of type ${object.data.runtimeType}');
    }
    return SyncObject<WebDavFile>(object.id, await client.webdav.getProps(_path(object)));
  }

  @override
  Future deleteObjectA(final SyncObject<WebDavFile> object) async => client.webdav.delete(_path(object));

  @override
  Future deleteObjectB(final SyncObject<FileSystemEntity> object) async => object.data.delete();

  @override
  List<SyncAction<WebDavFile, FileSystemEntity>> sortActions(
    final List<SyncAction<WebDavFile, FileSystemEntity>> actions,
  ) {
    final addActions = <SyncAction<WebDavFile, FileSystemEntity>>[];
    final removeActions = <SyncAction<WebDavFile, FileSystemEntity>>[];
    for (final action in actions) {
      if (action is SyncActionWriteToA) {
        addActions.add(action);
      } else if (action is SyncActionWriteToB) {
        addActions.add(action);
      } else if (action is SyncActionDeleteFromA) {
        removeActions.add(action);
      } else if (action is SyncActionDeleteFromB) {
        removeActions.add(action);
      } else {
        throw Exception('illegal action for sorting');
      }
    }
    return [
      ..._innerSortActions(addActions),
      ..._innerSortActions(removeActions).reversed,
    ];
  }

  List<SyncAction<WebDavFile, FileSystemEntity>> _innerSortActions(
    final List<SyncAction<WebDavFile, FileSystemEntity>> actions,
  ) =>
      actions..sort((final a, final b) => _idForAction(a).compareTo(_idForAction(b)));

  String _idForAction(final SyncAction<WebDavFile, FileSystemEntity> action) {
    if (action is SyncActionWriteToA<WebDavFile, FileSystemEntity>) {
      return action.object.id;
    } else if (action is SyncActionWriteToB<WebDavFile, FileSystemEntity>) {
      return action.object.id;
    } else if (action is SyncActionDeleteFromA<WebDavFile, FileSystemEntity>) {
      return action.object.id;
    } else if (action is SyncActionDeleteFromB<WebDavFile, FileSystemEntity>) {
      return action.object.id;
    } else {
      throw Exception('illegal action for getting id');
    }
  }

  @override
  SyncConflictSolution? findSolution(final SyncConflict<WebDavFile, FileSystemEntity> conflict) {
    if (conflict.objectA.data.isDirectory && conflict.objectB.data is Directory) {
      return SyncConflictSolution.overwriteA;
    }

    return null;
  }
}
