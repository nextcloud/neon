import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';

@internal
class LoginCheckServerPage extends StatelessWidget {
  const LoginCheckServerPage({
    required this.serverURL,
    super.key,
  });

  /// The url of the server to check.
  final Uri serverURL;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCheckServerBloc(
            accountRepository: context.read<AccountRepository>(),
            serverURL: serverURL,
          )..add(const LoginCheckServer()),
        ),
      ],
      child: const LoginCheckServerView(),
    );
  }
}
