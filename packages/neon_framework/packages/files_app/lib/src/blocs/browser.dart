import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/options.dart';
import 'package:logging/logging.dart';
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
}

sealed class FilesBrowserBloc implements InteractiveBloc {
  factory FilesBrowserBloc({
    required FilesBloc filesBloc,
    required FilesOptions options,
    required Account account,
    required PathUri uri,
    required FilesBrowserMode mode,
    PathUri? hideUri,
  }) = _FilesBrowserBloc;

  BehaviorSubject<Result<BuiltList<WebDavFile>>> get files;

  /// Mode to operate the `FilesBrowserView` in.
  FilesBrowserMode get mode;
}

class _FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBloc {
  _FilesBrowserBloc({
    required this.filesBloc,
    required this.options,
    required this.account,
    required this.uri,
    required this.mode,
    this.hideUri,
  }) {
    options.showHiddenFilesOption.addListener(refresh);

    updatesSubscription = filesBloc.updates.listen((_) async => refresh());

    unawaited(refresh());
  }

  @override
  final log = Logger('FilesBrowserBloc');

  final FilesBloc filesBloc;
  final FilesOptions options;
  final Account account;
  late StreamSubscription<void> updatesSubscription;
  final PathUri uri;
  @override
  final FilesBrowserMode mode;
  final PathUri? hideUri;

  @override
  void dispose() {
    options.showHiddenFilesOption.removeListener(refresh);
    unawaited(updatesSubscription.cancel());
    unawaited(files.close());
    super.dispose();
  }

  @override
  final files = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrap(
      account: account,
      subject: files,
      getRequest: () => account.client.webdav.propfind_Request(
        uri,
        prop: const WebDavPropWithoutValues.fromBools(
          davGetcontenttype: true,
          davGetetag: true,
          davGetlastmodified: true,
          ncHasPreview: true,
          ncMetadataBlurhash: true,
          ocSize: true,
          ocFavorite: true,
        ),
        depth: WebDavDepth.one,
      ),
      converter: const WebDavResponseConverter(),
      unwrap: (response) => BuiltList<WebDavFile>.build((b) {
        for (final file in response.toWebDavFiles()) {
          // Do not show itself
          if (uri == file.path) {
            continue;
          }

          // Do not show files when selecting a directory
          if (mode == FilesBrowserMode.selectDirectory && !file.isDirectory) {
            continue;
          }

          // Do not show the original directory when selecting a directory
          if (mode == FilesBrowserMode.selectDirectory && hideUri == file.path) {
            continue;
          }

          // Do not show hidden files unless the option is enabled
          if (!options.showHiddenFilesOption.value && file.isHidden) {
            continue;
          }

          b.add(file);
        }
      }),
    );
  }
}
