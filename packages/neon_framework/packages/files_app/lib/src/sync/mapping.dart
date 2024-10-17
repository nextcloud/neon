import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:neon_framework/sync.dart';
import 'package:nextcloud/webdav.dart' as webdav;
import 'package:nextcloud/webdav.dart';
import 'package:universal_io/io.dart';
import 'package:watcher/watcher.dart';

part 'mapping.g.dart';

@JsonSerializable()
class FilesSyncMapping implements SyncMapping<webdav.WebDavFile, FileSystemEntity> {
  FilesSyncMapping({
    required this.accountId,
    required this.appId,
    required this.journal,
    required this.remotePath,
    required this.localPath,
  });

  factory FilesSyncMapping.fromJson(Map<String, dynamic> json) => _$FilesSyncMappingFromJson(json);
  Map<String, dynamic> toJson() => _$FilesSyncMappingToJson(this);

  @override
  final String accountId;

  @override
  final String appId;

  @override
  final SyncJournal journal;

  @JsonKey(
    fromJson: PathUri.parse,
    toJson: _pathUriToJson,
  )
  final PathUri remotePath;

  static String _pathUriToJson(PathUri uri) => uri.toString();

  @JsonKey(
    fromJson: _directoryFromJson,
    toJson: _directoryToJson,
  )
  final Directory localPath;

  static Directory _directoryFromJson(String value) => Directory(value);
  static String _directoryToJson(Directory value) => value.path;

  StreamSubscription<WatchEvent>? _subscription;

  @override
  void watch(void Function() onUpdated) {
    debugPrint('Watching file changes: $localPath');
    _subscription ??= DirectoryWatcher(localPath.path).events.listen(
      (event) {
        debugPrint('Registered file change: ${event.path} ${event.type}');
        onUpdated();
      },
    );
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
  }
}
