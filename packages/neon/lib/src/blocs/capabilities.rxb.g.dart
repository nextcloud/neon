// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'capabilities.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class CapabilitiesBlocType extends RxBlocTypeBase {
  CapabilitiesBlocEvents get events;
  CapabilitiesBlocStates get states;
}

/// [$CapabilitiesBloc] extended by the [CapabilitiesBloc]
/// {@nodoc}
abstract class $CapabilitiesBloc extends RxBlocBase
    implements CapabilitiesBlocEvents, CapabilitiesBlocStates, CapabilitiesBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// The state of [capabilities] implemented in [_mapToCapabilitiesState]
  late final BehaviorSubject<Result<CoreServerCapabilitiesOcsData>> _capabilitiesState = _mapToCapabilitiesState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  BehaviorSubject<Result<CoreServerCapabilitiesOcsData>> get capabilities => _capabilitiesState;

  BehaviorSubject<Result<CoreServerCapabilitiesOcsData>> _mapToCapabilitiesState();

  @override
  CapabilitiesBlocEvents get events => this;

  @override
  CapabilitiesBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
