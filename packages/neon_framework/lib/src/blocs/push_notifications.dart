import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:neon_framework/src/utils/push_utils.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:unifiedpush/unifiedpush.dart';

@internal
sealed class PushNotificationsBloc {
  factory PushNotificationsBloc(
    final AccountsBloc accountsBloc,
    final GlobalOptions globalOptions,
  ) =>
      _PushNotificationsBloc(
        accountsBloc,
        globalOptions,
      );
}

class _PushNotificationsBloc extends Bloc implements PushNotificationsBloc {
  _PushNotificationsBloc(
    this._accountsBloc,
    this._globalOptions,
  ) {
    if (NeonPlatform.instance.canUsePushNotifications) {
      unawaited(UnifiedPush.getDistributors().then(_globalOptions.updateDistributors));

      _globalOptions.pushNotificationsEnabled.addListener(_pushNotificationsEnabledListener);
      // Call the listener to update everything
      unawaited(_pushNotificationsEnabledListener());
    }
  }

  final AccountsBloc _accountsBloc;
  late final _storage = const AppStorage(StorageKeys.lastEndpoint);
  final GlobalOptions _globalOptions;

  StreamSubscription<List<Account>>? _accountsListener;

  @override
  void dispose() {
    unawaited(_accountsListener?.cancel());
    _globalOptions.pushNotificationsEnabled.removeListener(_pushNotificationsEnabledListener);
  }

  Future<void> _pushNotificationsEnabledListener() async {
    if (_globalOptions.pushNotificationsEnabled.value) {
      await _setupUnifiedPush();

      _globalOptions.pushNotificationsDistributor.addListener(_distributorListener);
      _accountsListener = _accountsBloc.accounts.listen(_registerUnifiedPushInstances);
    } else {
      _globalOptions.pushNotificationsDistributor.removeListener(_distributorListener);
      unawaited(_accountsListener?.cancel());
    }
  }

  Future<void> _setupUnifiedPush() async {
    // We just use a single RSA keypair for all accounts
    final keypair = PushUtils.loadRSAKeypair();

    await UnifiedPush.initialize(
      onNewEndpoint: (final endpoint, final instance) async {
        final account = _accountsBloc.accounts.value.tryFind(instance);
        if (account == null) {
          debugPrint('Account for $instance not found, can not process endpoint');
          return;
        }

        if (_storage.getString(account.id) == endpoint) {
          debugPrint('Endpoint not changed');
          return;
        }

        debugPrint('Registering account $instance for push notifications on $endpoint');

        final subscription = await account.client.notifications.push.registerDevice(
          pushTokenHash: notifications.generatePushTokenHash(endpoint),
          devicePublicKey: keypair.publicKey.toFormattedPEM(),
          proxyServer: '$endpoint#', // This is a hack to make the Nextcloud server directly push to the endpoint
        );

        await _storage.setString(account.id, endpoint);

        debugPrint(
          'Account $instance registered for push notifications ${json.encode(subscription.body.ocs.data.toJson())}',
        );
      },
      onMessage: PushUtils.onMessage,
    );
  }

  Future<void> _distributorListener() async {
    final distributor = _globalOptions.pushNotificationsDistributor.value;
    final disabled = distributor == null;
    final sameDistributor = distributor == await UnifiedPush.getDistributor();
    final accounts = _accountsBloc.accounts.value;
    if (disabled || !sameDistributor) {
      await _unregisterUnifiedPushInstances(accounts);
    }
    if (!disabled && !sameDistributor) {
      debugPrint('UnifiedPush distributor changed to $distributor');
      await UnifiedPush.saveDistributor(distributor);
    }
    if (!disabled) {
      await _registerUnifiedPushInstances(accounts);
    }
  }

  Future<void> _unregisterUnifiedPushInstances(final List<Account> accounts) async {
    for (final account in accounts) {
      try {
        await account.client.notifications.push.removeDevice();
        await UnifiedPush.unregister(account.id);
        await _storage.remove(account.id);
      } catch (e) {
        debugPrint('Failed to unregister device: $e');
      }
    }
  }

  Future<void> _registerUnifiedPushInstances(final List<Account> accounts) async {
    // Notifications will only work on accounts with app password
    for (final account in accounts.where((final a) => a.password != null)) {
      await UnifiedPush.registerApp(account.id);
    }
  }
}
