part of 'login_check_account_bloc.dart';

/// Base event for the [LoginCheckAccountBloc].
sealed class LoginCheckAccountEvent extends Equatable {
  const LoginCheckAccountEvent();

  @override
  List<Object> get props => [];
}

/// {@template login_check_account}
/// Event when the credentials of a account should be checked.
/// {@endtemplate}
final class LoginCheckAccount extends LoginCheckAccountEvent {
  /// {@macro login_check_account}
  const LoginCheckAccount();
}
