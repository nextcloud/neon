import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/login/login.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/utils/validators.dart';
import 'package:neon_framework/src/widgets/nextcloud_logo.dart';
import 'package:neon_framework/theme.dart';

/// The material design view for the login page.
class LoginView extends StatelessWidget {
  /// Creates a new login view.
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateDone) {
          const HomeRoute().go(context);
        }
      },
      builder: (context, state) {
        AppBar? appBar;
        if (state is! LoginStateInitial || Navigator.canPop(context)) {
          appBar = AppBar(
            leading: const CloseButton(),
          );
        }

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: appBar,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: NeonDialogTheme.of(context).constraints,
                  child: switch (state) {
                    LoginStateInitial() => const _LoginSelection(key: Key('login-selection')),
                    LoginStateScanQrCode() => const LoginQrCodePage(),
                    LoginStateCheckServer(:final serverURL) => LoginCheckServerPage(serverURL: serverURL),
                    LoginStateFlowV2(:final serverURL) => LoginFLowV2Page(serverURL: serverURL),
                    LoginStateCheckAccount(:final credentials) => LoginCheckAccountPage(credentials: credentials),
                    LoginStateDone() => const SizedBox(),
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginSelection extends StatelessWidget {
  const _LoginSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final branding = Branding.of(context);

    return SingleChildScrollView(
      primary: true,
      child: Column(
        children: [
          ExcludeSemantics(
            child: branding.logo,
          ),
          Text(
            branding.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (branding.showLoginWithNextcloud) ...[
            const SizedBox(
              height: 10,
            ),
            Text(NeonLocalizations.of(context).loginWorksWith),
            const SizedBox(
              height: 10,
            ),
            Semantics(
              label: NeonLocalizations.of(context).nextcloud,
              child: const NextcloudLogo(),
            ),
          ],
          const SizedBox(
            height: 50,
          ),
          const _ServerUrlField(key: Key('login-server-url-field')),
          if (NeonPlatform.instance.canUseCamera) ...[
            const SizedBox(
              height: 50,
            ),
            IconButton(
              tooltip: NeonLocalizations.of(context).loginUsingQRcode,
              icon: Icon(
                AdaptiveIcons.qr_code_scanner,
                size: 60,
              ),
              onPressed: () => context.read<LoginBloc>().add(const LoginUseQRCode()),
            ),
          ],
        ],
      ),
    );
  }
}

class _ServerUrlField extends StatefulWidget {
  const _ServerUrlField({super.key});

  @override
  State<_ServerUrlField> createState() => _ServerUrlFieldState();
}

class _ServerUrlFieldState extends State<_ServerUrlField> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void login(String url) {
    if (_formKey.currentState!.validate()) {
      final uri = Uri.parse(url);

      context.read<LoginBloc>().add(LoginUrlEntered(uri));
    } else {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'https://...',
          labelText: NeonLocalizations.of(context).loginUsingServerAddress,
          suffixIcon: IconButton(
            tooltip: NeonLocalizations.of(context).loginUsingServerAddress,
            icon: Icon(AdaptiveIcons.arrow_forward),
            onPressed: () => login(_controller.text),
          ),
        ),
        keyboardType: TextInputType.url,
        validator: (input) => validateHttpUrl(context, input),
        onFieldSubmitted: login,
        autofillHints: const [
          AutofillHints.url,
        ],
      ),
    );
  }
}
