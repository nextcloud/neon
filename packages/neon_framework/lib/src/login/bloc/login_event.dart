part of 'login_bloc.dart';

/// Base event for the [LoginBloc].
sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// {@template login_use_qr_code}
/// Event when the user chose the login with QRcode method.
/// {@endtemplate}
final class LoginUseQRCode extends LoginEvent {
  /// {@macro login_use_qr_code}
  const LoginUseQRCode();
}

/// {@template login_url_entered}
/// Event when the server url is known and the maintenance mode and supported version should be checked.
/// {@endtemplate}
final class LoginUrlEntered extends LoginEvent {
  /// {@macro login_url_entered}
  const LoginUrlEntered(this.serverURL, [this.credentials]);

  /// The server url to check.
  final Uri serverURL;

  /// The credentials if already known.
  ///
  /// This parameter is optional. When non null the credentials are already known
  /// in advance. This is the case when logging in through the QR-Code flow.
  final Credentials? credentials;

  @override
  List<Object?> get props => [
        serverURL,
        credentials,
      ];
}

/// {@template login_server_checked}
/// Event when the server url is known and the maintenance mode and supported version should be checked.
/// {@endtemplate}
final class LoginServerChecked extends LoginEvent {
  /// {@macro login_server_checked}
  const LoginServerChecked();
}

/// {@template login_credentials_entered}
/// Event when the credentials are known.
///
/// The credentials must not have been validated yet.
/// {@endtemplate}
final class LoginCredentialsEntered extends LoginEvent {
  /// {@macro login_credentials_entered}
  const LoginCredentialsEntered(this.credentials);

  /// The credentials of the user logging in.
  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
      ];
}

/// {@template login_account_checked}
/// Event when all the account details are known.
///
/// The credentials of the account have been validated and can be persisted.
/// {@endtemplate}
final class LoginAccountChecked extends LoginEvent {
  /// {@macro login_account_checked}
  const LoginAccountChecked(this.account);

  /// The account logging in.
  final Account account;

  @override
  List<Object?> get props => [
        account,
      ];
}
