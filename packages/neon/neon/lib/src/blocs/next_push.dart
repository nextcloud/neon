import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract interface class NextPushBlocEvents {}

@internal
abstract interface class NextPushBlocStates {
  BehaviorSubject<void> get onNextPushSupported;
}

@internal
class NextPushBloc extends Bloc implements NextPushBlocEvents, NextPushBlocStates {
  NextPushBloc(
    this._accountsBloc,
    this._globalOptions, {
    final bool disabled = false,
  }) {
    if (disabled) {
      return;
    }
    Rx.merge([
      _globalOptions.pushNotificationsEnabled.stream,
      _globalOptions.pushNotificationsDistributor.stream,
      _accountsBloc.accounts,
    ]).debounceTime(const Duration(milliseconds: 100)).listen((final _) async {
      if (!_globalOptions.pushNotificationsEnabled.enabled || !_globalOptions.pushNotificationsEnabled.value) {
        return;
      }
      if (_globalOptions.pushNotificationsDistributor.value != null) {
        return;
      }
      if (_globalOptions.pushNotificationsDistributor.values.containsKey(unifiedPushNextPushID)) {
        // NextPush is already installed
        return;
      }

      var supported = false;
      for (final account in _accountsBloc.accounts.value) {
        if (!_supported.containsKey(account)) {
          try {
            final response = await account.client.uppush.check();
            _supported[account] = response.body.success;
          } catch (e, s) {
            debugPrint(e.toString());
            debugPrint(s.toString());
            _supported[account] = false;
          }
        }
        if (_supported[account]!) {
          supported = true;
          break;
        }
      }

      if (!supported) {
        return;
      }

      if (onNextPushSupported.hasValue) {
        return;
      }
      onNextPushSupported.add(null);
    });
  }

  final AccountsBloc _accountsBloc;
  final GlobalOptions _globalOptions;
  final _supported = <Account, bool>{};

  @override
  void dispose() {
    unawaited(onNextPushSupported.close());
  }

  @override
  BehaviorSubject<void> onNextPushSupported = BehaviorSubject();
}
