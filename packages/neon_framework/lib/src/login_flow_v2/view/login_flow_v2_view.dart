import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/login/login.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';

@internal
class LoginFLowV2View extends StatelessWidget {
  const LoginFLowV2View({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: move the listener into the page once our routing allows it
    return BlocConsumer<LoginFlowV2Bloc, LoginFlowV2State>(
      listener: (context, state) {
        if (state case LoginFlowV2StateSuccess(:final credentials)) {
          context.read<LoginBloc>().add(LoginCredentialsEntered(credentials));
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(NeonLocalizations.of(context).loginSwitchToBrowserWindow),
            const SizedBox(
              height: 10,
            ),
            if (state case LoginFlowV2StatePolling())
              ElevatedButton(
                onPressed: () => context.read<LoginFlowV2Bloc>().add(const LoginFlowV2OpenPage()),
                child: Text(NeonLocalizations.of(context).loginOpenAgain),
              ),
          ],
        );
      },
    );
  }
}
