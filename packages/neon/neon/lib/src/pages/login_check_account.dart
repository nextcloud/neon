import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/login_check_account.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/widgets/account_tile.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:neon/src/widgets/validation_tile.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class LoginCheckAccountPage extends StatefulWidget {
  const LoginCheckAccountPage({
    required this.serverURL,
    required this.loginName,
    required this.password,
    super.key,
  });

  final String serverURL;
  final String loginName;
  final String password;

  @override
  State<LoginCheckAccountPage> createState() => _LoginCheckAccountPageState();
}

class _LoginCheckAccountPageState extends State<LoginCheckAccountPage> {
  late final LoginCheckAccountBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = LoginCheckAccountBloc(
      Provider.of<PackageInfo>(context, listen: false),
      widget.serverURL,
      widget.loginName,
      widget.password,
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 640,
              ),
              child: ResultBuilder.behaviorSubject(
                stream: bloc.state,
                builder: (final context, final state) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NeonLinearProgressIndicator(
                      visible: state.isLoading,
                    ),
                    NeonException(
                      state.error,
                      onRetry: bloc.refresh,
                    ),
                    _buildAccountTile(state),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: state.hasData
                            ? () {
                                Provider.of<AccountsBloc>(context, listen: false)
                                  ..updateAccount(state.requireData)
                                  ..setActiveAccount(state.requireData);

                                const HomeRoute().go(context);
                              }
                            : null,
                        child: Text(AppLocalizations.of(context).actionContinue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildAccountTile(final Result<Account> result) {
    if (result.hasData) {
      return NeonAccountTile(
        account: result.requireData,
        showStatus: false,
      );
    }

    return NeonValidationTile(
      title: AppLocalizations.of(context).loginCheckingAccount,
      state: ValidationState.loading,
    );
  }
}
