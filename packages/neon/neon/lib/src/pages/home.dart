part of '../../neon.dart';

const kQuickBarWidth = kAvatarSize + 20;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: prefer_mixin
class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final drawerScrollController = ScrollController();

  late Account _account;
  late GlobalOptions _globalOptions;
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late CapabilitiesBloc _capabilitiesBloc;

  @override
  void initState() {
    super.initState();
    _globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _account = _accountsBloc.activeAccount.value!;
    _appsBloc = _accountsBloc.activeAppsBloc;
    _capabilitiesBloc = _accountsBloc.activeCapabilitiesBloc;

    _appsBloc.openNotifications.listen((final _) async {
      final notificationsAppImplementation = _appsBloc.notificationsAppImplementation.valueOrNull;
      if (notificationsAppImplementation != null) {
        await _openNotifications(
          notificationsAppImplementation.data!,
          _accountsBloc.accounts.value,
          _accountsBloc.activeAccount.value!,
        );
      }
    });

    _capabilitiesBloc.capabilities.listen((final result) async {
      if (result.data != null) {
        // ignore cached version and prevent duplicate dialogs
        if (result.cached) {
          return;
        }
        _appsBloc.appImplementations.listen((final appsResult) async {
          // ignore cached version and prevent duplicate dialogs
          if (appsResult.data == null || appsResult.cached) {
            return;
          }
          for (final id in [
            'core',
            ...appsResult.data!.map((final a) => a.id),
          ]) {
            try {
              final (supported, _) = switch (id) {
                'core' => await _account.client.core.isSupported(result.data),
                'news' => await _account.client.news.isSupported(),
                'notes' => await _account.client.notes.isSupported(result.data),
                _ => (true, null),
              };
              if (supported || !mounted) {
                return;
              }
              var name = AppLocalizations.of(context).appImplementationName(id);
              if (name == '') {
                name = id;
              }
              await _showProblem(
                AppLocalizations.of(context).errorUnsupportedVersion(name),
              );
            } catch (e, s) {
              debugPrint(e.toString());
              debugPrint(s.toString());
            }
          }
        });
      }
    });

    GlobalPopups().register(context);

    unawaited(_checkMaintenanceMode());
  }

  Future _checkMaintenanceMode() async {
    try {
      final status = await _account.client.core.getStatus();
      if (status.maintenance) {
        if (!mounted) {
          return;
        }
        await _showProblem(
          AppLocalizations.of(context).errorServerInMaintenanceMode,
        );
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      NeonException.showSnackbar(context, e);
    }
  }

  Future _showProblem(final String title) async {
    await showDialog(
      context: context,
      builder: (final context) => AlertDialog(
        title: Text(title),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppLocalizations.of(context).actionClose),
          ),
        ],
      ),
    );
  }

  Future _openNotifications(
    final NotificationsAppInterface app,
    final List<Account> accounts,
    final Account account,
  ) async {
    final page = Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(app.name(context)),
            if (accounts.length > 1) ...[
              Text(
                account.client.humanReadableID,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
      body: app.page,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final context) => Provider<NotificationsBlocInterface>(
          create: (final context) => app.getBloc(account),
          child: page,
        ),
      ),
    );
  }

  @override
  void dispose() {
    drawerScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<Capabilities>(
        stream: _capabilitiesBloc.capabilities,
        builder: (final context, final capabilities) => ResultBuilder<Iterable<AppImplementation>>(
          stream: _appsBloc.appImplementations,
          builder: (final context, final appImplementations) => ResultBuilder<NotificationsAppInterface?>(
            stream: _appsBloc.notificationsAppImplementation,
            builder: (final context, final notificationsAppImplementation) => StreamBuilder<String?>(
              stream: _appsBloc.activeAppID,
              builder: (final context, final activeAppIDSnapshot) => StreamBuilder<List<Account>>(
                stream: _accountsBloc.accounts,
                builder: (final context, final accountsSnapshot) => OptionBuilder<NavigationMode>(
                  option: _globalOptions.navigationMode,
                  builder: (final context, final navigationMode) {
                    final accounts = accountsSnapshot.data;
                    final account = accounts?.find(_account.id);
                    if (accounts == null || account == null) {
                      return const Scaffold();
                    }

                    final drawerAlwaysVisible = navigationMode == NavigationMode.drawerAlwaysVisible;

                    const drawer = NeonDrawer();
                    final appBar = AppBar(
                      automaticallyImplyLeading: !drawerAlwaysVisible,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (appImplementations.data != null && activeAppIDSnapshot.hasData) ...[
                                Flexible(
                                  child: Text(
                                    appImplementations.data!.find(activeAppIDSnapshot.data!)!.name(context),
                                  ),
                                ),
                              ],
                              if (appImplementations.error != null) ...[
                                const SizedBox(
                                  width: 8,
                                ),
                                NeonException(
                                  appImplementations.error,
                                  onRetry: _appsBloc.refresh,
                                  onlyIcon: true,
                                ),
                              ],
                              if (appImplementations.loading) ...[
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: NeonLinearProgressIndicator(
                                    color: Theme.of(context).appBarTheme.foregroundColor,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (accounts.length > 1) ...[
                            Text(
                              account.client.humanReadableID,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                      actions: [
                        if (notificationsAppImplementation.data != null) ...[
                          StreamBuilder<int>(
                            stream: notificationsAppImplementation.data!
                                .getUnreadCounter(notificationsAppImplementation.data!.getBloc(account)),
                            builder: (final context, final unreadCounterSnapshot) {
                              final unreadCount = unreadCounterSnapshot.data ?? 0;
                              return IconButton(
                                key: Key('app-${notificationsAppImplementation.data!.id}'),
                                onPressed: () async {
                                  await _openNotifications(
                                    notificationsAppImplementation.data!,
                                    accounts,
                                    account,
                                  );
                                },
                                tooltip: AppLocalizations.of(context)
                                    .appImplementationName(notificationsAppImplementation.data!.id),
                                icon: NeonAppImplementationIcon(
                                  appImplementation: notificationsAppImplementation.data!,
                                  unreadCount: unreadCount,
                                  color: unreadCount > 0
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.onBackground,
                                  size: const Size.square(kAvatarSize * 2 / 3),
                                ),
                              );
                            },
                          ),
                        ],
                        IconButton(
                          onPressed: () {
                            AccountSettingsRoute(accountid: account.id).go(context);
                          },
                          tooltip: AppLocalizations.of(context).settingsAccount,
                          icon: NeonUserAvatar(
                            account: account,
                          ),
                        ),
                      ],
                    );

                    Widget body = Builder(
                      builder: (final context) {
                        if (appImplementations.data == null) {
                          return const SizedBox.shrink();
                        }

                        if (appImplementations.data!.isEmpty) {
                          return const NoAppsPage();
                        }

                        return appImplementations.data!.find(activeAppIDSnapshot.data!)!.page;
                      },
                    );

                    body = MultiProvider(
                      providers: _appsBloc.appBlocProviders,
                      child: Scaffold(
                        key: _scaffoldKey,
                        resizeToAvoidBottomInset: false,
                        drawer: !drawerAlwaysVisible ? drawer : null,
                        appBar: appBar,
                        body: body,
                      ),
                    );

                    if (drawerAlwaysVisible) {
                      body = Row(
                        children: [
                          drawer,
                          Expanded(
                            child: body,
                          ),
                        ],
                      );
                    }

                    return WillPopScope(
                      onWillPop: () async {
                        if (_scaffoldKey.currentState!.isDrawerOpen) {
                          Navigator.pop(context);
                          return true;
                        }

                        _scaffoldKey.currentState!.openDrawer();
                        return false;
                      },
                      child: body,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
}
