part of '../neon.dart';

const kQuickBarWidth = kAvatarSize + 20;

class HomePage extends StatefulWidget {
  const HomePage({
    required this.account,
    required this.onThemeChanged,
    super.key,
  });

  final Account account;
  final Function(NextcloudTheme theme) onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: prefer_mixin
class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late GlobalOptions _globalOptions;
  late CapabilitiesBloc _capabilitiesBloc;
  late AppsBloc _appsBloc;

  @override
  void initState() {
    super.initState();

    _globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    _appsBloc = RxBlocProvider.of<AccountsBloc>(context).getAppsBloc(widget.account);
    _capabilitiesBloc = RxBlocProvider.of<AccountsBloc>(context).getCapabilitiesBloc(widget.account);

    _capabilitiesBloc.capabilities.listen((final result) async {
      if (result.data != null) {
        widget.onThemeChanged(result.data!.capabilities.theming!);

        // ignore cached version and prevent duplicate dialogs
        if (result is ResultSuccess) {
          _appsBloc.appImplementations.listen((final appsResult) async {
            // ignore cached version and prevent duplicate dialogs
            if (appsResult is ResultSuccess) {
              for (final id in [
                'core',
                ...appsResult.data!.map((final a) => a.id),
              ]) {
                try {
                  bool? supported;
                  switch (id) {
                    case 'core':
                      supported = await widget.account.client.core.isSupported(result.data!);
                      break;
                    case 'news':
                      supported = await widget.account.client.news.isSupported();
                      break;
                    case 'notes':
                      supported = await widget.account.client.notes.isSupported(result.data!);
                      break;
                  }
                  if (!(supported ?? true)) {
                    if (!mounted) {
                      return;
                    }
                    await _showProblem(
                      AppLocalizations.of(context).errorUnsupportedVersion(
                        id == 'core'
                            ? AppLocalizations.of(context).coreName
                            : appsResult.data!.singleWhere((final a) => a.id == id).name(context),
                      ),
                    );
                  }
                } catch (e, s) {
                  debugPrint(e.toString());
                  debugPrint(s.toString());
                }
              }
            }
          });
        }
      }
    });

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
      ExceptionWidget.showSnackbar(context, e);
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

  @override
  void dispose() {
    _capabilitiesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = RxBlocProvider.of<AccountsBloc>(context);
    return StandardRxResultBuilder<CapabilitiesBloc, Capabilities>(
      bloc: _capabilitiesBloc,
      state: (final bloc) => bloc.capabilities,
      builder: (
        final context,
        final capabilitiesData,
        final capabilitiesError,
        final capabilitiesLoading,
        final _,
      ) =>
          StandardRxResultBuilder<AppsBloc, List<AppImplementation>>(
        bloc: _appsBloc,
        state: (final bloc) => bloc.appImplementations,
        builder: (
          final context,
          final appsData,
          final appsError,
          final appsLoading,
          final _,
        ) =>
            StandardRxResultBuilder<AppsBloc, NotificationsApp?>(
          bloc: _appsBloc,
          state: (final bloc) => bloc.notificationsAppImplementation,
          builder: (
            final context,
            final notificationsAppData,
            final notificationsAppError,
            final notificationsAppLoading,
            final _,
          ) =>
              RxBlocBuilder<AppsBloc, String?>(
            bloc: _appsBloc,
            state: (final bloc) => bloc.activeAppID,
            builder: (
              final context,
              final activeAppIDSnapshot,
              final _,
            ) =>
                RxBlocBuilder<AccountsBloc, List<Account>>(
              bloc: accountsBloc,
              state: (final bloc) => bloc.accounts,
              builder: (
                final context,
                final accountsSnapshot,
                final _,
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
                        final account = accounts.singleWhere((final account) => account.id == widget.account.id);

                        final isQuickBar = navigationMode == NavigationMode.quickBar;
                        final drawer = Drawer(
                          width: isQuickBar ? kQuickBarWidth : null,
                          child: Container(
                            padding: isQuickBar ? const EdgeInsets.all(5) : null,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Scrollbar(
                                    child: ListView(
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
                                                                accountsBloc.setActiveAccount(account);
                                                              },
                                                              icon: IntrinsicHeight(
                                                                child: AccountAvatar(
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
                                                    if (capabilitiesData != null) ...[
                                                      Text(
                                                        capabilitiesData.capabilities.theming!.name,
                                                        style: DefaultTextStyle.of(context).style.copyWith(
                                                              color: Theme.of(context).appBarTheme.foregroundColor,
                                                            ),
                                                      ),
                                                      Flexible(
                                                        child: CachedURLImage(
                                                          url: capabilitiesData.capabilities.theming!.logo,
                                                        ),
                                                      ),
                                                    ] else ...[
                                                      ExceptionWidget(
                                                        capabilitiesError,
                                                        onRetry: () {
                                                          _capabilitiesBloc.refresh();
                                                        },
                                                      ),
                                                      CustomLinearProgressIndicator(
                                                        visible: capabilitiesLoading,
                                                      ),
                                                    ],
                                                    if (accounts.length != 1) ...[
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton<String>(
                                                          isExpanded: true,
                                                          dropdownColor: Theme.of(context).colorScheme.primary,
                                                          iconEnabledColor: Theme.of(context).colorScheme.onBackground,
                                                          value: widget.account.id,
                                                          items: accounts
                                                              .map<DropdownMenuItem<String>>(
                                                                (final account) => DropdownMenuItem<String>(
                                                                  value: account.id,
                                                                  child: AccountTile(
                                                                    account: account,
                                                                    dense: true,
                                                                    textColor:
                                                                        Theme.of(context).appBarTheme.foregroundColor,
                                                                  ),
                                                                ),
                                                              )
                                                              .toList(),
                                                          onChanged: (final id) {
                                                            for (final account in accounts) {
                                                              if (account.id == id) {
                                                                accountsBloc.setActiveAccount(account);
                                                                break;
                                                              }
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
                                        ExceptionWidget(
                                          appsError,
                                          onlyIcon: isQuickBar,
                                          onRetry: () {
                                            _appsBloc.refresh();
                                          },
                                        ),
                                        CustomLinearProgressIndicator(
                                          visible: appsLoading,
                                        ),
                                        if (appsData != null) ...[
                                          for (final appImplementation in appsData) ...[
                                            StreamBuilder<int>(
                                              stream: appImplementation.getUnreadCounter(_appsBloc) ??
                                                  BehaviorSubject<int>.seeded(0),
                                              builder: (final context, final unreadCounterSnapshot) {
                                                final unreadCount = unreadCounterSnapshot.data ?? 0;
                                                if (isQuickBar) {
                                                  return Tooltip(
                                                    message: appImplementation.name(context),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        _appsBloc.setActiveApp(appImplementation.id);
                                                      },
                                                      icon: AppImplementationIcon(
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
                                                  onTap: () {
                                                    _appsBloc.setActiveApp(appImplementation.id);
                                                    if (navigationMode == NavigationMode.drawer) {
                                                      // Don't pop when the drawer is always shown
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
                                            child: capabilitiesData?.capabilities.theming?.logo != null
                                                ? CachedURLImage(
                                                    url: capabilitiesData!.capabilities.theming!.logo,
                                                  )
                                                : null,
                                          )
                                        : null,
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            if (appsData != null && activeAppIDSnapshot.hasData) ...[
                                              Flexible(
                                                child: Text(
                                                  appsData
                                                      .singleWhere((final a) => a.id == activeAppIDSnapshot.data!)
                                                      .name(context),
                                                ),
                                              ),
                                            ],
                                            if (appsError != null) ...[
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.error_outline,
                                                size: 30,
                                                color: Theme.of(context).colorScheme.onPrimary,
                                              ),
                                            ],
                                            if (appsLoading) ...[
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(
                                                child: CustomLinearProgressIndicator(
                                                  color: Theme.of(context).appBarTheme.foregroundColor,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                        if (accounts.length > 1) ...[
                                          Text(
                                            account.client.humanReadableID,
                                            style: Theme.of(context).textTheme.bodySmall!,
                                          ),
                                        ],
                                      ],
                                    ),
                                    actions: [
                                      if (notificationsAppData != null) ...[
                                        StreamBuilder<int>(
                                          stream: notificationsAppData.getUnreadCounter(_appsBloc),
                                          builder: (final context, final unreadCounterSnapshot) {
                                            final unreadCount = unreadCounterSnapshot.data ?? 0;
                                            return IconButton(
                                              key: Key('app-${notificationsAppData.id}'),
                                              icon: AppImplementationIcon(
                                                appImplementation: notificationsAppData,
                                                unreadCount: unreadCount,
                                                color: unreadCount > 0
                                                    ? Theme.of(context).colorScheme.primary
                                                    : Theme.of(context).colorScheme.onBackground,
                                                width: kAvatarSize * 2 / 3,
                                                height: kAvatarSize * 2 / 3,
                                              ),
                                              onPressed: () async {
                                                await Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (final context) => Scaffold(
                                                      appBar: AppBar(
                                                        title: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(notificationsAppData.name(context)),
                                                            if (accounts.length > 1) ...[
                                                              Text(
                                                                account.client.humanReadableID,
                                                                style: Theme.of(context).textTheme.bodySmall!,
                                                              ),
                                                            ],
                                                          ],
                                                        ),
                                                      ),
                                                      body: notificationsAppData.buildPage(context, _appsBloc),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                      IconButton(
                                        icon: IntrinsicWidth(
                                          child: AccountAvatar(
                                            account: account,
                                          ),
                                        ),
                                        onPressed: () async {
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (final context) => AccountSettingsPage(
                                                bloc: accountsBloc,
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
                                            ExceptionWidget(
                                              appsError,
                                              onRetry: () {
                                                _appsBloc.refresh();
                                              },
                                            ),
                                            if (appsData != null) ...[
                                              if (appsData.isEmpty) ...[
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      AppLocalizations.of(context).errorNoCompatibleNextcloudAppsFound,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ] else ...[
                                                if (activeAppIDSnapshot.hasData) ...[
                                                  Expanded(
                                                    child: appsData
                                                        .singleWhere((final a) => a.id == activeAppIDSnapshot.data!)
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
}
