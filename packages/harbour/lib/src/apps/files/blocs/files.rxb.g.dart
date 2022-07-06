// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'files.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class FilesBlocType extends RxBlocTypeBase {
  FilesBlocEvents get events;
  FilesBlocStates get states;
}

/// [$FilesBloc] extended by the [FilesBloc]
/// {@nodoc}
abstract class $FilesBloc extends RxBlocBase implements FilesBlocEvents, FilesBlocStates, FilesBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [uploadFile]
  final _$uploadFileEvent = PublishSubject<_UploadFileEventArgs>();

  /// Тhe [Subject] where events sink to by calling [syncFile]
  final _$syncFileEvent = PublishSubject<List<String>>();

  /// Тhe [Subject] where events sink to by calling [openFile]
  final _$openFileEvent = PublishSubject<_OpenFileEventArgs>();

  /// Тhe [Subject] where events sink to by calling [delete]
  final _$deleteEvent = PublishSubject<List<String>>();

  /// Тhe [Subject] where events sink to by calling [rename]
  final _$renameEvent = PublishSubject<_RenameEventArgs>();

  /// Тhe [Subject] where events sink to by calling [move]
  final _$moveEvent = PublishSubject<_MoveEventArgs>();

  /// Тhe [Subject] where events sink to by calling [copy]
  final _$copyEvent = PublishSubject<_CopyEventArgs>();

  /// Тhe [Subject] where events sink to by calling [addFavorite]
  final _$addFavoriteEvent = PublishSubject<List<String>>();

  /// Тhe [Subject] where events sink to by calling [removeFavorite]
  final _$removeFavoriteEvent = PublishSubject<List<String>>();

  /// The state of [uploadTasks] implemented in [_mapToUploadTasksState]
  late final BehaviorSubject<List<UploadTask>> _uploadTasksState = _mapToUploadTasksState();

  /// The state of [downloadTasks] implemented in [_mapToDownloadTasksState]
  late final BehaviorSubject<List<DownloadTask>> _downloadTasksState = _mapToDownloadTasksState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void uploadFile(List<String> path, String localPath) => _$uploadFileEvent.add(_UploadFileEventArgs(path, localPath));

  @override
  void syncFile(List<String> path) => _$syncFileEvent.add(path);

  @override
  void openFile(List<String> path, String etag, String? mimeType) =>
      _$openFileEvent.add(_OpenFileEventArgs(path, etag, mimeType));

  @override
  void delete(List<String> path) => _$deleteEvent.add(path);

  @override
  void rename(List<String> path, String name) => _$renameEvent.add(_RenameEventArgs(path, name));

  @override
  void move(List<String> path, List<String> destination) => _$moveEvent.add(_MoveEventArgs(path, destination));

  @override
  void copy(List<String> path, List<String> destination) => _$copyEvent.add(_CopyEventArgs(path, destination));

  @override
  void addFavorite(List<String> path) => _$addFavoriteEvent.add(path);

  @override
  void removeFavorite(List<String> path) => _$removeFavoriteEvent.add(path);

  @override
  BehaviorSubject<List<UploadTask>> get uploadTasks => _uploadTasksState;

  @override
  BehaviorSubject<List<DownloadTask>> get downloadTasks => _downloadTasksState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<List<UploadTask>> _mapToUploadTasksState();

  BehaviorSubject<List<DownloadTask>> _mapToDownloadTasksState();

  Stream<Exception> _mapToErrorsState();

  @override
  FilesBlocEvents get events => this;

  @override
  FilesBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$uploadFileEvent.close();
    _$syncFileEvent.close();
    _$openFileEvent.close();
    _$deleteEvent.close();
    _$renameEvent.close();
    _$moveEvent.close();
    _$copyEvent.close();
    _$addFavoriteEvent.close();
    _$removeFavoriteEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesBlocEvents.uploadFile] event
class _UploadFileEventArgs {
  const _UploadFileEventArgs(this.path, this.localPath);

  final List<String> path;

  final String localPath;
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesBlocEvents.openFile] event
class _OpenFileEventArgs {
  const _OpenFileEventArgs(this.path, this.etag, this.mimeType);

  final List<String> path;

  final String etag;

  final String? mimeType;
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesBlocEvents.rename] event
class _RenameEventArgs {
  const _RenameEventArgs(this.path, this.name);

  final List<String> path;

  final String name;
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesBlocEvents.move] event
class _MoveEventArgs {
  const _MoveEventArgs(this.path, this.destination);

  final List<String> path;

  final List<String> destination;
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesBlocEvents.copy] event
class _CopyEventArgs {
  const _CopyEventArgs(this.path, this.destination);

  final List<String> path;

  final List<String> destination;
}
