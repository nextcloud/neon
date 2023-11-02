import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/theme/branding.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/validators.dart';
import 'package:neon/src/widgets/nextcloud_logo.dart';

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

  void login(final String url) {
    if (_formKey.currentState!.validate()) {
      final uri = Uri.parse(url);

      LoginCheckServerStatusRoute(serverUrl: uri).go(context);
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
                  if (branding.showLoginWithNextcloud)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(NeonLocalizations.of(context).loginWorksWith),
                    ),
                  if (branding.showLoginWithNextcloud)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Semantics(
                        label: NeonLocalizations.of(context).nextcloud,
                        child: const NextcloudLogo(),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        focusNode: _focusNode,
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'https://...',
                          labelText: NeonLocalizations.of(context).loginUsingServerAddress,
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
                        autofillHints: const [AutofillHints.url],
                      ),
                    ),
                  ),
                  if (NeonPlatform.instance.canUseCamera)
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: IconButton(
                        tooltip: NeonLocalizations.of(context).loginUsingQRcode,
                        icon: const Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 60,
                        ),
                        onPressed: () => const LoginQRcodeRoute().go(context),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
