part of '../../neon.dart';

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
  WebViewController? _webViewController;
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final PackageInfo _packageInfo;
  late final AccountsBloc _accountsBloc;
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();

    _packageInfo = Provider.of<PackageInfo>(context, listen: false);
    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _loginBloc = LoginBloc(_packageInfo);

    if (widget.serverURL != null) {
      _loginBloc.setServerURL(widget.serverURL);
    }

    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (Provider.of<NeonPlatform>(context, listen: false).canUseWebView) {
        _webViewController = WebViewController()
          // ignore: discarded_futures
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          // ignore: discarded_futures
          ..enableZoom(false)
          // ignore: discarded_futures
          ..setUserAgent(userAgent(_packageInfo));
      }

      _loginBloc.loginFlowInit.listen((final init) async {
        if (init != null) {
          if (Provider.of<NeonPlatform>(context, listen: false).canUseWebView) {
            await _webViewController!.loadRequest(Uri.parse(init.login));
          } else {
            await launchUrlString(
              init.login,
              mode: LaunchMode.externalApplication,
            );
          }
        }
      });
    });

    _loginBloc.loginFlowResult.listen((final result) async {
      if (result != null) {
        try {
          final account = await getAccount(
            _packageInfo,
            result.server,
            result.loginName,
            result.appPassword,
          );

          if (!mounted) {
            return;
          }

          if (widget.serverURL != null) {
            _accountsBloc.updateAccount(account);
            Navigator.of(context).pop();
          } else {
            final existingAccount = _accountsBloc.accounts.value.find(account.id);
            if (existingAccount != null) {
              NeonException.showSnackbar(context, AppLocalizations.of(context).errorAccountAlreadyExists);
              await _loginBloc.refresh();
              return;
            }
            _accountsBloc
              ..addAccount(account)
              ..setActiveAccount(account);
          }
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
          NeonException.showSnackbar(context, e);
          await _loginBloc.refresh();
        }
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<List<Account>>(
        stream: _accountsBloc.accounts,
        builder: (final context, final accountsSnapshot) => BackButtonListener(
          onBackButtonPressed: () async {
            if (accountsSnapshot.data?.isNotEmpty ?? false) {
              return false;
            }

            if ((await _loginBloc.serverURL.first) == null) {
              return false;
            }

            _loginBloc.setServerURL(null);
            return true;
          },
          child: StreamBuilder<String?>(
            stream: _loginBloc.serverURL,
            builder: (final context, final serverURLSnapshot) => StreamBuilder<ServerConnectionState?>(
              stream: _loginBloc.serverConnectionState,
              builder: (final context, final serverConnectionStateSnapshot) => Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: serverConnectionStateSnapshot.data == ServerConnectionState.success ||
                        (accountsSnapshot.data?.isNotEmpty ?? false)
                    ? AppBar(
                        leading: IconButton(
                          onPressed: () {
                            if (accountsSnapshot.data?.isNotEmpty ?? false) {
                              Navigator.of(context).pop();
                            } else {
                              _loginBloc.setServerURL(null);
                            }
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        actions: [
                          if (serverConnectionStateSnapshot.data != null) ...[
                            IconButton(
                              onPressed: _loginBloc.refresh,
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
                        ],
                      )
                    : null,
                body: serverConnectionStateSnapshot.data == ServerConnectionState.success
                    ? Provider.of<NeonPlatform>(context).canUseWebView
                        ? WebViewWidget(
                            controller: _webViewController!,
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppLocalizations.of(context).loginSwitchToBrowserWindow),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: _loginBloc.refresh,
                                  child: Text(AppLocalizations.of(context).loginOpenAgain),
                                ),
                              ],
                            ),
                          )
                    : Center(
                        child: Scrollbar(
                          interactive: true,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                            primary: true,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/logo.svg',
                                  width: 100,
                                  height: 100,
                                ),
                                Text(
                                  Provider.of<Branding>(context, listen: false).name,
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
                                    onFieldSubmitted: (final input) {
                                      if (_formKey.currentState!.validate()) {
                                        _loginBloc.setServerURL(input);
                                      } else {
                                        _focusNode.requestFocus();
                                      }
                                    },
                                  ),
                                ),
                                NeonLinearProgressIndicator(
                                  visible: serverConnectionStateSnapshot.data == ServerConnectionState.loading,
                                ),
                                if (serverConnectionStateSnapshot.data == ServerConnectionState.unreachable) ...[
                                  NeonException(
                                    AppLocalizations.of(context).errorUnableToReachServer,
                                    onRetry: _loginBloc.refresh,
                                  ),
                                ],
                                if (serverConnectionStateSnapshot.data == ServerConnectionState.maintenanceMode) ...[
                                  NeonException(
                                    AppLocalizations.of(context).errorServerInMaintenanceMode,
                                    onRetry: _loginBloc.refresh,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
}
