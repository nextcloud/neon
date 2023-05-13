part of '../../neon.dart';

const kQuickBarWidth = kAvatarSize + 20;

class HomePage extends StatefulWidget {
  const HomePage({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: prefer_mixin
class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final drawerScrollController = ScrollController();

  late GlobalOptions _globalOptions;
  late AccountsBloc _accountsBloc;
  late AppsBloc _appsBloc;
  late CapabilitiesBloc _capabilitiesBloc;

  @override
  void initState() {
    super.initState();

    _globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    _appsBloc = _accountsBloc.getAppsBloc(widget.account);
    _capabilitiesBloc = _accountsBloc.getCapabilitiesBloc(widget.account);

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
              bool? supported;
              switch (id) {
                case 'core':
                  supported = await widget.account.client.core.isSupported(result.data);
                  break;
                case 'news':
                  supported = await widget.account.client.news.isSupported();
                  break;
                case 'notes':
                  supported = await widget.account.client.notes.isSupported(result.data);
                  break;
              }
              if (!(supported ?? true)) {
                if (!mounted) {
                  return;
                }
                var name = AppLocalizations.of(context).appImplementationName(id);
                if (name == '') {
                  name = id;
                }
                await _showProblem(
                  AppLocalizations.of(context).errorUnsupportedVersion(name),
                );
              }
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
      final status = await widget.account.client.core.getStatus();
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
            child: Text(AppLocalizations.of(context).close),
          ),
        ],
      ),
    );
  }

  Future _openSettings() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final context) => const SettingsPage(),
      ),
    );
  }

  Future _openNotifications(
    final NotificationsAppInterface app,
    final List<Account> accounts,
    final Account account,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (final context) => Scaffold(
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
          body: app.buildPage(context, _appsBloc),
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
        builder: (final context, final capabilities) => ResultBuilder<List<AppImplementation>>(
          stream: _appsBloc.appImplementations,
          builder: (final context, final appImplementations) => ResultBuilder<NotificationsAppInterface?>(
            stream: _appsBloc.notificationsAppImplementation,
            builder: (final context, final notificationsAppImplementation) => StreamBuilder<String?>(
              stream: _appsBloc.activeAppID,
              builder: (
                final context,
                final activeAppIDSnapshot,
              ) =>
                  StreamBuilder<List<Account>>(
                stream: _accountsBloc.accounts,
                builder: (
                  final context,
                  final accountsSnapshot,
                ) =>
                    OptionBuilder<NavigationMode>(
                  option: _globalOptions.navigationMode,
                  builder: (final context, final navigationMode) => WillPopScope(
                    onWillPop: () async {
                      if (_scaffoldKey.currentState!.isDrawerOpen) {
                        Navigator.pop(context);
                        return true;
                      }

                      _scaffoldKey.currentState!.openDrawer();
                      return false;
                    },
                    child: Builder(
                      builder: (final context) {
                        if (accountsSnapshot.hasData) {
                          final accounts = accountsSnapshot.data!;
                          final account = accounts.find(widget.account.id)!;

                          final isQuickBar = navigationMode == NavigationMode.quickBar;
                          final drawer = Drawer(
                            width: isQuickBar ? kQuickBarWidth : null,
                            child: Container(
                              padding: isQuickBar ? const EdgeInsets.all(5) : null,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Scrollbar(
                                      controller: drawerScrollController,
                                      interactive: true,
                                      child: ListView(
                                        controller: drawerScrollController,
                                        // Needed for the drawer header to also render in the statusbar
                                        padding: EdgeInsets.zero,
                                        children: [
                                          Builder(
                                            builder: (final context) {
                                              if (accountsSnapshot.hasData) {
                                                if (isQuickBar) {
                                                  return Column(
                                                    children: [
                                                      if (accounts.length != 1) ...[
                                                        for (final account in accounts) ...[
                                                          Container(
                                                            margin: const EdgeInsets.symmetric(
                                                              vertical: 5,
                                                            ),
                                                            child: Tooltip(
                                                              message: account.client.humanReadableID,
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  _accountsBloc.setActiveAccount(account);
                                                                },
                                                                icon: IntrinsicHeight(
                                                                  child: NeonAccountAvatar(
                                                                    account: account,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        Container(
                                                          margin: const EdgeInsets.only(
                                                            top: 10,
                                                          ),
                                                          child: Divider(
                                                            height: 5,
                                                            color: Theme.of(context).appBarTheme.foregroundColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  );
                                                }
                                                return DrawerHeader(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context).colorScheme.primary,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      if (capabilities.data != null) ...[
                                                        if (capabilities.data!.capabilities.theming?.name != null) ...[
                                                          Text(
                                                            capabilities.data!.capabilities.theming!.name!,
                                                            style: DefaultTextStyle.of(context).style.copyWith(
                                                                  color: Theme.of(context).appBarTheme.foregroundColor,
                                                                ),
                                                          ),
                                                        ],
                                                        if (capabilities.data!.capabilities.theming?.logo != null) ...[
                                                          Flexible(
                                                            child: NeonCachedUrlImage(
                                                              url: capabilities.data!.capabilities.theming!.logo!,
                                                            ),
                                                          ),
                                                        ],
                                                      ] else ...[
                                                        NeonException(
                                                          capabilities.error,
                                                          onRetry: _capabilitiesBloc.refresh,
                                                        ),
                                                        NeonLinearProgressIndicator(
                                                          visible: capabilities.loading,
                                                        ),
                                                      ],
                                                      if (accounts.length != 1) ...[
                                                        DropdownButtonHideUnderline(
                                                          child: DropdownButton<String>(
                                                            isExpanded: true,
                                                            dropdownColor: Theme.of(context).colorScheme.primary,
                                                            iconEnabledColor:
                                                                Theme.of(context).colorScheme.onBackground,
                                                            value: widget.account.id,
                                                            items: accounts
                                                                .map<DropdownMenuItem<String>>(
                                                                  (final account) => DropdownMenuItem<String>(
                                                                    value: account.id,
                                                                    child: NeonAccountTile(
                                                                      account: account,
                                                                      dense: true,
                                                                      textColor:
                                                                          Theme.of(context).appBarTheme.foregroundColor,
                                                                    ),
                                                                  ),
                                                                )
                                                                .toList(),
                                                            onChanged: (final id) {
                                                              if (id != null) {
                                                                _accountsBloc.setActiveAccount(accounts.find(id));
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                                );
                                              }
                                              return Container();
                                            },
                                          ),
                                          NeonException(
                                            appImplementations.error,
                                            onlyIcon: isQuickBar,
                                            onRetry: _appsBloc.refresh,
                                          ),
                                          NeonLinearProgressIndicator(
                                            visible: appImplementations.loading,
                                          ),
                                          if (appImplementations.data != null) ...[
                                            for (final appImplementation in appImplementations.data!) ...[
                                              StreamBuilder<int>(
                                                stream: appImplementation.getUnreadCounter(_appsBloc) ??
                                                    BehaviorSubject<int>.seeded(0),
                                                builder: (final context, final unreadCounterSnapshot) {
                                                  final unreadCount = unreadCounterSnapshot.data ?? 0;
                                                  if (isQuickBar) {
                                                    return Tooltip(
                                                      message: appImplementation.name(context),
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          await _appsBloc.setActiveApp(appImplementation.id);
                                                        },
                                                        icon: NeonAppImplementationIcon(
                                                          appImplementation: appImplementation,
                                                          unreadCount: unreadCount,
                                                          color: Theme.of(context).colorScheme.primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  return ListTile(
                                                    key: Key('app-${appImplementation.id}'),
                                                    title: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(appImplementation.name(context)),
                                                        if (unreadCount > 0) ...[
                                                          Text(
                                                            unreadCount.toString(),
                                                            style: TextStyle(
                                                              color: Theme.of(context).colorScheme.primary,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ],
                                                    ),
                                                    leading: appImplementation.buildIcon(context),
                                                    minLeadingWidth: 0,
                                                    onTap: () async {
                                                      await _appsBloc.setActiveApp(appImplementation.id);
                                                      if (navigationMode == NavigationMode.drawer) {
                                                        // Don't pop when the drawer is always shown
                                                        if (!mounted) {
                                                          return;
                                                        }
                                                        Navigator.of(context).pop();
                                                      }
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (isQuickBar) ...[
                                    IconButton(
                                      icon: Icon(
                                        Icons.settings,
                                        color: Theme.of(context).appBarTheme.foregroundColor,
                                      ),
                                      onPressed: _openSettings,
                                    ),
                                  ] else ...[
                                    ListTile(
                                      key: const Key('settings'),
                                      title: Text(AppLocalizations.of(context).settings),
                                      leading: const Icon(Icons.settings),
                                      minLeadingWidth: 0,
                                      onTap: () async {
                                        if (navigationMode == NavigationMode.drawer) {
                                          Navigator.of(context).pop();
                                        }
                                        await _openSettings();
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );

                          return Scaffold(
                            resizeToAvoidBottomInset: false,
                            body: Row(
                              children: [
                                if (navigationMode == NavigationMode.drawerAlwaysVisible) ...[
                                  drawer,
                                ],
                                Expanded(
                                  child: Scaffold(
                                    key: _scaffoldKey,
                                    resizeToAvoidBottomInset: false,
                                    drawer: navigationMode == NavigationMode.drawer ? drawer : null,
                                    appBar: AppBar(
                                      scrolledUnderElevation: navigationMode != NavigationMode.drawer ? 0 : null,
                                      automaticallyImplyLeading: navigationMode == NavigationMode.drawer,
                                      leadingWidth: isQuickBar ? kQuickBarWidth : null,
                                      leading: isQuickBar
                                          ? Container(
                                              padding: const EdgeInsets.all(5),
                                              child: capabilities.data?.capabilities.theming?.logo != null
                                                  ? NeonCachedUrlImage(
                                                      url: capabilities.data!.capabilities.theming!.logo!,
                                                      svgColor: Theme.of(context).iconTheme.color,
                                                    )
                                                  : null,
                                            )
                                          : null,
                                      title: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              if (appImplementations.data != null && activeAppIDSnapshot.hasData) ...[
                                                Flexible(
                                                  child: Text(
                                                    appImplementations.data!
                                                        .find(activeAppIDSnapshot.data!)!
                                                        .name(context),
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
                                            stream: notificationsAppImplementation.data!.getUnreadCounter(_appsBloc),
                                            builder: (final context, final unreadCounterSnapshot) {
                                              final unreadCount = unreadCounterSnapshot.data ?? 0;
                                              return IconButton(
                                                key: Key('app-${notificationsAppImplementation.data!.id}'),
                                                icon: NeonAppImplementationIcon(
                                                  appImplementation: notificationsAppImplementation.data!,
                                                  unreadCount: unreadCount,
                                                  color: unreadCount > 0
                                                      ? Theme.of(context).colorScheme.primary
                                                      : Theme.of(context).colorScheme.onBackground,
                                                  size: const Size.square(kAvatarSize * 2 / 3),
                                                ),
                                                onPressed: () async {
                                                  await _openNotifications(
                                                    notificationsAppImplementation.data!,
                                                    accounts,
                                                    account,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                        IconButton(
                                          icon: IntrinsicWidth(
                                            child: NeonAccountAvatar(
                                              account: account,
                                            ),
                                          ),
                                          onPressed: () async {
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (final context) => AccountSettingsPage(
                                                  bloc: _accountsBloc,
                                                  account: account,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    body: Row(
                                      children: [
                                        if (navigationMode == NavigationMode.quickBar) ...[
                                          drawer,
                                        ],
                                        Expanded(
                                          child: Column(
                                            children: [
                                              if (appImplementations.data != null) ...[
                                                if (appImplementations.data!.isEmpty) ...[
                                                  Expanded(
                                                    child: Center(
                                                      child: Text(
                                                        AppLocalizations.of(context)
                                                            .errorNoCompatibleNextcloudAppsFound,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ] else ...[
                                                  if (activeAppIDSnapshot.hasData) ...[
                                                    Expanded(
                                                      child: appImplementations.data!
                                                          .find(activeAppIDSnapshot.data!)!
                                                          .buildPage(context, _appsBloc),
                                                    ),
                                                  ],
                                                ],
                                              ],
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
