import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const unifiedPushNextPushID = 'org.unifiedpush.distributor.nextpush';

class GlobalOptions {
  GlobalOptions(
    this._sharedPreferences,
    this._packageInfo,
  ) {
    themeMode.stream.listen((final value) {
      _themeOLEDAsDarkEnabledSubject.add(value != ThemeMode.light);
    });

    _pushNotificationsDistributorsSubject.listen((final distributors) async {
      final allowed = distributors.isNotEmpty;
      _pushNotificationsEnabledEnabledSubject.add(allowed);
      if (!allowed) {
        await pushNotificationsEnabled.set(false);
      }
    });

    pushNotificationsEnabled.stream.listen((final enabled) async {
      if (enabled) {
        final response = await Permission.notification.request();
        if (response.isPermanentlyDenied) {
          _pushNotificationsEnabledEnabledSubject.add(false);
        }
        if (!response.isGranted) {
          await pushNotificationsEnabled.set(false);
        }
      } else {
        await pushNotificationsDistributor.set(null);
      }
    });

    rememberLastUsedAccount.stream.listen((final remember) async {
      _initialAccountEnabledSubject.add(!remember);
      if (remember) {
        await initialAccount.set(null);
      } else {
        // Only override the initial account if there already has been a value,
        // which means it's not the initial emit from rememberLastUsedAccount
        if (initialAccount.hasValue) {
          await initialAccount.set((await initialAccount.values.first).keys.first);
        }
      }
    });
  }

  final SharedPreferences _sharedPreferences;
  late final AppStorage _storage = AppStorage('global', _sharedPreferences);
  final PackageInfo _packageInfo;
  final _themeOLEDAsDarkEnabledSubject = BehaviorSubject<bool>();
  final _pushNotificationsEnabledEnabledSubject = BehaviorSubject<bool>();
  final _pushNotificationsDistributorsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();
  final _accountsIDsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();
  final _initialAccountEnabledSubject = BehaviorSubject<bool>();

  late final _distributorsMap = <String, String Function(BuildContext)>{
    _packageInfo.packageName: (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorFirebaseEmbedded,
    'com.github.gotify.up': (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorGotifyUP,
    'eu.siacs.conversations': (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorConversations,
    'io.heckel.ntfy': (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsDistributorNtfy,
    'org.unifiedpush.distributor.fcm': (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorFCMUP,
    unifiedPushNextPushID: (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorNextPush,
    'org.unifiedpush.distributor.noprovider2push': (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorNoProvider2Push,
  };

  late final List<Option> options = [
    themeMode,
    themeOLEDAsDark,
    themeKeepOriginalAccentColor,
    pushNotificationsEnabled,
    pushNotificationsDistributor,
    startupMinimized,
    startupMinimizeInsteadOfExit,
    systemTrayEnabled,
    systemTrayHideToTrayWhenMinimized,
    rememberLastUsedAccount,
    initialAccount,
    navigationMode,
  ];

  Future reset() async {
    for (final option in options) {
      await option.reset();
    }
  }

  void dispose() {
    unawaited(_accountsIDsSubject.close());
    unawaited(_themeOLEDAsDarkEnabledSubject.close());
    for (final option in options) {
      option.dispose();
    }
  }

  void updateAccounts(final List<Account> accounts) {
    if (accounts.isEmpty) {
      return;
    }
    _accountsIDsSubject.add({
      for (final account in accounts) ...{
        account.id: (final context) => account.client.humanReadableID,
      },
    });
  }

  Future updateDistributors(final List<String> distributors) async {
    _pushNotificationsDistributorsSubject.add({
      for (final distributor in distributors) ...{
        distributor: _distributorsMap[distributor] ?? (final _) => distributor,
      },
    });
  }

  late final themeMode = SelectOption<ThemeMode>(
    storage: _storage,
    key: 'theme-mode',
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeMode,
    defaultValue: ThemeMode.system,
    values: BehaviorSubject.seeded({
      ThemeMode.light: (final context) => AppLocalizations.of(context).globalOptionsThemeModeLight,
      ThemeMode.dark: (final context) => AppLocalizations.of(context).globalOptionsThemeModeDark,
      ThemeMode.system: (final context) => AppLocalizations.of(context).globalOptionsThemeModeAutomatic,
    }),
  );

  late final themeOLEDAsDark = ToggleOption(
    storage: _storage,
    key: 'theme-oled-as-dark',
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeOLEDAsDark,
    defaultValue: false,
    enabled: _themeOLEDAsDarkEnabledSubject,
  );

  late final themeKeepOriginalAccentColor = ToggleOption(
    storage: _storage,
    key: 'theme-keep-original-accent-color',
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeKeepOriginalAccentColor,
    defaultValue: false,
  );

  late final pushNotificationsEnabled = ToggleOption(
    storage: _storage,
    key: 'push-notifications-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsEnabled,
    defaultValue: false,
    enabled: _pushNotificationsEnabledEnabledSubject,
  );

  late final pushNotificationsDistributor = SelectOption<String?>(
    storage: _storage,
    key: 'push-notifications-distributor',
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsDistributor,
    defaultValue: null,
    values: _pushNotificationsDistributorsSubject,
    enabled: pushNotificationsEnabled.stream,
  );

  late final startupMinimized = ToggleOption(
    storage: _storage,
    key: 'startup-minimized',
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimized,
    defaultValue: false,
  );

  late final startupMinimizeInsteadOfExit = ToggleOption(
    storage: _storage,
    key: 'startup-minimize-instead-of-exit',
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimizeInsteadOfExit,
    defaultValue: false,
  );

  // TODO: Autostart option

  late final systemTrayEnabled = ToggleOption(
    storage: _storage,
    key: 'systemtray-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayEnabled,
    defaultValue: false,
  );

  late final systemTrayHideToTrayWhenMinimized = ToggleOption(
    storage: _storage,
    key: 'systemtray-hide-to-tray-when-minimized',
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayHideToTrayWhenMinimized,
    defaultValue: true,
    enabled: systemTrayEnabled.stream,
  );

  late final rememberLastUsedAccount = ToggleOption(
    storage: _storage,
    key: 'remember-last-used-account',
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsRememberLastUsedAccount,
    defaultValue: true,
  );

  late final initialAccount = SelectOption<String?>(
    storage: _storage,
    key: 'initial-account',
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsInitialAccount,
    defaultValue: null,
    values: _accountsIDsSubject,
    enabled: _initialAccountEnabledSubject,
  );

  late final navigationMode = SelectOption<NavigationMode>(
    storage: _storage,
    key: 'navigation-mode',
    label: (final context) => AppLocalizations.of(context).globalOptionsNavigationMode,
    defaultValue: Platform.isAndroid || Platform.isIOS ? NavigationMode.drawer : NavigationMode.drawerAlwaysVisible,
    values: BehaviorSubject.seeded({
      NavigationMode.drawer: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeDrawer,
      if (!Platform.isAndroid && !Platform.isIOS) ...{
        NavigationMode.drawerAlwaysVisible: (final context) =>
            AppLocalizations.of(context).globalOptionsNavigationModeDrawerAlwaysVisible,
      },
      // ignore: deprecated_member_use_from_same_package
      NavigationMode.quickBar: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeQuickBar,
    }),
  );
}

enum NavigationMode {
  drawer,
  drawerAlwaysVisible,
  @Deprecated("The new design won't use this anymore")
  quickBar,
}
