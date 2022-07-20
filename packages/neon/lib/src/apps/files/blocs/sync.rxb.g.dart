// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'sync.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class FilesSyncBlocType extends RxBlocTypeBase {
  FilesSyncBlocEvents get events;
  FilesSyncBlocStates get states;
}

/// [$FilesSyncBloc] extended by the [FilesSyncBloc]
/// {@nodoc}
abstract class $FilesSyncBloc extends RxBlocBase
    implements FilesSyncBlocEvents, FilesSyncBlocStates, FilesSyncBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [addMapping]
  final _$addMappingEvent = PublishSubject<FilesSyncMapping>();

  /// Тhe [Subject] where events sink to by calling [removeMapping]
  final _$removeMappingEvent = PublishSubject<FilesSyncMapping>();

  /// Тhe [Subject] where events sink to by calling [syncMapping]
  final _$syncMappingEvent = PublishSubject<_SyncMappingEventArgs>();

  /// The state of [mappingStatuses] implemented in [_mapToMappingStatusesState]
  late final BehaviorSubject<Map<FilesSyncMapping, bool?>> _mappingStatusesState = _mapToMappingStatusesState();

  /// The state of [conflicts] implemented in [_mapToConflictsState]
  late final Stream<FilesSyncConflicts> _conflictsState = _mapToConflictsState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void addMapping(FilesSyncMapping mapping) => _$addMappingEvent.add(mapping);

  @override
  void removeMapping(FilesSyncMapping mapping) => _$removeMappingEvent.add(mapping);

  @override
  void syncMapping(
    FilesSyncMapping mapping,
    Map<String, SyncConflictSolution> solutions,
  ) =>
      _$syncMappingEvent.add(_SyncMappingEventArgs(
        mapping,
        solutions,
      ));

  @override
  BehaviorSubject<Map<FilesSyncMapping, bool?>> get mappingStatuses => _mappingStatusesState;

  @override
  Stream<FilesSyncConflicts> get conflicts => _conflictsState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Map<FilesSyncMapping, bool?>> _mapToMappingStatusesState();

  Stream<FilesSyncConflicts> _mapToConflictsState();

  Stream<Exception> _mapToErrorsState();

  @override
  FilesSyncBlocEvents get events => this;

  @override
  FilesSyncBlocStates get states => this;

  @override
  void dispose() {
    _$addMappingEvent.close();
    _$removeMappingEvent.close();
    _$syncMappingEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [FilesSyncBlocEvents.syncMapping] event
class _SyncMappingEventArgs {
  const _SyncMappingEventArgs(
    this.mapping,
    this.solutions,
  );

  final FilesSyncMapping mapping;

  final Map<String, SyncConflictSolution> solutions;
}
