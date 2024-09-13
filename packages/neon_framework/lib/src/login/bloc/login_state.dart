part of 'login_bloc.dart';

/// State of the [LoginBloc].
sealed class LoginState extends Equatable {
  /// Creates a new state for managing the Nextcloud login.
  const LoginState();

  factory LoginState.initial({
    Uri? serverURL,
    Credentials? credentials,
  }) {
    if (serverURL == null && credentials == null) {
      return const LoginStateInitial();
    }

    return LoginStateCheckServer(
      serverURL: credentials?.serverURL ?? serverURL!,
      credentials: credentials,
    );
  }

  @override
  List<Object?> get props => [];
}

/// {@template login_state_initial}
/// The initial state of the login process.
/// {@endtemplate}
final class LoginStateInitial extends LoginState {
  /// {@macro login_state_initial}
  const LoginStateInitial();
}

/// {@template login_state_scan_qr_code}
/// The user can scan a QR code.
/// {@endtemplate}
final class LoginStateScanQrCode extends LoginState {
  /// {@macro login_state_scan_qr_code}
  const LoginStateScanQrCode();
}

/// {@template login_state_check_server}
/// The server information can be validated.
/// {@endtemplate}
final class LoginStateCheckServer extends LoginState {
  /// {@macro login_state_check_server}
  const LoginStateCheckServer({
    required this.serverURL,
    this.credentials,
  });

  /// Url of the server.
  final Uri serverURL;

  /// The credentials of the account.
  final Credentials? credentials;

  @override
  List<Object?> get props => [
        serverURL,
        credentials,
      ];
}

/// {@template login_state_flow_v2}
/// The user selected the login flow.
/// {@endtemplate}
final class LoginStateFlowV2 extends LoginState {
  /// {@macro login_state_flow_v2}
  const LoginStateFlowV2({
    required this.serverURL,
  });

  /// Url of the server.
  final Uri serverURL;

  @override
  List<Object?> get props => [
        serverURL,
      ];
}

/// {@template login_state_check_account}
/// The account information can be validated.
/// {@endtemplate}
final class LoginStateCheckAccount extends LoginState {
  /// {@macro login_state_check_account}
  const LoginStateCheckAccount({
    required this.credentials,
  });

  /// The credentials of the account to check.
  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
      ];
}

/// {@template login_state_done}
/// The login process is finished.
///
/// The login page should be closed.
/// {@endtemplate}
final class LoginStateDone extends LoginState {
  /// {@macro login_state_done}
  const LoginStateDone();
}
