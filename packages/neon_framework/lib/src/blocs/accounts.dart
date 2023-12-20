import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/blocs/unified_search.dart';
import 'package:neon_framework/src/blocs/user_details.dart';
import 'package:neon_framework/src/blocs/user_statuses.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/account_cache.dart';
import 'package:neon_framework/src/models/app_implementation.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/utils/account_options.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

const _keyAccounts = 'accounts';

/// Events for the [AccountsBloc].
@internal
abstract interface class AccountsBlocEvents {
  /// Logs in the given [account].
  ///
  /// It will also call [setActiveAccount] when no other accounts are registered in [AccountsBlocStates.accounts].
  void addAccount(final Account account);

  /// Logs out the given [account].
  ///
  /// If [account] is the current [AccountsBlocStates.activeAccount] it will automatically activate the first one in [AccountsBlocStates.accounts].
  /// It is not defined whether listeners of [AccountsBlocStates.accounts] or [AccountsBlocStates.activeAccount] are informed first.
  void removeAccount(final Account account);

  /// Updates the given [account].
  ///
  /// It triggers an event in both [AccountsBlocStates.accounts] and [AccountsBlocStates.activeAccount] to inform all listeners.
  void updateAccount(final Account account);

  /// Sets the active [account].
  ///
  /// It triggers an event in [AccountsBlocStates.activeAccount] to inform all listeners.
  void setActiveAccount(final Account account);
}

/// States for the [AccountsBloc].
@internal
abstract interface class AccountsBlocStates {
  /// All registered accounts.
  ///
  /// An empty value represents a state where no account is logged in.
  BehaviorSubject<List<Account>> get accounts;

  /// Currently active account.
  ///
  /// It should be ensured to only emit an event when it's value changes.
  /// A null value represents a state where no user is logged in.
  BehaviorSubject<Account?> get activeAccount;
}

/// The Bloc responsible for managing the [Account]s
class AccountsBloc extends Bloc implements AccountsBlocEvents, AccountsBlocStates {
  /// Creates a new account bloc.
  ///
  /// The last state will be loaded from storage and all necessary listeners
  /// will be set up.
  AccountsBloc(
    this._globalOptions,
    this._allAppImplementations,
  ) {
    const lastUsedStorage = SingleValueStorage(StorageKeys.lastUsedAccount);

    accounts
      ..add(loadAccounts())
      ..listen((final as) async {
        _globalOptions.updateAccounts(as);
        await saveAccounts(as);
      });
    activeAccount.listen((final aa) async {
      if (aa != null) {
        await lastUsedStorage.setString(aa.id);
      } else {
        await lastUsedStorage.remove();
      }
    });

    final as = accounts.value;

    if (_globalOptions.rememberLastUsedAccount.value && lastUsedStorage.hasValue()) {
      final lastUsedAccountID = lastUsedStorage.getString();
      if (lastUsedAccountID != null) {
        final aa = as.tryFind(lastUsedAccountID);
        if (aa != null) {
          setActiveAccount(aa);
        }
      }
    }

    final account = as.tryFind(_globalOptions.initialAccount.value);
    if (activeAccount.valueOrNull == null) {
      if (account != null) {
        setActiveAccount(account);
      } else if (as.isNotEmpty) {
        setActiveAccount(as.first);
      }
    }

    accounts.listen((final accounts) {
      _accountsOptions.pruneAgainst(accounts);
      _appsBlocs.pruneAgainst(accounts);
      _capabilitiesBlocs.pruneAgainst(accounts);
      _userDetailsBlocs.pruneAgainst(accounts);
      _userStatusesBlocs.pruneAgainst(accounts);
      _unifiedSearchBlocs.pruneAgainst(accounts);
      for (final app in _allAppImplementations) {
        app.blocsCache.pruneAgainst(accounts);
      }
    });
  }

  final GlobalOptions _globalOptions;
  final Iterable<AppImplementation> _allAppImplementations;

  final _accountsOptions = AccountCache<AccountOptions>();
  final _appsBlocs = AccountCache<AppsBloc>();
  final _capabilitiesBlocs = AccountCache<CapabilitiesBloc>();
  final _userDetailsBlocs = AccountCache<UserDetailsBloc>();
  final _userStatusesBlocs = AccountCache<UserStatusesBloc>();
  final _unifiedSearchBlocs = AccountCache<UnifiedSearchBloc>();

  @override
  void dispose() {
    unawaited(activeAccount.close());
    unawaited(accounts.close());
    _appsBlocs.dispose();
    _capabilitiesBlocs.dispose();
    _userDetailsBlocs.dispose();
    _userStatusesBlocs.dispose();
    _unifiedSearchBlocs.dispose();
    _accountsOptions.dispose();
  }

  @override
  BehaviorSubject<List<Account>> accounts = BehaviorSubject<List<Account>>.seeded([]);

