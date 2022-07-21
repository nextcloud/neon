part of '../neon.dart';

class GlobalOptions {
  GlobalOptions(this._storage) {
    themeMode.stream.listen((final value) {
      _themeOLEDAsDarkEnabledSubject.add(value != ThemeMode.light);
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
  final _accountsIDsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();
  final _themeOLEDAsDarkEnabledSubject = BehaviorSubject<bool>();

  late final List<Option> options = [
    themeMode,
    themeOLEDAsDark,
    startupMinimized,
    startupMinimizeInsteadOfExit,
    systemTrayEnabled,
    systemTrayHideToTrayWhenMinimized,
    rememberLastUsedAccount,
    lastAccount,
  ];

  void dispose() {
    // ignore: discarded_futures
    _accountsIDsSubject.close();
    // ignore: discarded_futures
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
