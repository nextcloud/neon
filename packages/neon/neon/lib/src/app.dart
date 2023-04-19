part of '../../neon.dart';

class NeonApp extends StatefulWidget {
  const NeonApp({
    required this.accountsBloc,
    required this.sharedPreferences,
    required this.platform,
    required this.globalOptions,
    super.key,
  });

  final AccountsBloc accountsBloc;
  final SharedPreferences sharedPreferences;
  final NeonPlatform platform;
  final GlobalOptions globalOptions;

  @override
  State<NeonApp> createState() => _NeonAppState();
}

// ignore: prefer_mixin
class _NeonAppState extends State<NeonApp> with WidgetsBindingObserver, tray.TrayListener, WindowListener {
  final _appRegex = RegExp(r'^app_([a-z]+)$', multiLine: true);
  final _navigatorKey = GlobalKey<NavigatorState>();
  late NeonPlatform _platform;
  late GlobalOptions _globalOptions;
  late AccountsBloc _accountsBloc;
  final _globalPopups = const GlobalPopups();

  NextcloudCoreServerCapabilities_Ocs_Data_Capabilities_Theming? _nextcloudTheme;
  final _platformBrightness = BehaviorSubject<Brightness>.seeded(WidgetsBinding.instance.window.platformBrightness);
  Rect? _lastBounds;

  @override
  void didChangePlatformBrightness() {
    _platformBrightness.add(WidgetsBinding.instance.window.platformBrightness);

    super.didChangePlatformBrightness();
  }

  @override
  void initState() {
    super.initState();

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
      widget.accountsBloc.activeAccount.listen((final activeAccount) async {
        FlutterNativeSplash.remove();

        if (activeAccount == null) {
          await _navigatorKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (final context) => const LoginPage(),
            ),
            (final _) => false,
          );
        } else {
          const settings = RouteSettings(
            name: 'home',
          );
          Widget builder(final context) => Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    _globalPopups,
                    HomePage(
                      account: activeAccount,
                      onThemeChanged: (final nextcloudTheme) {
                        setState(() {
                          _nextcloudTheme = nextcloudTheme;
                        });
                      },
                    ),
                  ],
                ),
              );
          await _navigatorKey.currentState!.pushAndRemoveUntil(
            widget.globalOptions.navigationMode.value == NavigationMode.drawer
                ? MaterialPageRoute(
                    settings: settings,
                    builder: builder,
                  )
                : _NoAnimationPageRoute(
                    settings: settings,
                    builder: builder,
                  ),
            (final _) => false,
          );
        }
      });
      final localizations = await appLocalizationsFromSystem();

      if (!mounted) {
        return;
      }
      final appImplementations = Provider.of<List<AppImplementation>>(context, listen: false);
      if (_platform.canUseQuickActions) {
        const quickActions = QuickActions();
        await quickActions.setShortcutItems(
          appImplementations
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
                    for (final app in appImplementations) ...[
                      tray.MenuItem(
                        key: 'app_${app.id}',
                        label: app.nameFromLocalization(localizations),
                        // TODO: Add icons which should work on macOS and Windows
                      ),
                    ],
                    tray.MenuItem.separator(),
                    tray.MenuItem(
                      key: 'show_hide',
                      label: localizations.showSlashHide,
                    ),
                    tray.MenuItem(
                      key: 'exit',
                      label: localizations.exit,
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
            await _accountsBloc.getAppsBloc(account).getAppBloc<NotificationsBlocInterface>(app).refresh();
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
                  .getAppsBloc(account)
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
    await _accountsBloc.getAppsBloc(account).setActiveApp(id);
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
    unawaited(_platformBrightness.close());

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<Brightness>(
        stream: _platformBrightness,
        builder: (final context, final platformBrightnessSnapshot) => OptionBuilder(
          option: widget.globalOptions.themeMode,
          builder: (final context, final themeMode) => OptionBuilder(
            option: widget.globalOptions.themeOLEDAsDark,
            builder: (final context, final themeOLEDAsDark) => OptionBuilder(
              option: widget.globalOptions.themeKeepOriginalAccentColor,
              builder: (final context, final themeKeepOriginalAccentColor) {
                if (themeMode == null || !platformBrightnessSnapshot.hasData || themeOLEDAsDark == null) {
                  return Container();
                }
                return MaterialApp(
                  localizationsDelegates: AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  navigatorKey: _navigatorKey,
                  theme: getThemeFromNextcloudTheme(
                    _nextcloudTheme,
                    themeMode,
                    platformBrightnessSnapshot.data!,
                    oledAsDark: themeOLEDAsDark,
                    keepOriginalAccentColor: _nextcloudTheme == null || (themeKeepOriginalAccentColor ?? false),
                  ),
                  home: Container(),
                );
              },
            ),
          ),
        ),
      );
}

class _NoAnimationPageRoute extends MaterialPageRoute {
  _NoAnimationPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Duration get transitionDuration => Duration.zero;
}
