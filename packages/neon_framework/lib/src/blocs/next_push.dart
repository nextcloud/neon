import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:nextcloud/uppush.dart' as uppush;
import 'package:rxdart/rxdart.dart';

/// Bloc for checking NextPush compatibility.
sealed class NextPushBloc implements Disposable {
  @internal
  factory NextPushBloc({
    required BehaviorSubject<BuiltList<Account>> accountsSubject,
    required GlobalOptions globalOptions,
    bool disabled,
  }) = _NextPushBloc;

  /// Emits if NextPush is supported by the server.
  BehaviorSubject<void> get onNextPushSupported;
}

class _NextPushBloc extends Bloc implements NextPushBloc {
  _NextPushBloc({
    required this.accountsSubject,
    required this.globalOptions,
    bool disabled = false,
  }) {
    if (disabled) {
      return;
    }
    changesSubscription = Rx.merge([
      globalOptions.pushNotificationsEnabled.stream,
      globalOptions.pushNotificationsDistributor.stream,
      accountsSubject,
    ]).debounceTime(const Duration(milliseconds: 100)).listen((_) async {
      if (!globalOptions.pushNotificationsEnabled.enabled || !globalOptions.pushNotificationsEnabled.value) {
        return;
      }
      if (globalOptions.pushNotificationsDistributor.value != null) {
        return;
      }
      if (globalOptions.pushNotificationsDistributor.values.containsKey(unifiedPushNextPushID)) {
        // NextPush is already installed
        return;
      }

      var isSupported = false;
      for (final account in accountsSubject.value) {
        if (!supported.containsKey(account)) {
          try {
            final response = await account.client.uppush.check();
            supported[account] = response.body.success;
          } on http.ClientException catch (error, stackTrace) {
            log.warning(
              'Error checking NextPush availability.',
              error,
              stackTrace,
            );

            supported[account] = false;
          }
        }
        if (supported[account]!) {
          isSupported = true;
          break;
        }
      }

      if (!isSupported) {
        return;
      }

      if (onNextPushSupported.hasValue) {
        return;
      }
      onNextPushSupported.add(null);
    });
  }

  @override
  final log = Logger('NextPushBloc');

  final BehaviorSubject<BuiltList<Account>> accountsSubject;
  final GlobalOptions globalOptions;
  final supported = <Account, bool>{};
  late final StreamSubscription<Object?> changesSubscription;

  @override
  void dispose() {
    unawaited(changesSubscription.cancel());
    unawaited(onNextPushSupported.close());
  }

  @override
  final onNextPushSupported = BehaviorSubject();
}
