import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:files_app/src/sync/mapping.dart';
import 'package:files_app/src/sync/sources.dart';
import 'package:files_app/src/utils/dialog.dart';
import 'package:files_app/src/widgets/file_tile.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/sync.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/files.dart' as files;
import 'package:nextcloud/webdav.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart';

@immutable
class FilesSync implements SyncImplementation<FilesSyncMapping, WebDavFile, FileSystemEntity> {
  const FilesSync();

  @override
  String get id => files.appID;

  @override
  Future<FilesSyncSources> getSources(Account account, FilesSyncMapping mapping) async {
    // This shouldn't be necessary, but it sadly is because of https://github.com/flutter/flutter/issues/25659.
    // Alternative would be to use https://pub.dev/packages/shared_storage,
    // but to be efficient we'd need https://github.com/alexrintt/shared-storage/issues/91
    // or copy the files to the app cache (which is also not optimal).
    if (Platform.isAndroid && !await Permission.manageExternalStorage.request().isGranted) {
      throw const MissingPermissionException(Permission.manageExternalStorage);
    }
    return FilesSyncSources(
      account.client,
      mapping.remotePath,
      mapping.localPath,
    );
  }

  @override
  Map<String, dynamic> serializeMapping(FilesSyncMapping mapping) => mapping.toJson();

  @override
  FilesSyncMapping deserializeMapping(Map<String, dynamic> json) => FilesSyncMapping.fromJson(json);

  @override
  Future<FilesSyncMapping?> addMapping(BuildContext context, Account account) async {
    final remotePath = await showChooseFolderDialog(context, null);
    if (remotePath == null) {
      return null;
    }

    final localPath = await FileUtils.pickDirectory();
    if (localPath == null) {
      return null;
    }
    if (!context.mounted) {
      return null;
    }

    return FilesSyncMapping(
      appId: files.appID,
      accountId: account.id,
      remotePath: remotePath,
      localPath: Directory(localPath),
      journal: SyncJournal(),
    );
  }

  @override
  String getMappingDisplayTitle(FilesSyncMapping mapping) {
    final path = mapping.remotePath.toString();
    return path.substring(0, path.length - 1);
  }

  @override
  String getMappingDisplaySubtitle(FilesSyncMapping mapping) => mapping.localPath.path;

  @override
  String getMappingId(FilesSyncMapping mapping) =>
      '${Uri.encodeComponent(mapping.remotePath.toString())}-${Uri.encodeComponent(mapping.localPath.path)}';

  @override
  Widget getConflictDetailsLocal(BuildContext context, FileSystemEntity object) {
    final stat = object.statSync();
    return FilesFileTile(
      showFullPath: true,
      filesBloc: NeonProvider.of<FilesBloc>(context),
      details: FileDetails(
        uri: PathUri.parse(object.path),
        size: stat.size,
        etag: '',
        mimeType: '',
        lastModified: tz.TZDateTime.from(stat.modified.toUtc(), tz.UTC),
        isFavorite: false,
        blurHash: null,
      ),
    );
  }

  @override
  Widget getConflictDetailsRemote(BuildContext context, WebDavFile object) => FilesFileTile(
        showFullPath: true,
        filesBloc: NeonProvider.of<FilesBloc>(context),
        details: FileDetails.fromWebDav(
          file: object,
        ),
      );
}