  @override
  BehaviorSubject<Account?> activeAccount = BehaviorSubject();

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
    if (aa?.id == account.id) {
      if (as.firstOrNull != null) {
        setActiveAccount(as.first);
      } else {
        activeAccount.add(null);
      }
    }

    unawaited(() async {
      try {
        await account.client.core.appPassword.deleteAppPassword();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }());
  }

  @override
  void setActiveAccount(final Account account) {
    if (activeAccount.valueOrNull != account) {
      activeAccount.add(account);
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

  /// The currently active account.
  ///
  /// Equivalent to activeAccount.valueOrNull but throws a [StateError] when no user is logged in.
  @visibleForTesting
  Account get aa {
    final aa = activeAccount.valueOrNull;

    if (aa == null) {
      throw StateError('No user is logged in.');
    }

    return aa;
  }

  /// Whether accounts are logged in.
  bool get hasAccounts => activeAccount.valueOrNull != null;

  /// The options for the [activeAccount].
  ///
  /// Convenience method for [getOptionsFor] with the currently active account.
  AccountOptions get activeOptions => getOptionsFor(aa);

  /// The options for the specified [account].
  ///
  /// Use [activeOptions] to get them for the [activeAccount].
  AccountOptions getOptionsFor(final Account account) => _accountsOptions[account] ??= AccountOptions(
        AppStorage(StorageKeys.accounts, account.id),
        getAppsBlocFor(account),
      );

  /// The appsBloc for the [activeAccount].
  ///
  /// Convenience method for [getAppsBlocFor] with the currently active account.
  AppsBloc get activeAppsBloc => getAppsBlocFor(aa);

  /// The appsBloc for the specified [account].
  ///
  /// Use [activeAppsBloc] to get them for the [activeAccount].
  AppsBloc getAppsBlocFor(final Account account) => _appsBlocs[account] ??= AppsBloc(
        getCapabilitiesBlocFor(account),
        this,
        account,
        _allAppImplementations,
      );

  /// The capabilitiesBloc for the [activeAccount].
  ///
  /// Convenience method for [getCapabilitiesBlocFor] with the currently active account.
  CapabilitiesBloc get activeCapabilitiesBloc => getCapabilitiesBlocFor(aa);

  /// The capabilitiesBloc for the specified [account].
  ///
  /// Use [activeCapabilitiesBloc] to get them for the [activeAccount].
  CapabilitiesBloc getCapabilitiesBlocFor(final Account account) =>
      _capabilitiesBlocs[account] ??= CapabilitiesBloc(account);

  /// The userDetailsBloc for the [activeAccount].
  ///
  /// Convenience method for [getUserDetailsBlocFor] with the currently active account.
  UserDetailsBloc get activeUerDetailsBloc => getUserDetailsBlocFor(aa);

  /// The userDetailsBloc for the specified [account].
  ///
  /// Use [activeUerDetailsBloc] to get them for the [activeAccount].
  UserDetailsBloc getUserDetailsBlocFor(final Account account) =>
      _userDetailsBlocs[account] ??= UserDetailsBloc(account);

  /// The userStatusBloc for the [activeAccount].
  ///
  /// Convenience method for [getUserStatusesBlocFor] with the currently active account.
  UserStatusesBloc get activeUserStatusesBloc => getUserStatusesBlocFor(aa);

  /// The userStatusBloc for the specified [account].
  ///
  /// Use [activeUserStatusesBloc] to get them for the [activeAccount].
  UserStatusesBloc getUserStatusesBlocFor(final Account account) =>
      _userStatusesBlocs[account] ??= UserStatusesBloc(account);

  /// The UnifiedSearchBloc for the [activeAccount].
  ///
  /// Convenience method for [getUnifiedSearchBlocFor] with the currently active account.
  UnifiedSearchBloc get activeUnifiedSearchBloc => getUnifiedSearchBlocFor(aa);

  /// The UnifiedSearchBloc for the specified [account].
  ///
  /// Use [activeUnifiedSearchBloc] to get them for the [activeAccount].
  UnifiedSearchBloc getUnifiedSearchBlocFor(final Account account) =>
      _unifiedSearchBlocs[account] ??= UnifiedSearchBloc(
        getAppsBlocFor(account),
        account,
      );
}

/// Gets a list of logged in accounts from storage.
///
/// It is not checked whether the stored information is still valid.
List<Account> loadAccounts() {
  const storage = AppStorage(StorageKeys.accounts);

  if (storage.containsKey(_keyAccounts)) {
    return storage
        .getStringList(_keyAccounts)!
        .map((final a) => Account.fromJson(json.decode(a) as Map<String, dynamic>))
        .toList();
  }
  return [];
}

/// Saves the given [accounts] to the storage.
Future<void> saveAccounts(final List<Account> accounts) async {
  const storage = AppStorage(StorageKeys.accounts);
  final values = accounts.map((final a) => json.encode(a.toJson())).toList();

  await storage.setStringList(_keyAccounts, values);
}
