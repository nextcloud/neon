import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/webdav.dart';
import 'package:rxdart/rxdart.dart';

/// Mode to operate the `FilesBrowserView` in.
enum FilesBrowserMode {
  /// Default file browser mode.
  ///
  /// When a file is selected it will be opened or downloaded.
  browser,

  /// Select directory.
  selectDirectory,

  /// Do not show file actions.
  noActions,
}

sealed class FilesBrowserBloc implements InteractiveBloc {
  @internal
  factory FilesBrowserBloc(
    final FilesOptions options,
    final Account account, {
    final PathUri? initialPath,
    final FilesBrowserMode? mode,
  }) =>
      _FilesBrowserBloc(
        options,
        account,
        initialPath: initialPath,
        mode: mode,
      );

  void setPath(final PathUri uri);

  void createFolder(final PathUri uri);

  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<PathUri> get uri;

  FilesOptions get options;

  /// Mode to operate the `FilesBrowserView` in.
  FilesBrowserMode get mode;
}

class _FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBloc {
  _FilesBrowserBloc(
    this.options,
    this.account, {
    this.initialPath,
    final FilesBrowserMode? mode,
  }) : mode = mode ?? FilesBrowserMode.browser {
    final parent = initialPath?.parent;
    if (parent != null) {
      uri.add(parent);
    }

    options.showHiddenFilesOption.addListener(refresh);

    unawaited(refresh());
  }

  @override
  final FilesOptions options;
  final Account account;

  @override
  final FilesBrowserMode mode;

  final PathUri? initialPath;

  @override
  void dispose() {
    options.showHiddenFilesOption.removeListener(refresh);

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
      (final response) {
        final unwrapped = response.toWebDavFiles().sublist(1);

        return unwrapped.where((final file) {
          // Do not show files when selecting a directory
          if (mode == FilesBrowserMode.selectDirectory && !file.isDirectory) {
            return false;
          }

          // Do not show itself when selecting a directory
          if (mode == FilesBrowserMode.selectDirectory && initialPath == file.path) {
            return false;
          }

          // Do not show hidden files unless the option is enabled
          if (!options.showHiddenFilesOption.value && file.isHidden) {
            return false;
          }

          return true;
        }).toList();
      },
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
