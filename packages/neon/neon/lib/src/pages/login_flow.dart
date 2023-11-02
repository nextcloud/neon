import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/login_flow.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:url_launcher/url_launcher_string.dart';

@internal
class LoginFlowPage extends StatefulWidget {
  const LoginFlowPage({
    required this.serverURL,
    super.key,
  });

  final Uri serverURL;

  @override
  State<LoginFlowPage> createState() => _LoginFlowPageState();
}

class _LoginFlowPageState extends State<LoginFlowPage> {
  late final LoginFlowBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = LoginFlowBloc(widget.serverURL);

    bloc.init.listen((final result) async {
      if (result.hasData) {
        await launchUrlString(
          result.requireData.login,
          mode: LaunchMode.externalApplication,
        );
      }
    });

    bloc.result.listen((final result) {
      LoginCheckAccountRoute(
        serverUrl: Uri.parse(result.server),
        loginName: result.loginName,
        password: result.appPassword,
      ).pushReplacement(context);
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ResultBuilder.behaviorSubject(
                subject: bloc.init,
                builder: (final context, final init) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildChildren(init).toList(),
                ),
              ),
            ),
          ),
        ),
      );

  Iterable<Widget> _buildChildren(final Result<core.LoginFlowV2> init) sync* {
    yield NeonLinearProgressIndicator(
      visible: init.isLoading,
    );

    if (init.hasError) {
      yield NeonError(
        init.error,
        onRetry: bloc.refresh,
      );
    }

    if (init.hasData) {
      yield Text(NeonLocalizations.of(context).loginSwitchToBrowserWindow);
      yield Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: bloc.refresh,
          child: Text(NeonLocalizations.of(context).loginOpenAgain),
        ),
      );
    }
  }
}
