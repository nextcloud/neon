part of 'login_flow_v2_bloc.dart';

/// State of the [LoginFlowV2Bloc].
sealed class LoginFlowV2State extends Equatable {
  /// Creates a new state for managing the login flow v2.
  const LoginFlowV2State({
    required this.serverURL,
  });

  /// The url of the server to log in to.
  final Uri serverURL;

  @override
  List<Object?> get props => [
        serverURL,
      ];
}

/// Initial state of the [LoginFlowV2Bloc].
final class LoginFlowV2StateInitial extends LoginFlowV2State {
  /// Creates a new login flow initial state.
  const LoginFlowV2StateInitial({
    required super.serverURL,
  });
}

/// State fot the [LoginFlowV2Bloc] when the login flow has been initialized.
final class LoginFlowV2StatePolling extends LoginFlowV2State {
  /// Creates a new polling login flow state.
  const LoginFlowV2StatePolling({
    required super.serverURL,
    required this.loginEndpoint,
    required this.token,
  });

  /// The url of the login endpoint.
  ///
  /// This is opened in a browser and the user will log into the server directly.
  final Uri loginEndpoint;

  /// The token to poll the login endpoint.
  final String token;

  @override
  List<Object?> get props => [
        serverURL,
        loginEndpoint,
        token,
      ];
}

/// State fot the [LoginFlowV2Bloc] when the login was successful and the credentials are known.
final class LoginFlowV2StateSuccess extends LoginFlowV2State {
  /// Creates a new login flow success state.
  const LoginFlowV2StateSuccess({
    required super.serverURL,
    required this.credentials,
  });

  /// The credentials of the logged in user.
  final Credentials credentials;

  @override
  List<Object?> get props => [
        serverURL,
        credentials,
      ];
}
