import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/capabilities.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/models/notifications_interface.dart';
import 'package:neon/src/models/push_notification.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/settings/widgets/option_builder.dart';
import 'package:neon/src/theme/neon.dart';
import 'package:neon/src/theme/theme.dart';
import 'package:neon/src/utils/global.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/localizations.dart';
import 'package:neon/src/utils/push_utils.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tray_manager/tray_manager.dart' as tray;
import 'package:window_manager/window_manager.dart';

class NeonApp extends StatefulWidget {
  const NeonApp({
    required this.neonTheme,
    super.key,
  });

  final NeonTheme neonTheme;

  @override
  State<NeonApp> createState() => _NeonAppState();
}

// ignore: prefer_mixin
class _NeonAppState extends State<NeonApp> with WidgetsBindingObserver, tray.TrayListener, WindowListener {
  final _appRegex = RegExp(r'^app_([a-z]+)$', multiLine: true);
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final Iterable<AppImplementation> _appImplementations;
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

    _appImplementations = Provider.of<Iterable<AppImplementation>>(context, listen: false);
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
          final account = _accountsBloc.accounts.value.tryFind(accountID);
          if (account == null) {
            return;
          }

          final allAppImplementations = Provider.of<Iterable<AppImplementation>>(context, listen: false);
          final app = allAppImplementations.tryFind('notifications') as NotificationsAppInterface?;

          if (app == null) {
            return;
          }

          await _accountsBloc.getAppsBlocFor(account).getAppBloc<NotificationsBlocInterface>(app).refresh();
        };
        Global.onPushNotificationClicked = (final pushNotificationWithAccountID) async {
          final account = _accountsBloc.accounts.value.tryFind(pushNotificationWithAccountID.accountID);
          if (account == null) {
            return;
          }
          _accountsBloc.setActiveAccount(account);

          final allAppImplementations = Provider.of<Iterable<AppImplementation>>(context, listen: false);

          final notificationsApp = allAppImplementations.tryFind('notifications') as NotificationsAppInterface?;
          if (notificationsApp != null) {
            _accountsBloc
                .getAppsBlocFor(account)
                .getAppBloc<NotificationsBlocInterface>(notificationsApp)
                .deleteNotification(pushNotificationWithAccountID.subject.nid!);
          }

          final app = allAppImplementations.tryFind(pushNotificationWithAccountID.subject.app) ?? notificationsApp;
          if (app == null) {
            return;
          }

          await _openAppFromExternal(account, app.id);
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

    final matches = _appRegex.allMatches(shortcutType);
    final activeAccount = _accountsBloc.activeAccount.valueOrNull;
    if (matches.isNotEmpty && activeAccount != null) {
      await _openAppFromExternal(activeAccount, matches.first.group(1)!);
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
                FlutterNativeSplash.remove();
                return ResultBuilder<Capabilities?>.behaviorSubject(
                  stream: activeAccountSnapshot.hasData
                      ? _accountsBloc.getCapabilitiesBlocFor(activeAccountSnapshot.data!).capabilities
                      : null,
                  builder: (final context, final capabilitiesSnapshot) {
                    final appTheme = AppTheme(
                      capabilitiesSnapshot.data?.capabilities.theming,
                      keepOriginalAccentColor: themeKeepOriginalAccentColor,
                      oledAsDark: themeOLEDAsDark,
                      appThemes: _appImplementations.map((final a) => a.theme).whereNotNull(),
                      neonTheme: widget.neonTheme,
                    );

                    return MaterialApp.router(
                      localizationsDelegates: [
                        ..._appImplementations.map((final app) => app.localizationsDelegate),
                        ...AppLocalizations.localizationsDelegates,
                      ],
                      supportedLocales: {
                        ..._appImplementations
                            .map((final app) => app.supportedLocales)
                            .expand((final element) => element),
                        ...AppLocalizations.supportedLocales,
                      },
                      themeMode: themeMode,
                      theme: appTheme.lightTheme,
                      darkTheme: appTheme.darkTheme,
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
