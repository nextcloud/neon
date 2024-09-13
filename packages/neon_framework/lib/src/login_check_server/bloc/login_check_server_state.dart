part of 'login_check_server_bloc.dart';

/// State of the [LoginCheckServerBloc].
final class LoginCheckServerState extends Equatable {
  /// Creates a new state for managing the validation of a Nextcloud server.
  const LoginCheckServerState({
    required this.serverURL,
    this.serverVersionState = const ServerVersionStateLoading(),
    this.maintenanceModeState = const MaintenanceModeStateLoading(),
  });

  /// The url of the server to check.
  final Uri serverURL;

  /// The state of the server version check.
  final ServerVersionState serverVersionState;

  /// The state of the maintenance mode check.
  final MaintenanceModeState maintenanceModeState;

  /// Whether the server is supported and able to log in users.
  bool get isSuccess =>
      serverVersionState is ServerVersionStateSuccess && maintenanceModeState is MaintenanceModeStateSuccess;

  /// Creates a copy of this with changed attributes.
  LoginCheckServerState copyWith({
    ServerVersionState? serverVersionState,
    MaintenanceModeState? maintenanceModeState,
  }) {
    return LoginCheckServerState(
      serverURL: serverURL,
      serverVersionState: serverVersionState ?? this.serverVersionState,
      maintenanceModeState: maintenanceModeState ?? this.maintenanceModeState,
    );
  }

  @override
  List<Object?> get props => [
        serverURL,
        serverVersionState,
        maintenanceModeState,
      ];
}

/// The server version check sate of [LoginCheckServerState].
sealed class ServerVersionState extends Equatable {
  const ServerVersionState();

  @override
  List<Object?> get props => [];
}

/// The loading state for the server version check.
final class ServerVersionStateLoading extends ServerVersionState {
  /// Creates a new server version loading state.
  const ServerVersionStateLoading();
}

/// The success state for the server version check.
final class ServerVersionStateSuccess extends ServerVersionState {
  /// Creates a new server version success state.
  const ServerVersionStateSuccess({
    required this.serverVersion,
  });

  /// The server version.
  final String serverVersion;

  @override
  List<Object?> get props => [
        serverVersion,
      ];
}

/// The failure state for the server version check.
///
/// This is emitted when the server version was retrieved successfully but is unsupported.
final class ServerVersionStateFailure extends ServerVersionState {
  /// Creates a new server version failure state.
  const ServerVersionStateFailure({
    required this.serverVersion,
  });

  /// The server version.
  final String serverVersion;

  @override
  List<Object?> get props => [
        serverVersion,
      ];
}

/// The canceled state for the server version check.
///
/// This is emitted when the server version was not retrieved successfully.
final class ServerVersionStateCanceled extends ServerVersionState {
  /// Creates a new server version canceled state.
  const ServerVersionStateCanceled();
}

/// The server maintenance mode check sate of [LoginCheckServerState].
sealed class MaintenanceModeState extends Equatable {
  const MaintenanceModeState();

  @override
  List<Object?> get props => [];
}

/// The loading state for the server maintenance mode check.
final class MaintenanceModeStateLoading extends MaintenanceModeState {
  /// Creates a new server maintenance mode loading state.
  const MaintenanceModeStateLoading();
}

/// The success state for the server maintenance mode check.
final class MaintenanceModeStateSuccess extends MaintenanceModeState {
  /// Creates a new server maintenance mode success state.
  const MaintenanceModeStateSuccess();
}

/// The failure state for the server maintenance mode check.
///
/// This is emitted when the server maintenance mode was retrieved successfully,
/// but the server is currently in maintenance mode.
final class MaintenanceModeStateFailure extends MaintenanceModeState {
  /// Creates a new server maintenance mode failure state.
  const MaintenanceModeStateFailure();
}

/// The canceled state for the server maintenance mode check.
///
/// This is emitted when the server maintenance mode was not retrieved successfully.
final class MaintenanceModeStateCanceled extends MaintenanceModeState {
  /// Creates a new server maintenance mode canceled state.
  const MaintenanceModeStateCanceled();
}
