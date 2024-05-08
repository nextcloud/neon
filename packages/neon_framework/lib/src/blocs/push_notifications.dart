import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:neon_framework/src/utils/push_utils.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:rxdart/rxdart.dart';
import 'package:unifiedpush/unifiedpush.dart';

/// Bloc for managing push notifications and registration.
sealed class PushNotificationsBloc {
  @internal
  factory PushNotificationsBloc({
    required BehaviorSubject<BuiltList<Account>> accountsSubject,
    required GlobalOptions globalOptions,
  }) = _PushNotificationsBloc;
}

class _PushNotificationsBloc extends Bloc implements PushNotificationsBloc {
  _PushNotificationsBloc({
    required this.accountsSubject,
    required this.globalOptions,
  }) {
    if (NeonPlatform.instance.canUsePushNotifications) {
      unawaited(UnifiedPush.getDistributors().then(globalOptions.updateDistributors));

      globalOptions.pushNotificationsEnabled.addListener(pushNotificationsEnabledListener);
      // Call the listener to update everything
      unawaited(pushNotificationsEnabledListener());
    }
  }

  @override
  final log = Logger('PushNotificationsBloc');

  final BehaviorSubject<BuiltList<Account>> accountsSubject;
  late final storage = NeonStorage().settingsStore(StorageKeys.lastEndpoint);
  final GlobalOptions globalOptions;

  StreamSubscription<BuiltList<Account>>? accountsListener;

  @override
  void dispose() {
    unawaited(accountsListener?.cancel());
    globalOptions.pushNotificationsEnabled.removeListener(pushNotificationsEnabledListener);
  }

  Future<void> pushNotificationsEnabledListener() async {
    if (globalOptions.pushNotificationsEnabled.value) {
      await setupUnifiedPush();

      globalOptions.pushNotificationsDistributor.addListener(distributorListener);
      accountsListener = accountsSubject.listen(registerUnifiedPushInstances);
    } else {
      globalOptions.pushNotificationsDistributor.removeListener(distributorListener);
      unawaited(accountsListener?.cancel());
    }
  }

  Future<void> setupUnifiedPush() async {
    // We just use a single RSA keypair for all accounts
    final keypair = PushUtils.loadRSAKeypair();

    await UnifiedPush.initialize(
      onNewEndpoint: (endpoint, instance) async {
        final account = accountsSubject.value.tryFind(instance);
        if (account == null) {
          log.fine('Account for $instance not found, can not process endpoint');
          return;
        }

        if (storage.getString(account.id) == endpoint) {
          log.fine('Endpoint not changed');
          return;
        }

        log.fine('Registering account $instance for push notifications on $endpoint');

        final subscription = await account.client.notifications.push.registerDevice(
          pushTokenHash: notifications.generatePushTokenHash(endpoint),
          devicePublicKey: keypair.publicKey.toFormattedPEM(),
          proxyServer: '$endpoint#', // This is a hack to make the Nextcloud server directly push to the endpoint
        );

        await storage.setString(account.id, endpoint);

        log.fine(
          'Account $instance registered for push notifications ${json.encode(subscription.body.ocs.data.toJson())}',
        );
      },
      onMessage: PushUtils.onMessage,
    );
  }

  Future<void> distributorListener() async {
    final distributor = globalOptions.pushNotificationsDistributor.value;
    final disabled = distributor == null;
    final sameDistributor = distributor == await UnifiedPush.getDistributor();
    final accounts = accountsSubject.value;
    if (disabled || !sameDistributor) {
      await unregisterUnifiedPushInstances(accounts);
    }
    if (!disabled && !sameDistributor) {
      log.fine('UnifiedPush distributor changed to $distributor');
      await UnifiedPush.saveDistributor(distributor);
    }
    if (!disabled) {
      await registerUnifiedPushInstances(accounts);
    }
  }

  Future<void> unregisterUnifiedPushInstances(BuiltList<Account> accounts) async {
    for (final account in accounts) {
      try {
        await account.client.notifications.push.removeDevice();
        await UnifiedPush.unregister(account.id);
        await storage.remove(account.id);
      } on Exception catch (error) {
        log.warning(
          'Failed to unregister device.',
          error,
        );
      }
    }
  }

  Future<void> registerUnifiedPushInstances(BuiltList<Account> accounts) async {
    // Notifications will only work on accounts with app password
    for (final account in accounts.where((a) => a.password != null)) {
      await UnifiedPush.registerApp(account.id);
    }
  }
}
