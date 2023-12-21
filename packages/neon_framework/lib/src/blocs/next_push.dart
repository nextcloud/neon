import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:nextcloud/uppush.dart' as uppush;
import 'package:rxdart/rxdart.dart';

@internal
sealed class NextPushBloc implements Disposable {
  factory NextPushBloc(
    final AccountsBloc accountsBloc,
    final GlobalOptions globalOptions, {
    final bool disabled = false,
  }) =>
      _NextPushBloc(
        accountsBloc,
        globalOptions,
        disabled: disabled,
      );

  BehaviorSubject<void> get onNextPushSupported;
}

class _NextPushBloc extends Bloc implements NextPushBloc {
  _NextPushBloc(
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
