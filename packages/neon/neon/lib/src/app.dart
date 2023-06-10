part of '../../neon.dart';

class NeonApp extends StatefulWidget {
  const NeonApp({
    super.key,
  });

  @override
  State<NeonApp> createState() => _NeonAppState();
}

// ignore: prefer_mixin
class _NeonAppState extends State<NeonApp> with WidgetsBindingObserver, tray.TrayListener, WindowListener {
  final _appRegex = RegExp(r'^app_([a-z]+)$', multiLine: true);
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final List<AppImplementation> _appImplementations;
  late final NeonPlatform _platform;
  late final GlobalOptions _globalOptions;
  late final AccountsBloc _accountsBloc;
  late final _routerDelegate = AppRouter(
    navigatorKey: _navigatorKey,
    accountsBloc: _accountsBloc,
  );

  Rect? _lastBounds;

  @override
  void initState() {
    super.initState();

    _appImplementations = Provider.of<List<AppImplementation>>(context, listen: false);
    _platform = Provider.of<NeonPlatform>(context, listen: false);
    _globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    _accountsBloc = Provider.of<AccountsBloc>(context, listen: false);

    WidgetsBinding.instance.addObserver(this);
    if (_platform.canUseSystemTray) {
      tray.trayManager.addListener(this);
    }
    if (_platform.canUseWindowManager) {
      windowManager.addListener(this);
    }

    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      final localizations = await appLocalizationsFromSystem();

      if (!mounted) {
        return;
      }
      if (_platform.canUseQuickActions) {
        const quickActions = QuickActions();
        await quickActions.setShortcutItems(
          _appImplementations
              .map(
                (final app) => ShortcutItem(
                  type: 'app_${app.id}',
                  localizedTitle: app.nameFromLocalization(localizations),
                  icon: 'app_${app.id}',
                ),
              )
              .toList(),
        );
        await quickActions.initialize(_handleShortcut);
      }

      if (_platform.canUseWindowManager) {
        await windowManager.setPreventClose(true);

        if (_globalOptions.startupMinimized.value) {
          await _saveAndMinimizeWindow();
        }
      }

      if (_platform.canUseSystemTray) {
        _globalOptions.systemTrayEnabled.stream.listen((final enabled) async {
          if (enabled) {
            // TODO: This works on Linux, but maybe not on macOS or Windows
            await tray.trayManager.setIcon('assets/logo.svg');
            if (mounted) {
              await tray.trayManager.setContextMenu(
                tray.Menu(
                  items: [
                    for (final app in _appImplementations) ...[
                      tray.MenuItem(
                        key: 'app_${app.id}',
                        label: app.nameFromLocalization(localizations),
                        // TODO: Add icons which should work on macOS and Windows
                      ),
                    ],
                    tray.MenuItem.separator(),
                    tray.MenuItem(
                      key: 'show_hide',
                      label: localizations.actionShowSlashHide,
                    ),
                    tray.MenuItem(
                      key: 'exit',
                      label: localizations.actionExit,
                    ),
                  ],
                ),
              );
            }
          } else {
            await tray.trayManager.destroy();
          }
        });
      }

      if (_platform.canUsePushNotifications) {
        final localNotificationsPlugin = await PushUtils.initLocalNotifications();
        Global.onPushNotificationReceived = (final accountID) async {
          final account = _accountsBloc.accounts.value.find(accountID);
          if (account == null) {
            return;
          }
          final app = Provider.of<List<AppImplementation>>(context, listen: false).find('notifications');
          if (app != null) {
            await _accountsBloc.getAppsBlocFor(account).getAppBloc<NotificationsBlocInterface>(app).refresh();
          }
        };
        Global.onPushNotificationClicked = (final pushNotificationWithAccountID) async {
          final allAppImplementations = Provider.of<List<AppImplementation>>(context, listen: false);

          final app = (pushNotificationWithAccountID.subject.app != null
                  ? allAppImplementations.find(pushNotificationWithAccountID.subject.app!)
                  : null) ??
              allAppImplementations.find('notifications');

          final account = _accountsBloc.accounts.value.find(pushNotificationWithAccountID.accountID);
          if (account == null) {
            return;
          }

          _accountsBloc.setActiveAccount(account);
          if (app != null) {
            if (app.id != 'notifications') {
              _accountsBloc
                  .getAppsBlocFor(account)
                  .getAppBloc<NotificationsBlocInterface>(app)
                  .deleteNotification(pushNotificationWithAccountID.subject.nid!);
            }
            await _openAppFromExternal(account, app.id);
          }
        };

        final details = await localNotificationsPlugin.getNotificationAppLaunchDetails();
        if (details != null && details.didNotificationLaunchApp && details.notificationResponse?.payload != null) {
          await Global.onPushNotificationClicked!(
            PushNotification.fromJson(
              json.decode(details.notificationResponse!.payload!) as Map<String, dynamic>,
            ),
          );
        }
      }
    });
  }

  @override
  void onTrayMenuItemClick(final tray.MenuItem menuItem) {
    if (menuItem.key != null) {
      unawaited(_handleShortcut(menuItem.key!));
    }
  }

  @override
  Future onWindowClose() async {
    if (_globalOptions.startupMinimizeInsteadOfExit.value) {
      await _saveAndMinimizeWindow();
    } else {
      await windowManager.destroy();
    }
  }

  @override
  Future onWindowMinimize() async {
    await _saveAndMinimizeWindow();
  }

  Future _handleShortcut(final String shortcutType) async {
    if (shortcutType == 'show_hide') {
      if (_platform.canUseWindowManager) {
        if (await windowManager.isVisible()) {
          await _saveAndMinimizeWindow();
        } else {
          await _showAndRestoreWindow();
        }
      }
      return;
    }
    if (shortcutType == 'exit') {
      exit(0);
    }

    final matches = _appRegex.allMatches(shortcutType).toList();
    if (matches.isNotEmpty) {
      final activeAccount = _accountsBloc.activeAccount.valueOrNull;
      if (activeAccount == null) {
        return;
      }
      await _openAppFromExternal(activeAccount, matches[0].group(1)!);
    }
  }

  Future _openAppFromExternal(final Account account, final String id) async {
    await _accountsBloc.getAppsBlocFor(account).setActiveApp(id);
    _navigatorKey.currentState!.popUntil((final route) => route.settings.name == 'home');
    await _showAndRestoreWindow();
  }

  Future _saveAndMinimizeWindow() async {
    _lastBounds = await windowManager.getBounds();
    if (_globalOptions.systemTrayEnabled.value && _globalOptions.systemTrayHideToTrayWhenMinimized.value) {
      await windowManager.hide();
    } else {
      await windowManager.minimize();
    }
  }

  Future _showAndRestoreWindow() async {
    if (!_platform.canUseWindowManager) {
      return;
    }

    final wasVisible = await windowManager.isVisible();
    await windowManager.show();
    await windowManager.focus();
    if (_lastBounds != null && !wasVisible) {
      await windowManager.setBounds(_lastBounds);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_platform.canUseSystemTray) {
      tray.trayManager.removeListener(this);
    }
    if (_platform.canUseWindowManager) {
      windowManager.removeListener(this);
    }

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => OptionBuilder(
        option: _globalOptions.themeMode,
        builder: (final context, final themeMode) => OptionBuilder(
          option: _globalOptions.themeOLEDAsDark,
          builder: (final context, final themeOLEDAsDark) => OptionBuilder(
            option: _globalOptions.themeKeepOriginalAccentColor,
            builder: (final context, final themeKeepOriginalAccentColor) => StreamBuilder<Account?>(
              stream: _accountsBloc.activeAccount,
              builder: (final context, final activeAccountSnapshot) {
                if (themeMode == null || themeOLEDAsDark == null) {
                  return Container();
                }

                FlutterNativeSplash.remove();
                return ResultBuilder<Capabilities?>(
                  stream: activeAccountSnapshot.hasData
                      ? _accountsBloc.getCapabilitiesBlocFor(activeAccountSnapshot.data!).capabilities
                      : null,
                  builder: (final context, final capabilitiesSnapshot) {
                    final nextcloudTheme = capabilitiesSnapshot.data?.capabilities.theming;
                    return MaterialApp.router(
                      localizationsDelegates: [
                        ..._appImplementations.map((final app) => app.localizationsDelegate),
                        ...AppLocalizations.localizationsDelegates,
                      ],
                      supportedLocales: {
                        ..._appImplementations
                            .map((final app) => app.supportedLocales)
                            .reduce((final value, final element) => [...value, ...element]),
                        ...AppLocalizations.supportedLocales,
                      },
                      themeMode: themeMode,
                      theme: getThemeFromNextcloudTheme(
                        nextcloudTheme,
                        Brightness.light,
                        keepOriginalAccentColor: nextcloudTheme == null || (themeKeepOriginalAccentColor ?? false),
                      ),
                      darkTheme: getThemeFromNextcloudTheme(
                        nextcloudTheme,
                        Brightness.dark,
                        keepOriginalAccentColor: nextcloudTheme == null || (themeKeepOriginalAccentColor ?? false),
                        oledAsDark: themeOLEDAsDark,
                      ),
                      routerConfig: _routerDelegate,
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
}
