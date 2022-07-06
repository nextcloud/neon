import 'dart:async';

import 'package:harbour/src/harbour.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'browser.rxb.g.dart';

abstract class FilesBrowserBlocEvents {
  void refresh();

  void setPath(final List<String> path);

  void createFolder(final List<String> path);
}

abstract class FilesBrowserBlocStates {
  BehaviorSubject<Result<List<WebDavFile>>> get files;

  BehaviorSubject<List<String>> get path;

  Stream<Exception> get errors;
}

@RxBloc()
class FilesBrowserBloc extends $FilesBrowserBloc {
  FilesBrowserBloc(
    this.options,
    this._requestManager,
    this.client,
  ) {
    _$refreshEvent.listen((final _) => _loadFiles());

    _$setPathEvent.listen((final path) {
      _pathSubject.add(path);
      _loadFiles();
    });

    _$createFolderEvent.listen((final path) {
      _wrapAction(
        () async => client.webdav!.mkdir(
          path.join('/'),
          safe: false,
        ),
      );
    });

    _loadFiles();
  }

  void _wrapAction(final Future Function() call) {
    final stream = _requestManager.wrapWithoutCache(call).asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) async {
      refresh();
    });
  }

  void _loadFiles() {
    _requestManager
        .wrapWithoutCache(
          () async => client.webdav!.ls(
            _pathSubject.value.join('/'),
            props: {
              WebDavProps.davContentType.name,
              WebDavProps.davETag.name,
              WebDavProps.davLastModified.name,
              WebDavProps.ncHasPreview.name,
              WebDavProps.ocSize.name,
              WebDavProps.ocFavorite.name,
            },
          ),
        )
        .listen(_filesSubject.add);
  }

  final FilesAppSpecificOptions options;
  final RequestManager _requestManager;
  final NextcloudClient client;

  final _filesSubject = BehaviorSubject<Result<List<WebDavFile>>>();
  final _pathSubject = BehaviorSubject<List<String>>.seeded([]);
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    // ignore: discarded_futures
    _filesSubject.close();
    // ignore: discarded_futures
    _pathSubject.close();
    // ignore: discarded_futures
    _errorsStreamController.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<WebDavFile>>> _mapToFilesState() => _filesSubject;

  @override
  BehaviorSubject<List<String>> _mapToPathState() => _pathSubject;

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
