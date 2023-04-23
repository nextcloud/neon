part of '../neon_files.dart';

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
    this._requestManager,
    this.options,
    this.client,
  ) {
    unawaited(refresh());
  }

  final RequestManager _requestManager;
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
    await _requestManager.wrapWebDav<List<WebDavFile>>(
      client.id,
      'files-${path.value.join('/')}',
      files,
      () async => client.webdav.ls(
        path.value.join('/'),
        prop: WebDavPropfindProp.fromBools(
          davgetcontenttype: true,
          davgetetag: true,
          davgetlastmodified: true,
          nchaspreview: true,
          ocsize: true,
          ocfavorite: true,
        ),
      ),
      (final response) => response.toWebDavFiles(client.webdav),
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
    wrapAction(
      () async => client.webdav.mkdir(
        path.join('/'),
        safe: false,
      ),
    );
  }
}
