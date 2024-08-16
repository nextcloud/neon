import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/login/bloc/login_bloc.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';
import 'package:neon_framework/src/widgets/validation_tile.dart';

@internal
class LoginCheckServerView extends StatelessWidget {
  const LoginCheckServerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCheckServerBloc, LoginCheckServerState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeonValidationTile(
              key: const Key('login_check_server-server_version_validation'),
              title: switch (state.serverVersionState) {
                ServerVersionStateSuccess(:final serverVersion) =>
                  NeonLocalizations.of(context).loginServerVersionSupported(
                    serverVersion,
                  ),
                ServerVersionStateFailure(:final serverVersion) =>
                  NeonLocalizations.of(context).loginServerVersionUnsupported(
                    serverVersion,
                  ),
                _ => NeonLocalizations.of(context).loginServerVersion,
              },
              state: switch (state.serverVersionState) {
                ServerVersionStateSuccess() => ValidationState.success,
                ServerVersionStateFailure() => ValidationState.failure,
                ServerVersionStateLoading() => ValidationState.loading,
                ServerVersionStateCanceled() => ValidationState.canceled,
              },
            ),
            NeonValidationTile(
              key: const Key('login_check_server-server_status_validation'),
              title: switch (state.maintenanceModeState) {
                MaintenanceModeStateSuccess() => NeonLocalizations.of(context).loginMaintenanceModeDisabled,
                MaintenanceModeStateFailure() => NeonLocalizations.of(context).loginMaintenanceModeEnabled,
                _ => NeonLocalizations.of(context).loginMaintenanceMode,
              },
              state: switch (state.maintenanceModeState) {
                MaintenanceModeStateSuccess() => ValidationState.success,
                MaintenanceModeStateFailure() => ValidationState.failure,
                MaintenanceModeStateLoading() => ValidationState.loading,
                MaintenanceModeStateCanceled() => ValidationState.canceled,
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: state.isSuccess
                  ? const _CheckServerContinue(key: Key('login_check_server-continue'))
                  : const _CheckServerRetry(key: Key('login_check_server-retry')),
            ),
          ],
        );
      },
    );
  }
}

class _CheckServerContinue extends StatelessWidget {
  const _CheckServerContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginBloc>().add(const LoginServerChecked()),
      child: Text(NeonLocalizations.of(context).actionContinue),
    );
  }
}

class _CheckServerRetry extends StatelessWidget {
  const _CheckServerRetry({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginCheckServerBloc>().add(const LoginCheckServer()),
      child: Text(NeonLocalizations.of(context).actionRetry),
    );
  }
}
