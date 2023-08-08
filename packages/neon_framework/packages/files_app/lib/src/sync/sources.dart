import 'package:neon_framework/sync.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/webdav.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

class FilesSyncSources implements SyncSources<WebDavFile, FileSystemEntity> {
  FilesSyncSources(
    NextcloudClient client,
    PathUri webdavBaseDir,
    Directory ioBaseDir,
  )   : sourceA = FilesSyncSourceWebDavFile(client, webdavBaseDir),
        sourceB = FilesSyncSourceFileSystemEntity(client, ioBaseDir);

  @override
  final SyncSource<WebDavFile, FileSystemEntity> sourceA;

  @override
  final SyncSource<FileSystemEntity, WebDavFile> sourceB;

  @override
  SyncConflictSolution? findSolution(SyncObject<WebDavFile> objectA, SyncObject<FileSystemEntity> objectB) {
    if (objectA.data.isDirectory && objectB.data is Directory) {
      return SyncConflictSolution.overwriteA;
    }

    return null;
  }
}

class FilesSyncSourceWebDavFile implements SyncSource<WebDavFile, FileSystemEntity> {
  FilesSyncSourceWebDavFile(
    this.client,
    this.baseDir,
  );

  /// [NextcloudClient] used by the WebDAV part.
  final NextcloudClient client;

  /// Base directory on the WebDAV server.
  final PathUri baseDir;

  final props = const WebDavPropWithoutValues.fromBools(
    davGetetag: true,
    davGetlastmodified: true,
    ncHasPreview: true,
    ocSize: true,
    ocFavorite: true,
  );

  PathUri _uri(SyncObject<dynamic> object) => baseDir.join(PathUri.parse(object.id));

  @override
  Future<List<SyncObject<WebDavFile>>> listObjects() async => (await client.webdav.propfind(
        baseDir,
        prop: props,
        depth: WebDavDepth.infinity,
      ))
          .toWebDavFiles()
          .sublist(1)
          .map(
            (file) => (
              id: file.path.pathSegments.sublist(baseDir.pathSegments.length).join('/'),
              data: file,
            ),
          )
          .toList();

  @override
  Future<String> getObjectETag(SyncObject<WebDavFile> object) async => object.data.isDirectory ? '' : object.data.etag!;

  @override
  Future<SyncObject<WebDavFile>> writeObject(SyncObject<FileSystemEntity> object) async {
    if (object.data is File) {
      final stat = await object.data.stat();
      await client.webdav.putFile(
        object.data as File,
        stat,
        _uri(object),
        lastModified: stat.modified,
      );
    } else if (object.data is Directory) {
      await client.webdav.mkcol(_uri(object));
    } else {
      throw Exception('Unable to sync FileSystemEntity of type ${object.data.runtimeType}');
    }
    return (
      id: object.id,
      data: (await client.webdav.propfind(
        _uri(object),
        prop: props,
        depth: WebDavDepth.zero,
      ))
          .toWebDavFiles()
          .single,
    );
  }

  @override
  Future<void> deleteObject(SyncObject<WebDavFile> object) async => client.webdav.delete(_uri(object));
}

class FilesSyncSourceFileSystemEntity implements SyncSource<FileSystemEntity, WebDavFile> {
  FilesSyncSourceFileSystemEntity(
    this.client,
    this.baseDir,
  );

  /// [NextcloudClient] used by the WebDAV part.
  final NextcloudClient client;

  /// Base directory on the local filesystem.
  final Directory baseDir;

  @override
  Future<List<SyncObject<FileSystemEntity>>> listObjects() async => baseDir.listSync(recursive: true).map(
        (e) {
          var path = p.relative(e.path, from: baseDir.path);
          if (path.endsWith('/')) {
            path = path.substring(0, path.length - 1);
          }
          return (id: path, data: e);
        },
      ).toList();

  @override
  Future<String> getObjectETag(SyncObject<FileSystemEntity> object) async =>
      object.data is Directory ? '' : object.data.statSync().modified.millisecondsSinceEpoch.toString();

  @override
  Future<SyncObject<FileSystemEntity>> writeObject(SyncObject<WebDavFile> object) async {
    if (object.data.isDirectory) {
      final dir = Directory(p.join(baseDir.path, object.id))..createSync();
      return (id: object.id, data: dir);
    } else {
      final file = File(p.join(baseDir.path, object.id));
      await client.webdav.getFile(object.data.path, file);
      await file.setLastModified(object.data.lastModified!);
      return (id: object.id, data: file);
    }
  }

  @override
  Future<void> deleteObject(SyncObject<FileSystemEntity> object) async => object.data.delete();
}
