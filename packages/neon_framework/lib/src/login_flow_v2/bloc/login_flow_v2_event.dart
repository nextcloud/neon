part of 'login_flow_v2_bloc.dart';

/// Base event for the [LoginFlowV2Bloc].
sealed class LoginFlowV2Event extends Equatable {
  const LoginFlowV2Event();

  @override
  List<Object> get props => [];
}

/// {@template login_flow_v2_init}
/// Event for starting the login flow.
/// {@endtemplate}
final class LoginFlowV2Init extends LoginFlowV2Event {
  /// {@macro login_flow_v2_init}
  const LoginFlowV2Init();
}

/// {@template login_flow_v2_open_page}
/// Event for opening the login page of the server.
/// {@endtemplate}
final class LoginFlowV2OpenPage extends LoginFlowV2Event {
  /// {@macro login_flow_v2_open_page}
  const LoginFlowV2OpenPage();
}

/// {@template _login_flow_v2_poll}
/// Event for polling the login endpoint.
/// {@endtemplate}
final class _LoginFlowV2Poll extends LoginFlowV2Event {
  /// {@macro _login_flow_v2_poll}
  const _LoginFlowV2Poll();
}
