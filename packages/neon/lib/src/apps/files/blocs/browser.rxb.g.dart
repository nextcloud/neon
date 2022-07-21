// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'browser.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class FilesBrowserBlocType extends RxBlocTypeBase {
  FilesBrowserBlocEvents get events;
  FilesBrowserBlocStates get states;
}

/// [$FilesBrowserBloc] extended by the [FilesBrowserBloc]
/// {@nodoc}
abstract class $FilesBrowserBloc extends RxBlocBase
    implements FilesBrowserBlocEvents, FilesBrowserBlocStates, FilesBrowserBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [setPath]
  final _$setPathEvent = PublishSubject<List<String>>();

  /// Тhe [Subject] where events sink to by calling [createFolder]
  final _$createFolderEvent = PublishSubject<List<String>>();

  /// The state of [files] implemented in [_mapToFilesState]
  late final BehaviorSubject<Result<List<WebDavFile>>> _filesState = _mapToFilesState();

  /// The state of [path] implemented in [_mapToPathState]
  late final BehaviorSubject<List<String>> _pathState = _mapToPathState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void setPath(List<String> path) => _$setPathEvent.add(path);

  @override
  void createFolder(List<String> path) => _$createFolderEvent.add(path);

  @override
  BehaviorSubject<Result<List<WebDavFile>>> get files => _filesState;

  @override
  BehaviorSubject<List<String>> get path => _pathState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Result<List<WebDavFile>>> _mapToFilesState();

  BehaviorSubject<List<String>> _mapToPathState();

  Stream<Exception> _mapToErrorsState();

  @override
  FilesBrowserBlocEvents get events => this;

  @override
  FilesBrowserBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$setPathEvent.close();
    _$createFolderEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
