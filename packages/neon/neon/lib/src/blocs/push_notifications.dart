import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/push_notification.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/push_utils.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unifiedpush/unifiedpush.dart';

abstract class PushNotificationsBlocEvents {}

abstract class PushNotificationsBlocStates {
  Stream<PushNotification> get notifications;
}

@internal
class PushNotificationsBloc extends Bloc implements PushNotificationsBlocEvents, PushNotificationsBlocStates {
  PushNotificationsBloc(
    this._accountsBloc,
    this._sharedPreferences,
    this._globalOptions,
    this._platform,
  ) {
    if (_platform.canUsePushNotifications) {
      unawaited(UnifiedPush.getDistributors().then(_globalOptions.updateDistributors));

      _globalOptions.pushNotificationsEnabled.addListener(_pushNotificationsEnabledListener);
    }
  }

  Future<void> _pushNotificationsEnabledListener() async {
    final enabled = _globalOptions.pushNotificationsEnabled.value;
    if (enabled != _pushNotificationsEnabled) {
      _pushNotificationsEnabled = enabled;
      if (enabled) {
        // We just use a single RSA keypair for all accounts
        _keypair = await PushUtils.loadRSAKeypair(_storage);
        await _setupUnifiedPush();
      } else {
        _globalOptions.pushNotificationsDistributor.removeListener(_distributorListener);
        unawaited(_accountsListener?.cancel());
      }
    }
  }

  final AccountsBloc _accountsBloc;
  final NeonPlatform _platform;
  final SharedPreferences _sharedPreferences;
  late final _storage = AppStorage('notifications', _sharedPreferences);
  final GlobalOptions _globalOptions;
  late RSAKeypair _keypair;
  bool? _pushNotificationsEnabled;

  final _notificationsController = StreamController<PushNotification>();
  StreamSubscription? _accountsListener;

  @override
  void dispose() {
    unawaited(_notificationsController.close());
    unawaited(_accountsListener?.cancel());
    _globalOptions.pushNotificationsEnabled.removeListener(_pushNotificationsEnabledListener);
  }

  @override
  late Stream<PushNotification> notifications = _notificationsController.stream.asBroadcastStream();

  String _keyLastEndpoint(final Account account) => 'last-endpoint-${account.id}';

  Future _setupUnifiedPush() async {
    await UnifiedPush.initialize(
      onNewEndpoint: (final endpoint, final instance) async {
        final account = _accountsBloc.accounts.value.tryFind(instance);
        if (account == null) {
          debugPrint('Account for $instance not found, can not process endpoint');
          return;
        }

        if (_storage.getString(_keyLastEndpoint(account)) == endpoint) {
          debugPrint('Endpoint not changed');
          return;
        }

        debugPrint('Registering account $instance for push notifications on $endpoint');

        final subscription = await account.client.notifications.registerDevice(
          pushTokenHash: generatePushTokenHash(endpoint),
          devicePublicKey: _keypair.publicKey.toFormattedPEM(),
          proxyServer: '$endpoint#', // This is a hack to make the Nextcloud server directly push to the endpoint
        );

        await _storage.setString(_keyLastEndpoint(account), endpoint);

        debugPrint(
          'Account $instance registered for push notifications ${json.encode(subscription.ocs.data.toJson())}',
        );
      },
      onMessage: PushUtils.onMessage,
    );

    _globalOptions.pushNotificationsDistributor.addListener(_distributorListener);
    _accountsListener = _accountsBloc.accounts.listen(_registerUnifiedPushInstances);
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

  Future _unregisterUnifiedPushInstances(final List<Account> accounts) async {
    for (final account in accounts) {
      try {
        await account.client.notifications.removeDevice();
        await UnifiedPush.unregister(account.client.id);
        await _storage.remove(_keyLastEndpoint(account));
      } catch (e) {
        debugPrint('Failed to unregister device: $e');
      }
    }
  }

  Future _registerUnifiedPushInstances(final List<Account> accounts) async {
    // Notifications will only work on accounts with app password
    for (final account in accounts.where((final a) => a.password != null)) {
      await UnifiedPush.registerApp(account.client.id);
    }
  }
}
