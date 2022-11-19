part of '../neon.dart';

class GlobalOptions {
  GlobalOptions(
    this._storage,
    this._packageInfo,
  ) {
    themeMode.stream.listen((final value) {
      _themeOLEDAsDarkEnabledSubject.add(value != ThemeMode.light);
    });

    _pushNotificationsDistributorsSubject.listen((final distributors) async {
      _pushNotificationsEnabledEnabledSubject.add(distributors.isNotEmpty);
      await _setDefaultDistributor();
    });

    pushNotificationsEnabled.stream.listen((final enabled) async {
      if (!enabled) {
        await pushNotificationsDistributor.set(null);
      }
      await _setDefaultDistributor();
    });

    rememberLastUsedAccount.stream.listen((final remember) async {
      _initialAccountEnabledSubject.add(!remember);
      if (remember) {
        await initialAccount.set(null);
      } else {
        // Only override the initial account if there already has been a value,
        // which means it's not the initial emit from rememberLastUsedAccount
        if (initialAccount.hasValue) {
          await initialAccount.set((await initialAccount.values.first).keys.toList()[0]);
        }
      }
    });
  }

  final AppStorage _storage;
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
    'io.heckel.ntfy': (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsDistributorNtfy,
    'org.unifiedpush.distributor.fcm': (final context) =>
        AppLocalizations.of(context).globalOptionsPushNotificationsDistributorFCMUP,
    'org.unifiedpush.distributor.nextpush': (final context) =>
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

  Future _setDefaultDistributor() async {
    if ((pushNotificationsEnabled.enabled.valueOrNull ?? false) &&
        pushNotificationsEnabled.value &&
        pushNotificationsDistributor.values.hasValue &&
        pushNotificationsDistributor.values.value.isNotEmpty &&
        pushNotificationsDistributor.stream.hasValue &&
        pushNotificationsDistributor.value == null) {
      await pushNotificationsDistributor.set((await pushNotificationsDistributor.values.first).keys.toList()[0]);
    }
  }

  late final themeMode = SelectOption<ThemeMode>(
    storage: _storage,
    key: 'theme-mode',
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeMode,
    defaultValue: BehaviorSubject.seeded(ThemeMode.system),
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
    defaultValue: BehaviorSubject.seeded(false),
    enabled: _themeOLEDAsDarkEnabledSubject,
  );

  late final themeKeepOriginalAccentColor = ToggleOption(
    storage: _storage,
    key: 'theme-keep-original-accent-color',
    label: (final context) => AppLocalizations.of(context).globalOptionsThemeKeepOriginalAccentColor,
    defaultValue: BehaviorSubject.seeded(false),
  );

  late final pushNotificationsEnabled = ToggleOption(
    storage: _storage,
    key: 'push-notifications-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsEnabled,
    defaultValue: BehaviorSubject.seeded(true),
    enabled: _pushNotificationsEnabledEnabledSubject,
  );

  late final pushNotificationsDistributor = SelectOption<String?>(
    storage: _storage,
    key: 'push-notifications-distributor',
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsDistributor,
    defaultValue: BehaviorSubject.seeded(null),
    values: _pushNotificationsDistributorsSubject,
    enabled: pushNotificationsEnabled.stream,
  );

  late final startupMinimized = ToggleOption(
    storage: _storage,
    key: 'startup-minimized',
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimized,
    defaultValue: BehaviorSubject.seeded(false),
  );

  late final startupMinimizeInsteadOfExit = ToggleOption(
    storage: _storage,
    key: 'startup-minimize-instead-of-exit',
    label: (final context) => AppLocalizations.of(context).globalOptionsStartupMinimizeInsteadOfExit,
    defaultValue: BehaviorSubject.seeded(false),
  );

  // TODO: Autostart option

  late final systemTrayEnabled = ToggleOption(
    storage: _storage,
    key: 'systemtray-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayEnabled,
    defaultValue: BehaviorSubject.seeded(false),
  );

  late final systemTrayHideToTrayWhenMinimized = ToggleOption(
    storage: _storage,
    key: 'systemtray-hide-to-tray-when-minimized',
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayHideToTrayWhenMinimized,
    defaultValue: BehaviorSubject.seeded(true),
    enabled: systemTrayEnabled.stream,
  );

  late final rememberLastUsedAccount = ToggleOption(
    storage: _storage,
    key: 'remember-last-used-account',
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsRememberLastUsedAccount,
    defaultValue: BehaviorSubject.seeded(true),
  );

  late final initialAccount = SelectOption<String?>(
    storage: _storage,
    key: 'initial-account',
    label: (final context) => AppLocalizations.of(context).globalOptionsAccountsInitialAccount,
    defaultValue: BehaviorSubject.seeded(null),
    values: _accountsIDsSubject,
    enabled: _initialAccountEnabledSubject,
  );

  late final navigationMode = SelectOption<NavigationMode>(
    storage: _storage,
    key: 'navigation-mode',
    label: (final context) => AppLocalizations.of(context).globalOptionsNavigationMode,
    defaultValue: BehaviorSubject.seeded(
      Platform.isAndroid || Platform.isIOS ? NavigationMode.drawer : NavigationMode.drawerAlwaysVisible,
    ),
    values: BehaviorSubject.seeded({
      NavigationMode.drawer: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeDrawer,
      if (!Platform.isAndroid && !Platform.isIOS) ...{
        NavigationMode.drawerAlwaysVisible: (final context) =>
            AppLocalizations.of(context).globalOptionsNavigationModeDrawerAlwaysVisible,
      },
      NavigationMode.quickBar: (final context) => AppLocalizations.of(context).globalOptionsNavigationModeQuickBar,
    }),
  );
}

enum NavigationMode {
  drawer,
  drawerAlwaysVisible,
  quickBar,
}
