import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/branding.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/validators.dart';
import 'package:neon/src/widgets/nextcloud_logo.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    this.serverURL,
    super.key,
  });

  final String? serverURL;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.serverURL != null) {
      WidgetsBinding.instance.addPostFrameCallback((final _) async {
        await _beginLoginFlow(widget.serverURL!);
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future _beginLoginFlow(final String serverURL) async {
    final result = await LoginCheckServerStatusRoute(serverURL: serverURL).push<bool>(context);
    if ((result ?? false) && mounted) {
      // This needs be done, otherwise the context is dirty after returning from the previously pushed route
      WidgetsBinding.instance.addPostFrameCallback((final _) async {
        await LoginFlowRoute(serverURL: serverURL).push(context);
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    final branding = Provider.of<Branding>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: Navigator.of(context).canPop() ? const CloseButton() : null,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 640,
          ),
          child: Scrollbar(
            interactive: true,
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
                    height: 30,
                  ),
                  Text(AppLocalizations.of(context).loginWorksWith),
                  const SizedBox(
                    height: 20,
                  ),
                  const NextcloudLogo(),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: 'https://...',
                      ),
                      keyboardType: TextInputType.url,
                      initialValue: widget.serverURL,
                      validator: (final input) => validateHttpUrl(context, input),
                      onFieldSubmitted: (final input) async {
                        if (_formKey.currentState!.validate()) {
                          await _beginLoginFlow(input);
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
