import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/select_option.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/settings/models/toggle_option.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

const unifiedPushNextPushID = 'org.unifiedpush.distributor.nextpush';

@internal
@immutable
class GlobalOptions extends OptionsCollection {
  GlobalOptions(
    this._packageInfo,
  ) : super(const AppStorage(StorageKeys.global)) {
    pushNotificationsEnabled.addListener(_pushNotificationsEnabledListener);
    rememberLastUsedAccount.addListener(_rememberLastUsedAccountListener);
  }

  void _rememberLastUsedAccountListener() {
    initialAccount.enabled = !rememberLastUsedAccount.value;
    if (rememberLastUsedAccount.value) {
      initialAccount.value = null;
    } else {
      // Only override the initial account if there already has been a value,
      // which means it's not the initial emit from rememberLastUsedAccount
      initialAccount.value = initialAccount.values.keys.first;
    }
  }

  Future<void> _pushNotificationsEnabledListener() async {
    if (pushNotificationsEnabled.value) {
      final response = await Permission.notification.request();
      if (response.isPermanentlyDenied) {
        pushNotificationsEnabled.enabled = false;
      }
      if (!response.isGranted) {
        pushNotificationsEnabled.value = false;
      }
    } else {
      pushNotificationsDistributor.value = null;
    }
  }

  final PackageInfo _packageInfo;

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

  @override
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

  @override
  void dispose() {
    super.dispose();

    pushNotificationsEnabled.removeListener(_pushNotificationsEnabledListener);
    rememberLastUsedAccount.removeListener(_rememberLastUsedAccountListener);
  }

  void updateAccounts(final List<Account> accounts) {
    initialAccount.values = {
      for (final account in accounts) account.id: (final context) => account.humanReadableID,
    };

    if (accounts.tryFind(initialAccount.value) == null) {
      initialAccount.reset();
    }
  }

  Future updateDistributors(final List<String> distributors) async {
    pushNotificationsDistributor.values = {
      for (final distributor in distributors) distributor: _distributorsMap[distributor] ?? (final _) => distributor,
    };

    final allowed = distributors.isNotEmpty;
    pushNotificationsEnabled.enabled = allowed;
    if (!allowed) {
      pushNotificationsEnabled.value = false;
    }
  }

  late final themeMode = SelectOption<ThemeMode>(
    storage: storage,
    key: GlobalOptionKeys.themeMode,
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeMode,
    defaultValue: ThemeMode.system,
    values: {
      ThemeMode.light: (final context) => AppLocalizations.of(context).globalOptionsThemeModeLight,
      ThemeMode.dark: (final context) => AppLocalizations.of(context).globalOptionsThemeModeDark,
      ThemeMode.system: (final context) => AppLocalizations.of(context).globalOptionsThemeModeAutomatic,
    },
  );

  late final themeOLEDAsDark = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.themeOledAsDark,
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeOLEDAsDark,
    defaultValue: false,
  );

  late final themeKeepOriginalAccentColor = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.themeKeepOriginalAccentColor,
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeKeepOriginalAccentColor,
    defaultValue: false,
  );

  late final pushNotificationsEnabled = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.pushNotificationsEnabled,
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsEnabled,
    defaultValue: false,
  );

  late final pushNotificationsDistributor = SelectOption<String?>.depend(
    storage: storage,
    key: GlobalOptionKeys.pushNotificationsDistributor,
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsDistributor,
    defaultValue: null,
    values: {},
    enabled: pushNotificationsEnabled,
  );

  late final startupMinimized = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.startupMinimized,
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimized,
    defaultValue: false,
  );

  late final startupMinimizeInsteadOfExit = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.startupMinimizeInsteadOfExit,
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimizeInsteadOfExit,
    defaultValue: false,
  );

  // TODO: Autostart option

  late final systemTrayEnabled = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.systemtrayEnabled,
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayEnabled,
    defaultValue: false,
  );

  late final systemTrayHideToTrayWhenMinimized = ToggleOption.depend(
    storage: storage,
    key: GlobalOptionKeys.systemtrayHideToTrayWhenMinimized,
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayHideToTrayWhenMinimized,
    defaultValue: true,
    enabled: systemTrayEnabled,
  );

  late final rememberLastUsedAccount = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.rememberLastUsedAccount,
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsRememberLastUsedAccount,
    defaultValue: true,
  );

  late final initialAccount = SelectOption<String?>(
    storage: storage,
    key: GlobalOptionKeys.initialAccount,
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsInitialAccount,
    defaultValue: null,
    values: {},
  );

  late final navigationMode = SelectOption<NavigationMode>(
    storage: storage,
    key: GlobalOptionKeys.navigationMode,
    label: (final context) => AppLocalizations.of(context).globalOptionsNavigationMode,
    defaultValue: Platform.isAndroid || Platform.isIOS ? NavigationMode.drawer : NavigationMode.drawerAlwaysVisible,
    values: {
      NavigationMode.drawer: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeDrawer,
      if (!Platform.isAndroid && !Platform.isIOS)
        NavigationMode.drawerAlwaysVisible: (final context) =>
            AppLocalizations.of(context).globalOptionsNavigationModeDrawerAlwaysVisible,
      // ignore: deprecated_member_use_from_same_package
      NavigationMode.quickBar: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeQuickBar,
    },
  );
}

enum GlobalOptionKeys implements Storable {
  themeMode._('theme-mode'),
  themeOledAsDark._('theme-oled-as-dark'),
  themeKeepOriginalAccentColor._('theme-keep-original-accent-color'),
  pushNotificationsEnabled._('push-notifications-enabled'),
  pushNotificationsDistributor._('push-notifications-distributor'),
  startupMinimized._('startup-minimized'),
  startupMinimizeInsteadOfExit._('startup-minimize-instead-of-exit'),
  systemtrayEnabled._('systemtray-enabled'),
  systemtrayHideToTrayWhenMinimized._('systemtray-hide-to-tray-when-minimized'),
  rememberLastUsedAccount._('remember-last-used-account'),
  initialAccount._('initial-account'),
  navigationMode._('navigation-mode');

  const GlobalOptionKeys._(this.value);

  @override
  final String value;
}

enum NavigationMode {
  drawer,
  drawerAlwaysVisible,
  @Deprecated("The new design won't use this anymore")
  quickBar,
}
