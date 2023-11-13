part of '../neon_files.dart';

abstract interface class FilesBrowserBlocEvents {
  void setPath(final PathUri uri);

  void createFolder(final PathUri uri);
}

abstract interface class FilesBrowserBlocStates {
  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<PathUri> get uri;
}

class FilesBrowserBloc extends InteractiveBloc implements FilesBrowserBlocEvents, FilesBrowserBlocStates {
  FilesBrowserBloc(
    this.options,
    this.account, {
    final PathUri? initialPath,
  }) {
    if (initialPath != null) {
      uri.add(initialPath);
    }

    unawaited(refresh());
  }

  final FilesAppSpecificOptions options;
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
