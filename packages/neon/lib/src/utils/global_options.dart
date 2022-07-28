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
      _pushNotificationsEnabledSubject.add(distributors.isNotEmpty);
      await pushNotificationsEnabled.set(distributors.isNotEmpty);
      await _setDefaultDistributor();
    });

    pushNotificationsEnabled.stream.listen((final enabled) async {
      if (!enabled) {
        await pushNotificationsDistributor.set(null);
      }
      await _setDefaultDistributor();
    });

    rememberLastUsedAccount.stream.listen((final remember) async {
      if (remember) {
        await lastAccount.set(null);
      } else {
        await lastAccount.set((await lastAccount.values.first).keys.toList()[0]);
      }
    });
  }

  final Storage _storage;
  final PackageInfo _packageInfo;
  final _accountsIDsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();
  final _themeOLEDAsDarkEnabledSubject = BehaviorSubject<bool>();
  final _pushNotificationsEnabledSubject = BehaviorSubject<bool>();
  final _pushNotificationsDistributorsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();

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
    pushNotificationsEnabled,
    pushNotificationsDistributor,
    startupMinimized,
    startupMinimizeInsteadOfExit,
    systemTrayEnabled,
    systemTrayHideToTrayWhenMinimized,
    rememberLastUsedAccount,
    lastAccount,
  ];

  void dispose() {
    _accountsIDsSubject.close();
    _themeOLEDAsDarkEnabledSubject.close();
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
        account.id: (final _) => '',
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

  late final pushNotificationsEnabled = ToggleOption(
    storage: _storage,
    key: 'push-notifications-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsPushNotificationsEnabled,
    defaultValue: BehaviorSubject.seeded(true),
    enabled: _pushNotificationsEnabledSubject,
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
    defaultValue: BehaviorSubject.seeded(true),
  );

  // TODO: Autostart option

  late final systemTrayEnabled = ToggleOption(
    storage: _storage,
    key: 'systemtray-enabled',
    label: (final context) => AppLocalizations.of(context).globalOptionsSystemTrayEnabled,
    defaultValue: BehaviorSubject.seeded(true),
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

  late final lastAccount = SelectOption<String?>(
    storage: _storage,
    key: 'last-account',
    label: (final _) => '',
    defaultValue: BehaviorSubject.seeded(null),
    values: _accountsIDsSubject,
  );
}
