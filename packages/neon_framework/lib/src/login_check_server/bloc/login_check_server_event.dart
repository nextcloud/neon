part of 'login_check_server_bloc.dart';

/// Base event for the [LoginCheckServerBloc].
sealed class LoginCheckServerEvent extends Equatable {
  const LoginCheckServerEvent();

  @override
  List<Object> get props => [];
}

/// {@template login_check_server}
/// Event when the version and status of a server should be checked.
/// {@endtemplate}
final class LoginCheckServer extends LoginCheckServerEvent {
  /// {@macro login_check_server}
  const LoginCheckServer();
}
