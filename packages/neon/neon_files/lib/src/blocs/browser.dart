import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/webdav.dart';
import 'package:rxdart/rxdart.dart';

sealed class FilesBrowserBloc implements InteractiveBloc {
  @internal
  factory FilesBrowserBloc(
    final FilesOptions options,
    final Account account, {
    final PathUri? initialPath,
  }) =>
      _FilesBrowserBloc(
        options,
        account,
        initialPath: initialPath,
      );

  void setPath(final PathUri uri);

  void createFolder(final PathUri uri);

  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<PathUri> get uri;

  FilesOptions get options;
}

class _FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBloc {
  _FilesBrowserBloc(
    this.options,
    this.account, {
    final PathUri? initialPath,
  }) {
    if (initialPath != null) {
      uri.add(initialPath);
    }

    unawaited(refresh());
  }

  @override
  final FilesOptions options;
  final Account account;

  @override
  void dispose() {
    unawaited(files.close());
    unawaited(uri.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<WebDavFile>>> files = BehaviorSubject<Result<List<WebDavFile>>>();

  @override
  BehaviorSubject<PathUri> uri = BehaviorSubject.seeded(PathUri.cwd());

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapWebDav<List<WebDavFile>>(
      account.id,
      'files-${uri.value.path}',
      files,
      () => account.client.webdav.propfind(
        uri.value,
        prop: WebDavPropWithoutValues.fromBools(
          davgetcontenttype: true,
          davgetetag: true,
          davgetlastmodified: true,
          nchaspreview: true,
          ocsize: true,
          ocfavorite: true,
        ),
        depth: WebDavDepth.one,
      ),
      (final response) => response.toWebDavFiles().sublist(1),
      emitEmptyCache: true,
    );
  }

  @override
  void setPath(final PathUri uri) {
    this.uri.add(uri);
    unawaited(refresh());
  }

  @override
  void createFolder(final PathUri uri) {
    wrapAction(() async => account.client.webdav.mkcol(uri));
  }
}
