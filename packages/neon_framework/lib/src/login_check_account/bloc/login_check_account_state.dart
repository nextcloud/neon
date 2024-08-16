part of 'login_check_account_bloc.dart';

/// State of the [LoginCheckAccountBloc].
sealed class LoginCheckAccountState extends Equatable {
  /// Creates a new state for managing the validation of an Account.
  const LoginCheckAccountState({
    required this.credentials,
  });

  /// The credentials of the account to check.
  final Credentials credentials;

  @override
  List<Object?> get props => [
        credentials,
      ];
}

/// The loading state for the account check.
final class LoginCheckAccountStateLoading extends LoginCheckAccountState {
  /// Creates a new account check loading state.
  const LoginCheckAccountStateLoading({
    required super.credentials,
  });
}

/// The success state for the account check.
final class LoginCheckAccountStateSuccess extends LoginCheckAccountState {
  /// Creates a new account check success state.
  const LoginCheckAccountStateSuccess({
    required super.credentials,
    required this.account,
  });

  /// The account fetched from the server.
  final Account account;

  @override
  List<Object?> get props => [
        credentials,
        account,
      ];
}

/// The failure state for the account check.
final class LoginCheckAccountStateFailure extends LoginCheckAccountState {
  /// Creates a new account check failure state.
  const LoginCheckAccountStateFailure({
    required super.credentials,
  });
}
