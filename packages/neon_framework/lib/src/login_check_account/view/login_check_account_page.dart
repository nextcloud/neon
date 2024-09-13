import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';

@internal
class LoginCheckAccountPage extends StatelessWidget {
  const LoginCheckAccountPage({
    required this.credentials,
    super.key,
  });

  /// The credentials of the account to check.
  final Credentials credentials;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCheckAccountBloc(
            accountRepository: context.read<AccountRepository>(),
            credentials: credentials,
          )..add(const LoginCheckAccount()),
        ),
      ],
      child: const LoginCheckAccountView(),
    );
  }
}
