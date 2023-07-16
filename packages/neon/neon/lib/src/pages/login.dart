import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/theme/branding.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/validators.dart';
import 'package:neon/src/widgets/nextcloud_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
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

  void login(final String url) {
    if (_formKey.currentState!.validate()) {
      LoginCheckServerStatusRoute(serverUrl: url).go(context);
    } else {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final branding = Branding.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Navigator.canPop(context)
          ? AppBar(
              leading: const CloseButton(),
            )
          : null,
      body: Center(
        child: ConstrainedBox(
          constraints: NeonDialogTheme.of(context).constraints,
          child: Scrollbar(
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
                    Text(AppLocalizations.of(context).loginWorksWith),
                    const SizedBox(
                      height: 10,
                    ),
                    Semantics(
                      label: AppLocalizations.of(context).nextcloud,
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
                        labelText: AppLocalizations.of(context).loginUsingServerAddress,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            login(_controller.text);
                          },
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      validator: (final input) => validateHttpUrl(context, input),
                      onFieldSubmitted: login,
                    ),
                  ),
                  if (NeonPlatform.instance.canUseCamera) ...[
                    const SizedBox(
                      height: 50,
                    ),
                    IconButton(
                      tooltip: AppLocalizations.of(context).loginUsingQrcode,
                      icon: const Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 60,
                      ),
                      onPressed: () => const LoginQrcodeRoute().go(context),
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
