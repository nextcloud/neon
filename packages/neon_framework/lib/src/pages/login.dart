import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/theme/branding.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/utils/validators.dart';
import 'package:neon_framework/src/widgets/nextcloud_logo.dart';

@internal
class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

      LoginCheckServerStatusRoute(serverUrl: uri).go(context);
    } else {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final branding = Branding.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Navigator.canPop(context)
          ? AppBar(
              leading: const CloseButton(),
            )
          : null,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: NeonDialogTheme.of(context).constraints,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
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
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      focusNode: _focusNode,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'https://...',
                        labelText: NeonLocalizations.of(context).loginUsingServerAddress,
                        suffixIcon: IconButton(
                          icon: Icon(AdaptiveIcons.arrow_forward),
                          onPressed: () {
                            login(_controller.text);
                          },
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      validator: (input) => validateHttpUrl(context, input),
                      onFieldSubmitted: login,
                      autofillHints: const [AutofillHints.url],
                    ),
                  ),
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
                      onPressed: () => const LoginQRcodeRoute().go(context),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
