import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';

@internal
class LoginFLowV2Page extends StatelessWidget {
  const LoginFLowV2Page({
    required this.serverURL,
    super.key,
  });

  /// The url of the server to log into.
  final Uri serverURL;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginFlowV2Bloc(
            accountRepository: context.read<AccountRepository>(),
            serverURL: serverURL,
          )..add(const LoginFlowV2Init()),
        ),
      ],
      child: const LoginFLowV2View(),
    );
  }
}
