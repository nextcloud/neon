import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/login_check_server_status.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/validation_tile.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/core.dart';

@internal
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

  final Uri serverURL;
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

    bloc = LoginCheckServerStatusBloc(
      serverURL: widget.serverURL,
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: NeonDialogTheme.of(context).constraints,
              child: ResultBuilder.behaviorSubject(
                subject: bloc.state,
                builder: (context, state) {
                  final success =
                      state.hasData && state.requireData.versionCheck.isSupported && !state.requireData.maintenance;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.hasError)
                        NeonValidationTile(
                          title: NeonError.getDetails(state.error).getText(context),
                          state: ValidationState.failure,
                        ),
                      _buildServerVersionTile(state),
                      _buildMaintenanceModeTile(state),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: success ? _onContinue : bloc.refresh,
                          child: Text(
                            success
                                ? NeonLocalizations.of(context).actionContinue
                                : NeonLocalizations.of(context).actionRetry,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onContinue() async {
    if (widget.loginName != null) {
      await LoginCheckAccountRoute(
        serverUrl: widget.serverURL,
        loginName: widget.loginName!,
        password: widget.password!,
      ).push<LoginCheckAccountRoute>(context);
    } else {
      await LoginFlowRoute(serverUrl: widget.serverURL).push<LoginFlowRoute>(context);
    }
  }

  Widget _buildServerVersionTile(Result<core.Status> result) {
    if (result.hasError) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginCheckingServerVersion,
        state: ValidationState.canceled,
      );
    }

    if (!result.hasData) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginCheckingServerVersion,
        state: ValidationState.loading,
      );
    }

    if (result.requireData.versionCheck.isSupported) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginSupportedServerVersion(result.requireData.versionstring),
        state: ValidationState.success,
      );
    }

    return NeonValidationTile(
      title: NeonLocalizations.of(context).loginUnsupportedServerVersion(result.requireData.versionstring),
      state: ValidationState.failure,
    );
  }

  Widget _buildMaintenanceModeTile(Result<core.Status> result) {
    if (result.hasError) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginCheckingMaintenanceMode,
        state: ValidationState.canceled,
      );
    }

    if (!result.hasData) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginCheckingMaintenanceMode,
        state: ValidationState.loading,
      );
    }

    if (result.requireData.maintenance) {
      return NeonValidationTile(
        title: NeonLocalizations.of(context).loginMaintenanceModeEnabled,
        state: ValidationState.failure,
      );
    }

    return NeonValidationTile(
      title: NeonLocalizations.of(context).loginMaintenanceModeDisabled,
      state: ValidationState.success,
    );
  }
}
