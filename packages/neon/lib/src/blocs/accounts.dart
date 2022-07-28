import 'dart:convert';

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
      _globalOptions.lastAccount.stream.first.then((final lastAccount) {
        final matches = accounts.where((final account) => account.id == lastAccount).toList();
        if (matches.isNotEmpty) {
          _activeAccountSubject.add(matches[0]);
        }
      });
    }
  }

  AccountSpecificOptions? getOptions([Account? account]) {
    account ??= _activeAccountSubject.valueOrNull;
    if (account != null) {
      final accountID = account.id;
      if (_accountsOptions[accountID] != null) {
        return _accountsOptions[accountID];
      }

      return _accountsOptions[accountID] =
          AccountSpecificOptions(Storage('accounts-${account.id}', _sharedPreferences));
    }

    return null;
  }

  final RequestManager _requestManager;
  final Storage _storage;
  final SharedPreferences _sharedPreferences;
  final GlobalOptions _globalOptions;
  final PackageInfo _packageInfo;
  final _keyAccounts = 'accounts';
  final _keyLastUsedAccount = 'last-used-account';

  final _accountsOptions = <String, AccountSpecificOptions>{};
  late final _activeAccountSubject = BehaviorSubject<Account?>.seeded(null);
  late final _accountsSubject = BehaviorSubject<List<Account>>.seeded([]);
  String? pushNotificationApp;

  final Map<Account, UserDetailsBloc> _userDetailsBlocs = {};
  final Map<Account, UserStatusBloc> _userStatusBlocs = {};

  UserDetailsBloc getUserDetailsBloc(final Account account) {
    if (_userDetailsBlocs[account] != null) {
      return _userDetailsBlocs[account]!;
    }

    final bloc = UserDetailsBloc(_requestManager, account.client);
    _userDetailsBlocs[account] = bloc;

    return bloc;
  }

  UserStatusBloc getUserStatusBloc(final Account account) {
    if (_userStatusBlocs[account] != null) {
      return _userStatusBlocs[account]!;
    }

    final bloc = UserStatusBloc(_requestManager, account, _activeAccountSubject);
    _userStatusBlocs[account] = bloc;

    return bloc;
  }

  @override
  void dispose() {
    _activeAccountSubject.close();
    _accountsSubject.close();
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
