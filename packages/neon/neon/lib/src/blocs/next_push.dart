import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/bloc.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:rxdart/rxdart.dart';

abstract class NextPushBlocEvents {}

abstract class NextPushBlocStates {
  BehaviorSubject get onNextPushSupported;
}

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
      _globalOptions.pushNotificationsDistributor.values,
      _accountsBloc.accounts,
    ]).debounceTime(const Duration(milliseconds: 100)).listen((final _) async {
      if (!_globalOptions.pushNotificationsEnabled.enabled.hasValue ||
          !_globalOptions.pushNotificationsEnabled.enabled.value ||
          !_globalOptions.pushNotificationsEnabled.hasValue ||
          !_globalOptions.pushNotificationsEnabled.value) {
        return;
      }
      if (_globalOptions.pushNotificationsDistributor.value != null) {
        return;
      }
      if (_globalOptions.pushNotificationsDistributor.values.value.containsKey(unifiedPushNextPushID)) {
        // NextPush is already installed
        return;
      }

      var supported = false;
      for (final account in _accountsBloc.accounts.value) {
        if (!_supported.containsKey(account)) {
          try {
            _supported[account] = (await account.client.uppush.check()).success;
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
  BehaviorSubject onNextPushSupported = BehaviorSubject();
}
