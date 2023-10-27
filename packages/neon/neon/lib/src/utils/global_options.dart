import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/label_builder.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/options_collection.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

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
      initialAccount.reset();
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
      pushNotificationsDistributor.reset();
    }
  }

  final PackageInfo _packageInfo;

  late final _distributorsMap = <String, LabelBuilder>{
    _packageInfo.packageName: (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorFirebaseEmbedded,
    'com.github.gotify.up': (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorGotifyUP,
    'eu.siacs.conversations': (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorConversations,
    'io.heckel.ntfy': (final context) => NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorNtfy,
    'org.unifiedpush.distributor.fcm': (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorFCMUP,
    unifiedPushNextPushID: (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorNextPush,
    'org.unifiedpush.distributor.noprovider2push': (final context) =>
        NeonLocalizations.of(context).globalOptionsPushNotificationsDistributorNoProvider2Push,
  };

  @override
  late final List<Option<dynamic>> options = [
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
    initialAccount.values = Map.fromEntries(
      accounts.map(
        (final account) => MapEntry(account.id, (final context) => account.humanReadableID),
      ),
    );

    if (!initialAccount.values.containsKey(initialAccount.value)) {
      initialAccount.reset();
    }
  }

  void updateDistributors(final List<String> distributors) {
    pushNotificationsDistributor.values = Map.fromEntries(
      distributors.map(
        (final distributor) => MapEntry(distributor, _distributorsMap[distributor] ?? (final _) => distributor),
      ),
    );

    final allowed = pushNotificationsDistributor.values.containsKey(pushNotificationsDistributor.value);
    pushNotificationsEnabled.enabled = allowed;
    if (!allowed) {
      pushNotificationsDistributor.reset();
      pushNotificationsEnabled.reset();
    }
  }

  late final themeMode = SelectOption(
    storage: storage,
    key: GlobalOptionKeys.themeMode,
    label: (final context) => NeonLocalizations.of(context).globalOptionsThemeMode,
    defaultValue: ThemeMode.system,
    values: {
      ThemeMode.light: (final context) => NeonLocalizations.of(context).globalOptionsThemeModeLight,
      ThemeMode.dark: (final context) => NeonLocalizations.of(context).globalOptionsThemeModeDark,
      ThemeMode.system: (final context) => NeonLocalizations.of(context).globalOptionsThemeModeAutomatic,
    },
  );

  late final themeOLEDAsDark = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.themeOLEDAsDark,
    label: (final context) => NeonLocalizations.of(context).globalOptionsThemeOLEDAsDark,
    defaultValue: false,
  );

  late final themeKeepOriginalAccentColor = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.themeKeepOriginalAccentColor,
    label: (final context) => NeonLocalizations.of(context).globalOptionsThemeKeepOriginalAccentColor,
    defaultValue: false,
  );

  late final pushNotificationsEnabled = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.pushNotificationsEnabled,
    label: (final context) => NeonLocalizations.of(context).globalOptionsPushNotificationsEnabled,
    defaultValue: false,
  );

  late final pushNotificationsDistributor = SelectOption<String?>.depend(
    storage: storage,
    key: GlobalOptionKeys.pushNotificationsDistributor,
    label: (final context) => NeonLocalizations.of(context).globalOptionsPushNotificationsDistributor,
    defaultValue: null,
    values: {},
    enabled: pushNotificationsEnabled,
  );

  late final startupMinimized = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.startupMinimized,
    label: (final context) => NeonLocalizations.of(context).globalOptionsStartupMinimized,
    defaultValue: false,
  );

  late final startupMinimizeInsteadOfExit = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.startupMinimizeInsteadOfExit,
    label: (final context) => NeonLocalizations.of(context).globalOptionsStartupMinimizeInsteadOfExit,
    defaultValue: false,
  );

  // TODO: Autostart option

  late final systemTrayEnabled = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.systemTrayEnabled,
    label: (final context) => NeonLocalizations.of(context).globalOptionsSystemTrayEnabled,
    defaultValue: false,
  );

  late final systemTrayHideToTrayWhenMinimized = ToggleOption.depend(
    storage: storage,
    key: GlobalOptionKeys.systemTrayHideToTrayWhenMinimized,
    label: (final context) => NeonLocalizations.of(context).globalOptionsSystemTrayHideToTrayWhenMinimized,
    defaultValue: true,
    enabled: systemTrayEnabled,
  );

  late final rememberLastUsedAccount = ToggleOption(
    storage: storage,
    key: GlobalOptionKeys.rememberLastUsedAccount,
    label: (final context) => NeonLocalizations.of(context).globalOptionsAccountsRememberLastUsedAccount,
    defaultValue: true,
  );

  late final initialAccount = SelectOption<String?>(
    storage: storage,
    key: GlobalOptionKeys.initialAccount,
    label: (final context) => NeonLocalizations.of(context).globalOptionsAccountsInitialAccount,
    defaultValue: null,
    values: {},
  );

  late final navigationMode = SelectOption(
    storage: storage,
    key: GlobalOptionKeys.navigationMode,
    label: (final context) => NeonLocalizations.of(context).globalOptionsNavigationMode,
    defaultValue: Platform.isAndroid || Platform.isIOS ? NavigationMode.drawer : NavigationMode.drawerAlwaysVisible,
    values: {
      NavigationMode.drawer: (final context) => NeonLocalizations.of(context).globalOptionsNavigationModeDrawer,
      if (!Platform.isAndroid && !Platform.isIOS)
        NavigationMode.drawerAlwaysVisible: (final context) =>
            NeonLocalizations.of(context).globalOptionsNavigationModeDrawerAlwaysVisible,
    },
  );
}

@internal
enum GlobalOptionKeys implements Storable {
  themeMode._('theme-mode'),
  themeOLEDAsDark._('theme-oled-as-dark'),
  themeKeepOriginalAccentColor._('theme-keep-original-accent-color'),
  pushNotificationsEnabled._('push-notifications-enabled'),
  pushNotificationsDistributor._('push-notifications-distributor'),
  startupMinimized._('startup-minimized'),
  startupMinimizeInsteadOfExit._('startup-minimize-instead-of-exit'),
  systemTrayEnabled._('system-tray-enabled'),
  systemTrayHideToTrayWhenMinimized._('system-tray-hide-to-tray-when-minimized'),
  rememberLastUsedAccount._('remember-last-used-account'),
  initialAccount._('initial-account'),
  navigationMode._('navigation-mode');

  const GlobalOptionKeys._(this.value);

  @override
  final String value;
}

@internal
enum NavigationMode {
  drawer,
  drawerAlwaysVisible,
}
