import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/theme/branding.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/validators.dart';
import 'package:neon/src/widgets/nextcloud_logo.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final branding = Branding.of(context);
    final platform = Provider.of<NeonPlatform>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Navigator.canPop(context) ? const CloseButton() : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: NeonDialogTheme.of(context).constraints,
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              primary: true,
              child: Column(
                children: [
                  branding.logo,
                  Text(
                    branding.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (branding.showLoginWithNextcloud) ...[
                    Text(AppLocalizations.of(context).loginWorksWith),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                  const NextcloudLogo(),
                  const SizedBox(
                    height: 40,
                  ),
                  if (platform.canUseCamera) ...[
                    ExcludeSemantics(
                      child: Center(
                        child: Text(AppLocalizations.of(context).loginUsingQrcode),
                      ),
                    ),
                    IconButton(
                      tooltip: AppLocalizations.of(context).loginUsingQrcode,
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        size: 50,
                      ),
                      onPressed: () => const LoginQrcodeRoute().go(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ExcludeSemantics(
                      child: Center(
                        child: Text(AppLocalizations.of(context).loginUsingServerAddress),
                      ),
                    ),
                  ],
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: 'https://...',
                      ),
                      keyboardType: TextInputType.url,
                      validator: (final input) => validateHttpUrl(context, input),
                      onFieldSubmitted: (final input) {
                        if (_formKey.currentState!.validate()) {
                          LoginCheckServerStatusRoute(serverUrl: input).go(context);
                        } else {
                          _focusNode.requestFocus();
                        }
                      },
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
