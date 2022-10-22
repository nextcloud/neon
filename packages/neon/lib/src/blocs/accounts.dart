import 'dart:async';
import 'dart:convert';

import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/blocs/user_details.dart';
import 'package:neon/src/blocs/user_status.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'accounts.rxb.g.dart';

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

@RxBloc()
class AccountsBloc extends $AccountsBloc {
  AccountsBloc(
    this._requestManager,
    this._storage,
    this._sharedPreferences,
    this._globalOptions,
    this._packageInfo,
    this._allAppImplementations,
  ) {
    _accountsSubject.listen((final accounts) async {
      _globalOptions.updateAccounts(accounts);
      await _storage.setStringList(_keyAccounts, accounts.map((final a) => json.encode(a.toJson())).toList());
    });

    _$setActiveAccountEvent.listen((final account) async {
      if (account != null) {
        if (_activeAccountSubject.value != account) {
          await _storage.setString(_keyLastUsedAccount, account.id);
          _activeAccountSubject.add(account);
        }
      } else {
        final accounts = _accountsSubject.value;
        if (accounts.isNotEmpty) {
          setActiveAccount(accounts[0]);
        } else {
          await _storage.remove(_keyLastUsedAccount);
          _activeAccountSubject.add(null);
        }
      }
    });

    _$addAccountEvent.listen((final account) async {
      account.setupClient(_packageInfo);
      if (_activeAccountSubject.valueOrNull == null) {
        setActiveAccount(account);
      }
      final accounts = _accountsSubject.value;
      _accountsSubject.add(accounts..add(account));
    });

    _$removeAccountEvent.listen((final account) async {
      final accounts = _accountsSubject.value..removeWhere((final a) => a.id == account.id);
      _accountsSubject.add(accounts);

      final activeAccount = _activeAccountSubject.valueOrNull;
      if (activeAccount != null && activeAccount.id == account.id) {
        setActiveAccount(accounts.isNotEmpty ? accounts[0] : null);
      }
    });

    _$updateAccountEvent.listen((final account) async {
      account.setupClient(_packageInfo);
      final accounts = _accountsSubject.value;
      final index = accounts.indexWhere((final a) => a.id == account.id);
      if (index == -1) {
        // TODO: Figure out how we can remove the old account without potentially race conditioning
        accounts.add(account);
      } else {
        accounts.replaceRange(
          index,
          index + 1,
          [account],
        );
      }

      _accountsSubject.add(accounts);
      setActiveAccount(account);
    });

    if (_storage.containsKey(_keyAccounts)) {
      _accountsSubject.add(
        _storage
            .getStringList(_keyAccounts)!
            .map((final a) => (Account.fromJson(json.decode(a) as Map<String, dynamic>))..setupClient(_packageInfo))
            .toList(),
      );
    }

    final accounts = _accountsSubject.value;
    if (_globalOptions.rememberLastUsedAccount.value && _storage.containsKey(_keyLastUsedAccount)) {
      final lastUsedAccountID = _storage.getString(_keyLastUsedAccount);
      _activeAccountSubject.add(accounts.singleWhere((final account) => account.id == lastUsedAccountID));
    } else {
      unawaited(
        _globalOptions.initialAccount.stream.first.then((final lastAccount) {
          final matches = accounts.where((final account) => account.id == lastAccount).toList();
          if (matches.isNotEmpty) {
            _activeAccountSubject.add(matches[0]);
          }
        }),
      );
    }
  }

  AccountSpecificOptions getOptions(final Account account) => _accountsOptions[account.id] ??= AccountSpecificOptions(
        Storage('accounts-${account.id}', _sharedPreferences),
        getAppsBloc(account),
      );

  AppsBloc getAppsBloc(final Account account) {
    if (_accountsAppsBlocs[account.id] != null) {
      return _accountsAppsBlocs[account.id]!;
    }

    return _accountsAppsBlocs[account.id] = AppsBloc(
      _requestManager,
      this,
      account,
      _allAppImplementations,
    );
  }

  UserDetailsBloc getUserDetailsBloc(final Account account) {
    if (_userDetailsBlocs[account] != null) {
      return _userDetailsBlocs[account]!;
    }

    return _userDetailsBlocs[account.id] = UserDetailsBloc(
      _requestManager,
      account.client,
    );
  }

  UserStatusBloc getUserStatusBloc(final Account account) {
    if (_userStatusBlocs[account] != null) {
      return _userStatusBlocs[account]!;
    }

    return _userStatusBlocs[account.id] = UserStatusBloc(
      _requestManager,
      account,
      _activeAccountSubject,
    );
  }

  final RequestManager _requestManager;
  final Storage _storage;
  final SharedPreferences _sharedPreferences;
  final GlobalOptions _globalOptions;
  final List<AppImplementation> _allAppImplementations;
  final PackageInfo _packageInfo;
  final _keyAccounts = 'accounts';
  final _keyLastUsedAccount = 'last-used-account';

  final _accountsOptions = <String, AccountSpecificOptions>{};
  late final _activeAccountSubject = BehaviorSubject<Account?>.seeded(null);
  late final _accountsSubject = BehaviorSubject<List<Account>>.seeded([]);

  final _accountsAppsBlocs = <String, AppsBloc>{};
  final _userDetailsBlocs = <String, UserDetailsBloc>{};
  final _userStatusBlocs = <String, UserStatusBloc>{};

  @override
  void dispose() {
    unawaited(_activeAccountSubject.close());
    unawaited(_accountsSubject.close());
    for (final bloc in _userDetailsBlocs.values) {
      bloc.dispose();
    }
    for (final bloc in _userStatusBlocs.values) {
      bloc.dispose();
    }
    for (final options in _accountsOptions.values) {
      options.dispose();
    }
    super.dispose();
  }

  @override
  BehaviorSubject<List<Account>> _mapToAccountsState() => _accountsSubject;

  @override
  BehaviorSubject<Account?> _mapToActiveAccountState() => _activeAccountSubject;
}
