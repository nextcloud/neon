// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'login.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class LoginBlocType extends RxBlocTypeBase {
  LoginBlocEvents get events;
  LoginBlocStates get states;
}

/// [$LoginBloc] extended by the [LoginBloc]
/// {@nodoc}
abstract class $LoginBloc extends RxBlocBase implements LoginBlocEvents, LoginBlocStates, LoginBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [setServerURL]
  final _$setServerURLEvent = PublishSubject<String?>();

  /// The state of [serverURL] implemented in [_mapToServerURLState]
  late final BehaviorSubject<String?> _serverURLState = _mapToServerURLState();

  /// The state of [serverConnectionState] implemented in
  /// [_mapToServerConnectionStateState]
  late final BehaviorSubject<ServerConnectionState?> _serverConnectionStateState = _mapToServerConnectionStateState();

  /// The state of [loginFlowInit] implemented in [_mapToLoginFlowInitState]
  late final BehaviorSubject<CoreLoginFlowInit?> _loginFlowInitState = _mapToLoginFlowInitState();

  /// The state of [loginFlowResult] implemented in [_mapToLoginFlowResultState]
  late final BehaviorSubject<CoreLoginFlowResult?> _loginFlowResultState = _mapToLoginFlowResultState();

  @override
  void setServerURL(String? url) => _$setServerURLEvent.add(url);

  @override
  BehaviorSubject<String?> get serverURL => _serverURLState;

  @override
  BehaviorSubject<ServerConnectionState?> get serverConnectionState => _serverConnectionStateState;

  @override
  BehaviorSubject<CoreLoginFlowInit?> get loginFlowInit => _loginFlowInitState;

  @override
  BehaviorSubject<CoreLoginFlowResult?> get loginFlowResult => _loginFlowResultState;

  BehaviorSubject<String?> _mapToServerURLState();

  BehaviorSubject<ServerConnectionState?> _mapToServerConnectionStateState();

  BehaviorSubject<CoreLoginFlowInit?> _mapToLoginFlowInitState();

  BehaviorSubject<CoreLoginFlowResult?> _mapToLoginFlowResultState();

  @override
  LoginBlocEvents get events => this;

  @override
  LoginBlocStates get states => this;

  @override
  void dispose() {
    _$setServerURLEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
