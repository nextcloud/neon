import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/apps/files/app.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

abstract class FilesBrowserBlocEvents {
  void setPath(final List<String> path);

  void createFolder(final List<String> path);
}

abstract class FilesBrowserBlocStates {
  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<List<String>> get path;
}

class FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBlocEvents, FilesBrowserBlocStates {
  FilesBrowserBloc(
    this.options,
    this.client,
  ) {
    unawaited(refresh());
  }

  final FilesAppSpecificOptions options;
  final NextcloudClient client;

  @override
  void dispose() {
    unawaited(files.close());
    unawaited(path.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<WebDavFile>>> files = BehaviorSubject<Result<List<WebDavFile>>>();

  @override
  BehaviorSubject<List<String>> path = BehaviorSubject<List<String>>.seeded([]);

  @override
  Future refresh() async {
    // TODO: We have to do this manually, because we can't cache WebDAV stuff right now
    try {
      files.add(Result.loading());
      final data = await client.webdav.ls(
        path.value.join('/'),
        props: {
          WebDavProps.davContentType.name,
          WebDavProps.davETag.name,
          WebDavProps.davLastModified.name,
          WebDavProps.ncHasPreview.name,
          WebDavProps.ocSize.name,
          WebDavProps.ocFavorite.name,
        },
      );
      files.add(Result.success(data));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      files.add(Result.error(e));
    }
  }

  @override
  void setPath(final List<String> p) {
    path.add(p);
    unawaited(refresh());
  }

  @override
  void createFolder(final List<String> path) {
    wrapAction(
      () async => client.webdav.mkdir(
        path.join('/'),
        safe: false,
      ),
    );
  }
}
