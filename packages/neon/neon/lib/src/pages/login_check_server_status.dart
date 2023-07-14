import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/login_check_server_status.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:neon/src/widgets/validation_tile.dart';
import 'package:nextcloud/nextcloud.dart';

class LoginCheckServerStatusPage extends StatefulWidget {
  const LoginCheckServerStatusPage({
    required this.serverURL,
    super.key,
  })  : loginName = null,
        password = null;

  const LoginCheckServerStatusPage.withCredentials({
    required this.serverURL,
    required String this.loginName,
    required String this.password,
    super.key,
  });

  final String serverURL;
  final String? loginName;
  final String? password;

  @override
  State<LoginCheckServerStatusPage> createState() => _LoginCheckServerStatusPageState();
}

class _LoginCheckServerStatusPageState extends State<LoginCheckServerStatusPage> {
  late final LoginCheckServerStatusBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = LoginCheckServerStatusBloc(widget.serverURL);
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
              constraints: NeonDialogTheme.of(context).constraints,
              child: ResultBuilder.behaviorSubject(
                stream: bloc.state,
                builder: (final context, final state) {
                  final success = state.hasData && state.requireData.isSupported && !state.requireData.maintenance;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeonLinearProgressIndicator(
                        visible: state.isLoading,
                      ),
                      NeonException(
                        state.error,
                        onRetry: bloc.refresh,
                      ),
                      _buildServerVersionTile(state),
                      _buildMaintenanceModeTile(state),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: success ? _onContinue : null,
                          child: Text(AppLocalizations.of(context).actionContinue),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );

  void _onContinue() {
    if (widget.loginName != null) {
      LoginCheckAccountRoute(
        serverUrl: widget.serverURL,
        loginName: widget.loginName!,
        password: widget.password!,
      ).pushReplacement(context);
    } else {
      LoginFlowRoute(serverUrl: widget.serverURL).pushReplacement(context);
    }
  }

  Widget _buildServerVersionTile(final Result<CoreServerStatus> result) {
    if (!result.hasData) {
      return NeonValidationTile(
        title: AppLocalizations.of(context).loginCheckingServerVersion,
        state: ValidationState.loading,
      );
    }

    if (result.requireData.isSupported) {
      return NeonValidationTile(
        title: AppLocalizations.of(context).loginSupportedServerVersion(result.requireData.versionstring),
        state: ValidationState.success,
      );
    }

    return NeonValidationTile(
      title: AppLocalizations.of(context).loginUnsupportedServerVersion(result.requireData.versionstring),
      state: ValidationState.failure,
    );
  }

  Widget _buildMaintenanceModeTile(final Result<CoreServerStatus> result) {
    if (!result.hasData) {
      return NeonValidationTile(
        title: AppLocalizations.of(context).loginCheckingMaintenanceMode,
        state: ValidationState.loading,
      );
    }

    if (result.requireData.maintenance) {
      return NeonValidationTile(
        title: AppLocalizations.of(context).loginMaintenanceModeEnabled,
        state: ValidationState.failure,
      );
    }

    return NeonValidationTile(
      title: AppLocalizations.of(context).loginMaintenanceModeDisabled,
      state: ValidationState.success,
    );
  }
}
