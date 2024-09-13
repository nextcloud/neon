import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/login/bloc/login_bloc.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';
import 'package:neon_framework/src/widgets/validation_tile.dart';

@internal
class LoginCheckAccountView extends StatelessWidget {
  const LoginCheckAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCheckAccountBloc, LoginCheckAccountState>(
      builder: (context, state) {
        final success = state is LoginCheckAccountStateSuccess;

        Widget tile = NeonValidationTile(
          title: NeonLocalizations.of(context).loginCheckingAccount,
          state: switch (state) {
            LoginCheckAccountStateLoading() => ValidationState.loading,
            LoginCheckAccountStateSuccess() => ValidationState.success,
            LoginCheckAccountStateFailure() => ValidationState.failure,
          },
        );

        if (success) {
          tile = NeonAccountTile(
            account: state.account,
            userStatusBloc: null,
            userDetailsBloc: NeonProvider.of<AccountsBloc>(context).getUserDetailsBlocFor(
              state.account,
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tile,
            Align(
              alignment: Alignment.bottomRight,
              child: success
                  ? _CheckAccountContinue(
                      account: state.account,
                      key: const Key('login-check-account-continue'),
                    )
                  : const _CheckAccountRetry(key: Key('login-check-account-retry')),
            ),
          ],
        );
      },
    );
  }
}

class _CheckAccountContinue extends StatelessWidget {
  const _CheckAccountContinue({required this.account, super.key});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginBloc>().add(LoginAccountChecked(account)),
      child: Text(NeonLocalizations.of(context).actionContinue),
    );
  }
}

class _CheckAccountRetry extends StatelessWidget {
  const _CheckAccountRetry({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginCheckAccountBloc>().add(const LoginCheckAccount()),
      child: Text(NeonLocalizations.of(context).actionRetry),
    );
  }
}
