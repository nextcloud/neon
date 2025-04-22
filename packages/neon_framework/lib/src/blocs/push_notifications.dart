import 'dart:async';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/bloc/bloc.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:permission_handler/permission_handler.dart';

/// Bloc for managing push subscriptions.
sealed class PushNotificationsBloc implements Bloc {
  @internal
  factory PushNotificationsBloc({
    required GlobalOptions globalOptions,
    required NotificationsPushRepository notificationsPushRepository,
  }) = _PushNotificationsBloc;
}

class _PushNotificationsBloc extends Bloc implements PushNotificationsBloc {
  _PushNotificationsBloc({
    required this.globalOptions,
    required this.notificationsPushRepository,
  }) {
    unawaited(changeDistributor());
    globalOptions.pushNotificationsDistributor.addListener(changeDistributor);
  }

  @override
  final log = Logger('PushNotificationsBloc');

  final GlobalOptions globalOptions;
  final NotificationsPushRepository notificationsPushRepository;
  String? oldDistributor;

  @override
  void dispose() {
    globalOptions.pushNotificationsDistributor.removeListener(changeDistributor);
  }

  Future<void> changeDistributor() async {
    final distributor = globalOptions.pushNotificationsDistributor.value;

    if (distributor != null) {
      if (NeonPlatform.instance.canUsePermissions) {
        final response = await Permission.notification.request();
        if (!response.isGranted) {
          log.fine('Notifications permission denied, disabling push notifications');

          globalOptions.pushNotificationsDistributor.reset();
          return;
        }
      }
    }

    await notificationsPushRepository.changeDistributor(distributor);
  }
}
