part of '../neon.dart';

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
      _loginBloc.setServerURL(widget.serverURL!);
    }

    _loginBloc.loginFlowInit.listen((final init) {
      if (init != null && !Provider.of<NeonPlatform>(context, listen: false).canUseWebView) {
        WidgetsBinding.instance.addPostFrameCallback((final _) async {
          await launchUrlString(
            init.login,
            mode: LaunchMode.externalApplication,
            webViewConfiguration: WebViewConfiguration(
              headers: _buildHeaders(context, Provider.of<Env?>(context, listen: false)),
            ),
          );
        });
      }
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
            for (final a in _accountsBloc.accounts.value) {
              if (a.id == account.id) {
                ExceptionWidget.showSnackbar(context, AppLocalizations.of(context).errorAccountAlreadyExists);
                await _loginBloc.refresh();
                return;
              }
            }
            _accountsBloc
              ..addAccount(account)
              ..setActiveAccount(account);
          }
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
          ExceptionWidget.showSnackbar(context, e);
          await _loginBloc.refresh();
        }
      }
    });
  }

  Map<String, String> _buildHeaders(
    final BuildContext context,
    final Env? env,
  ) =>
      {
        HttpHeaders.userAgentHeader: userAgent(_packageInfo),
        if (env != null) ...{
          HttpHeaders.authorizationHeader:
              'Basic ${base64.encode(utf8.encode('${env.testUsername}:${env.testPassword}'))}',
        },
      };

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final env = Provider.of<Env?>(context);

    return StreamBuilder<List<Account>>(
      stream: _accountsBloc.accounts,
      builder: (final context, final accountsSnapshot) => WillPopScope(
        onWillPop: () async {
          if (accountsSnapshot.data?.isNotEmpty ?? false) {
            return true;
          }

          if ((await _loginBloc.serverURL.first) == null) {
            return true;
          }

          _loginBloc.setServerURL(null);
          return false;
        },
        child: StreamBuilder<String?>(
          stream: _loginBloc.serverURL,
          builder: (final context, final serverURLSnapshot) => StreamBuilder<ServerConnectionState?>(
            stream: _loginBloc.serverConnectionState,
            builder: (final context, final serverConnectionStateSnapshot) => Scaffold(
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
                        IconButton(
                          onPressed: _loginBloc.refresh,
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    )
                  : null,
              body: serverConnectionStateSnapshot.data == ServerConnectionState.success
                  ? Provider.of<NeonPlatform>(context).canUseWebView
                      ? WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          zoomEnabled: false,
                          userAgent: userAgent(_packageInfo),
                          onWebViewCreated: (final controller) async {
                            _webViewController = controller;
                            final url =
                                (await _loginBloc.loginFlowInit.firstWhere((final init) => init != null))!.login;
                            if (mounted) {
                              await _webViewController!.loadUrl(
                                url,
                                headers: _buildHeaders(context, env),
                              );
                            }
                          },
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
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: Column(
                              children: [
                                const NeonLogo(),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(AppLocalizations.of(context).loginWorksWith),
                                const SizedBox(
                                  height: 20,
                                ),
                                const NextcloudLogo(),
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              focusNode: _focusNode,
                              decoration: const InputDecoration(
                                hintText: 'https://...',
                              ),
                              initialValue:
                                  widget.serverURL ?? (env?.testHost != null ? 'http://${env!.testHost}' : null),
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
                          Column(
                            children: [
                              CustomLinearProgressIndicator(
                                visible: serverConnectionStateSnapshot.data == ServerConnectionState.loading,
                              ),
                              if (serverConnectionStateSnapshot.data == ServerConnectionState.unreachable) ...[
                                ExceptionWidget(
                                  AppLocalizations.of(context).errorUnableToReachServer,
                                  onRetry: _loginBloc.refresh,
                                ),
                              ],
                              if (serverConnectionStateSnapshot.data == ServerConnectionState.maintenanceMode) ...[
                                ExceptionWidget(
                                  AppLocalizations.of(context).errorServerInMaintenanceMode,
                                  onRetry: _loginBloc.refresh,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
