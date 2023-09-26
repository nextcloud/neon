part of '../neon_files.dart';

abstract interface class FilesBrowserBlocEvents {
  void setPath(final List<String> path);

  void createFolder(final List<String> path);
}

abstract interface class FilesBrowserBlocStates {
  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<List<String>> get path;
}

class FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBlocEvents, FilesBrowserBlocStates {
  FilesBrowserBloc(
    this.options,
    this.account, {
    final List<String>? initialPath,
  }) {
    if (initialPath != null) {
      path.add(initialPath);
    }

    unawaited(refresh());
  }

  final FilesAppSpecificOptions options;
  final Account account;

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
  Future<void> refresh() async {
    await RequestManager.instance.wrapWebDav<List<WebDavFile>>(
      account.id,
      'files-${path.value.join('/')}',
      files,
      () => account.client.webdav.propfind(
        Uri(pathSegments: path.value),
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
  void setPath(final List<String> p) {
    path.add(p);
    unawaited(refresh());
  }

  @override
  void createFolder(final List<String> path) {
    wrapAction(() async => account.client.webdav.mkcol(Uri(pathSegments: path)));
  }
}
