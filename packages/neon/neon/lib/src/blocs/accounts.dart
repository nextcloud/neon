part of '../../neon.dart';

const _keyAccounts = 'accounts';

abstract class AccountsBlocEvents {
  void addAccount(final Account account);
  void removeAccount(final Account account);
  void updateAccount(final Account account);
  void setActiveAccount(final Account? account);
}

abstract class AccountsBlocStates {
  BehaviorSubject<List<Account>> get accounts;
  BehaviorSubject<Account?> get activeAccount;
}

class AccountsBloc extends Bloc implements AccountsBlocEvents, AccountsBlocStates {
  AccountsBloc(
    this._requestManager,
    this._platform,
    this._sharedPreferences,
    this._globalOptions,
    this._allAppImplementations,
  ) {
    accounts
      ..add(loadAccounts(_storage))
      ..listen((final as) async {
        _globalOptions.updateAccounts(as);
        await _storage.setStringList(_keyAccounts, as.map((final a) => json.encode(a.toJson())).toList());
      });

    final as = accounts.value;
    if (_globalOptions.rememberLastUsedAccount.value && _storage.containsKey(_keyLastUsedAccount)) {
      final lastUsedAccountID = _storage.getString(_keyLastUsedAccount);
      activeAccount.add(lastUsedAccountID != null ? as.find(lastUsedAccountID) : null);
    } else {
      unawaited(
        _globalOptions.initialAccount.stream.first.then((final lastAccount) {
          final account = lastAccount != null ? as.find(lastAccount) : null;
          if (account != null) {
            activeAccount.add(account);
          }
        }),
      );
    }
  }

  final RequestManager _requestManager;
  final NeonPlatform _platform;
  late final AppStorage _storage = AppStorage('accounts', _sharedPreferences);
  final SharedPreferences _sharedPreferences;
  final GlobalOptions _globalOptions;
  final List<AppImplementation> _allAppImplementations;
  final _keyLastUsedAccount = 'last-used-account';

  final _accountsOptions = <String, AccountSpecificOptions>{};
  final _appsBlocs = <String, AppsBloc>{};
  final _capabilitiesBlocs = <String, CapabilitiesBloc>{};
  final _userDetailsBlocs = <String, UserDetailsBloc>{};
  final _userStatusBlocs = <String, UserStatusBloc>{};

  @override
  void dispose() {
    unawaited(activeAccount.close());
    unawaited(accounts.close());
    for (final bloc in _userDetailsBlocs.values) {
      bloc.dispose();
    }
    for (final bloc in _userStatusBlocs.values) {
      bloc.dispose();
    }
    for (final options in _accountsOptions.values) {
      options.dispose();
    }
  }

  @override
  BehaviorSubject<List<Account>> accounts = BehaviorSubject<List<Account>>.seeded([]);

  @override
  BehaviorSubject<Account?> activeAccount = BehaviorSubject<Account?>.seeded(null);

  @override
  void addAccount(final Account account) {
    if (activeAccount.valueOrNull == null) {
      setActiveAccount(account);
    }
    accounts.add(accounts.value..add(account));
  }

  @override
  void removeAccount(final Account account) {
    accounts.add(accounts.value..removeWhere((final a) => a.id == account.id));

    final as = accounts.value;
    final aa = activeAccount.valueOrNull;
    if (aa != null && aa.id == account.id) {
      setActiveAccount(as.isNotEmpty ? as[0] : null);
    }

    unawaited(() async {
      try {
        await account.client.core.deleteAppPassword();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }());
  }

  @override
  void setActiveAccount(final Account? account) {
    if (account != null) {
      if (activeAccount.value != account) {
        unawaited(_storage.setString(_keyLastUsedAccount, account.id));
        activeAccount.add(account);
      }
    } else {
      final as = accounts.value;
      if (as.isNotEmpty) {
        setActiveAccount(as[0]);
      } else {
        unawaited(_storage.remove(_keyLastUsedAccount));
        activeAccount.add(null);
      }
    }
  }

  @override
  void updateAccount(final Account account) {
    final as = accounts.value;
    final index = as.indexWhere((final a) => a.id == account.id);
    if (index == -1) {
      // TODO: Figure out how we can remove the old account without potentially race conditioning
      as.add(account);
    } else {
      as.replaceRange(
        index,
        index + 1,
        [account],
      );
    }

    accounts.add(as);
    setActiveAccount(account);
  }

  AccountSpecificOptions getOptions(final Account account) => _accountsOptions[account.id] ??= AccountSpecificOptions(
        AppStorage('accounts-${account.id}', _sharedPreferences),
        getAppsBloc(account),
      );

  AppsBloc getAppsBloc(final Account account) {
    if (_appsBlocs[account.id] != null) {
      return _appsBlocs[account.id]!;
    }

    return _appsBlocs[account.id] = AppsBloc(
      _requestManager,
      getCapabilitiesBloc(account),
      this,
      account,
      _allAppImplementations,
    );
  }

  CapabilitiesBloc getCapabilitiesBloc(final Account account) {
    if (_capabilitiesBlocs[account.id] != null) {
      return _capabilitiesBlocs[account.id]!;
    }

    return _capabilitiesBlocs[account.id] = CapabilitiesBloc(
      _requestManager,
      account.client,
    );
  }

  UserDetailsBloc getUserDetailsBloc(final Account account) {
    if (_userDetailsBlocs[account.id] != null) {
      return _userDetailsBlocs[account.id]!;
    }

    return _userDetailsBlocs[account.id] = UserDetailsBloc(
      _requestManager,
      account.client,
    );
  }

  UserStatusBloc getUserStatusBloc(final Account account) {
    if (_userStatusBlocs[account.id] != null) {
      return _userStatusBlocs[account.id]!;
    }

    return _userStatusBlocs[account.id] = UserStatusBloc(
      _platform,
      account,
    );
  }
}

List<Account> loadAccounts(final AppStorage storage) {
  if (storage.containsKey(_keyAccounts)) {
    return storage
        .getStringList(_keyAccounts)!
        .map((final a) => Account.fromJson(json.decode(a) as Map<String, dynamic>))
        .toList();
  }
  return [];
}
